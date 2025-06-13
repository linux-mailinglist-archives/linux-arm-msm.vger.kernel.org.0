Return-Path: <linux-arm-msm+bounces-61237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B25AD8F18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781A13B9B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A8D293C6D;
	Fri, 13 Jun 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpJbYToc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3C3293C43
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823589; cv=none; b=THo8JibEvoQ5wuyOS+H/LZyf2/VxnyEHK3+sY6eTbAg4LiLSAcfUe1xay1juMx6/i9Ev7ve2KMJf6yoCJIA3beDeivMboMho7o5sMQKXafkpvjKucWK6sf668+jlaThbxdGfz/STYHyAKlNsKd9Je6TE+M6uexI/4iX0rzGKP3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823589; c=relaxed/simple;
	bh=KbUlGtpfhdEZom8VAmFrDXTGJwRDxsPYiWV9ksPDsMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFVC/4mobZzGE3IQQh0EFKMEnVCBwxQ51OCsgnPmg3b+bVfrujVYi8WJwdcE+XzMTAgRYGqgjcvTwxvh/qre+14GKSQ59pMQICJEW8LuaOrVA3fBjkHSsvJUS4I1lmduvU7KISDqh8HybTAmS6SyGgGSFgIlrauItw/RQIptVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpJbYToc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a361b8a664so2037569f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823586; x=1750428386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUn/T2v9DcG34w0Q+hYirGCU74t68lTP6XWgRwe314k=;
        b=kpJbYTocUAqLOKDKuQJi6yWEmIJ/LBfN9jr4Iks1LTFkws+L3Ml2arfEy3ZrkQMCjb
         O7zAa7bV64SBjBnFMXg/HDBmsZSRkQcT6dO+8NuiXDjhtSvmwP0SAq9cNptSxOlppjsZ
         d42E8PdpUgHC8Bff95jkZc6TAn8O65M81UFWNUNGNXKWKA/Xk8O/mJVUERtwWPDTD0y7
         FJIDU/H4ZOMXse1UxZ8bg7hdwJwJB8h5SvzMuiuwLM/zNLt5bVVEamsSGAuyh8jeuWZl
         w9Pru+VEXgEmUSykFGnOVDudQWWYYs7JEtDtMegD3cYqQcPFqDBQmyYGVF/usQ7MTkiD
         lI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823586; x=1750428386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUn/T2v9DcG34w0Q+hYirGCU74t68lTP6XWgRwe314k=;
        b=BIIA0fmNwg1bTjUVxr5Q3KoZ9q35HcqCPkdSFXoEzgI6UduTIZFV4MTekm1/jy2793
         GKnZVUh6kU7XXlSBw9uztkT6sxNECWYxCo5gUOAorO867hft+dNslftenlw5PQtJe47Q
         3+J8jem1GtElh+ZR9rLwg11l2Pv2ZUwI7WWW33JFMVMUosHvIY+uxKT9HpyeO/qcoipf
         P40YxnBpeL601QzIwrm2rqmUP+xnkaf5tNo7JKlLVzhwJfIYEALRSJD16tuA9ZLx3mCQ
         tDoEg0cF/6Am9wwA8/2dN508k/34oYmdjeNozxeR+06l9RJRG/Y7iYhIr/EJrGHla1+K
         s8sw==
X-Gm-Message-State: AOJu0YwSKcF332dg5PKxc+2m+67CNF/qQJKTg3obXdroLQTERTNmF1Bf
	caNMC+Ewf2z+dPlzv8FepvzTA4iw6fGPrPv2haGZ8kdBzv5UHEeFD3IapWBh8NSn+9g=
X-Gm-Gg: ASbGncsINj31PEf2RfaEEGd3gd0W1UmsmnPfBmngfv13GJKCkfAKDbs3hvkAARH+9Iy
	Vgja/g+1k+6KBgcsMSezkiFCYpjB5GtJjJrbVS65TPbzSAH8b1TuhyIMsg926wfqhRg3PsxEZ5C
	iCk8GKCsOJ70gz3sj55jmWN3+7JPLc/nRVqUgKjwTNNt22ngHvTNyoMHlReICSn7NBYe0vDwhYB
	+5cdJGR51J2L8xeWRSW79MCh0z/yTsriKRTWjnH95U7jb2SKcP7yR6IkbJ4ZP5BCRjTkBHmJrqG
	mo1rzcUTwzRchW2XylLtZUp0ncdFw5Moy26LjxWNjzqb/cS0Nzxk/8c51YxPTgEL6DOM5L5uzCV
	q/Vpgbfj0KQLTaW7HEITm8a6pk6o=
X-Google-Smtp-Source: AGHT+IH1fMP2KnFNWRoIIFgpfDxW7MxNb1uMSxg0eL6l8twtoQZjitcGVI8/ENMR8PDgAtAlfuMQQg==
X-Received: by 2002:a05:6000:2505:b0:3a4:ef00:a7b9 with SMTP id ffacd0b85a97d-3a56868319emr2894882f8f.12.1749823584788;
        Fri, 13 Jun 2025 07:06:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm2525723f8f.36.2025.06.13.07.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:06:24 -0700 (PDT)
Message-ID: <81a65ea6-2f46-4d11-9a3f-50664da78eea@linaro.org>
Date: Fri, 13 Jun 2025 15:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> Add DT entries for the qcm2290 venus encoder/decoder.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f49ac1c1f8a3..af2c1f66fe07 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
>   			#iommu-cells = <2>;
>   		};
>   
> +		venus: video-codec@5a00000 {
> +			compatible = "qcom,qcm2290-venus";
> +			reg = <0 0x5a00000 0 0xff000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus", "vcodec0", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus", "throttle",
> +				      "vcodec0_core", "vcodec0_bus";
> +
> +			memory-region = <&pil_video_mem>;
> +			iommus = <&apps_smmu 0x860 0x0>,
> +				 <&apps_smmu 0x880 0x0>,
> +				 <&apps_smmu 0x861 0x04>,
> +				 <&apps_smmu 0x863 0x0>,
> +				 <&apps_smmu 0x804 0xE0>;
> +
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +				opp-133000000 {
> +					opp-hz = /bits/ 64 <133000000>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +			};
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};

These should be dropped in favour of static config in the driver.

> +		};
> +
>   		mdss: display-subsystem@5e00000 {
>   			compatible = "qcom,qcm2290-mdss";
>   			reg = <0x0 0x05e00000 0x0 0x1000>;

---
bod

