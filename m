Return-Path: <linux-arm-msm+bounces-20934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1798D36AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D606FB22C5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5111843;
	Wed, 29 May 2024 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg5GxleY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53ADDA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986862; cv=none; b=PkqXGUSO71cCbdxwa60L/5VHgAN/4Qq831+LyXdOwr9gR7vxud3hl5CXqEema4/aGocWBOnotbHN+PwFpV+4AW9tRjQ50GtuhQOKSaIzCA24/05ylgG75/q4VhdQgOd4uRyStzcrKzLDIhQQyH4wbIWUjtAJNyC5oYxeFBEwr/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986862; c=relaxed/simple;
	bh=jcMBfdCk8jTQZro4OJJak9oCrCRDjhhjc86nMkCgIdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0iMZFpUCCkZs3qu5toVALp14/o72AkQEX9+b/I+T03AHpcp6RY4Cc6CNSQpA2Re0Kkiqbh/lMYuVXSnkhrVIJoCstItkF6vBAubM6C69PTQDc8CitsPnzFjfO1MAz47jc6I5M2DSPAYm1dsrqr4gvEYSKffBnjlIGGLdR2zv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sg5GxleY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52a54d664e3so969948e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716986859; x=1717591659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QG9S5GCq0rk0/aIqTkyWvwtUd6kWwmDiBTyVJ1zhLEs=;
        b=sg5GxleYsseQ4aXjw6eXYkhPcRGESBXIhIwcO9nY+30YY0Th2++cNehQQ/Z4LCHSTb
         JWWZUN8E7vOCcS9Z7V7MN49yfn7jHHsiBmTbek801j364DWlcHm+y2eRNyPBaqDLTzWH
         xDNSapC9ieG9bC0hOqsef8JJUQtrpuQD+csLu6UGntresVLBmWTLrmIy+rw9281YcNPh
         szcj3RF+QyYrV1DA7uIEgNVWCmnophLCNqhNpl5SAGr6AN4Muicdm4BNLoUq+JFHMjDf
         IIR1nY2u5t4kNeKAYb1a5P53pvtUYr8NwjLwwZhr39b3m6t7c5q0SliXTxw333/S4EE5
         urow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716986859; x=1717591659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG9S5GCq0rk0/aIqTkyWvwtUd6kWwmDiBTyVJ1zhLEs=;
        b=vQjKmdl/VLVo5wKliTeRVqIavILDu/TrVfGx4NS53YfGGxKOk4B12IQiqX6rdJWzjq
         CT58hOfdVbUl6cV5xBQDBHFdYUK2P6MtereQ+f2sVKxJ6IGwWI4QB2mQn66eC6wuAcca
         uWaGJBn1MHv0krNhV6Yuvchxrse/CVEBlKmPzwgWcYRfrCznU3YS8FS4bHP6qCWHbbGf
         Tktm0izwXFD1wHyltCWZI7TL39Sv9tSI8iLQrVpX6IZWEdtInfsmIhJwznhT2jz+Zeg/
         iMd0oltI2KapQH2Emdu80nik/fLi8DILSvkCEzf3FWDWVTuKagcCxGGPKI2ZyIu1kOVn
         0z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/VhycqtvWSpi3bJ4VzDKUQW9vn+lPqujX1jNZ7XAEkl9uWcpyVqwSm8XSlgNojPB9NgPJ1FbEtj0OdCgZ2nCLS3TmwAkDSBoW1BIaxQ==
X-Gm-Message-State: AOJu0YwN70xw2k/SL4DMHhpFs4CdhkK1u8QEzhueOD7dODqiG07AkeTf
	jw4x0InURlWtPGrHFsMayFQD3aKEj/u0W9nC6Q0m8Spq+n/JBg/PcFxq2bXZQ4U=
X-Google-Smtp-Source: AGHT+IE82XWdPiGv9vygcZmvhos4VtSHC4qhhCVstpP+iimngdvKDpuoCuYWp8vrcqOHOldc3cHYEg==
X-Received: by 2002:a05:6512:32c9:b0:523:9747:4920 with SMTP id 2adb3069b0e04-52964bb1750mr11083799e87.36.1716986859316;
        Wed, 29 May 2024 05:47:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c332c5sm1264770e87.189.2024.05.29.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 05:47:38 -0700 (PDT)
Date: Wed, 29 May 2024 15:47:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Move usb-role-switch to
 SoC dtsi
Message-ID: <ljwkn7ilsixrww4vt7cmnmtot6qgihqglasoaftuil6i37qsxi@ia4bpqhkulwo>
References: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
 <20240529100256.3158447-2-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529100256.3158447-2-quic_tengfan@quicinc.com>

On Wed, May 29, 2024 at 06:02:55PM +0800, Tengfei Fan wrote:
> The usb-role-switch is SA8775p SoC property, so move it from board dts
> to SA8775p SoC dtsi.

The commit message doesn't match patch contents. Other than that LGTM

> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 -
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 -
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 1 -
>  arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 -
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
>  5 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 31f52df6b67e..411de3451db8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1255,7 +1255,6 @@ &usb_1 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "otg";
> -	usb-role-switch;
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 42d4d558b7aa..84d16227ef80 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -948,7 +948,6 @@ &usb_1 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "otg";
> -	usb-role-switch;
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2ed1715000c9..e20c6240f76d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -1117,7 +1117,6 @@ &usb_1 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "otg";
> -	usb-role-switch;
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> index 92a88fb05609..6dd5232da9f9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -739,7 +739,6 @@ &usb_1 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "otg";
> -	usb-role-switch;
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 79311a6bd1ad..8e3ce1152211 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3264,6 +3264,7 @@ usb_1_dwc3: usb@a600000 {
>  				snps,has-lpm-erratum;
>  				tx-fifo-resize;
>  				dma-coherent;
> +				usb-role-switch;
>  
>  				ports {
>  					#address-cells = <1>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

