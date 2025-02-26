Return-Path: <linux-arm-msm+bounces-49418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D03A45529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70A551886E47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F53B26770A;
	Wed, 26 Feb 2025 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="he5iouPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805922FDE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740549559; cv=none; b=GG1XS58NurmV3I3wH/7bpc1+ZbcSLYUjKb8a4h4e5UBTggipkBevwcO2x5NUjPafEalExUvkA8jt7pjOvk0XAh2hkh3GTupbiAqhofDyg7+FT6RsFgSo9AxY94PdS/p0C0WKKRucY+W3MhVHFTNhrgcwMMlF0iRyilDftAu+/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740549559; c=relaxed/simple;
	bh=20uJLoHJH8tsE+6AfrND96SpyUccdeO85E8ywgrZKF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHb68thO7qaqnMBT0762Eu57QVHvNhrKlAuXR1f8IKf5dnG4bnOceD8Ax2DnxAJMrGbBIJNjlINgRXrdyIhgV2L0I9/XAjjB+IfRGBKXkhNeodrL2Q1m3fbX+K0dHo9hW6I0p9VmJ8BI7rFltWsy6tBYVy3dT0YsWX/2P2KVtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=he5iouPD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5461a485a72so6199650e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 21:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740549554; x=1741154354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
        b=he5iouPD7D3qYSZ8109SS5Gq3/lc3sUys2g+VezqM+MlY6qIn2ew55Nh2ytLa1Rhn6
         LaS7PaT1vZ/KAJw98Vtm0sakwWw/60NkI+7TnH8qW3Xw+L6UQa+ScwGQkNcHflsyvPUe
         Wa3+TpATZCPikwT+SLubd5odHYMs+kGlj53yq1k1nyJuCBx0H/SvvpaLYk7Nb3hBurHo
         5ovA23D2CmmiPEWP8QpsOAwbe3zfmztYAYaZQqiSqUbu/HwOHtlfh7Z5H5BEM+BWKVR3
         xeWqMuvCqMEGiZQ22VnX4VOXMZBZI2DuEcirRJHNLOU8LdxO0q/m9gbx+TdZsCv8XWCb
         qXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740549554; x=1741154354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
        b=IjNA1UN6/AQ/NvVGX2gpT1hgc4P6Dzn9Y+jVm2r/7NwbALyrR1ntHiKV3MoWctEjgt
         MWqDdq0g2p8+rF9GGa16Ge3CtZXQgLmX5LXXEsTeDyQcXnd8r26pgcHKqwW0UBpK9BbQ
         gJNPv1l66kg+HB6LEe3Ay1WrTBKz7woayUmaU0UOlTphxpkJBBNMBper90WdL2a53AHH
         kyfl6YU8YuzUNDHmXtSwivHFFhlqHtsebIPuD+AnqxqhH+TwqcNt3SskZzyhIG3q4k3B
         hiul92V7o5ObmSqBCXZTIBmZ3oC/rpQfuYcqHXBZ9l1qShIxrs1pep+Qd3/pmPHSkdYP
         u4PA==
X-Forwarded-Encrypted: i=1; AJvYcCUNWmdSQjI3NR/O4K0pjsNx/w+C+A20ljeZ3q28W9+pPfr7Kxm9bdBCNVmguxLR4kBgkmJe3qsqN5PSo21b@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCcfzsFRaafw/wTvfhbi7EsqtjsLGE1a6HqX2O92CVRO3Gqqw
	OkWeKhKq3rq5uda2kgpd4M295wXSJHlX5yzXang3TB7onV8XQGnv09AxWZ9Aido=
X-Gm-Gg: ASbGncv0LxOXNKpC7F3kLX1BbuEfSxiKGUA+tIme232OSyABFMp7SRrR2fkhEomuJgJ
	H2HvTmfNuiz9yPPgYzPtwR3eBU2B6CX78IcgKiWsWPEqN498yyUskfBsA52o4fCSP904lwCDa4H
	T4NAvyb0lIEW6Rtuabbvet2Yy1281WdCOdJwaDWnk4NA8Ny6K+oOut2Z1YyQdTY3ctKldN8NsKF
	QkE+wsuHyyk54PWECIoRh+HMj1voDfBzsFsvAhF9u1Ex64HAy+5TtEqe0+rSG4to40B3EP5oC1m
	fMLzr8udbnr5GoxBO5/qngd2HAWT+KIT/xB+EeSd3SY842ErieTaxHK2DXfEnv2yqlSYLIlNtFi
	K8ScJcQ==
X-Google-Smtp-Source: AGHT+IEoS4qwP4ua72xrTF0W1n0ce2ri8eECexu7dt46ZDMlqiICPAa9TU2+args7SmvRiq5CJK7wA==
X-Received: by 2002:a05:6512:3f05:b0:545:646:7519 with SMTP id 2adb3069b0e04-5493c39db7cmr2155507e87.0.1740549553775;
        Tue, 25 Feb 2025 21:59:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f4d50sm346333e87.176.2025.02.25.21.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 21:59:12 -0800 (PST)
Date: Wed, 26 Feb 2025 07:59:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <xnbncjxfpc3cideza5cemnhskdpedqpiatmvxj3eu3xgtrv24n@iky5ghkh4grs>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>

On Tue, Feb 25, 2025 at 10:14:31PM +0100, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

