Return-Path: <linux-arm-msm+bounces-18208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3428AD51C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 21:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F2A5B2051D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 19:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E46155382;
	Mon, 22 Apr 2024 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrscIQKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58491155347
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713815161; cv=none; b=P9EGXhFsTnxKRK/8bhNg01K0hxE6w5t1lyyYOd4YBe2X9DkQP6peMnf6Bd2lK+7QIHRaSdqKHXsfcfeUbhulxeblsCCgeUmCd6yzbzMPYjUBOZUCcmgQCvu9GLBZHwy6A5W+mtoc49uWmkJ8esgyXuX6Dyu/NbSKl3gz9mwsOkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713815161; c=relaxed/simple;
	bh=Xko6z1fl55XyiHdSobQQnzhy7TR6fGyGMC1S0LXqISY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAwcbEl1V5x9KxbjusL8VOJYe/YXfGczb+G7JyXJSJpqjtEXsyUkEp2hjIXCTeQmcnvnUPAU3S3U3UP7CsU1heK/eqzQCmrp1sCzLsny6QNQ5sCNvAZBBVb+jJbSzJeQu8l1q6FQmq53SCADLrKIyZXNyBv7LUZhN2l/GimpxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrscIQKd; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51abd580902so3136681e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713815157; x=1714419957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oczHlzSC/UPaNc2LgQ5vSBFQ2KcNspCQ4fkb6GlVJw8=;
        b=mrscIQKdelKfn6uquWy1/MHya7yCswj6cwE9gBx49eeV8fIBoSC9/SM5M6VRZqPY7/
         8jiGh6I/pUmx15G1bU/al41Uf3Msh0dT+YTwdRdRRPfae4X2jthKpVPghaYSv9wtSK5N
         SpL26If9UDWJoPFe2KJjYfpL8JuIgixjlT/vBnyTzt52urVCLJ4Yb+4gf5iTcVbRRO3K
         7DhrmUJrbLQUdtztbE5EgXLiZz4GEpkZUaiqWXxtHayFPaIgv1QS4d2VQkUTzakI4awp
         /Y49RRRYEq+UrYiNqIVN0o1qxjO0yzniF1MnFmxXxby8e0fq+nId0B4/TZJJGMOtSVaj
         gsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713815157; x=1714419957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oczHlzSC/UPaNc2LgQ5vSBFQ2KcNspCQ4fkb6GlVJw8=;
        b=clqj0E9sY97g385hZ65bAEtYokhA+B1mZobYXWQpeisxQMTh4i0rdgNC00fY5BGY2L
         vxmYVL0Ew6JQK5YbScYZ7bmR1dXAScf/C0/CkaMc7nw1tzSjWmWcYSJmNDZyOQJH0ONP
         mcyDqnchJKb+0NURK/SArDeeOXlszZsgoaBa3OeDGWGAvqx51pTuwElgntTROgje96kH
         baO9w0GwqgwI0QdJp9C8t9HEUvCbh54XzH5tc5ur4+3xCezMCiHF1VxATG2C50bibgOt
         fTtxMbXq+NBok6IDDE7f8/NQTHAHQrwLxLzWE1eOle6V+SUb9M7GfUhkl/omlFvs3t6e
         2veA==
X-Forwarded-Encrypted: i=1; AJvYcCWofgLWnpXLx450QSB1OT/fdnTresMvobATKToKcm1UfOZfGnUdJir5gVR4/XihAVjAYg4MHTXE8GscJ0wtq5AOctvABiqnxH/90cMB5w==
X-Gm-Message-State: AOJu0YzYYtkiYLwr2R1nBQ9SW4cqIWKXH85R3peg8+YdngJ7SDHLBGf1
	d3hDkJaQQR41OBf4VPQoKpOz1UgPif7wIHGSIDo0Q9yYey7ZyQ6deCKePD8HUV4=
X-Google-Smtp-Source: AGHT+IF14L/T9IvkeZrOwqfHcwk2Y0hm4EP/cfe8FF6+164kRjiuEYO6k5CY9HCaFE2rH8uTWbvqcw==
X-Received: by 2002:a05:6512:20f:b0:519:65fe:ac10 with SMTP id a15-20020a056512020f00b0051965feac10mr201015lfo.32.1713815157475;
        Mon, 22 Apr 2024 12:45:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id j14-20020a19f50e000000b005194167c042sm1806503lfb.171.2024.04.22.12.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:45:57 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:45:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/mdp4: don't destroy mdp4_kms in
 mdp4_kms_init error path
Message-ID: <4aovv43qe3nm7uwb32b655lv54rion6lw4ofegi4vkr4si2y27@w3rvyvcw7mda>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-2-96a70f64fa85@linaro.org>
 <313d9eed-098f-c09b-eb5d-ac9ad56a8e1d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <313d9eed-098f-c09b-eb5d-ac9ad56a8e1d@quicinc.com>

On Mon, Apr 22, 2024 at 11:17:15AM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > Since commit 3c74682637e6 ("drm/msm/mdp4: move resource allocation to
> > the _probe function") the mdp4_kms data is allocated during probe. It is
> > an error to destroy it during mdp4_kms_init(), as the data is still
> > referenced by the drivers's data and can be used later in case of probe
> > deferral.
> > 
> 
> mdp4_destroy() currently detaches mmu, calls msm_kms_destroy() which
> destroys pending timers and releases refcount on the aspace.
> 
> It does not touch the mdp4_kms as that one is devm managed.
> 
> In the comment https://patchwork.freedesktop.org/patch/590411/?series=132664&rev=1#comment_1074306,
> we had discussed that the last component's reprobe attempt is affected
> (which is not dpu or mdp4 or mdp5 right? )
> 
> If it was an interface (such as DSI OR DP), is it the aspace detach which is
> causing the crash?

I should have retained the trace log. I'll trigger the issue and post the trace.

> 
> Another note is, mdp5 needs the same fix in that case.
> 
> dpu_kms_init() looks fine.
> 
> > Fixes: 3c74682637e6 ("drm/msm/mdp4: move resource allocation to the _probe function")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 28 +++++++++-------------------
> >   1 file changed, 9 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > index 4ba1cb74ad76..4c5f72b7e0e5 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -392,7 +392,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	kms = priv->kms;
> > @@ -403,7 +403,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		ret = regulator_enable(mdp4_kms->vdd);
> >   		if (ret) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
> > -			goto fail;
> > +			return ret;
> >   		}
> >   	}
> > @@ -414,8 +414,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	if (major != 4) {
> >   		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
> >   			      major, minor);
> > -		ret = -ENXIO;
> > -		goto fail;
> > +		return -ENXIO;
> >   	}
> >   	mdp4_kms->rev = minor;
> > @@ -423,8 +422,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	if (mdp4_kms->rev >= 2) {
> >   		if (!mdp4_kms->lut_clk) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> > -			ret = -ENODEV;
> > -			goto fail;
> > +			return -ENODEV;
> >   		}
> >   		clk_set_rate(mdp4_kms->lut_clk, max_clk);
> >   	}
> > @@ -445,8 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	mmu = msm_iommu_new(&pdev->dev, 0);
> >   	if (IS_ERR(mmu)) {
> > -		ret = PTR_ERR(mmu);
> > -		goto fail;
> > +		return PTR_ERR(mmu);
> >   	} else if (!mmu) {
> >   		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> >   				"contig buffers for scanout\n");
> > @@ -458,8 +455,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		if (IS_ERR(aspace)) {
> >   			if (!IS_ERR(mmu))
> >   				mmu->funcs->destroy(mmu);
> > -			ret = PTR_ERR(aspace);
> > -			goto fail;
> > +			return PTR_ERR(aspace);
> >   		}
> >   		kms->aspace = aspace;
> > @@ -468,7 +464,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	ret = modeset_init(mdp4_kms);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
> > @@ -476,14 +472,14 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
> >   		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
> >   		mdp4_kms->blank_cursor_bo = NULL;
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->aspace,
> >   			&mdp4_kms->blank_cursor_iova);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	dev->mode_config.min_width = 0;
> > @@ -492,12 +488,6 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	dev->mode_config.max_height = 2048;
> >   	return 0;
> > -
> > -fail:
> > -	if (kms)
> > -		mdp4_destroy(kms);
> > -
> > -	return ret;
> >   }
> >   static const struct dev_pm_ops mdp4_pm_ops = {
> > 

-- 
With best wishes
Dmitry

