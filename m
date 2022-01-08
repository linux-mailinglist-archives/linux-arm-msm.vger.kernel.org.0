Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD82487FEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jan 2022 01:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiAHA1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 19:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbiAHA1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 19:27:09 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453B6C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jan 2022 16:27:09 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id r7-20020a05683001c700b005906f5b0969so8383240ota.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jan 2022 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8g9Y4RuZWFxiMsPIDvaQ+fBgT+fTQjHR9ZTccgF3/K4=;
        b=OYRhnU3o+R1nSiicP0JnwrEAAytRujnsK5+KCA2Nzs5bmK0AIzWHPKMnresN9gTbkk
         W/ep+yUJjES90oRk63c1ajbxa4IamvlQFIn39zMpruqGre2frlO6kseWNwrpkWlIh4d0
         tFyFnXGczc1jB8ZgqO5q8cWkhpgalR1JM3diY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8g9Y4RuZWFxiMsPIDvaQ+fBgT+fTQjHR9ZTccgF3/K4=;
        b=I3XrIXPpsOUawN/Y8/8zSI2ohWrm2zcjRgbxMxllb1Ji0V/OwAzsuM6RpN7rwtLccM
         VpFtTryAuR9TiZ9IJHmaauuXxzR08YDX4xq1XyMsflaFAJNYr5ntJsGBkkO+SDaCYWTF
         HPhoVW5LfSEAOzCqpiikub7wGdsLDj8nsdrUa4OIXeVub56a1uZjDCy/lXFccSSdhhL7
         VnIciFcFlX8xW5KdpKh+AxLeASDkH4baQFjcFYgwE62RmnupDhH61Vpvwah+titBc0gK
         KXy2HvjUPJqf6axCpI7IqV/PvaigZEl1SAZgb6xu8cbrGloxv1KytbkeborMiM553vCj
         5p+A==
X-Gm-Message-State: AOAM532/qAwlgYJ97Mmrug6qU0xuK2AmiKwvE8qCOVKRuh7PvLzu4J+V
        Pr5GeeBCcJE16l+XAmd3WSDXv65mGsovtzm7sNH0cw==
X-Google-Smtp-Source: ABdhPJzm5bl+1dlG7IjEcfo4sutjPa4jJpUog3GV9//EpeVjS9XpHdZ2agKLM8sM3JMIGirZ+LdbhWUZaj563d9ilNM=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr46117313ota.126.1641601628423;
 Fri, 07 Jan 2022 16:27:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Jan 2022 16:27:08 -0800
MIME-Version: 1.0
In-Reply-To: <20220106181449.696988-2-robdclark@gmail.com>
References: <20220106181449.696988-1-robdclark@gmail.com> <20220106181449.696988-2-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 7 Jan 2022 16:27:07 -0800
Message-ID: <CAE-0n53N0GQ2UXYNpDOf_WVvvUa3cu95ePGYfYk7jZwPTqJ-XA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Wait for idle before suspending
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2022-01-06 10:14:46)
> From: Rob Clark <robdclark@chromium.org>
>
> System suspend uses pm_runtime_force_suspend(), which cheekily bypasses
> the runpm reference counts.  This doesn't actually work so well when the
> GPU is active.  So add a reasonable delay waiting for the GPU to become
> idle.

Maybe also say:

Failure to wait during system wide suspend leads to GPU hangs seen on
resume.

>
> Alternatively we could just return -EBUSY in this case, but that has the
> disadvantage of causing system suspend to fail.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.c              | 3 +++
>  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 93005839b5da..b677ca3fd75e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -611,6 +611,15 @@ static int adreno_resume(struct device *dev)
>  static int adreno_suspend(struct device *dev)
>  {
>         struct msm_gpu *gpu = dev_to_gpu(dev);
> +       int ret = 0;

Please don't assign and then immediately overwrite.

> +
> +       ret = wait_event_timeout(gpu->retire_event,
> +                                !msm_gpu_active(gpu),
> +                                msecs_to_jiffies(1000));
> +       if (ret == 0) {

The usual pattern is

	long timeleft;

	timeleft = wait_event_timeout(...)
	if (!timeleft) {
		/* no time left; timed out */

Can it be the same pattern here? It helps because people sometimes
forget that wait_event_timeout() returns the time that is left and not
an error code when it times out.

> +               dev_err(dev, "Timeout waiting for GPU to suspend\n");
> +               return -EBUSY;
> +       }
>
>         return gpu->funcs->pm_suspend(gpu);
>  }
