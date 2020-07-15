Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A842214A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 20:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGOSqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 14:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgGOSqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 14:46:25 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5723C061755;
        Wed, 15 Jul 2020 11:46:24 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so3253665eje.1;
        Wed, 15 Jul 2020 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tH8EzGJuAour5Ld/OHQpx0CjdtDcUT29EPy3vJhSCcs=;
        b=LM4EpI6WESzvFBV5KCoWIUoYciSkG1zCTp8PijtNtaAS47DCVASxc7lTLJ8wt89gE0
         lAMuHq9biKyfGvR6PFATVXcDzGzSPpoLYxQddlzyerPZO5Uit50kJjvx+hmrG+NMdfOR
         UZg6dFsem1/sVYfej3/+w7dD/pP+HZGRrmFrExI5HLbDuSC3wCLEyfeyglpyRsYaM6we
         eclcyCWci9mvFugI+DQH57aZ1/Gou2EUnk0qh3lHHDh8ToNdbiEuk1gcIYy4mnGcpoll
         1c99s5rlY+vBSI2qh9X16D/4wjw3MjOkpeZbrw+qdyCntZIfmggBVozUqcOEa0dU9E4+
         OgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tH8EzGJuAour5Ld/OHQpx0CjdtDcUT29EPy3vJhSCcs=;
        b=mo/d1vu4C/+6idNxMAlVRV6avvkiE0aGXE1NP+ROLSsIONBPaF4OJUnk6AXqcDG8x7
         NKw18XKl+yTSr9ncSdeQBoQCS+teUGEaxa52/0takQpoFq83h6ekArlob6khf+9/7Q5w
         1EG/eYC2ed3GppTWrjZLURQX6xULNHCdxt8qlYznTImfxlJ9fuN9K+u2jS+zCKoSclWH
         eNklbtdPzPm28L0G7pm54EQKOAjXL0qDQBpIQxkb8/mFmMXWxZdmQwjIpgZrZSQFugDy
         lmRyWgbAulfN4XLyBCauslFLlVxBvALQpOBth8rMoBmtdqoZD0WAoJGWsIyJqA5pF5sq
         Ertg==
X-Gm-Message-State: AOAM533+pj/L5YSbH/8Q6eSFZw1HrEfIKgZa3B51ESkZqx3BgkVf/vJL
        NTsiHntP0ibqvxxWHnExpo9OPPr5O5ux8qcjtEE=
X-Google-Smtp-Source: ABdhPJzo1fPucvEyPoQ56QHlEooluADNY4aAMZoA7854MihhEUE5Vf3uZG9kkSEm4QEumz/qM7DPbtqljfwTeHzRHIg=
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr323194ejw.71.1594838783369;
 Wed, 15 Jul 2020 11:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200715182955.3081774-1-robdclark@gmail.com> <baef95e0-e44f-be7d-f60f-0ba75b550050@marek.ca>
In-Reply-To: <baef95e0-e44f-be7d-f60f-0ba75b550050@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 15 Jul 2020 11:46:55 -0700
Message-ID: <CAF6AEGt7b+9jGGARTEGiuNQMPTqixXWfvJ5CygU+2h-qL34pBg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 15, 2020 at 11:37 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 7/15/20 2:29 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If there is no interconnect-names, but there is an interconnects
> > property, then of_icc_get(dev, "gfx-mem"); would return an error
> > rather than NULL.
> >
> > Also, if there is no interconnect-names property, there will never
> > be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
> > instead of -ENODATA.  Just don't bother trying in this case.
> >
> > Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 0527e85184e1..c4ac998b90c8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -979,6 +979,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >       struct adreno_platform_config *config = dev->platform_data;
> >       struct msm_gpu_config adreno_gpu_config  = { 0 };
> >       struct msm_gpu *gpu = &adreno_gpu->base;
> > +     bool has_interconnect_names = true;
> >       int ret;
> >
> >       adreno_gpu->funcs = funcs;
> > @@ -1005,12 +1006,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >
> >       /* Check for an interconnect path for the bus */
> >       gpu->icc_path = of_icc_get(dev, "gfx-mem");
> > -     if (!gpu->icc_path) {
> > +     if (IS_ERR_OR_NULL(gpu->icc_path)) {
> >               /*
> >                * Keep compatbility with device trees that don't have an
> >                * interconnect-names property.
> >                */
> >               gpu->icc_path = of_icc_get(dev, NULL);
>
> This is misleading because if it gets a EPROBE_DEFER error (or any other
> error), it will hit this path. Maybe there's a specific error you can
> check for instead to identify the "no-interconnect-names" case?

good point, we should probably instead just explicitly check with
of_find_property("interconnect-names")

fwiw, of_icc_get() returns:

  - NULL if icc disabled, or no "interconnects" property
  - -EINVAL if name!=NULL and no "interconnect-names"
  - and looks like -ENODATA if name!=NULL but no match in
    interconnect-names

The specific error returns aren't really called out in the API comment
block, so not really sure how much we should rely on them not being
implementation details.

BR,
-R

> Also don't think its a good idea to be calling of_icc_get(dev, NULL)
> again when there's a EPROBE_DEFER, the interconnect driver could come up
> between the two calls
>
> > +             has_interconnect_names = false;
> >       }
> >       if (IS_ERR(gpu->icc_path)) {
> >               ret = PTR_ERR(gpu->icc_path);
> > @@ -1018,7 +1020,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >               return ret;
> >       }
> >
> > -     gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> > +     if (has_interconnect_names)
> > +             gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> > +
> >       if (IS_ERR(gpu->ocmem_icc_path)) {
> >               ret = PTR_ERR(gpu->ocmem_icc_path);
> >               gpu->ocmem_icc_path = NULL;
> >
