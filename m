Return-Path: <linux-arm-msm+bounces-44129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65573A03F04
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1B5164701
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6641EF088;
	Tue,  7 Jan 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFhuSr//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B29191F66
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252655; cv=none; b=cgBCi99BB3qu7Qr4XrTeJIL7om7xEB7x4RGBoHcqNugeK827ZzGD9Lnw6Tlb4y3BZDSzVGCBzTBk3nthWLd6Ec4TjFOcYLABGB0GRqfYrYzcXBlyvkyLF/LTn2qWWCzMWCeRESZ5WfpTF+h4jOJL4vqf6S85EMJM6U2C2rE4qY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252655; c=relaxed/simple;
	bh=Ved/w3Cr0aHwMmUTUkkgr8gzvnQZRWZmvxRkeCXncjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvO1yRrHUBuf4RGfuUkPgO5F57pufWT+yW9X7qtCWXOIbSTViO+tQdXD9S0d4kFb+P65BjfOtKYXa4sJlbEbucU2UB/x5PM3hENBJrE/ZIhoO9vcxshJmjQxGqApltgc/Qd91N/7s0APUbphcNLdEBRNZMOGQtgU1AWk8CpRuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFhuSr//; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so142692211fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736252649; x=1736857449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcK4pPUzky+xJBm/oJEKASVPPcaYHKT+Z8OSXvJ3HBM=;
        b=RFhuSr//nSpCWlVNGeLmIQUZSrDHTBenVELmtWVReXcyyEm4+DMK9BQPP5o9u1EeeI
         YTRs6JpAX8c8Z3f+Jfwykxfp6TBMazhC/EpvVXIgsESqO/WcXPmHa15cokzKHdj6WcpM
         +c9oR3bVOiWo1vE7V/0qZr4wSRMax+iSbCeVpv+9sZa/JdsNZ3qIumUW0Y0Sf+68KLTu
         GHLWABGSklUK/Qm3ssKJHZYqB882edwXkvzpzYRtJKvdDQlUb8v2yABfrK99noWhdY+U
         PFsAFwwVmlEhFEXUC/liNVtxuam48UBWraIHsDERE4YYNd0h7CVVHMVkv/UUv6Raw2IY
         pYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252649; x=1736857449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcK4pPUzky+xJBm/oJEKASVPPcaYHKT+Z8OSXvJ3HBM=;
        b=f79GKHZQosXqTKIty7k61LnueBvfDbyOqwVvvWqCBiCQB8pswuQqPwyywW39GY5y6q
         ncHd6Z2LqDmwheZFkm8iQ/JeZtamZPnzgweu1pP2y8FmokLcIvfTt9rKbmJ+uUvkPH+J
         bJJd3+atmgS+V6lMiGgXD2MWxnsLKSp6AlfAx3xwha9+AoxW1HQEA69dJxG+JVVdQlrE
         2aLVwjYABmfrInuhq+xPy7zpsSP8Xphg3mDIaHoM5Ng512DpWZYPf+9ICqeHGOUs9l3H
         yXU26Ha9LdveUmErwMMlxerlzPInsg4AEBqtbsVopCIUXM/yITz4em8urBoHgzerz5at
         ctvw==
X-Forwarded-Encrypted: i=1; AJvYcCXfM+Gc6skX4rRQLSGsCP6DlyTDViWjSCSlfi5y/rFUD3+M2cpDhrI26JMEh2/zJzt/D8x1lKqjMpawxjkn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgzw8FCjSfPL+gRMDDRm/5072o7lXCp+0pCfXKwITvKs4vGVkn
	cIffmPDrMSnp1Wq8ZGEW9MeQ5rGY1DQH7oJ0hqYTI1cpn1tM6kQjixw3F1cKb9Y=
X-Gm-Gg: ASbGncuMGWyUOvWlWoe8XJtf8okjSdBzT/MK9w6jf8OXFmZ9l2kRT5Rzbz1mcMhYLyR
	YhzXiMud4xFE2HH5VwLNj+/pM9wlQlvWcfewAkmZUny8Rvt0tFvZGqGfdvfxIe0gVXb1EFOwv+d
	aBnOy4GCksd1FRQ5xt0xj2koceg3hQY3VGJiu8bpmUEEyWz+d7RJ+cM6ZjxkPagTiJTysV8KEi/
	cJxZYxfoQjxbDR+oFM7GtCyGVMib65r16njX63u4PFzeelFkRHNwmEKEaLXconqwuZMPMk4YL6K
	hgK5X7S1LhCg5y0gFEgv043YbNQWzoPjX6+3
X-Google-Smtp-Source: AGHT+IEV5bUCaH/tirUXBo3Gg3ZrZZ9xhb9hq+JFjW19TixgsnKJ/bjfZlwlXb/bpuvcxI0EZhd4xw==
X-Received: by 2002:a05:651c:150b:b0:302:1c90:58f5 with SMTP id 38308e7fff4ca-3046851fa66mr181197271fa.1.1736252649075;
        Tue, 07 Jan 2025 04:24:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c632sm59101751fa.21.2025.01.07.04.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:24:08 -0800 (PST)
Date: Tue, 7 Jan 2025 14:24:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 6/8] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Message-ID: <devb6nhgkshbrtiosrc34zwojvamhy75pb3n7poml4qkj2sq5l@wh4dx5uai2pk>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-7-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-7-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:45PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index d3c3e215a15c..85e10b20342a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * IPQ5332 device tree source
>   *
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> @@ -146,6 +146,11 @@ smem@4a800000 {
>  
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		q6_region: wcss@4a900000 {
> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc@0 {
> @@ -479,6 +484,39 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@d100000 {
> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0xd100000 0x4040>;
> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";

If the device is fused to use vendor keys, will the same firmware image
work? If not, the remoteproc should be disabled by default and the
firmware-name should go to the board file.

And anyway, please use .mbn

> +			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
> 

-- 
With best wishes
Dmitry

