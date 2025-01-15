Return-Path: <linux-arm-msm+bounces-45159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DAA12C24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 20:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B4D188778D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 19:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CF51D89E4;
	Wed, 15 Jan 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJKOl3AG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08A1D88CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736971183; cv=none; b=gTiqGY9vUoPoWE1XDqhLHxrD3/RGnF0TbB542Wlqt+H3bGTh60yv9EvP7AncFZc0dlFhNtUDuJSsKHky9CWULEVsQyAM9D2YUDzlSbpj8CLdOgvqSincU/63Ec2YiZwXqe1/nom0VbSmbc+2f3ymGjD8DmcES48Qs6gVp1mRYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736971183; c=relaxed/simple;
	bh=rRmOJmRIOy/wdMHwdCmOnXcji1lJDV0SyC/BXE9Q77Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj6mZRqalO0qrW3ET7jEsRRzysFzd1TI2EtT0NPINnlIl10xv4BBTS6nI8lMl6yOKgzPWXI8oWZD9gFfdMpjgz31aOI27j71/ce6kb9clClIG2q43OjoZUXF8OxdBFudOsAG7epdtyyi+G8LisYauF+j1W9pT9AcPVAUpYdqgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJKOl3AG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3061f1e534bso2175501fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736971179; x=1737575979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x37MGVTi+7LLCYAbiXmT4g42J1cDZJlwMsnlJFXjsC8=;
        b=XJKOl3AGEqP6kUeK5ZNBAULsWSrYiiD+LbgdCb+1aQwWeXZc2R+rTtXcXw9hV6sKc3
         z9yVpyn7WjKXHqdAlVA9tLIgGyIGwel9ogzL+J2aUn+N5NgqOZjVXW4cOOneW4HHSzHd
         JLM4mWoMgrO3VRkMwhSBjOZ6NJNWZj/lNRZJ9xYojSN10LQY95Yts3dx3mj9Iq5483gG
         PWglgy5c0Cftp5Yzc1WP2LUrTQkDHAgtd7buoEoQ4vXI0o7keOAtkTaSEeA/4Y6ODz3V
         pPBacjg3/C8OaEFcisEPyg8lxY1059Ez1kjRgnuGPbagVvwHdCRF1SYFF9W5xapkduHb
         zxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736971179; x=1737575979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x37MGVTi+7LLCYAbiXmT4g42J1cDZJlwMsnlJFXjsC8=;
        b=g5ei9ciRyGt6wmJRsj2TvGUowqqsmhb8uN9ArmyuurnpikBmPeJTL9JfB2uNEZ5kXP
         JQMcobf8iZqmMYMxFCSdA5dTCqTbh0qefZTyDcKATkSS89esiBAZ73UfbUExg9M896dy
         QOGSn3sME7wyIWGVqY4ssBRBhfKWAfxGwrg0AwA2Gqz5L4/RVpedXXmxn6UsAG33Yp+1
         DDOISO9l7NjAHBbEITFLBRdmDUhlraTuYkqimm0VZTF304oGHGLk77NUC29hy/GXJp39
         a7J2+ZnWxV6aMDbobbvcQxUZ0XvkQQnVplpGN0Vvolb6EFhAOQR9o3tyIbahnKzBvkqr
         jrLA==
X-Forwarded-Encrypted: i=1; AJvYcCV3p5tRCQixNtYqqtwYpL4PyPzStTrXNObLJw9k3xumj5ZXCrjfknDdwJB4XSyVFwybMIUa3t6SYSbdE4s/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZWg1A7xC/t3HcReQLPnqVsYkfL1/97gg335bhYwDGb/rEyJ0
	3+6OYjOBHdHwBHuz14HG7ICJXFa1MI26GHWPLNtwMf2gQyliCov6j16Exo97wqs=
X-Gm-Gg: ASbGncvzQY4BOEAfz9EWefxAuJaun+s7sH06qvI0A8MmcLdY4EcrSqJVxwhU987cAY7
	lmP0iX0R+oF0PmBq7vciCK0kJsSg5xiTouSGRjOKthebj6DtgXuqNKlSYTW89uNVY9DVGND5AW6
	ZMqFMQVDPSpoJtt6gB2KHZjWFV5/nyG4t6ls/p4Nl9RT1bnujxB0Jy+9psHiU5DWqPuRIabuvmU
	FmbRsqsGJl+n841fN2WTaUJ9ED0QikJog0hsEx0ADiA+Mbb/u/c3XM9T183qCoht07SBaortWN8
	UZI4rxpp3OhJYATL9i0IDX9Hhc0ORDWxyklx
X-Google-Smtp-Source: AGHT+IEgsaKsijQtzxn7rCfFidNVZj0/9WmlBcq9snlTFjWsJkPsdGTXxyCiCkpWSsFsl61eUySb8g==
X-Received: by 2002:a05:6512:1055:b0:542:91a5:1d5c with SMTP id 2adb3069b0e04-54291a51db8mr6711480e87.8.1736971179233;
        Wed, 15 Jan 2025 11:59:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be499fcsm2104336e87.8.2025.01.15.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:59:37 -0800 (PST)
Date: Wed, 15 Jan 2025 21:59:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
Message-ID: <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
 <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
 <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>

On Thu, Jan 16, 2025 at 01:07:17AM +0530, Akhil P Oommen wrote:
> On 1/9/2025 7:27 PM, Konrad Dybcio wrote:
> > On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
> >> Adreno X1-85 has an additional bit which is at a non-contiguous
> >> location in qfprom. Add support for this new "hi" bit along with
> >> the speedbin mappings.
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
> >>  2 files changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
> >>  			.gmu_cgc_mode = 0x00020202,
> >>  		},
> >>  		.address_space_size = SZ_256G,
> >> +		.speedbins = ADRENO_SPEEDBINS(
> >> +			{ 0,   0 },
> >> +			{ 263, 1 },
> >> +			{ 315, 0 },
> >> +		),
> >>  		.preempt_record_size = 4192 * SZ_1K,
> >>  	}, {
> >>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
> >>  
> >>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> >>  {
> >> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> >> +	u32 hi_bits = 0;
> >> +	int ret;
> >> +
> >> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
> >> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
> >> +	if (ret != -ENOENT)
> >> +		return ret;
> >> +
> >> +	*speedbin |= (hi_bits << 8);
> > 
> > Now that we're overwriting speedbin, we should probably have some checks in
> > order to make sure somebody passing a too-wide cell to one of these won't
> > result in cripplingly-untraceable value corruption
> > 
> > I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
> > a day?
> 
> X1E is an outlier here, because this was fixed from the next chipset
> onward. For newer chipsets, we can use just the "speed_bin" node, which
> represents a contiguous 9 bits. So, just do a "WARN_ON(fls(speedbin) >
> 8)" here?

Or extend nvmem core to support non-contiguous fields.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

