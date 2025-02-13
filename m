Return-Path: <linux-arm-msm+bounces-47933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBCA34B4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D951884AB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0203E1C863C;
	Thu, 13 Feb 2025 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Si/Ctduw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822D15855C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466044; cv=none; b=cg/UFw1O8qOjdwC/hKI9sqqKFHFhS8f58shDxBmu/7wHixBaBnn+eZTxNCK1TR4TVpNot91rnqeuxkljtXg6IdfVe/9tno/DO/ey1uZclDN6QD4DDwhkFRf5vIrPvCr9kHMmMqV6inAsigC+f/M6JDTIHIWZBoYw40XVpwwGSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466044; c=relaxed/simple;
	bh=zmrS0xInz7ZPMUNPbz50a5drJQVT6ULUv+bzAYPXgk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrrT9g9tQsEHMXSshO/nAQxofAjW3CT8QRU/WtwZDJo2Nab8hznhz8ZY8Ma/rCisuyUo18sbdDW8l5VGJwT5q+xcEOjEUCQ30SnZGZvJDEli5yCOsRFTA+O25gJda2kH0umRXiz5oWVleXuAsAb55EMOz/7VJEt5zVUWeSRIJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Si/Ctduw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308e92c3779so23284931fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739466040; x=1740070840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
        b=Si/CtduwsftKKkyi4Tc7D+f13nEYGhj+mj8tcD4oK/vbczAm2L9R/AzIFuhDr3VywJ
         9dNO4vyekO1OfgEvvuiqEKbEQMsYx8/RlcKUZVOdXZBliX0FibDO1F7C/59LyaKlcCwS
         XNJl0Uevqzb6zOgmiiC6cZevOc1oiT5zLQyDbWK0afHgrAyBPhGoOzIXMl5jQijuIrsy
         +7Hw3pZURMqqAzcT3K8aajjZM4ewnjWhWrTGTNU+bb0acOQGW87wiCHf0VU6AViyfbMH
         1GFQu/vibqQmhruem1WxaVYagX1U5xAVawytRt7N2d3KjgcarHWDgLiYYyDqZc/DjLZO
         3wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466040; x=1740070840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
        b=BwOa+Yrk+Ph8juJCfNuLYYCU/UPJYASubHydIRarDwhlCCj1TYNv8/WZ+TVT6Mwz95
         gk6vcufmvP9bv93H9FeE771Y2HopsdbXMtH/1O3vvDlnDu4LChlcVBV0QWy2AC2WDide
         V0SbSPcudRTcxPJlIOfICHo/LkR/JnjaOfXEHEgzZfjkX6d7j/5VbTK1ZqmJ4Wbs7WyL
         lEmNXGezK4ezBbmKsgGTHgrmgNjldLTsqnaul8VYDzI2sLzXnwqQjTd6ATtxVs2W1Jeg
         CICSylY8A3E54zktCsr2J/gFdB2Y2dspxhSshhcGI7evQwl63bASAdB00T1GO8psAZFh
         kWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk6mRza4p+HxUSZQTldYPfDy4os02JTLmlYAJw8ORBJ/VxOWrIlpJ+O46YovkN+C/Xy7mHHh7Z9j3cAVy+@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrp2Berpu9BG+fCE2u8Lrp7VRnw8hg8y+4VkqdQve0ZG54JRM
	f2IU+5utTxnI2vfWw0V/EKKg6iXzOiH2COOXt5rmlFFZA9or4EOIB8PdvU6Tdlo=
X-Gm-Gg: ASbGnctaV4sC5ulrYEANDoxdnd6dKREI137L1Nc414nED74vnbeZ5azVbQNawFrkpg2
	vDNlAwM9oD7Sr2JvZqI9+chLRh0RlqATJU/ZwADm+N4kK4/k5xP72ynW7Pu5YuH6WegzIBUf8Ns
	1n8Nn17WbUrpO5d1wFCYYXl55DmxmEbg6uS8+9j0694iQoFybWHqrl8NrgIFsQ1fGdA9JGcJhwm
	Oi6xknqJJ41Wc4TAOiWvff7OeHO2Y73l7dBHrOd9vOJU+RCbX+dqsKSk3XAYZN5d9JKdfbhBIJt
	bnMwA5G+qcG6GXu7ePIaglglyTolh71Euy3hUSQdSIewYA5nxWd4/QCflR+0fzdtf+bJwJ0=
X-Google-Smtp-Source: AGHT+IFxfLzjVADe+NQ9hyecFQjlri4ibXGiH0NU1miK6ClkLcEickWMwRLitIzMvkrGViP4aYFupQ==
X-Received: by 2002:a2e:8887:0:b0:300:17a3:7af9 with SMTP id 38308e7fff4ca-3090f3bee24mr11613931fa.19.1739466039832;
        Thu, 13 Feb 2025 09:00:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b835sm2457111fa.100.2025.02.13.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:00:38 -0800 (PST)
Date: Thu, 13 Feb 2025 19:00:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <7mojw3jf5skm4esa3xquthkpwez52u5fnbvyqj7g7hdjgsz5dz@ewfsb36sa7tx>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
 <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>

On Thu, Feb 13, 2025 at 05:27:59PM +0100, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.

Same comment. Nevertheless

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

