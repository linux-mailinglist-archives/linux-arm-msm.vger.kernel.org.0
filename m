Return-Path: <linux-arm-msm+bounces-76828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409ABCF411
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DBF44E6916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 11:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC71262D14;
	Sat, 11 Oct 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydMxZPQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E375F9C1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760180815; cv=none; b=FrwbffiutzkJ47a4NfFPAIoIq6WZSLCNSgWCHQx7Ty69JylgOMDBQ37jSCIh/b6+sFw6AHdmURcstMAOJx9zEoRZpcDPeS0dmNpNoAFWWRWGSv32JMFwQhp31rvCOJY4vtECTQHhlvsUgkrt8/fsBm9BXE04K4+NA4lR95Ud294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760180815; c=relaxed/simple;
	bh=DFtPK8eRVHr4jByOoKRmS2GzzHVM9d7Kax895/EA/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REyQQUkQcYnX93F4nEc8/SlJlRum+6cGwW90TN9Bac105uiBVBGyJ2ClhpCSDUWHC0CdHsvi63NI3PnZbqtAvnDPzLn3VniCMXmOUxmLozvfbglqN5cjX8wlHsYQACUT/H6/V/Z7VKON3PGM/bLlRUwra1uFk2DlIJXCZwL42Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydMxZPQo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso30250995e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760180807; x=1760785607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hUM2/URIhgfzGfcKYQTjSM1umO6xjx3Kxpuxk6gO9mM=;
        b=ydMxZPQoVOFT3LP7//xVCQoQhrIDuSx77DVHOEHLILHf8VLDRy71a0qNVbqc3TJT7F
         rkKjX3u4H/j+OQnFd6ooORKGgaSvK7lpcYu4YK5SLXP9aeMMNEv+YafBIC0vxGRteKuF
         OkOf+1E0euv/1PNYk05oET/ivPsTpJZktr4owVGsFg1Er86ha/5O9sbUISSrZntx8ZcZ
         FhCaAkxmPDs3ZDnaJUOQGlfpLW3ZRSzmceId4vS0K/uaX77WX3UMWP0xsZt7g2RJ/EZN
         fjDXbVeOyxH1momBW8t1TCTZP/i3n9tGVQW8+Ek7aaI5NF+xY5itPXA90pX9FneR2ggj
         jaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760180807; x=1760785607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUM2/URIhgfzGfcKYQTjSM1umO6xjx3Kxpuxk6gO9mM=;
        b=NIuVkAJ4nTo4Oj5z+BimnBs1sCxYUIV8PP8aN9X9lwX4hFQjW+7WuiGWzsZjkqiiGP
         jEdhUQhv9qiijsjTfQhYNKUikqLcT5yPX/z8KmWFo47l52li4tQ2NcSGUEKT7aM1igHt
         5XMmu+pMsNiax5o4073QSfY9bENehOL83f6216dCgfj+11eV/8MCkVyeIwOkEOfIJWrT
         4vj8gG7Wn88qNmEhqvTPJim7EMp7Sde/MauYusR//+4q0P0mrhZSUhWB6LmjnM4asyDt
         SfE1jaGB8k1jyU840XC4aIaHaUcXhe+4vC8GAYA21TJ+T4e7tiVEy7UyXwvDo4maJ/o0
         Gd9A==
X-Forwarded-Encrypted: i=1; AJvYcCU9R+8gKXsh6zq4sZ4yFMqsr8QolQLNWfTFNTyrDhVqxcy0PT5pku9qzZ2jn2dMDXeLLaxNQNNrdTU4kQBg@vger.kernel.org
X-Gm-Message-State: AOJu0YyegOWuePUyZpcCYNXB/OBnXTzS0ZzeL4hloOHzu0e3sucB9GJE
	PQmpPzLF7A7eADzGy6nWdQ0n7h23gcneoV/pqeLa7/y/cNFvUJoeQowNpi+mTu0WOnw=
X-Gm-Gg: ASbGncuo0e42pfUGjbmQZQ9bU/QaJ4zq5Lde7GlnyV2uyitrAz0vSFfGIWdb8g17N4b
	VnkxaAygw3YEW0QeSQgO/TTmBqqQ/9k6C4pMqzltgNRLNojsikCOQRp9qqrlllH3PCPV/83oVxg
	dmfHsfTHHtuKTAZOzMhl05zwtQ9MwzpEQdGOaL7PM0kno4WsOHLThsvvDCcOXL/EeK434buSxyB
	OKlGVH158aGzarkenh5NuW5vfu56Fp0kyGbtO0yYU2j509Dk0qXpi3MEFIu+ErolCBezuvRerJ+
	MqhwieeI6U5+koolPfvHkhy87Q/2wnYN3ZNRaLBF0ZpWqFMg9JpVHEuxEYQ4IetylsfKdUAjyR+
	ooUvOpNFsxmwlO2YHfxBg5/Fg9Hq0xsSnM88vue/YqYvmLjapC6sr
X-Google-Smtp-Source: AGHT+IHGR+So1TUHRFxgxBeilcnqZpteXvOpesOn1YzO553Yr7iIOWcb2MOwachFSdxEjwsl+4NDYQ==
X-Received: by 2002:a05:600c:34c2:b0:46e:502c:8d6a with SMTP id 5b1f17b1804b1-46fa9b06499mr93510435e9.25.1760180807403;
        Sat, 11 Oct 2025 04:06:47 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489ad27sm88785185e9.15.2025.10.11.04.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:06:45 -0700 (PDT)
Date: Sat, 11 Oct 2025 14:06:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
Message-ID: <3af57kktkwevbxkno4o54w3o2qajoco5x7dlj3ckepcutlzmdh@2bnqqxndbvf3>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:12, Pankaj Patil wrote:
> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Add device tree support for QUPv3 serial engine protocols on Glymur.
> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> support of GPI DMA engines.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
>  2 files changed, 2936 insertions(+), 148 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f1c5a0cb483670e9f8044e250950693b4a015479..8674465b22707207523caa8ad635d95a3396497a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -707,6 +707,32 @@ gcc: clock-controller@100000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0 0x00800000 0 0x60000>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			dma-channel-mask = <0x3f>;
> +			#dma-cells = <3>;
> +			iommus = <&apps_smmu 0xd76 0x0>;
> +			status = "ok";

s/ok/okay/

Everywhere actually.


