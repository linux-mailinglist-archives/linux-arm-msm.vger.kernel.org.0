Return-Path: <linux-arm-msm+bounces-31919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C653A97B121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 16:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729D61F22BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 14:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4340F179972;
	Tue, 17 Sep 2024 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8Lp9svY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC24176ABA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582242; cv=none; b=WT44K90WAJcY1TF8OCGK0pIKJKNckQLyepJDHRAEXD66TLPiWH/MIEXL7xaK1bP6t6Ca1R2gpKvtz8D37PVuexJUyh4OcOgHjxz7svTg4ll6s42fXYYnomQ7GrSt4X33wbizma+nxJW6+WS2p/qJUZEXp+KFlVpmtmbujcbLHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582242; c=relaxed/simple;
	bh=kWU05W7EDGsc0nyDXmmoagPc3Mdz9eD9O4J/vpPHmpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2c/inzqPPdzdand/GTJSe3EU4ut/byGkobAI5iS7SkknsMKs93mVwc5695v6zp2/jFjk740nqwo32/WE1UUN/SzXdXs1dY7vMatBFptl1vGvFrik2apobCuXmv1HwFxthn+SYilByBw9nLMLzYespClVOnF60PxY7qfas/gXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8Lp9svY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso6342700e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726582238; x=1727187038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vShU0ZKR3T7c9MJYjia+tpsGHfvIRsShfL7DNWEVdI=;
        b=L8Lp9svYySjHOtAh9KJ+BHOQhq3D2/FAnp22XWFyik35j3ZsmO13Csck4H30SrRKCC
         s0r6VAlBMzIuIJgVUYCxvJTJo1Pytv0mCBHsEPLJU54CiHFrVSTFbpGkIwVF+w4R7X4a
         fSlDVtLhtrlP7vQBCCn5NZ8XWOcv2LaWH5NoxUzUoEEUNrRyqZuPrieoFXdr+LKU9dn2
         95UM7QG2y4EvvuGkbwJcS5Air22spnHbSVEDJB8+naU0JCEmqEPmJS//lISgnTIoLmVN
         bV7KqV+aAaUV8eUj32qvDPATe286mdMD9/+quTBIQJ3089XO36qHv5HEQum1+g3A3Jwy
         DrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726582238; x=1727187038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vShU0ZKR3T7c9MJYjia+tpsGHfvIRsShfL7DNWEVdI=;
        b=NzibxhPq5qPH59URHRRldDMMfhSHSRhifOHNproO1ZJkPuSSSf1QD4IyoOeObMEoCZ
         xQml9lNDqWd1NKE7RV49vhh+VDPNNq8W3EY2YZeY1enAGf8faEuQhuaMibCJCTQSgQiY
         xVZJ1LQV66pAoAVsu01wAv5WmT0fNfYX4DMi2YbF3LOfJSdrhhv5NK4W9f995dIzNhsn
         kneM2L3kVyIWBvy/FpqnfunITVd3I8iLkuD1JtUET+W2FuJ7w458wNhxHBfBz5zIuLnr
         0FZlY2MTX65KzNUMOy50J+xOLMKvTxMYOoNzlJFUF6sMq2NgPRx46GZGb00wpYsJ6qXT
         y9nA==
X-Forwarded-Encrypted: i=1; AJvYcCU8loUxG8Yf79FxPVgm0MWDfK+HS6nf2PwIC9ntZdNb+uhG+VdHVl2bSonIbuJVJB0fkwopuJaGkkx4+drY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RKioVmT77fCTuDrzPYsu2NJUOhQk/Lgec/wE1IDIiBiiorgn
	85UBBeUx2ekSQEjldRjlMYPbldKBT//HJEhd38ju2c73+kE336obIoTU80WYLUo=
X-Google-Smtp-Source: AGHT+IEGALiuvpWJUrfspqxOGRWnJUsrPZ2UPMaEf8tYyunJhMuTXu/0425oBG/VwS50WvqYqZaF+g==
X-Received: by 2002:a05:6512:e94:b0:531:8f2f:8ae7 with SMTP id 2adb3069b0e04-5367fee4540mr10644068e87.25.1726582237908;
        Tue, 17 Sep 2024 07:10:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53687096946sm1191698e87.165.2024.09.17.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 07:10:36 -0700 (PDT)
Date: Tue, 17 Sep 2024 17:10:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
Message-ID: <yfyx3hjobk5hwxhre2pjjp2bodusvqmpivcjwvadjsmhtpr2w7@v6xgomcdz64v>
References: <20240917102715.4096-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917102715.4096-1-srinivas.kandagatla@linaro.org>

On Tue, Sep 17, 2024 at 06:27:15AM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
> at I2C address 0x2c add this to be able to get it working on these laptops.

Do you think that we might need to introduce the same workardound as the
one added in the commit a9164910c5ce ("arm64: dts: qcom: c630: keep both
touchpad devices enabled")?

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 941dfddd6713..8468f99d9bed 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -467,7 +467,19 @@ touchpad@15 {
>  		wakeup-source;
>  	};
>  
> -	/* TODO: second-sourced SYNA8022 or SYNA8024 touchpad @ 0x2c */
> +	/* SYNA8022 or SYNA8024 touchpad @ 0x2c */
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
>  
>  	/* ELAN06F1 or SYNA06F2 */
>  	keyboard@3a {
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

