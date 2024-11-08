Return-Path: <linux-arm-msm+bounces-37369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD09C287A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 00:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681C51C20FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82F71F5854;
	Fri,  8 Nov 2024 23:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQKwTKmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298D1E231C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110303; cv=none; b=LazRf1E9W+ku7YXNKd1Tlh5iXHQrSN/IFxbls4n3n+QethdD4qnslFHk96cT3ilfJKcsph25ZaDpG/QOZlSlTo04iQoJ/KNZApv7oVIn38UbSt0IYwkRtPEpP58r062W4/IA6M6w5iyApSaPuG10YAxmOe4qMCf17JYrdCrYasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110303; c=relaxed/simple;
	bh=NWV3hIirFAqmOrQUMeQOd4BuSvi/vnJgLG5uotTW7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SinmkffMsJk6k38Qi61d5TU4xhbq829y/yDmS4DK95UhYBVc9dvYIhYBDwb45legM1UUZhClySKI5wIhU/Mo1xQKkosI8pqUeChUeaCKMPQd2S0VAYPzqM+QZaTDfcc7Bb8ZRjayiTAEyEww+5ljshqoPgzk1Q8QDu4mHaPU5YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQKwTKmo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso21659601fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 15:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731110300; x=1731715100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/6/ikER5LJxRRsz/OAmgjtbWvnUlAJKIhGNW1dp240=;
        b=SQKwTKmoybYngm7vYTj7D8EQ3rPfl1PLO5aeojdq3IkxsQwjjbiN+2qO6DYurdMFNS
         Z8+42TKHpvgrLqmZvS4gS4fwtJPRtRZGJQWZHfS6P3g/sMBpmYpgZpd32p2BJFcofqff
         wTq9V7cHTgZtmb8EfgOze13pk4r8+ukCCBl7adnjU2JEVlPI5fWoGC9ctkhdaoexPO2C
         GoEC01O9hfCoEp3lRAuYJ8fIJMDPq1eVRG7ogHoXkV91ct/xjK7TEnyDo9pEHJMK4UDa
         fijlVTPuRHdYUTM8ZK4OKTaISRrk7KVTUT1IqkZxy/jNsUhSRCPKoGeEcRLMY7pFRGM7
         9N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110300; x=1731715100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/6/ikER5LJxRRsz/OAmgjtbWvnUlAJKIhGNW1dp240=;
        b=v2HE2pVAB1RE+LHd9iw7qah59DC6eKLPvOxhci6/C+rzpQJvLjvRj2nT+cxyHNt2g4
         g7njTeyFtzv045SEYxSWvrVOyRgDiqBA+wPkGiVUJb8fKPbT6Kzs37RrzIRo5M4E7mlY
         NFAlO+km+UylgZcSAFbRga/N8qZWNIMFQd2MtMl3rdZt3qybVrabwwOKQhWAFW4eLguA
         PJ+6SksbYu8+rXWpORu3CvuKl3uT4X7YHmF1VCAWZeu+l/U77bJAdvFFcyJu2MSpCV5g
         jQxEJDlGe2BDNOMpJIFh3N0/dwofqLWO6l62+McCjUAOKsXCo4YAq0VH3WGGqs1BOvQX
         59+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMIEngwBHJQ+2AGJYXCZ56BSVmbcXxfWXs0SxwA9f8BvI/21ZUTZjWV9FfLa64Y4solRQzYjKHiirfnyfM@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWX3d6+Ci/LGCT9Dmg5GK2YcyWXNOM2VCp7GcIeDgDFMlB8dI
	/u/Dz1p655RoqR8CyecI7A/7jGGPpKiU9epP/PMMI8RkPCEXzQlvvApTizawy3c=
X-Google-Smtp-Source: AGHT+IH9m+3BnNKw63J1oaaPKlmo3VgzPxpr4dI0cUE60Np6PRNXf81YxQDZtwHLR70UIHYfwCA1GQ==
X-Received: by 2002:a05:651c:1542:b0:2f1:a30c:cd15 with SMTP id 38308e7fff4ca-2ff202ad40fmr27545941fa.36.1731110299678;
        Fri, 08 Nov 2024 15:58:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179069d5sm8345481fa.66.2024.11.08.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 15:58:18 -0800 (PST)
Date: Sat, 9 Nov 2024 01:58:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add clock nodes for multimedia
 clock
Message-ID: <7imdhfeq5tvjy43337xryqrhom2r5xezu2kx4jzasafsfsberj@c7zcab5scegv>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>

On Fri, Nov 08, 2024 at 11:54:04AM +0530, Taniya Das wrote:
> Add support for video, camera, display and gpu clock controller nodes
> for QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 868808918fd2cdf3f23fcb43ead61b2abfc776f7..8c98ac77dc5c665ef296e65ac76c1b59be485abb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3,7 +3,11 @@
>   * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>  #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> @@ -488,6 +492,18 @@ qup_uart0_rx: qup-uart0-rx-state {
>  			};
>  		};
>  
> +		gpucc: clock-controller@5090000 {
> +			compatible = "qcom,qcs615-gpucc";
> +			reg = <0 0x5090000 0 0x9000>;

Please pad address field to 8 digits (just the address, not the size)

> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GPLL0>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		dc_noc: interconnect@9160000 {
>  			reg = <0x0 0x09160000 0x0 0x3200>;
>  			compatible = "qcom,qcs615-dc-noc";
> @@ -502,6 +518,41 @@ gem_noc: interconnect@9680000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		videocc: clock-controller@ab00000 {
> +			compatible = "qcom,qcs615-videocc";
> +			reg = <0 0xab00000 0 0x10000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,qcs615-camcc";
> +			reg = <0 0xad00000 0 0x10000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,qcs615-dispcc";
> +			reg = <0 0xaf00000 0 0x20000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,qcs615-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

