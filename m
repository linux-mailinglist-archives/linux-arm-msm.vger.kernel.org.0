Return-Path: <linux-arm-msm+bounces-67754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C43B1B0C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0CF189DE2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2718225A347;
	Tue,  5 Aug 2025 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYqNsA6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F8260569
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754385354; cv=none; b=CfeehVH2FxemoBdUXwg+4QL4/Lvl2XoUZnZb28BEWQCGdadO/ydpAa2NU4o9/6OSqZX5GKsYS3FodEdf0theCkouhH0h/rFaZbltrKKWvakYbCcklMfWujBogaCvgTFrH/txFCJYCv4RzPT+V+lCey2w9A2oKLa8HtPJpYd2hwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754385354; c=relaxed/simple;
	bh=SVJLLY9b+A2Ow6Hfl6TdqTYLbgy0WRgvTvRSaRu+4i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaW+wI75Zp33Uml1vvAmJw/jq7PIdsUGFii2vjCRGyvQbTJO/Vsd3jZNYuunB1MGKaHPPNTItrP0yvYbmfmQ9qj2iK5kMvZXTFgqD8F5hNgWeaarCD9zj2mDRUmqPtUJ0g3t/kdL+5tEacdAnFakYe3PIQBFpT6IG7KKINRbD3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYqNsA6j; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af95525bac4so545454066b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754385350; x=1754990150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mI3NXVqyKiVG50xbkud2NPNqvmCUVZbmYL0tUjmcuaE=;
        b=NYqNsA6jwZwjDZnE0plMfvGCcahb7ixEQlFYX6Wb2cj5rRMCEmDN+f1bxkq9vNo4Ob
         r3nBWulQEZoOo2hD4HWDggA/Ar0vL9dae9pF8kRyCtC3GGAkAq9VT31yhWDRrxmWj0c8
         SKSuComGv7PbFBNN1+Xb46J7WzWKliowxLqFTMsteNLfSTksSuVHx/pQp3ItEYJOT8c1
         ruq++7oqhuJy9WkGjWt8UzSEom9Ql8CuylRxQ9aqgACPECJNnopNRTH2lSbEgSxrNllb
         BTONAtZgYLnrx5rPj/alLja3RgXuwWTuKa5KYCrY9J1EGDs2SUydy7r3x8v+Kycc+R0k
         KXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754385350; x=1754990150;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI3NXVqyKiVG50xbkud2NPNqvmCUVZbmYL0tUjmcuaE=;
        b=jvN+2xG/qPZjX41tb7b1bZe58MDNzSk96bsN+HNmMGYYufi0YpjdWPMfCnS+2fZ30B
         LF5tW4KRFkmfO48C3Zm9CzM7bB/4fowRX5rYvY+QWZEVUbiqbHplWFZIKE2xlm4bP30b
         F/QKZ/DKetsLYLmi1exU9D20qUFpH4lBTclpJfImM3GS9jWQLLMybRg4Yz0ZnLRLVlUT
         pS6St9d+fZIvqyBu8f3IyzQsqdHVYmmFAZz95sU7EHEIP+GrvZFDX0eGUR//Iyxleksb
         hjMciqOJzdKRb1flUdea0poCAhgcF2H1U8QjHb2s7FzW/uaxbN8YS80i0ly1qVmA0KjY
         SUjg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZIWi2v61ASnhMn/3XqujzeX+yIB6J63+OQINA+zXYSjiiYu2805arX56rj9P7isujoSXo5YF0ygPdqJn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+qi/VM8vHVMxgwQk2DRgkwRDP2XvAh54JVn2DF6GhOUPWbuDV
	CdsM+7PJ619PiSIBy5v2r4WWpjHA4PkV86uiYsw2CaFch7Ofa58dO2KtDf8ZzhL9SFU=
X-Gm-Gg: ASbGncsMwgFDQbZU68PspfpEzidtyTCXeYRzgMPZZSU3oz7PxuIftscw9JD0BbeDo8c
	Swc5xk4bS99Ielce83Ieqve7qLP6voI+C+YL21AZ0qM/4EF5viNt/Krp3I3+E32kqvTZaeiRCfR
	ncQxc2BSYk6GeZudrY+O6gUrJ1B9OOLCz+5hlHWru/qwHSu4DRNK/lxubLmIXYsw2wLw9V/Astw
	qemFDVOwH+lUCHIFDkDdzIOlTIjDM6VjWFqj5ry39BEkWk0FoNDAEd/MV+WsGknY107HksxiUk2
	cX13MJ2TetrpgtAHE9LNsaoFYmdtibHhRqMDdZFUfQDDmxLa3gpmyjwWE5h3ZCtVyYIpBCmREY0
	jWpUYPKS9RQmJa8hiRrhYbmzV95Od5BCK+NOoPaaHh8mcckFjw6+XDiRtouV2RXJnKSgduSbd8Q
	==
X-Google-Smtp-Source: AGHT+IFSQsh79TNXqQaV19dvtSQv+eoeTCrnDui9MT29o5c/h19Vmob28lRx3aBCVAdqKf7927HIkg==
X-Received: by 2002:a17:907:c13:b0:af9:3c68:f743 with SMTP id a640c23a62f3a-af9401ee770mr1301929566b.34.1754385349788;
        Tue, 05 Aug 2025 02:15:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436c2sm857466266b.141.2025.08.05.02.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 02:15:49 -0700 (PDT)
Message-ID: <9d770617-966b-4b84-a626-59f0ffe83605@linaro.org>
Date: Tue, 5 Aug 2025 10:15:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-7-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250805064430.782201-7-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> Add DT entries for the qcm2290 Venus encoder/decoder.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 55 +++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f49ac1c1f8a3..7cfacd189a10 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1628,6 +1628,61 @@ adreno_smmu: iommu@59a0000 {
>   			#iommu-cells = <2>;
>   		};
>   
> +		venus: video-codec@5a00000 {
> +			compatible = "qcom,qcm2290-venus";
> +			reg = <0 0x5a00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "throttle",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			memory-region = <&pil_video_mem>;
> +			iommus = <&apps_smmu 0x860 0x0>,
> +				 <&apps_smmu 0x880 0x0>,
> +				 <&apps_smmu 0x861 0x04>,
> +				 <&apps_smmu 0x863 0x0>,
> +				 <&apps_smmu 0x804 0xe0>;
> +
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133333333 {
> +					opp-hz = /bits/ 64 <133333333>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +			};
> +		};
> +
>   		mdss: display-subsystem@5e00000 {
>   			compatible = "qcom,qcm2290-mdss";
>   			reg = <0x0 0x05e00000 0x0 0x1000>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

