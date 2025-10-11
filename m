Return-Path: <linux-arm-msm+bounces-76829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE4BCF423
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AAF34E16E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 11:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B77263F49;
	Sat, 11 Oct 2025 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1f/+Ssv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0C265CB2
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760181118; cv=none; b=DdGqqU2vsr89MvzBetvy+i7LKKmAUvKuWLZiRvTpcl+WoNGb1HfNFMEbaCqK9iNzeIaofKrCEPfkfxFXL1bMwV8tJxn6MkCzxEBcQkgqZXipI1jkjOaaeJtfGRlw8sM09b1z7NS0lbnn7lQ6xfZgLXiPcxI7pccUHcDJa1yuWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760181118; c=relaxed/simple;
	bh=VLNehFa+74G6ouliisMmWydo212BwNFmsaIJWfmT1OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+wyGaHhUxokR5TPCJliVtGy0ksFk8zjRK1PuVTeTF23bvvA2+5fC/RqC/N9jH1cgEfiTkY+x4MYIXuYDm+6FAkaU1Nsyf7ROpqM/VIVsEM7R8Y58KDa+GKBQiJUI5dH8gnBKyiGtPxWMc4sqDWg51bIk2r5rPJGg40wK9RhN2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1f/+Ssv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so33670435e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760181111; x=1760785911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNDhaIuD7OLkGqc/qEfwOdLoM3WbuTz3vo+ZGfTaAzo=;
        b=D1f/+SsvcoGN/DOnJT9cNhyLHomqqSBs6nP58pFDgoUVJ90QwiGz4Fu9PymoEBxmYb
         dBICfJt4l5K03bYhpoBF43SiHUnbhWIxPEVmC6eEYQ/GGYSBSt2oz47uD9RyORj9MGty
         GrU5RnZWaPAOUJwzVK9v/6WbCl0zPInNx5GebblMjIv3Q+39U6OJFWBA0DTs49vxJF/c
         nwZBzsfIX/REvrgEZabdPRWzh8lQJTggXKYPm5UYxR3IYbnp2oZYMa4bLrD0uPd7NdDW
         F9ggExgc+GUK8JK4/JbNmojSm19FnewyzGMqPD9feT3r4Y79aILFGYAQG3bqtrbf8yl5
         RSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760181111; x=1760785911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNDhaIuD7OLkGqc/qEfwOdLoM3WbuTz3vo+ZGfTaAzo=;
        b=eyjoHJhb1gji05ldmF3kTbaoH/bCtoPAlvasd+nBMQBNkRjmGg+4MYPm58V6tgOOtN
         e9fPpvLa7TEExiDXCOSKHYYbN93USlxOJNkfvg7gh++51GIJEcXh4EusT/ndfoZryer7
         opzWzPI4IHJplyrgUa9K5dGmUkTuABURINHy3O2QHaaMG9UN0FXJq4aFQ+yXOMqK2xoQ
         qnHwNPLWc0uVKV+mu+P9Llj5KoXMKFQcM7yZWnheWp2SDmEVodbDa1szF2KgTbsgaJan
         Fw2oR8QOAhr4Ax9qzve3Xd/JChSpGfoLl8hiNo1vcksFVO2eZdjeBta8GVnp2SMprnGc
         uAVw==
X-Forwarded-Encrypted: i=1; AJvYcCUu1eqit0S/kxkWCHEHSA6DNlR/w0qthRz6tw9TYe4MRmwfZdsR6ylTKACYwYpFq2bKmjoGupOUt75Om0Hm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3rFoyCmcnk4IoG5bw2s07QMTkEs3ra8W7L1Tx4+l2XYt0qBuT
	M8z7xNTPCDaSx1ifopfD1b+6+GKWVsp3IozdlzhiFHlQRFR5UNVV2tfuz4VNTrcIDBg=
X-Gm-Gg: ASbGnctJTndm+KnlO2MCwrBQUGv4Bl1BSVKzBvdUSmbUT6BOSH4O8OYmeM0sbe35svR
	DfvB2qgu/3qCuSgnKyBrv8qmZCCnvrdx4b5/5Bmvedjk40IzH1/EHZMZBRW/XTIHCSG74UB7/fu
	uk//v0hHsP3GG5cmPayfTuBpBab16WoCjOZx8Ywhiyf5L+mf8KvhuJlGLLEpyAeP0kDgi37mQpV
	szpRN5DMvI7xUiWqJD0yuG1r6CVXyXjw4Swi60HO4B5+WU001n/hnSadt4VnnkC5w20jJqLN/mp
	RbZn9z9MtIO4MX10w4UYCIQoDUpcZxCskVUKWoK+ZiD2iOn3iah6szUqvMRBhDSISYe12TFjUXj
	YRnCYN025UA2o6jzKo6/dFmAEGx7Lj74PzC0ydjjkRn4X6XPM83Zn
X-Google-Smtp-Source: AGHT+IG+Po5fydvrqlUM2RboMwUIiJXKPtq/u/N57XLVk2dGSAzVv03PCDsidqqc+aLMpsY6TSwuaQ==
X-Received: by 2002:a05:6000:603:b0:407:77f9:949e with SMTP id ffacd0b85a97d-42666ac7026mr9133286f8f.21.1760181110654;
        Sat, 11 Oct 2025 04:11:50 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b44sm8555148f8f.16.2025.10.11.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:11:49 -0700 (PDT)
Date: Sat, 11 Oct 2025 14:11:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
Message-ID: <odjto4fjqoi5ct33unring22s3p6vwnbrafyrcmrppwcdnm4zq@aabot4m6q2rm>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <3af57kktkwevbxkno4o54w3o2qajoco5x7dlj3ckepcutlzmdh@2bnqqxndbvf3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3af57kktkwevbxkno4o54w3o2qajoco5x7dlj3ckepcutlzmdh@2bnqqxndbvf3>

On 25-10-11 14:06:44, Abel Vesa wrote:
> On 25-09-25 12:02:12, Pankaj Patil wrote:
> > From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > 
> > Add device tree support for QUPv3 serial engine protocols on Glymur.
> > Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> > support of GPI DMA engines.
> > 
> > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
> >  arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
> >  2 files changed, 2936 insertions(+), 148 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index f1c5a0cb483670e9f8044e250950693b4a015479..8674465b22707207523caa8ad635d95a3396497a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -707,6 +707,32 @@ gcc: clock-controller@100000 {
> >  			#power-domain-cells = <1>;
> >  		};
> >  
> > +		gpi_dma2: dma-controller@800000 {
> > +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> > +			reg = <0 0x00800000 0 0x60000>;
> > +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> > +			dma-channels = <16>;
> > +			dma-channel-mask = <0x3f>;
> > +			#dma-cells = <3>;
> > +			iommus = <&apps_smmu 0xd76 0x0>;
> > +			status = "ok";
> 
> s/ok/okay/
> 
> Everywhere actually.
> 

Actually no. Maybe drop entirely like Konrad already suggested.

But then everywhere else you do "ok" please replace with "okay",
otherwise dtbs_check complains.


