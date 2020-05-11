Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA841CE5A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 22:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgEKUgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 16:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgEKUgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 16:36:21 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51986C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 13:36:21 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e10so2470062edq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1uYG9e4dVm6PWRoL8m/kIoqP3zhS97zMzITiZZkfVo8=;
        b=TsuiNVSyuVdgW/EOzGASz9Q20Ckfj8RkQ+7t6+K55MZvuz5looNlvY2UVaTiu4R7SX
         RSXam1aHMNhP1jHAnq5ySmGP9uVuKt9OMtP5D6/BBZk/0jDoDd27QodPfH2c8fdfqlB5
         k1k7ulQCJnd+duACVn752X2Q8GTSOF2nrvDlAJjbkn0vICeXl6yUbNBy5rgxzZaVDENS
         j6z+P5ADfDcau3xp6mHV0P9kN9eHCe1pbal8KmOjZ8/oHatHc8LOr3yslCouXWD5fC19
         DCrz26wwRFkxxuycZ2Vl77jnp3OEm/4hPwa0L9LOmIGQEsvJl+tS4TEl/Sn2NA/3S5dC
         8dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1uYG9e4dVm6PWRoL8m/kIoqP3zhS97zMzITiZZkfVo8=;
        b=c0fjf3WjETN3Z9Gzgehm9mpwupppvYSP+A6TlSCghTgZ1oiZY+EmqeERuV64HU/h1K
         soT60TU3vcYq1ijKnRjvlFpIuyGgKLM3IRbj/7OqhRRiVAQWlYrt8gHplqmJkQbRek5r
         4t5gO8VyHHJnyfpWRNWUrv4WcITB11Qv+AHxx6ngRK0gHH5q5Ukbd4q+O/cfeZw9Cexi
         0bBH5THBbm+eQ7c1cNvSDi76jGSn+fnIPWbfVa2AgBlGrZQqkxKyOi3J4tRrMuncJ2cF
         2c0Fl/iYbIPvqH6d2R89w0Q/aBYmUVoSpFJ44f+uZrIPRpKeJMXIVaZmYy83QsGJjcqo
         whrg==
X-Gm-Message-State: AGi0PuZL45ODbxRfFWpT/h2lG9SVV72xaY48cLgfcLtlaFgDJkOSswFO
        6bahW/PzvJx3pTDgG3I03rZx0EeKtpsh55cL8zQ=
X-Google-Smtp-Source: APiQypJd2EfcwETUCT/8L023guh6ESXaqu8nohL13MgmMY+BO2wuzIUOXD9NKuPFyN2oza0kbWSA/6s1ReCwUv+XQNE=
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr15478740edj.101.1589229379271;
 Mon, 11 May 2020 13:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-2-daniel.vetter@ffwll.ch> <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
 <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
In-Reply-To: <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 11 May 2020 13:36:38 -0700
Message-ID: <CAF6AEGuGH1-5mhtwfCC=pMe+DtLHGQxhfibJuMSDsDusMmeaEg@mail.gmail.com>
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

On Mon, May 11, 2020 at 8:29 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, May 11, 2020 at 5:24 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > I honestly don't exactly understand what's going on here, but the
> > > current code is wrong for sure: It calls dma_buf_vunmap without ever
> > > calling dma_buf_vmap.
> > >
> > > What I'm not sure about is whether the WARN_ON is correct:
> > > - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
> > >   a pretty neat layering violation of how you shouldn't peek behind
> > >   the curtain of the dma-buf exporter, but par for course. Note that
> > >   all the nice new helpers don't (and we should probably have a bit a
> > >   warning about this in the kerneldoc).
> > >
> > > - but then in the get_vaddr() in msm_gem.c, and that seems to happily
> > >   wrap a vmap() around any object with ->pages set (so including
> > >   imported dma-buf)
> > >
> > > - I'm not seeing any guarantees that userspace can't use an imported
> > >   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
> > >   guarantees that an imported dma-buf won't end up with a ->vaddr set.
> >
> > fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
> > by default, and restricted to sudo).. it really only exists to
> > simplify poking at fw.
> >
> > There could be vmap's in the msm_gem_submit path, however.  If we
> > don't, we should probably just disallow using an imported dma-buf as
> > cmdstream.. I don't think there is any sane reason to permit that.  We
> > should probably also disallow get_vaddr() on imported buffers.
>
> Yeah if that's possible and won't blow up (I can't test) I think it'd
> be best. Something like
> if (bo->import_attach) return NULL; should do the trick I think.
> Should I type that up as v2 of this?

Sure.  It should probably be something like

  if (obj->import_attach)
    return ERR_PTR(-ESOMETHING)

looks like the gem-submit path handles an IS_ERR() return

BR,
-R


> -Daniel
>
> >
> > BR,
> > -R
> >
> > >
> > > But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> > > calling dma_buf_vmap is the wrong thing to do.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: freedreno@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index 5a6a79fbc9d6..3305a457960e 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
> > >         put_iova(obj);
> > >
> > >         if (obj->import_attach) {
> > > -               if (msm_obj->vaddr)
> > > -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> > > +               WARN_ON(msm_obj->vaddr);
> > >
> > >                 /* Don't drop the pages for imported dmabuf, as they are not
> > >                  * ours, just free the array we allocated:
> > > --
> > > 2.26.2
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
