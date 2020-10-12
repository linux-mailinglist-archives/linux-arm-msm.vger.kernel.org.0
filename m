Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13A328BF20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 19:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390759AbgJLRki (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 13:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390724AbgJLRki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 13:40:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C198EC0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 10:40:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b26so14171457pff.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KPCBQGJFn0SxOT5QAxB8SIDlgbbUMf897x10D8eAgl4=;
        b=FvsoGzfEMAk7KCFRI3bHDorDFAvOk6IoDRmR44X64G369voHZ2IeqDSdfjZildjfP0
         RZZWKR2sJelEXoAwAsaPQaX6yTj4panBgXDHYIZbKV3H/3GIY/RypYvGctGRov0L0ehN
         BNuf+At3a39634/FaSGSTwgyMcM0EF42V5ZMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KPCBQGJFn0SxOT5QAxB8SIDlgbbUMf897x10D8eAgl4=;
        b=Ya1+rxFJtWzPPtmmYgHKLTgbJok4G14LXgRnNrZP7gziBvqpr9/r1UsLziqiAbvhru
         QH6faP5watBDZS//bwCzPpjW9ircmEIYJ+IZVkyuWbkZmki+W0V5DR9hb9AR91nARRIj
         xIjh4tuB2dkGqxbXltuYXbt0reZe4bIixwRTBBfNN6ZIGPnZn2wjeTv27X4yiJXMleFJ
         AEp9lePcNIJDw2x0E/MS+FSbaoGieT2TctnSizBFbrF7OzkvKpQAGmenFqDgh3Opw+tu
         XfPt7C/U1fBuhUxIbjVjWEr6U6mHOP87wyYJKBkTLwIOfJqKYTpokfsepFhjznFoF8hW
         L0/w==
X-Gm-Message-State: AOAM533wUNQMW1VdinT1wTNiRo3lgPWpV7CCu4neCHpGpsWV5Rvmwzs9
        wJ9eXZ3CWZv6jcN2CuuHqUME8g==
X-Google-Smtp-Source: ABdhPJx4n2kFy/ocJYOXijLTETMFaYerFoXQf6WoDsch6QEnFEuDBxSgbzWWb9ZwlRnPsbgGotlw/A==
X-Received: by 2002:a17:90a:5881:: with SMTP id j1mr11925578pji.56.1602524438208;
        Mon, 12 Oct 2020 10:40:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id w74sm6240640pff.200.2020.10.12.10.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 10:40:37 -0700 (PDT)
Date:   Mon, 12 Oct 2020 10:40:35 -0700
From:   mka@chromium.org
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, robh@kernel.org,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
Message-ID: <20201012174035.GA44627@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
> On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> > Hi Akhil,
> > 
> > On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> > > Register GPU as a devfreq cooling device so that it can be passively
> > > cooled by the thermal framework.
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > ---
> > >   drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
> > >   drivers/gpu/drm/msm/msm_gpu.h |  2 ++
> > >   2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > index 55d1648..93ffd66 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -14,6 +14,7 @@
> > >   #include <generated/utsrelease.h>
> > >   #include <linux/string_helpers.h>
> > >   #include <linux/devfreq.h>
> > > +#include <linux/devfreq_cooling.h>
> > >   #include <linux/devcoredump.h>
> > >   #include <linux/sched/task.h>
> > > @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
> > >   	if (IS_ERR(gpu->devfreq.devfreq)) {
> > >   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> > >   		gpu->devfreq.devfreq = NULL;
> > > +		return;
> > >   	}
> > >   	devfreq_suspend_device(gpu->devfreq.devfreq);
> > > +
> > > +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> > > +			gpu->devfreq.devfreq);
> > > +	if (IS_ERR(gpu->cooling)) {
> > > +		DRM_DEV_ERROR(&gpu->pdev->dev,
> > > +				"Couldn't register GPU cooling device\n");
> > > +		gpu->cooling = NULL;
> > > +	}
> > >   }
> > >   static int enable_pwrrail(struct msm_gpu *gpu)
> > > @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > >   	msm_devfreq_init(gpu);
> > > -
> > >   	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
> > >   	if (gpu->aspace == NULL)
> > > @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> > >   		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> > >   		msm_gem_address_space_put(gpu->aspace);
> > >   	}
> > > +
> > > +	devfreq_cooling_unregister(gpu->cooling);
> > 
> > Resources should be released in reverse order, otherwise the cooling device
> > could use resources that have already been freed.
> > Why do you think this is not the correct order? If you are thinking
> about devfreq struct, it is managed device resource.

I did not check specifically if changing the frequency really uses any of the
resources that are released previously, In any case it's not a good idea to
allow other parts of the kernel to use a half initialized/torn down device.
Even if it isn't a problem today someone could change the driver to use any
of these resources (or add a new one) in a frequency change, without even
thinking about the cooling device, just (rightfully) asuming that things are
set up and torn down in a sane order.
