Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C839F21C0BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgGJX2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgGJX2m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:28:42 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39895C08C5DC;
        Fri, 10 Jul 2020 16:28:42 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dr13so7759762ejc.3;
        Fri, 10 Jul 2020 16:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzVgodV2044NdM/Krgytwhtop4ouw4FLMMvBYFt+YIQ=;
        b=BbBPbcBOOhPXg2G6ZW+NeOzdbInLdxQD0SpviWDEwzFEUtOBoUYVmsdkZxabAh9AY8
         0PKDTY88rzgWDsYxQdUh2BSSHWpwYLZiWY4F50Ktxmq9BBSPcIXTAhkrjT9GXmJURzJr
         24oscTpEFyGJomz0OxWsZx0/4VPfrNFU9oYHoaCXZ/FSJUfz0KZGUcuW5ulXv3ISKu2z
         A/1Y+ESka0YbFLWbjKu5z+H/XWAGQeZdQMXKXIwwFdDpXDbHsNrarZoYibQSLRn3dNmN
         euGc4l8TwFLVZaW+A5VkqRP2DvJQ0tqRTV1GMXObjpVgA0jX0V+6+dxP3378cafjJK5k
         te6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzVgodV2044NdM/Krgytwhtop4ouw4FLMMvBYFt+YIQ=;
        b=WXzPchlcoOhXx93bQdHQdUkEFjcxmceXgxxvyITYvZmJkp4mzfDfRlbS5gqqH8xaj1
         pmtU5CJ6LtC9F2hFog00gW2za55FlLfhqmFPDBZy0MBVAZApMgTcFXVYT5Ddh8OQl623
         2zVSQGQv0FdNKAlVz3r8h4maLNsgLIrb/pLh73I+rFWOGb5M9l4bmMZHZyJEZqvzt01i
         NuiaviCM1YEhb+VM8iaWpn/Wkg7uI7Mu8qEervYKmSFfuJv4LxbxdC7uDdked4jsD8NO
         HPH7TQaqU31ybIE9Iubn2Tzi5v0iRFMRCUZetln9GScKQmjkVssIHBUSRvvmHJ8VBTtd
         YGtA==
X-Gm-Message-State: AOAM532Uke5fvN5uEQ5WwRBPuQosxEemH+e86e2ywn380QWjCjh9znzA
        Pt7V5Xlc13KgtTBuSqyhZlarMJYrnWycFwSSDiJx0IPo
X-Google-Smtp-Source: ABdhPJxWsXEH4BLy9e7jPFQ1m1LEibFY6E59Se1fE5uCBG4Bt1OTlLlcEPD1O1ydQK/fTFLyaIRv99ZVVV3B1ivPqKs=
X-Received: by 2002:a17:906:4d4c:: with SMTP id b12mr61930508ejv.506.1594423720898;
 Fri, 10 Jul 2020 16:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200709143404.11876-1-jonathan@marek.ca> <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
 <3729cda9-2d02-c213-c31a-d3e1316798f8@marek.ca>
In-Reply-To: <3729cda9-2d02-c213-c31a-d3e1316798f8@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Jul 2020 16:29:11 -0700
Message-ID: <CAF6AEGuPfgeGBPv=H4xYDiRj3eXUvF+zGC4U8RPTSca_sNeAUQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: handle for EPROBE_DEFER for of_icc_get
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 10, 2020 at 4:11 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 7/9/20 11:15 AM, Rob Clark wrote:
> > On Thu, Jul 9, 2020 at 7:35 AM Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> Check for errors instead of silently not using icc if the msm driver
> >> probes before the interconnect driver.
> >>
> >> Allow ENODATA for ocmem path, as it is optional and this error
> >> is returned when "gfx-mem" path is provided but not "ocmem".
> >>
> >> Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
> >> been called on the list yet when going through the defer error path.
> >>
> >> Changes in v2:
> >> * Changed to not only check for EPROBE_DEFER
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
> >>   drivers/gpu/drm/msm/msm_gpu.c           |  2 --
> >>   2 files changed, 14 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> index 89673c7ed473..0f5217202eb5 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
> >>                   */
> >>                  gpu->icc_path = of_icc_get(dev, NULL);
> >>          }
> >> -       if (IS_ERR(gpu->icc_path))
> >> +       if (IS_ERR(gpu->icc_path)) {
> >> +               ret = PTR_ERR(gpu->icc_path);
> >>                  gpu->icc_path = NULL;
> >> +               return ret;
> >> +       }
> >>
> >>          gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> >> -       if (IS_ERR(gpu->ocmem_icc_path))
> >> +       if (IS_ERR(gpu->ocmem_icc_path)) {
> >> +               ret = PTR_ERR(gpu->ocmem_icc_path);
> >>                  gpu->ocmem_icc_path = NULL;
> >> +               /* allow -ENODATA, ocmem icc is optional */
> >> +               if (ret != -ENODATA)
> >> +                       return ret;
> >> +       }
> >>
> >>          return 0;
> >>   }
> >> @@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>          struct adreno_platform_config *config = pdev->dev.platform_data;
> >>          struct msm_gpu_config adreno_gpu_config  = { 0 };
> >>          struct msm_gpu *gpu = &adreno_gpu->base;
> >> +       int ret;
> >>
> >>          adreno_gpu->funcs = funcs;
> >>          adreno_gpu->info = adreno_info(config->rev);
> >> @@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>
> >>          adreno_gpu_config.nr_rings = nr_rings;
> >>
> >> -       adreno_get_pwrlevels(&pdev->dev, gpu);
> >> +       ret = adreno_get_pwrlevels(&pdev->dev, gpu);
> >> +       if (ret)
> >> +               return ret;
> >>
> >>          pm_runtime_set_autosuspend_delay(&pdev->dev,
> >>                  adreno_gpu->info->inactive_period);
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> >> index a22d30622306..ccf9a0dd9706 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> >>
> >>          DBG("%s", gpu->name);
> >>
> >> -       WARN_ON(!list_empty(&gpu->active_list));
> >> -
> >
> > hmm, not a huge fan of removing the WARN_ON().. can we just init the
> > list head earlier?
> >
>
> There doesn't seem to be a nice way of doing that. Would it be
> reasonable to instead detect that msm_gpu_init wasn't called (checking
> if gpu->dev is NULL?), and just skip the msm_gpu_cleanup() call in
> adreno_gpu_cleanup() in that case?

Hmm, you can't just call msm_gpu_init() before looking up the icc path
in adreno_gpu_init()?

BR,
-R

>
> > BR,
> > -R
> >
> >>          for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
> >>                  msm_ringbuffer_destroy(gpu->rb[i]);
> >>                  gpu->rb[i] = NULL;
> >> --
> >> 2.26.1
> >>
