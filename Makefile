SVG = one-does-not-simply-cast-an-american-actress.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 600

all: $(PNG) $(JPEG) $(WEBP) $(PHOTO_DEST)

$(PNG): $(SVG) $(PHOTO_DEST)
	inkscape --export-type=png --export-filename=$@ --export-width=$(WIDTH) $<
	optipng $@

$(WEBP): $(PNG)
	gm convert $< $@

$(JPEG): $(PNG)
	gm convert $< $@
