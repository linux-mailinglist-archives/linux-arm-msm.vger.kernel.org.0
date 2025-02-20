Return-Path: <linux-arm-msm+bounces-48699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BFA3DDE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDB4189E8DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AFC1D618E;
	Thu, 20 Feb 2025 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dr2CLVwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B591CA84
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064160; cv=none; b=XX6lWccqXIOvGFdEGZtpokoBwmlTr64bncbm+n7LhQbyaaw5OKFov+rtV0HsZ6KTsLreI1If++p2drvqVYRfyCEVD20nbVp1aT3/Bt2xvS8MeebZJsHtGCvokop8EBIhTzH5iQ/0bUm/R7hlonHMV1agJaE8cj9Kuk79f2GW+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064160; c=relaxed/simple;
	bh=JlqoXuF53H31gxKpbWKHo/2meJt4C5k5NY8ch81d/pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOL0G0sQaZZ0sMOD7ZmF8jz+Qme5oD3zKQvOG/F7b5EFyH2fQXp3dyXW0QcIjdCsOvDiW0K+zn/lkZPcoYcDpT1jHvgb5sPHRFKCKb4FsUDzbkPuqtag5T3Ki2gyIIbIeUXJLAsDZ3ci5WsgqLvmPS4qUoNsR+9t3Vutl5P9jSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dr2CLVwX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5461cb12e39so1041760e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740064156; x=1740668956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TrqmFIDg7LS0RMitQBMTQIEpS/xCuYWiAEeRX3X4CQ=;
        b=dr2CLVwX8LejNPBMm5wGvYTsr677gF+81i0W1ZAs9UoSm8gjC27X0hQzdzKczSx4ui
         TLs9lsW0gAdhx+piDmZRp7pZtGnOf06vEfzvCknJcAtTVmj8vOJu2U3X/DtXgmezCT8H
         CwkoXYlP2T1uxuB9vqnF62vCfotdirY2IyKn4HJ/czixIHZvC6OaAMO2nYWm5ffw1oBG
         HYXo/PrdqJ9soDZBeN1LYoOjtfF5sWIT3PEcbfiBmdJMZRQJHwBJofUuRZWVbKkYHY18
         pm6sJKbpTBX+ahAJXUQwdHWI91yMNDprr/VmbAGApsto3ckAVujRhMe3+intCpr/5C9k
         LVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064156; x=1740668956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TrqmFIDg7LS0RMitQBMTQIEpS/xCuYWiAEeRX3X4CQ=;
        b=H4bTN8zxGNSvXQjz4rAFMHBW81kOPkZTyI1KYDjegEk8JY0g2VneMWaIPENsbEvDWP
         uoCcsTG8MoVOg5qVDuuR1ouYhOc1OEp9Vn9YV0rJJzHLIRkogIAnlIuKwu6anIa6stLD
         dlIEKQmVqqDeXUVaW+RRPOuujPL44q8xGsCb7FpdeH9BM6L5bn8Rjtpv0MstPX0lppyU
         cN27SpCCq+T4V1Y3c3EPFRa4Ewn8XO6uuiCcgAP925f/Fw/u+sp6ZfBKx9l5zP8JI0ut
         WhfPtnTll3sR0OsLg/zpSaCfbNJrEHRBaKuiWleAVqMQI3xRiAcXGv2K0MF2DCRSsl4U
         9WjA==
X-Forwarded-Encrypted: i=1; AJvYcCX3tzNvnXR7iG4kSYEXYN1E2fophtZTEhxHosVkxQjOxfvfIyxQKYO5u0Xzv3M6WY899eEqb9LG68j7fvbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWiACDulIdBul9uCqsDpuS4lqzsr74kg3N7gut3gH9BnoNrJk
	gV4ZY6r5gBCvOsyQ5seY/OCIjr3Cd30DWCFx0UzVuxiu1NaB0GTWFSvLacqldNo=
X-Gm-Gg: ASbGnctBEet1aKFFG6N9CDGT+xhrLTX+4LhpWVs81gonwSl7DtKytvqiw7Z1S8lhX9P
	QvkRDK9JgfMICRSqUvnFBjixXHpG7aiWlCZ/A7oX37kUkogc/1tlgnioTH/0Mx91RVAWVlJ7k7H
	8ZvuqCI13X+hp6f0MID0fZa6c+oInE1+xnL8/KrR3qbMJXI0rlsxy+MdhAPDW0HOec4tJkzVe3z
	WT37bLasjon1yvAy7CnlmYAyJNJPc0hfyrPk4fAbFc0EeUgYQWjCw+tcsHytMfeUqawbuapMuV+
	+gtPl3vzdrEcWTt/u/ewnjG1dg/aU1ivcDdhBn2GIhwt/PfG1QwiCwsd4aO6VVK0jbOQows=
X-Google-Smtp-Source: AGHT+IGYUSRyxQtQJHKFhBRccMyjpV7DJJR+lrKX82ITo7yqqtVGG6BQu2KYcQoKQzMfymattBJGDg==
X-Received: by 2002:a05:6512:12c5:b0:545:d08:86 with SMTP id 2adb3069b0e04-54723d1039fmr1235901e87.5.1740064156278;
        Thu, 20 Feb 2025 07:09:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452ba48767sm2109485e87.177.2025.02.20.07.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:09:14 -0800 (PST)
Date: Thu, 20 Feb 2025 17:09:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
Message-ID: <2sd5plw65y5ggknve7ou4utfuvnpmryi7ymhzlaj4x35zf5tb6@he7ukjvjknle>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
 <517f2021-d863-4976-9df3-ae5f64102b8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517f2021-d863-4976-9df3-ae5f64102b8e@oss.qualcomm.com>

On Thu, Feb 20, 2025 at 03:17:23PM +0100, Konrad Dybcio wrote:
> On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> > Instead of using .parent_names, use .parent_data, which binds parent
> > clocks by using relative names specified in DT rather than using global
> > system clock names.
> 
> You're not actually dropping that behavior, since you still populate
> .name of clock_data.

Yeah, it should be "in addition to"

> 
> Konrad

-- 
With best wishes
Dmitry

