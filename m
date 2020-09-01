Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B6F25958F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 17:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731108AbgIAPxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 11:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgIAPxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 11:53:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E135C061244;
        Tue,  1 Sep 2020 08:53:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so2129976wrn.0;
        Tue, 01 Sep 2020 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BY4bXKc0xSgKW8hDeDD9u95KOuc3RBx/gc2Fu/W48eQ=;
        b=TBqWWrSB1mvUqsytHINsQUCpaD6PqLh3UsHJMRUkGwH/66biENmlSfUhshtvyFx1Jl
         Xm0W8v8iKkFOcdwlTL6nLnBqWo29CyX2TENRlw+7jc3NGK86XiruLidBhNmVttRUPs36
         LfzPsLKO8sOVbxnG5K3VaHG3CgZEMEConRc7AIKSnvCz2lQI2jXmSmo47D3DH2EVKIe7
         +716NNemet7lsA6Cel/JHnqqvzqRw7d6Q0bdmZn91FGsOYklnoY9Pd5xUlgENa1Qnr3l
         Vr9BpGca6oaWmy2J9JHDdL7RKAd04P1S/x/kgTGyfh+1EOOPBVSqethI5oTYr8bLFwhE
         x5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BY4bXKc0xSgKW8hDeDD9u95KOuc3RBx/gc2Fu/W48eQ=;
        b=d3ULZkh+M833FFKHtexqLP2qO8fjVm0TM2DILjA7EGw4XLLl7TL+rTtgIwQ0fR6eqe
         s3XP/4HhiO5SpB7KwoayWRPX6rX9RuND8FNHddCNG/U38+fkrnRVRhrIK7VZjISOuAbY
         6RX8KJy1hfqypnwUQc85rQILwed7NLmHWe2RGZTXbXCDf14en50fh5gznf13t601mnsa
         gVO37b0AnMTWJSGmFN20yPi9g+9GnH1OSsTlBAkmhwO97TlBPcS7Nh8nvLJkGfRMpTaO
         4lxWWdJ/iK7J3vgNWUpGHdWgwAO+8XQCao/17JRqA1ph4qJQE4WuFLb7oJKpaLvf6agp
         Be2A==
X-Gm-Message-State: AOAM530qMYOzCJYnkZ4sQsMCf1/yo9buycPZU1LxsDzx9hADpgpQzM06
        ncxq+B2a0yZU6ZgOilWFytqW/0lyeNTOBchgm3I=
X-Google-Smtp-Source: ABdhPJzDoeC0Pb4kh7G7ViZBofzjFA7/roqtprdLHZ43CwlP1yJxepquJBwNWHIMnMPZtjY/Vti5ADETxrYodXZvEfo=
X-Received: by 2002:adf:f382:: with SMTP id m2mr2458894wro.327.1598975584169;
 Tue, 01 Sep 2020 08:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-7-robdclark@gmail.com> <20200901043211.GN3715@yoga>
In-Reply-To: <20200901043211.GN3715@yoga>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 1 Sep 2020 08:53:50 -0700
Message-ID: <CAF6AEGthzRwUZby6XsToNpSbx0ad3hZWN2QM+qipR2zDDi-ySw@mail.gmail.com>
Subject: Re: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 31, 2020 at 9:32 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In a later patch, the drvdata will not directly be 'struct msm_gpu *',
> > so add a helper to reduce the churn.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
> >  drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
> >  drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
> >  3 files changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 9eeb46bf2a5d..26664e1b30c0 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
> >       int ret;
> >
> >       if (pdev)
> > -             gpu = platform_get_drvdata(pdev);
> > +             gpu = dev_to_gpu(&pdev->dev);
> >
> >       if (!gpu) {
> >               dev_err_once(dev->dev, "no GPU device was found\n");
> > @@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >  static void adreno_unbind(struct device *dev, struct device *master,
> >               void *data)
> >  {
> > -     struct msm_gpu *gpu = dev_get_drvdata(dev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       pm_runtime_force_suspend(dev);
> >       gpu->funcs->destroy(gpu);
> > @@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
> >  #ifdef CONFIG_PM
> >  static int adreno_resume(struct device *dev)
> >  {
> > -     struct platform_device *pdev = to_platform_device(dev);
> > -     struct msm_gpu *gpu = platform_get_drvdata(pdev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       return gpu->funcs->pm_resume(gpu);
> >  }
> >
> >  static int adreno_suspend(struct device *dev)
> >  {
> > -     struct platform_device *pdev = to_platform_device(dev);
> > -     struct msm_gpu *gpu = platform_get_drvdata(pdev);
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       return gpu->funcs->pm_suspend(gpu);
> >  }
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index d5645472b25d..6aa9e04e52e7 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -24,7 +24,7 @@
> >  static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               u32 flags)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >       struct dev_pm_opp *opp;
> >
> >       opp = devfreq_recommended_opp(dev, freq, flags);
> > @@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >  static int msm_devfreq_get_dev_status(struct device *dev,
> >               struct devfreq_dev_status *status)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >       ktime_t time;
> >
> >       if (gpu->funcs->gpu_get_freq)
> > @@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
> >
> >  static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> >  {
> > -     struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> > +     struct msm_gpu *gpu = dev_to_gpu(dev);
> >
> >       if (gpu->funcs->gpu_get_freq)
> >               *freq = gpu->funcs->gpu_get_freq(gpu);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 0db117a7339b..8bda7beaed4b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -141,6 +141,11 @@ struct msm_gpu {
> >       struct msm_gpu_state *crashstate;
> >  };
> >
> > +static inline struct msm_gpu *dev_to_gpu(struct device *dev)
>
> That's a fairly generic name for a driver-global helper :)

tbf, it is only global to the gpu part of the driver..

thanks for the review

BR,
-R

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
> > +{
> > +     return dev_get_drvdata(dev);
> > +}
> > +
> >  /* It turns out that all targets use the same ringbuffer size */
> >  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
> >  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
> > --
> > 2.26.2
> >
