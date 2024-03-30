Return-Path: <linux-arm-msm+bounces-15850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA1892D42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 21:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCEE8B220F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 20:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895E551C5B;
	Sat, 30 Mar 2024 20:43:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AB36AE4
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711831416; cv=none; b=CUUHYSdiaAHHBx59uX73LEyLZfsy6jh84y6/h2J3D1CV6/rZL339ObZbd1JB6lSVpPnprS6sTzl2iV2w/Oz7huZv89QBKnHQsH2tru1mkuoY+F/cSCAmhryeUnPpK7u3fbMva580Xg/m1jK8xDR9mpSjs7dlplEiEAshwfL5Uc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711831416; c=relaxed/simple;
	bh=pfqKv3kINo7s12Ag+5JFXZnOc3IMumuu3lzrRgtEIZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syUPtSZamKQbiAww2ZZqvoByeYnMmN8BDCcYRqG3/unqRj7P9+X1eX0GxXFwjJTGU7iEMpKiRPfeyrYulvSAXuwTRUBvPW4BXjSvvWcrXoUSqsHUZLzUzyBCLaU4CVQmg5kj16X2FS2VOX3IoQhhww1sVvJPQDWxs1AKrLO5v3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 265153F61D;
	Sat, 30 Mar 2024 21:07:43 +0100 (CET)
Date: Sat, 30 Mar 2024 21:07:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Message-ID: <6ysok4lmub3xuyjwbc32lsecmurfvaciv7bekxrjefdzmv4mrt@sei6yxukozca>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
 <dosvghhvlrmmrdvd5malknbgdel6vlclvozkqcdvbmjnaw2yze@vr4pqvu3mudb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dosvghhvlrmmrdvd5malknbgdel6vlclvozkqcdvbmjnaw2yze@vr4pqvu3mudb>

On 2024-03-30 11:31:37, Marijn Suijten wrote:
> On 2024-03-30 05:53:22, Dmitry Baryshkov wrote:
> > There is little point in using %ps to print a value known to be NULL. On
> > the other hand it makes sense to print the callback symbol in the
> > 'invalid IRQ' message. Correct those two error messages to make more
> > sense.
> > 
> > Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Agreed, this is a lot more clear:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Note that, as seen in [1], there are still a few codepaths that only print
"invalid IRQ" without any additional context (if we could even add it - __func__
might be a good start) and inconsistently use DPU_ERROR vs pr_err too :/

Any possibility to address that?

- Marijn

[1]: https://lore.kernel.org/linux-arm-msm/mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2/

> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 946dd0135dff..6a0a74832fb6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -525,14 +525,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
> >  	int ret;
> >  
> >  	if (!irq_cb) {
> > -		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> > -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> > +		DPU_ERROR("IRQ=[%d, %d] NULL callback\n",
> > +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (!dpu_core_irq_is_valid(irq_idx)) {
> > -		DPU_ERROR("invalid IRQ=[%d, %d]\n",
> > -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> > +		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> > +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> >  		return -EINVAL;
> >  	}
> >  
> > 
> > ---
> > base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
> > change-id: 20240330-dpu-irq-messages-5cf13fd7568c
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 

