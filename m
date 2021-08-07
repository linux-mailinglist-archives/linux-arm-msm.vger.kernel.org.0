Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835373E3678
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 19:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHGRS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 13:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhHGRS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 13:18:56 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1275C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Aug 2021 10:18:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h13so15408422wrp.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Aug 2021 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hbuDKh/pz00s6q8ViXl34FY2QFpcZMpDha1IvDmYqU=;
        b=dUlMaJcYlrL9KCiV6IXdTH0REFud/+1f2NKp1Jla3jEyeX2hD0UtNf6rboYrVVKbf9
         WcMD/7qHoysJS65t3bpIjeQXNxGuffLLaSklFebMjBKdFoPANNPxLXQmVfQCq5qjyJDK
         xdszDGPorxHa3fqbrgp44m2ESY83RIQs2PX1ja/FnsBqeuj8b6MxEcx4a3dLI+MDYL2u
         ehsisEEhUtRUdwYxAiBixgmvKhzwNAf+CqF2yd/n0RCr4FEkocACy+C5zwzaYH+gCEP1
         2e6wn6hm/JTYcLEt6eGrXOp+bPpLcfLTWUUtx+2pgD2y9rcbouz1UlpRKu1eTfaeMCkD
         7KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hbuDKh/pz00s6q8ViXl34FY2QFpcZMpDha1IvDmYqU=;
        b=C8XiJRuUJChsKaOZGx58fE6ioKn+/4Lajqxb2i3PHgRpOIH4JGmf0x5ZC4sLeX378p
         GxbinzwcbSx+Kw3YDNrOg7OXSoSnQwTQBUWrh3vLYDjiQj9R6pz73yKFWvoP8Tc8ZjMI
         6wiv73xdKM2ipt+yy8O7uda4AWKiEsdWIWBUdrG7vX2vTFwkosffTWAa104qPBF3iZZ5
         qfEJrr2vBbYfJzLDpCbedd29ru1dzajyL4haEPzlt1HJsqgVhb/5bROjgRzJEnfkz4QH
         0b7KXEiRnezBaAeRFCQaH8E2KWEikvx1ybayl5f05uHg+77v1eaBx20mEeMWyq89TlST
         y65w==
X-Gm-Message-State: AOAM5303j86KDt41j7NYsYJOvr3bi40FJ3d9iSy2jk9GpC/zLDhN9+1Y
        pp0meu++dOTN18o/kfRVJXpRvJ7c+kQIpxa7YpM=
X-Google-Smtp-Source: ABdhPJx4MLhD42aux6sivF/EYk+qPy/m85zs8ghQIw6qkpvvIGYgO80R7iNATsYLAq3xm3K//s7YDdjvYnCqHnA9u9s=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr14538920wrr.28.1628356716240;
 Sat, 07 Aug 2021 10:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210706084753.8194-1-tzimmermann@suse.de>
In-Reply-To: <20210706084753.8194-1-tzimmermann@suse.de>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Aug 2021 10:22:51 -0700
Message-ID: <CAF6AEGtC+A4Rg-8EQWcBuWzOsm-CtnL4KFJJSE0CFQgry7dh7Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Implement mmap as GEM object function
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jonathan <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 1:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective msm functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>
> v2:
>         * rebase onto latest upstream
>         * remove declaration of msm_gem_mmap_obj() from msm_fbdev.c
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

applied with the following fixup squashed in:

-------
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4d1872916552..28c1a81f7e7f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1057,7 +1057,7 @@ static int msm_gem_object_mmap(struct
drm_gem_object *obj, struct vm_area_struct
  struct msm_gem_object *msm_obj = to_msm_bo(obj);

  vma->vm_flags &= ~VM_PFNMAP;
- vma->vm_flags |= VM_MIXEDMAP;
+ vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
  vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));

  return 0;
-------

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c       | 14 ++---------
>  drivers/gpu/drm/msm/msm_drv.h       |  1 -
>  drivers/gpu/drm/msm/msm_fbdev.c     | 12 ++--------
>  drivers/gpu/drm/msm/msm_gem.c       | 37 ++++++++++-------------------
>  drivers/gpu/drm/msm/msm_gem.h       |  3 ---
>  drivers/gpu/drm/msm/msm_gem_prime.c | 11 ---------
>  6 files changed, 16 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b8fa2ad0d84..a4d238e8d377 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1004,17 +1004,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  };
>
> -static const struct file_operations fops = {
> -       .owner              = THIS_MODULE,
> -       .open               = drm_open,
> -       .release            = drm_release,
> -       .unlocked_ioctl     = drm_ioctl,
> -       .compat_ioctl       = drm_compat_ioctl,
> -       .poll               = drm_poll,
> -       .read               = drm_read,
> -       .llseek             = no_llseek,
> -       .mmap               = msm_gem_mmap,
> -};
> +DEFINE_DRM_GEM_FOPS(fops);
>
>  static const struct drm_driver msm_driver = {
>         .driver_features    = DRIVER_GEM |
> @@ -1034,7 +1024,7 @@ static const struct drm_driver msm_driver = {
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
> -       .gem_prime_mmap     = msm_gem_prime_mmap,
> +       .gem_prime_mmap     = drm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 1a48a709ffb3..1a42903db347 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -309,7 +309,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>                 struct dma_buf_attachment *attach, struct sg_table *sg);
>  int msm_gem_prime_pin(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 67fae60f2fa5..0daaeb54ff6f 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -8,13 +8,12 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>  #include "msm_kms.h"
>
> -extern int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -                                       struct vm_area_struct *vma);
>  static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
>
>  /*
> @@ -48,15 +47,8 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>         struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
>         struct msm_fbdev *fbdev = to_msm_fbdev(helper);
>         struct drm_gem_object *bo = msm_framebuffer_bo(fbdev->fb, 0);
> -       int ret = 0;
>
> -       ret = drm_gem_mmap_obj(bo, bo->size, vma);
> -       if (ret) {
> -               pr_err("%s:drm_gem_mmap_obj fail\n", __func__);
> -               return ret;
> -       }
> -
> -       return msm_gem_mmap_obj(bo, vma);
> +       return drm_gem_prime_mmap(bo, vma);
>  }
>
>  static int msm_fbdev_create(struct drm_fb_helper *helper,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 141178754231..519a9601b219 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -218,31 +218,6 @@ static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
>         return prot;
>  }
>
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -               struct vm_area_struct *vma)
> -{
> -       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -
> -       vma->vm_flags &= ~VM_PFNMAP;
> -       vma->vm_flags |= VM_MIXEDMAP;
> -       vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
> -
> -       return 0;
> -}
> -
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       int ret;
> -
> -       ret = drm_gem_mmap(filp, vma);
> -       if (ret) {
> -               DBG("mmap failed: %d", ret);
> -               return ret;
> -       }
> -
> -       return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>  static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma = vmf->vma;
> @@ -1114,6 +1089,17 @@ void msm_gem_free_object(struct drm_gem_object *obj)
>         kfree(msm_obj);
>  }
>
> +static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +
> +       vma->vm_flags &= ~VM_PFNMAP;
> +       vma->vm_flags |= VM_MIXEDMAP;
> +       vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
> +
> +       return 0;
> +}
> +
>  /* convenience method to construct a GEM buffer object, and userspace handle */
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>                 uint32_t size, uint32_t flags, uint32_t *handle,
> @@ -1151,6 +1137,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
>         .get_sg_table = msm_gem_prime_get_sg_table,
>         .vmap = msm_gem_prime_vmap,
>         .vunmap = msm_gem_prime_vunmap,
> +       .mmap = msm_gem_object_mmap,
>         .vm_ops = &vm_ops,
>  };
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 405f8411e395..aab548720bee 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -112,9 +112,6 @@ struct msm_gem_object {
>  };
>  #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
>
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -                       struct vm_area_struct *vma);
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>  int msm_gem_get_iova(struct drm_gem_object *obj,
>                 struct msm_gem_address_space *aspace, uint64_t *iova);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 9880348a4dc7..fc94e061d6a7 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -39,17 +39,6 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>         msm_gem_put_vaddr(obj);
>  }
>
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> -{
> -       int ret;
> -
> -       ret = drm_gem_mmap_obj(obj, obj->size, vma);
> -       if (ret < 0)
> -               return ret;
> -
> -       return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>                 struct dma_buf_attachment *attach, struct sg_table *sg)
>  {
> --
> 2.32.0
>
