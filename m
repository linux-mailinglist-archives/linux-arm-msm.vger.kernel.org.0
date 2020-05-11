Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC9A1CDEFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 17:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgEKP3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 11:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726934AbgEKP3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 11:29:08 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30CEC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 08:29:07 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id a2so15219890oia.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jr8BqxYa5N2UQFIWCH+ZeFGjIUjI6K0QpaYQti5dmF0=;
        b=Lg++tOm6IwiIzgdNtd59XFNZ5Rmlo64vDv1d4OxItcq8FR+s48C8JwmCXbAKorjZ6J
         YMSEEwHXoSig7JadxHN8PtMZuZemoD+1KjSnSKqfgM2CBbOHJslVSimDSF7trCKxPCQU
         IZR0vJPAXGKhAKd75Zi+m8C4aIcjuV9t7jzbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jr8BqxYa5N2UQFIWCH+ZeFGjIUjI6K0QpaYQti5dmF0=;
        b=TU5KPPs1RfgAjTEjNTFJ88YS/OA+xpss3Nt7DOfgxO+zzh6afFHvoKlR+c/s4JPFaf
         7674G9cBSbDe/A9gREmc2T7XrakPKF6YB9pwDHOrTIZ6VJ6o7vFHSMEvqNjJM9jMOwkt
         OOwI4dHme4AAFyCm5bEmnXa8F1napCjlp3N86G/dqUd0Y2+U7DZhn9Tp6IrCNOcdc38F
         +TMnqOH8OLg22QjnXosvSXezRDCgZOQArzB1AoVspQi9c+i/hcYYGPWOK2S1gh8bMz9P
         eD97tnZGmasY6kMn4nhEon0muFrRGFJS0S0grlRgURT0OYR8dtUaS3QhvaonTQAfcFtP
         am/w==
X-Gm-Message-State: AGi0PuazMLXNkJ17AsGC/LU3YO8DwbpdIt4gBJS59r3uRLWexwzljQDS
        0IohaGl2e1mXMWZDLSdrRfpv4xXLY210+IKsTNsdxw==
X-Google-Smtp-Source: APiQypKoTHn0cJuzKGjhu51d/sGUsrkJZ4SrSZew0vSiBm3gQMc/ep2bCh/uj8x3VtDMZyNngfdYdPlUlBeH3a6m4Zs=
X-Received: by 2002:aca:2113:: with SMTP id 19mr11528686oiz.128.1589210947246;
 Mon, 11 May 2020 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-2-daniel.vetter@ffwll.ch> <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 11 May 2020 17:28:56 +0200
Message-ID: <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
To:     Rob Clark <robdclark@gmail.com>
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

On Mon, May 11, 2020 at 5:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > I honestly don't exactly understand what's going on here, but the
> > current code is wrong for sure: It calls dma_buf_vunmap without ever
> > calling dma_buf_vmap.
> >
> > What I'm not sure about is whether the WARN_ON is correct:
> > - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
> >   a pretty neat layering violation of how you shouldn't peek behind
> >   the curtain of the dma-buf exporter, but par for course. Note that
> >   all the nice new helpers don't (and we should probably have a bit a
> >   warning about this in the kerneldoc).
> >
> > - but then in the get_vaddr() in msm_gem.c, and that seems to happily
> >   wrap a vmap() around any object with ->pages set (so including
> >   imported dma-buf)
> >
> > - I'm not seeing any guarantees that userspace can't use an imported
> >   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
> >   guarantees that an imported dma-buf won't end up with a ->vaddr set.
>
> fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
> by default, and restricted to sudo).. it really only exists to
> simplify poking at fw.
>
> There could be vmap's in the msm_gem_submit path, however.  If we
> don't, we should probably just disallow using an imported dma-buf as
> cmdstream.. I don't think there is any sane reason to permit that.  We
> should probably also disallow get_vaddr() on imported buffers.

Yeah if that's possible and won't blow up (I can't test) I think it'd
be best. Something like
if (bo->import_attach) return NULL; should do the trick I think.
Should I type that up as v2 of this?
-Daniel

>
> BR,
> -R
>
> >
> > But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> > calling dma_buf_vmap is the wrong thing to do.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index 5a6a79fbc9d6..3305a457960e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
> >         put_iova(obj);
> >
> >         if (obj->import_attach) {
> > -               if (msm_obj->vaddr)
> > -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> > +               WARN_ON(msm_obj->vaddr);
> >
> >                 /* Don't drop the pages for imported dmabuf, as they are not
> >                  * ours, just free the array we allocated:
> > --
> > 2.26.2
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
