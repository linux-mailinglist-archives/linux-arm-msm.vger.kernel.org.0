Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415051CDECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 17:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgEKPYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726410AbgEKPYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 11:24:32 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC90C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 08:24:31 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g9so3780049edw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9317Vp/mszqVVBYRgEelwHdsJRXESTytWCCgkQudO74=;
        b=Q4G0tAo9CeWVb+SHnkl46B1fwIT5ihxOZ6OBdQCeZEPNGXcoo3CSrPNQsEksAzREUE
         uImG4BUtxLhbMWdgdLGMGk1UiZfFNqgdSNjB+supI5LJJh79Rlqifn2xB2dbTFOXgYCM
         GvrlnqkVrt6GaNL3fld51mgBS04p0CBTYOps1tN/TLvk7TCdskbk/WcTy3hatGLidXIS
         9ElEOMBFTWSk574tdNLSyj6qkgAk5/r80ivj8HxlYswKT7kTxUm/WUQLUOXuJ72aUOC6
         6MkKbRrc7Bkc6xLKQOAfftxQFacR+buQsC7cu0um5nqIdrdWMqWkHvbW8XB81zA8y8qY
         ZdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9317Vp/mszqVVBYRgEelwHdsJRXESTytWCCgkQudO74=;
        b=XGdZRksBK3NfYAJbuaZVtcIylmeR2VA6XpA9+7Yc0yZkvX4BO0hcjUtEdmgx72epbE
         LtHDHy01nzsiee/wiSDXVidIsVmIHTyLiV2Qn0FLNZkPVVQmdJPy2tOMwx38rfwFXAoy
         2Hm17n16HiwS7BtWIlWSfQli/ZH3/HjS6dzH+e0Jt16/szPf3tiJEm52e5e2nhqzX254
         Sx1IHlQRv0l977EgRM9oQBvwM59YyfuDWC9qqIH6Bi6spgDkbO93oqYrKhIfacCkhSxi
         /J7B+dH+PdxUufzSAE1xxkxPecL4JZlSrHWySGiFwB4Bp3n4pLeIll0g0c+UM1+6cZOr
         tCqQ==
X-Gm-Message-State: AGi0PuZ7io8+AXBJESitmWmXtvIWJm6C5or6U1voZi9GXna3q19ebDoi
        Jgw1mpGuOBTLF7oBRTx9zdOuHLPhfXQdYmHOQZo=
X-Google-Smtp-Source: APiQypJUQvBwsX+YG54scmGefg56nBH96yZ4D/VzDhxG8kq6a9xVR40OsUOkXH/KvA+YLpjekFJ/pvniszknIGWSkjI=
X-Received: by 2002:a50:9eac:: with SMTP id a41mr13810164edf.120.1589210670396;
 Mon, 11 May 2020 08:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch> <20200511093554.211493-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 11 May 2020 08:24:17 -0700
Message-ID: <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I honestly don't exactly understand what's going on here, but the
> current code is wrong for sure: It calls dma_buf_vunmap without ever
> calling dma_buf_vmap.
>
> What I'm not sure about is whether the WARN_ON is correct:
> - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
>   a pretty neat layering violation of how you shouldn't peek behind
>   the curtain of the dma-buf exporter, but par for course. Note that
>   all the nice new helpers don't (and we should probably have a bit a
>   warning about this in the kerneldoc).
>
> - but then in the get_vaddr() in msm_gem.c, and that seems to happily
>   wrap a vmap() around any object with ->pages set (so including
>   imported dma-buf)
>
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.

fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
by default, and restricted to sudo).. it really only exists to
simplify poking at fw.

There could be vmap's in the msm_gem_submit path, however.  If we
don't, we should probably just disallow using an imported dma-buf as
cmdstream.. I don't think there is any sane reason to permit that.  We
should probably also disallow get_vaddr() on imported buffers.

BR,
-R

>
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vmap is the wrong thing to do.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..3305a457960e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>         put_iova(obj);
>
>         if (obj->import_attach) {
> -               if (msm_obj->vaddr)
> -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> +               WARN_ON(msm_obj->vaddr);
>
>                 /* Don't drop the pages for imported dmabuf, as they are not
>                  * ours, just free the array we allocated:
> --
> 2.26.2
>
