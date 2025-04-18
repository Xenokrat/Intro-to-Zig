#include <spng.h>
#include <stdio.h>

#define _NO_CRT_STDIO_INLINE 1

int main() {
  int rc = 0;
  struct spng_ihdr header;

  const char* path = "pedro_pascal.png";
  FILE* file_desc = fopen(path, "rb");
  if (file_desc == NULL) {
    return -1;
  }

  spng_ctx *ctx = spng_ctx_new(0);
  rc = spng_set_png_file(ctx, file_desc);
  if (rc != 0) {
    return -1;
  }

  spng_get_ihdr(ctx, &header);
  spng_ctx_free(ctx);
  return 0;
}
