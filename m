Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC93428D334
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 19:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJMRkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 13:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgJMRkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 13:40:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B8BC0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 10:40:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d23so224243pll.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BgqdPWs6k36v3EWHSCP5rIGkH3M8a7CT3H5KDtj6quk=;
        b=D1gwXHACQsx2PqfeXXFocSDuvYv2+rCbN8y3GlauYrnpzYBaqeF6LlMSWiWsI7DhEw
         AHI7yLk23HAdzbup0c3EEgCntoVKaVXrspt86RkLh+rNrAJuCLAs7eyjaUsTcE0u7VxG
         Fq09OAfg/M9T/nMBxrTXXKJ3uXfFx3z58onpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BgqdPWs6k36v3EWHSCP5rIGkH3M8a7CT3H5KDtj6quk=;
        b=srJCmcMpnfjF1+Nlx78pr1VIuXOZsdFyQgihvm7l/o9XylxeeYUJYQIUcYE/kCtfi1
         HhPAehBufB4TOtpWST7kGS5GX5gEZ0zx2yHrjR/IYXWgBnegQp+4DMwY8gX3mZn005jj
         vcwQLPJq7jb0rnoq3CLUy8goueqDEa5i8fgK3AkVJAGLB/IwYpvmFyyX7Dxr+oJg1lOT
         nuJ2skDg2xT7G1XVbNG7nw9a69TwOnVGaMNoj36XGkZEOY5A6WHXCpqqUEdwtgIICOFR
         ULtYbUKrnmovvnvhUddLLtfxVq6zwxBMd1kIfKWtap/ramBVEz8b0R/+4Idc1nhzbyvA
         9fkg==
X-Gm-Message-State: AOAM531f4HWhq1/P8waSLqCAHSn/cIyk1/BKvblP7TvFx1VEWRxg7CGN
        54lpp2sOQ+fG/hPa9XV9683gUw==
X-Google-Smtp-Source: ABdhPJxcQDym/jLS7CXIRriJ6p5w8ir5pH5scUs0e3tlaC0hn8R/ZsAouQVQx9h4pitkUsStjIXxvw==
X-Received: by 2002:a17:90b:1b03:: with SMTP id nu3mr863981pjb.64.1602610841134;
        Tue, 13 Oct 2020 10:40:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n3sm265870pgf.11.2020.10.13.10.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 10:40:40 -0700 (PDT)
Date:   Tue, 13 Oct 2020 10:40:38 -0700
From:   mka@chromium.org
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
Message-ID: <20201013174038.GA424420@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
 <20201012174035.GA44627@google.com>
 <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 13, 2020 at 07:23:34PM +0530, Akhil P Oommen wrote:
> On 10/12/2020 11:10 PM, mka@chromium.org wrote:
> > On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
> > > On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> > > > Hi Akhil,
> > > > 
> > > > On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> > > > > Register GPU as a devfreq cooling device so that it can be passively
> > > > > cooled by the thermal framework.
> > > > > 
> > > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
> > > > >    drivers/gpu/drm/msm/msm_gpu.h |  2 ++
> > > > >    2 files changed, 14 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > index 55d1648..93ffd66 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > > > @@ -14,6 +14,7 @@
> > > > >    #include <generated/utsrelease.h>
> > > > >    #include <linux/string_helpers.h>
> > > > >    #include <linux/devfreq.h>
> > > > > +#include <linux/devfreq_cooling.h>
> > > > >    #include <linux/devcoredump.h>
> > > > >    #include <linux/sched/task.h>
> > > > > @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
> > > > >    	if (IS_ERR(gpu->devfreq.devfreq)) {
> > > > >    		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> > > > >    		gpu->devfreq.devfreq = NULL;
> > > > > +		return;
> > > > >    	}
> > > > >    	devfreq_suspend_device(gpu->devfreq.devfreq);
> > > > > +
> > > > > +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> > > > > +			gpu->devfreq.devfreq);
> > > > > +	if (IS_ERR(gpu->cooling)) {
> > > > > +		DRM_DEV_ERROR(&gpu->pdev->dev,
> > > > > +				"Couldn't register GPU cooling device\n");
> > > > > +		gpu->cooling = NULL;
> > > > > +	}
> > > > >    }
> > > > >    static int enable_pwrrail(struct msm_gpu *gpu)
> > > > > @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > > > >    	msm_devfreq_init(gpu);
> > > > > -
> Will remove this unintended change.
> > > > >    	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
> > > > >    	if (gpu->aspace == NULL)
> > > > > @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> > > > >    		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> > > > >    		msm_gem_address_space_put(gpu->aspace);
> > > > >    	}
> > > > > +
> > > > > +	devfreq_cooling_unregister(gpu->cooling);
> > > > 
> > > > Resources should be released in reverse order, otherwise the cooling device
> > > > could use resources that have already been freed.
> > > > Why do you think this is not the correct order? If you are thinking
> > > about devfreq struct, it is managed device resource.
> > 
> > I did not check specifically if changing the frequency really uses any of the
> > resources that are released previously, In any case it's not a good idea to
> > allow other parts of the kernel to use a half initialized/torn down device.
> > Even if it isn't a problem today someone could change the driver to use any
> > of these resources (or add a new one) in a frequency change, without even
> > thinking about the cooling device, just (rightfully) asuming that things are
> > set up and torn down in a sane order.
> 'sane order' relative to what specifically here? Should we worry about freq
> change at this point because we have already disabled gpu runtime pm and
> devfreq?

GPU runtime PM and the devfreq being disabled is not evident from the context
of the function. You are probably right that it's not a problem in practice,
but why give reason for doubts in the first place if this could be avoided
by following a common practice?
