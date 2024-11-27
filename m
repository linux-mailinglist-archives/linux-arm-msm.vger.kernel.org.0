Return-Path: <linux-arm-msm+bounces-39327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBF9DA901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F033C165351
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A911FCF6B;
	Wed, 27 Nov 2024 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkW3Ua84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAB1FCD18
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715377; cv=none; b=g9n9BOkbSkYvCFDyXYBDzvk7NWiXWEvU6bQ/G9ibt4yTsXz7bj7u5AHI00sA4uHt+1XEKnoqo4044mOCzmd7SMTckQluj9lmcRCZQc2mdsI5woK/a7PWZyGbfA2eLWcbtUscd9ZwC5+CZn+1hoEtNjI2jFYDLuXc6YfDNdDQuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715377; c=relaxed/simple;
	bh=WX6F2pbmJntTEVmTtzwmYGRGErBtTZ0nOLIu2nI/zDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/E1XbMHkd8mfQ4v0Kh6pvhyFez2YlCIlM172rxHrcowXmjGCROnqIOjZRXTEIfc/pGTRvy56R5Hia5rUnoFPYug9dky0n43VJt8MnYrRRol0mhLHzREL5tsA9m6sSAegWoWrRV12Ewbx2pBlkjCE0h+tiFKZPCxZNBFIisl0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkW3Ua84; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso4442481e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715374; x=1733320174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
        b=DkW3Ua84aeplAPJCJ32/ZS+VtqjFLVEV8Hmz2w++OlWLEFnrxfm28QIE0QbiwdCWlR
         hDKcuQrw7DhSl7O+EIWHQqIfY7d78vGCQuib1aDJTCxa8VdV2jOriV5e1o5fpZ0qk5R9
         khTV2lb7z1Wh+zig3rpYftCsc9q3Nnpc+QDpJCOefPdntLQU+XioF3GtnPSVHHqrmbsu
         TBe7SzJU6NsB1jofWN6YtIheLP5YTJmOTBdrLfs4oGhLdyAWWymcSv/nwYoCsSfwfrVK
         jKGCx92oKfqZ0d2KGEF2O3s+aaVdIdkOON3Z9mpk+VJtJ500K6vMdTSqeqPd5oBNh5on
         iqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715374; x=1733320174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
        b=c6J77P+3OVO5R0hL0IFc6xFYZiGZdFYhYtypupvBgHCHXsme2E98Twv7SofvyqBRfv
         FB8x3FjxmpAA/RyC2upfptDrPGyOQui3idunN5LBGjnFYchpMLWD4Oehc4RCEiDvqIzW
         6f2Y/mCk41hLWTk/EJmBe9RmtsLsOR4Izei/vPgcKGYG4ddv5ba1PaUbgo8rfWahEQTD
         3mqJkTEHcv8qtPjNCs5+Hv62zm8Eeu2Xz4TjIu4s2TtJwRAI/x6O2DMzBfgD26BMfW/K
         GZwibrWneEW3hr5bfylgwoHlLoUM+L63KQkI9Dx85tJsH/wlxYPR3qga9Q30HAhKf4pn
         l79w==
X-Forwarded-Encrypted: i=1; AJvYcCVP1ctL22UC1xqhelQtuugHCguVuM57DeKdCs5ZNw4LT+VqauQgQRaAjIGZS3rvXV5q0EfKj+mvX2CGl+Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YxESz9iFhy3PFIjL+9saTTg6/z66IPeqBJcPKYB4PN5A2gwbZPv
	qHmomndBq8ZHn2/V2ttoq4qCyHR5Rm6owW6+MH5dPFtiPuDozHrwi0Jy3dFsdSc=
X-Gm-Gg: ASbGncsNY3JbEFQZidY4AtDjQBvaNcc4X8if6p3ifpMZ4jYuKqUEj9G22NEt8gjKMj+
	LL5LjvkQxx0z5d37DSo5bnXljU6d4TDCRrVOLFlhTztDPXwyyYfK2NpaMew4Mcg2spDgPBFc4+j
	66iQpaJigFM4FZRe5167IacKpv4mEut0fa1wFoSo+kv/eM+e/t/RgjpHFwzaMTlUBv6uUVRtf2M
	etdnds8CL7FLQTic3f7+5h3Q1WJsc26bBlAxzTRJGdwfzRQV2UYYlTu8w69D7Bg6qQoGqI01QST
	iXjnOrHlbppp1SXNBeDz22YZOiVwrw==
X-Google-Smtp-Source: AGHT+IFxQkhy+KuEro7ZMNIqjxBcDKQk66j1eoYtbfEaE+Xo2Ghx/5z0Ju7Gw0TpK1R+/8bJQWa42w==
X-Received: by 2002:a05:6512:4012:b0:539:f7ba:c982 with SMTP id 2adb3069b0e04-53df00de5aamr1541730e87.33.1732715373671;
        Wed, 27 Nov 2024 05:49:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de0c3ce8bsm1323963e87.116.2024.11.27.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:49:32 -0800 (PST)
Date: Wed, 27 Nov 2024 15:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
Message-ID: <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>

On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
> Add definitions for the display hardware used on the
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 488 insertions(+)
> 
> 

NAK, there is no need for this.


-- 
With best wishes
Dmitry

