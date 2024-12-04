Return-Path: <linux-arm-msm+bounces-40220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DB9E3866
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964B2161533
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B3A1B2188;
	Wed,  4 Dec 2024 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwF6CUim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B81B21A6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310421; cv=none; b=cQ7yLnWIVy5fjyzCrB3HZbeRtBGYfYMB7zziDRmu1oLSe6pPL3uoeit5mBrxO2sM/4IbqwMJN3Uzd+z27fJboC2KSLPtP10V+VnofBf7LTi49Coj8zZh/GlMLz2ei6rs8sGU7M3NU/THN1MtYG6lHTCv58Bgc+BzrS2twWWX2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310421; c=relaxed/simple;
	bh=E65WWkwNgLnXFkVJhkwVsz00upPotmr4Pfe+PM77E68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUi0ElRaIiDuOVoRfKsiRCEex3eDQG/4fKnoMBLZdeYyMkAue5cT56xKsbhdYks+nVFOW/MlAsD3u9sG38c8mP7XC8Z6I61F164InTs+gxj2DgaM9gcMJF5nK8S5Ts1d7APMCqsGiQZcKyda5vVLTtFfdQCp0SIxrnYCe7oBAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwF6CUim; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so68314891fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310417; x=1733915217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Frwodt7e80iVestTvU82jBPF1mauExxFI6AqVijqEjg=;
        b=AwF6CUimdgFE5Pc5NTsfZ2kgva8lQYAofkJAciTJcm8hk8fp7oo5Jut2rkh6NnILtH
         LKMQ16ThbY0cXsTsHxeZ3D7vbPI4kbi4zRFz+mjBZjBS39l9pOyD4tAh4wld3o7IzAMd
         Aa2lKHphSl9t3Dz7gwTpVQZD8MLZ9zRoaHyoD4wXh+WknS2QUzcvMUlh9m0kxDTcZAYf
         qIzjjmKw4w+R/58I7xulE5A5TbBC6xZVRvLyI37weeymWHnQurBCqGGIJnetYVhhB+q8
         JxTY+DnbQZim5mLgcVJA+b7J0FtXMzH2X5un2BZzo7SgZnMDdPE5HQqXjABV2XYT1Dyf
         yChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310417; x=1733915217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Frwodt7e80iVestTvU82jBPF1mauExxFI6AqVijqEjg=;
        b=Vn/cPJ4GHvrs/plpER/rKFvBTiDFM9VncAvXWXqBbbva1RqLcV3S0fKpfBz83YCzlR
         BRB/Pj+o8L0p4DB4orDkafvZZbjKiL0gKkKEM0A+LnLOtcHFj9FTFyG5uEgNddDM7fUx
         ud7xCEVp+i9O6QOO2B21W/+tiFBG3NjgpS/cjHDHunYPQqWUA4O8v0XfoSdmRuILTd1p
         CwwQluW8uQjAIax7bAZq0MjwL0htYX4aj1d1tLe94ZfVPMNI3Ydm240jC3vgo4Fstv2C
         T+FGO+YPHv8CA+IKy81+wyqcUGJceH2jm98T80HdqRdbcJIuXxZqTAsT8ppGW+1CEJHw
         yTWw==
X-Forwarded-Encrypted: i=1; AJvYcCUbUrDLP5okp62rYBfv85Wx28lUJgtLBh+BQwajdgmpDqXHi4O+AuPKK9NXYKBHa71CX+B/o4RQRL2s+uzq@vger.kernel.org
X-Gm-Message-State: AOJu0YyII5XCQV/1+leoQFkH8G+DcsU7g4pWxuO0JYfUzcbpvpGMudKc
	RtH0F4N+ilXkvS4WSyY5s2mqVkP7hk3rGzR3sl3hMZwrBUdYUB7XdTQ7uK8In4e5nBYmQbHSD7J
	M
X-Gm-Gg: ASbGncvUxeF/+VdTPU3w63/emau9L+Zx/AugEAnMTltDxsBoyWt2Vm856D7k+xszkR2
	Ne8pjObhyX7hvvsxZ1q/Jyjc5B3XLbTyQTdNtAIX2ryHRuPsD0b3Pe0kJse0OsfcfqxrcYgA6pd
	VwSUJKbv1O7eGBUHlTCiHXwx3yNb1dDCijBbsmeDKgnD++cAICfkA1op82959g9bbNcOzOe5pqr
	SqQKOcmqitXF68ezePjfKrPmaUBdd+O7Fipbak0r3KQnvHIw7jBPfxUMATraADWx0V9Q0wkuxzY
	mIYM9jyficYouSM9GK7faLytXV2r+g==
X-Google-Smtp-Source: AGHT+IEMk4pFxAlr3TGP6UdHEhLOi9fl1THCZj9kUnw9vcRnkqFukVuUyiWzLySwmier7TkiwbynLw==
X-Received: by 2002:a2e:b8c9:0:b0:2ff:d81f:2d33 with SMTP id 38308e7fff4ca-30009ca9f84mr30152041fa.28.1733310417470;
        Wed, 04 Dec 2024 03:06:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfca1c6esm19213481fa.104.2024.12.04.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:06:56 -0800 (PST)
Date: Wed, 4 Dec 2024 13:06:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7180-trogdor-pompom: rename
 5v-choke thermal zone
Message-ID: <b7ayn6kejzh3uaxcn5kfvrjdl5isiqei3uelf6yma7ap5c4gul@4qmnbdb6bix3>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
 <20241204-topic-misc-dt-fixes-v1-4-6d320b6454e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-4-6d320b6454e6@linaro.org>

On Wed, Dec 04, 2024 at 11:56:56AM +0100, Neil Armstrong wrote:
> Rename the 5v-choke thermal zone to satisfy the bindings.
> 
> This fixes:
> sc7180-trogdor-pompom-r2-lte.dts: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

