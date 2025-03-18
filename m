Return-Path: <linux-arm-msm+bounces-51754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A013BA676FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D1DC7A230E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CF620D4E7;
	Tue, 18 Mar 2025 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbxAswXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9580209F27
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309828; cv=none; b=APa/GnUxk8txrykDJzrViDifowFNK8zPQvcgy6VHOXdrB+jwOv+CUGWrfOt2j3dblkrG8l2sLzNmvjPCpIsxC9uX7iDw6qloJzw5FOSXBfSYpH2wNcjiDRDhaMlPEPyvT4YYzShfvyuzxGtnjRCyojDFIc6jZmSjmhs1lVhNvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309828; c=relaxed/simple;
	bh=N+sFJXUfBMA0CoJhUPLBMoIsImXXvb0Qq+jGqBryElU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD7IqggPsACiWcYxS2V/I5Fz3Ae1G+XjaRukIPMVzu/uLShQ6R1Ea+yigtJpPg2RL4I9hhyvWdafeog+rAh1pLKtZIB5Qb7FkCuwNe47ijR0Moj5+AZnlEmvJwa7oQgXCL2740IpTqRZGKXmM4e2rsAej+mXLBpCMq2NS1EhA9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wbxAswXQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac25313ea37so1127460266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742309824; x=1742914624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VVVI1GriwyXPsCwD+FNmlh5SAMatdc1NEjAoi7sx58=;
        b=wbxAswXQ6h9hvVyqLzZGZhMpub+q7TrY5QLHz2CEyeAxIkiuC6eAN6HIKqth4g/gpZ
         Xfh9Z1WDhZd0PDV2knkgsYN9LPIyZ06/dRBtUmG9YjRbjXS7NI+1IITkdTJH65/gKNr6
         Tk5SzVktBHM3hlIuCEfSjkweQlEzWzAQYSR/SBfuVKT/bn4jsRKJ+xfIRExrdqGu6RBv
         PbEKJ3ClFTQcCn+xUi5PrGPRleRy1VsxZ3CbtEsivxd9r3PhZes1+N/no0JztgR94sfc
         Yh7vBRB908pmXIdte3gyeK4OsLu7FcBvsexIJhOcuKDxKyB1B9LTqjPKSdyMFpgDzfe4
         FsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309824; x=1742914624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VVVI1GriwyXPsCwD+FNmlh5SAMatdc1NEjAoi7sx58=;
        b=ZlnVB1dk0AzH2m3PiWhNMlRlR3c2hciwG+LPDqqhGG4LB3Vjdi0kcLfY2If0dNkWGl
         52bLv8E3lcxwraUqUESSrx7SV9YeIt+0GgGgtH2i0bfpI/6HM6zzy5X+BuIwl1koO/Pj
         yHmbRGyJFfTd7dztErNiQ7baLPwdTBOgjRxu9WZDhHEQzlcWgsnwYcde+5zamynW20Sc
         wF9PgXGZlTzsSHDbIx+BoaQPwJAweoqbg3o48paq+BLGMV8i/mo+d6/TIqtVV0QOMHC0
         4gC5av1MH+v7b5sMqNt5EyaAZCDQUF7GOXzjOqai1UF5gSbLvR5m5PDwcYpu+Aj5Skf6
         Jw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3kyWr9KG6lILsQHGGM7jekjbGqXHkjsoQXuMdnee9tJsvcTxKK3PnoWz7cA2oVUs8+nb4V06tGGRFG2Fp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98vBM5gBQMmEwwRdbLythNJz63+A2yngJCvF9b5DicC2YpvsG
	48gXM1vk6IIV4TPu2qpw8nv5nHFhhf3rd8t8SLf+lEcTP2mUJUB4N3b2J3SFgIk=
X-Gm-Gg: ASbGnctSxEVMPdd86/EkWPVs0+Ru+aeknK7AKlU3KYnmVOeBrddNHzykcU6Uld7dIFT
	Gy+a6WqftjqKWCDXRS8B8LgCgzdW9TzJyBVjNVU2XB86i63shgZWhIQ8e2wMuL3dUXa07fdiie3
	s9xvM6bvQUcbaQg4wZVVabtruCUCEHOtzwYJtXTMJUstzoR86GOdX3N9lU2WwZ4JCs1yXu0HYQd
	XxFvBA6KUCKIxUs51c2d4i2BKeKenFMqko+gi1p09ctw8o1p3+U3eOmjy/OB0v8xKIDMeIXHTNT
	pyfm7hV36LFeJRq+kevU8zPlgNOdRG4GeKB6nrB1ZCr+F3WWkss4
X-Google-Smtp-Source: AGHT+IFPBNRVXxeGQms9vMv75e9tPnzez+MLNXkizMdoSmRWOjlnAFWQdlrvFmC3VIruWWq7ehbuMQ==
X-Received: by 2002:a17:907:3d8d:b0:abf:614a:3e48 with SMTP id a640c23a62f3a-ac3304042e6mr2319157866b.50.1742309823976;
        Tue, 18 Mar 2025 07:57:03 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbfasm867829366b.104.2025.03.18.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:57:03 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:57:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset
 polarity
Message-ID: <Z9mJvh2KGwhOJ6I9@linaro.org>
References: <20250318074907.13903-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318074907.13903-1-johan+linaro@kernel.org>

On 25-03-18 08:49:07, Johan Hovold wrote:
> The ps8830 retimer reset is active low.
> 
> Fix up the retimer nodes which were based on an early version of the
> driver which inverted the polarity.
> 
> Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> index f92bda2d34f2..dc1a8f5d485a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -788,7 +788,7 @@ typec-mux@8 {
>  		vddat-supply = <&vreg_rtmr2_1p15>;
>  		vddio-supply = <&vreg_rtmr2_1p8>;
>  
> -		reset-gpios = <&tlmm 185 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
>  
>  		orientation-switch;
>  		retimer-switch;
> @@ -843,7 +843,7 @@ typec-mux@8 {
>  		vddat-supply = <&vreg_rtmr0_1p15>;
>  		vddio-supply = <&vreg_rtmr0_1p8>;
>  
> -		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
>  
>  		retimer-switch;
>  		orientation-switch;
> @@ -898,7 +898,7 @@ typec-mux@8 {
>  		vddat-supply = <&vreg_rtmr1_1p15>;
>  		vddio-supply = <&vreg_rtmr1_1p8>;
>  
> -		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
>  
>  		retimer-switch;
>  		orientation-switch;
> -- 
> 2.48.1
> 

