Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2132EE8C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 23:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbhAGWfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 17:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAGWfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 17:35:02 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D9AC0612F6;
        Thu,  7 Jan 2021 14:34:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g25so5696410wmh.1;
        Thu, 07 Jan 2021 14:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5h5f4k/7Y5BLMbqGtHy+4oMGbAtdYGA2ZXVid79BVKY=;
        b=HUpwWq10RcjyHZqCnGb/EYqKvCcD1qS3cbr4FJNM0745wJxF6syd2xwl6YfqaWqQWs
         voCVfb4ixVXzxDBgiRqv2BdrPH7mTqu/fR09+0njGyp65jh610zIVR4yhLddFGRg6kFc
         /Ff0akoVNdCi2B8xb+IWYW3OvrkW3t7Aocy7u3hE8rds4Cn/uj8xo3qFpHAqBgdFFEIp
         qIc9NT6J9W5ZM8S6WwtaB4USBKj8DFxFLIcbmggGoSAtxpHm6CjTnK8FW6Zr1jDA+f+w
         Hy3ctJCapL6ich5EJwaZMR1LHs+6xCDZ4Bla73V2qtyLzb63vUy6p5lWMXYkL22za69i
         XI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5h5f4k/7Y5BLMbqGtHy+4oMGbAtdYGA2ZXVid79BVKY=;
        b=imvh74RfAPyEQD9ZEicJKvFN5zs3kxS69GjStH9EUBGlBCd+BJOJ1ppkuwENrxEjBV
         oQ2sepPNxTKhXrFKVKTraDbijcAwvCgKynvBnqLdu8QS2dyi4MsffD4QZaBdjQBLYdiu
         6v3JUUzmI6zRQf9sdKsw3Tl06keXKoJYtqTOIGoFPJlIb7MB+aDoAkzQpkO83/HBvu2i
         qeNXI4B++QCitePKcyGzyqdVn+fTw85XioSesjUQaf0QsG2cy1W/NbCh/DA/ToZmz3po
         9mHrV/oX7Fi3MkCsHWE3zjANvxxulN3/xlvRSI2bqRtfDW4UheRa02UqsqR6SeIuZySK
         yAMw==
X-Gm-Message-State: AOAM533JISnL6zCK7+k5xHtYu9tfk6Gb3LDLkFuSyeHLPRpFQeFNRRTk
        OpLPnOIxGLvTU0Xvb7gAs9NMxMjOSVMrntMKwv4=
X-Google-Smtp-Source: ABdhPJzwN3w3vxCtrqqaHbyIihZjgDGzLQJ1TNyS3Ov2G46nAQoIMjcS8+RXA6CBbUmFUz24Egqu/WF+rdrw1SslT4E=
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr537631wmd.49.1610058860895;
 Thu, 07 Jan 2021 14:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20210102202437.1630365-1-iskren.chernev@gmail.com> <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 7 Jan 2021 14:36:39 -0800
Message-ID: <CAF6AEGvoG4DUSrsEBpsZV-gc42XnhvgqPWXvwa1SMMk1JoF15w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 7, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Sat, Jan 2, 2021 at 12:26 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:
> >
> > The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> > != NULL, because aspace is NULL when using vram carveout.
> >
> > Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
> >
> > Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index c5e61cb3356df..c1953fb079133 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
> >                 struct drm_file *file, struct drm_gem_object *obj,
> >                 uint64_t *iova)
> >  {
> > +       struct msm_drm_private *priv = dev->dev_private;
> >         struct msm_file_private *ctx = file->driver_priv;
> >
> > -       if (!ctx->aspace)
> > +       if (!priv->gpu)
> >                 return -EINVAL;
>
> Does this actually work?  It seems like you would hit a null ptr deref
> in msm_gem_init_vma().. and in general I think a lot of code paths
> would be surprised by a null address space, so this seems like a risky
> idea.

oh, actually, I suppose it is ok, since in the vram carveout case we
create the vma up front when the gem obj is created..

(still, it does seem a bit fragile.. and easy for folks testing on
devices not using vram carvout to break.. hmm..)

BR,
-R

> Maybe instead we should be creating an address space for the vram carveout?
>
> BR,
> -R
>
>
> >         /*
> > --
> > 2.29.2
> >
