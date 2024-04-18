Return-Path: <linux-arm-msm+bounces-17830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B98A988B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 13:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45991C20A39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1088D15E7F0;
	Thu, 18 Apr 2024 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7gOe1Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C315E5DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713439776; cv=none; b=juJw/8HdvlReVbsYp3/hyExHS59nSIsmfKAhusmQtSYmkRHUBKwnyj67oMBlhQwVVRhTXjvkq9xMyxRvx8HKmm9DW/bMAEJJmYk+fVm6cB7Vo1ODEtQ/asDqG0ELaU62vNuecp0P6Wv3g/Hals2W8Ardg4ihiwesaxcKr4M5Yrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713439776; c=relaxed/simple;
	bh=lN1vDTT/1GpDlMc7dTQoQFul/16jZ2rP94h7wx/6jI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5wWoUq+58C02bcyxRUgbttPmlXXKRSk5IpMd34jE8WoW6xm3BAOFeb/tx2EU+FohdI4gF+t1FkJ84scYQPiGF2UKj3k6DHN4tUq16Amm571SL4ZSVVyg4WLkyf2D4+0uKhz/JXTIzu8kNAEMbYoaV0xNKSpU/AF11EFyGSsewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7gOe1Hj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d2600569so929645e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713439772; x=1714044572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnnE/IfmzmlA5CHyUgqh20yYFBPuvnnShtetUjnyr8w=;
        b=p7gOe1HjaE+WJl5Zyf9NG4wwUdgRLiy+jDK0WDsxYVRzvQzwOm+RFdvrER9BKtoSgz
         44nuQxIsUkS0qzaRojKw1AvN/jbJOXPyblXD3pBGl4G0+SGaI4fMkp4lxFsmhXtWyPG6
         /mChTzrIJ5nzXEOa5CcAErL7dtSN7Ytpy/8zsQB9myWsTFI4le/wRBqMpTvcjGUtsznw
         OCENGPeKjsf1cTF7wxSoo12xCMYaOOA5N5ekBqfwQ/njkUf10RdoTZQtrgr6WpCLi9Ie
         AHBqDn3mAvFbnzeyVmx/efq+1Omf01GH6kSkyUePCBklZzoPXRS4vh7kPVskt5pyv/Pc
         PnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713439772; x=1714044572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnnE/IfmzmlA5CHyUgqh20yYFBPuvnnShtetUjnyr8w=;
        b=RGMvSBfZcGBMpXDMHuTtjMHyL1I7ZmYoMnivNfAbxuRXA/g/QEx6N6QZNMi4Fkk2Ql
         sgwUQNMytkiKLwXyK35xYaTIFkQyJG9wXPDxWcAjizxIkq9QPYjPUkJRyII5uaLZ0ia/
         b42LI7xId6eNsQkXHjJMpXOjg862+/l/+f6jJQ3FHcc803BfGuwb0laJXV247FP3QrE2
         DKBznHL6EHh53c23bgUrEXb8Fwv1xC8gjcdr8yac4xCymRXu0fIYV4KU0Nhp7coYvUeh
         jSa2TiQFd7UJiiCuDG9eis+QLgUraFwvfLrxQaUWbVJbeYq0fVNB9oL6DfYtd+f02byf
         nUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlnyyGkaWwUuRMEPTuN6gfpwaLjRA63IWYvcJsZOq7c2gvZ4trO1mgbpYnmRs64blLgqiRGIa1RrkslQRAIUXJhue2U6LT3PFOqYeaGQ==
X-Gm-Message-State: AOJu0YxrGQEgT2aTOMbxD7EGoV2Sm5nFz589eK+KWPzxk+XYxuhr/HSH
	xwv/tHdH8IE1ouf3Bgwgt7w1QulY1zMlVNrLNuWFgKMY8RckZYt7gDHVzDF/l0I=
X-Google-Smtp-Source: AGHT+IHDv6oDHXnx691EqLgUPOwR5cVUUBZLA5KH4jyaTEU8AhEQ4q2Ks28SwOSGF59XRR6bH5r3jg==
X-Received: by 2002:a05:6512:158d:b0:519:591b:6d7a with SMTP id bp13-20020a056512158d00b00519591b6d7amr2116064lfb.7.1713439771793;
        Thu, 18 Apr 2024 04:29:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id n17-20020a056512389100b005175dbca53bsm202809lft.185.2024.04.18.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:29:31 -0700 (PDT)
Date: Thu, 18 Apr 2024 14:29:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 6/7] drm/msm/adreno: Redo the speedbin assignment
Message-ID: <2ha26ft5hliicfgaiu6uk7cywyjhhl4x6gygg7rhqqftyfmwqo@qpqf6xr4zudy>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-6-c84f820b7e5b@linaro.org>
 <rilfqdvei26bjyz76hdsh5wlh4s2lcn235up2vxbs65pnolyty@rs77jbxxqzye>
 <132c1e03-f55c-46ba-8a22-9cea1ebdfae1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132c1e03-f55c-46ba-8a22-9cea1ebdfae1@linaro.org>

On Thu, Apr 18, 2024 at 11:57:35AM +0200, Konrad Dybcio wrote:
> On 18.04.2024 1:49 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 17, 2024 at 10:02:58PM +0200, Konrad Dybcio wrote:
> >> There is no need to reinvent the wheel for simple read-match-set logic.
> >>
> >> Make speedbin discovery and assignment generation independent.
> >>
> >> This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
> >> which has no representation in hardware whatshowever.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> 
> [...]
> 
> >> +	/* No speedbins defined for this GPU SKU => allow all defined OPPs */
> >> +	if (!info->speedbins) {
> >> +		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
> >> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> > 
> > BIT(0)
> 
> You mean for &supp_hw, or "1"?
> 
> 1 is the "count" parameter, supp_hw is a "u32 supported_hw[count]"

I see. It confused me. This way it's getting set to UINT_MAX, which
will match against any non-zero opp-supported-hw. Ack.

> 
> > 
> >> +	}
> >> +
> >> +	/*
> >> +	 * If a real error (not counting older devicetrees having no nvmem references)
> >> +	 * occurs when trying to get the fuse value, bail out.
> >> +	 */
> >> +	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
> >> +	if (ret) {
> >> +		return ret;
> >> +	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
> >> +		/* The info struct has speedbin data, but the DT is too old => allow all OPPs */
> > 
> > Missing assignment to adeno_gpu->speedbin ? Or is it fine?
> 
> Good catch. Only mesa (and I suppose you :D) read this value.
> 
> > 
> >> +		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
> >> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> > 
> > BIT(0)
> > maybe #define it?
> 
> (ditto)
> 
> Konrad

-- 
With best wishes
Dmitry

