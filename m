Return-Path: <linux-arm-msm+bounces-89123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764BD22C90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 576D730907D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DCC2F84F;
	Thu, 15 Jan 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIIuhiHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BS5AzU34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C741E5207
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461596; cv=none; b=pwVrAxI5f5P0G0Z4s0BAQx1pS/GjfBqPZJDOaFW+0MfU4x7Ey1UT3ar//7EUH0sMHt7WdkvO8ocHn2/DRg5f+2ojlVrTegGFG+edUp5N0sRDIyHXX360yEJSVT8j9CFPGWUl8I7gUVVg82HKKxtc/EHN24mmQs205H/FTdm819I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461596; c=relaxed/simple;
	bh=2YP0p7KvQlhxBy8aGgjeDod6ufapFGcpOkKLPGk2E44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQazDJ6dap+eZLsljAKxeAFXLgEzraeyHcWvmw1ydlOCEkLF34Op64h5XE3f9UPqBMMTXEMCQmQlceKLezt9E+Ed9YMGQCfBZLO84/rMhgmFmDJA/NM4Iy3CKZDQ5RPUn4wdqBrZMRGKADGCFS2MGyJZWIG9ODIfR/TBZ/TGZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIIuhiHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BS5AzU34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g3tx783457
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgKsPJMB/JF7dOkXman7gnd/
	dRfYFowAvZ072kvli4Q=; b=YIIuhiHIAXWjQWMdT4CRbclfvTEE0BAcF800DzOo
	PGGDJ7ujKG021pCAZS7B1fI2I6EEWznErnVdKypNEQYV7ZdJKvqmosEhnDodT/p5
	0TtU4b88WjdvqEiMCBAnQ9vSvNAdNQLnl6vDWrXldiHXIHABdM0e9uOID9cQfMHI
	2P7q895EWNpwXQlEPO2BlA8R9aU9O8wUxdIv14nyqwSP7QZRwSwymznFVG/S5564
	BDGPA5Sui1jBRmONXpP18i8MAWhgiOJJUBhIgPRFDjQMW8RfMiH7DyFRVFuyBX0+
	lgpg/IauQEnioLr/jAc1GL0Z6B4rnSCNOt4ZeOkbervquA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jxss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:19:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c67f65cso249701485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461591; x=1769066391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgKsPJMB/JF7dOkXman7gnd/dRfYFowAvZ072kvli4Q=;
        b=BS5AzU34nEvDuT52LFA1E+y0K7huBfuwMJBgfEPPtp7dqw+dfVWSoVrQMMkXt0eav9
         bWMYCxvhkylGroPHZjAZyA3oARmgZoHwdZYmmVS74QNljDe59LVu8smIA2OLB1L6HH7i
         8z3hTpqUEDuWMkTCL8qk6iFUs+Wk4yFdf9xKyJiHJTJqe57dGEtaT6XaBR69dZCygX42
         HdW0j4ZG9liG3/OQr1rUrgRIiOR/bFAniOlL4Nws1dHASwNovSU17kfJTVz5OjidRg6v
         NLFA9DFL4zA7LcyAmqR/jE9Jfo3dU6gYHAx/ljxqJbS7dg0n4U2wQcNfpAfl165Mtr2n
         uEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461591; x=1769066391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgKsPJMB/JF7dOkXman7gnd/dRfYFowAvZ072kvli4Q=;
        b=f6pKuKVWBd9R/G6jVDFSs+tfGddlArkRng1FXzNVCPWxXDbqOBSJ/yoxSrYBvR2N03
         Bnu8ZytVowaqXqUFqHA5eoTgvDxYLkdrkkjhcF1ULHpcEBWoLN0NMflfic8t7QzmPkTD
         RItP7/9voNooaI3uy6/BLuqF5YWJKCnhMNbCCULjgl9N+vcg4mR3ExHjK29s92u7cAf0
         UjSXE5zsE+UZZEyKwLP9Ozd/9TcxBsUAZqwIXTr1ckgmIcwslfN3yynkFbQL/uaNUoxB
         TmFnfcqJvXv34q/5jFzxt0LTIrtNAqnxzN7eFay4ZwBcbN/AnxXilrdcj5iC3n1UL3hM
         cCnw==
X-Forwarded-Encrypted: i=1; AJvYcCXH9Cb45UKvMSNH1LoeAhgTpOENhHm70RSf72Y1zvT4emmiJ++sO34yJOuQ4ydAdZg/QVpNLr4VRkkYUtVe@vger.kernel.org
X-Gm-Message-State: AOJu0YwTebXrMpkzz36dm3JLCFaedhIdDlAXpIcaBsHjF5PlMNZMkWpN
	F4V9K18/nfRn64EGjG7dDWpshq3aNfNvQFP+AMvA+yVmbDfgulIY4hTvAWoyzcjR10J31PJb3rz
	A6afuV8qGis2I2rctRGIkTTWLMlVjlnU8/zDr/pg5ci3BJ7z01pv29wGzdJxu9/4npfkR
X-Gm-Gg: AY/fxX5FSzZqEOBauhvq1MSAKH+tGxiWElsx8cnhKqmybc795yB7NOKrpYadH8SDu47
	FLXq1AGGSZgSF3Mh0j0i7KnbDk0RULVwOwcHX6cg6dW3KrSXz2eRJvCbsy5Nay1y98f5IBZzP7V
	LI0t48l0PaEVGKWozUOChVP0CrA5h1J4GWZqmGjSVntkccvpQ2JEupSIAFzkyXkpzeuWzMSCZDk
	+ENSm9+MSha7z0PZfJfcAaWkjTYMc2e8JlvUHz65IWn3zmmXCJuZrj3b5l760BPwObqd5DR9QJz
	cpRxEIZa1xgo6TU8uZ4GtGZ0keCXzF8YdHOVUZUydK4DT+ttj2wHgDVgrxoN9jD4afIsOlcCzMq
	p+ojtb1dm0nZ3k+6njE1+CowBXnPHnt/zV1e6cvWmcV/arINtpPROj+bcEKayB4S1aGAnQbuWBA
	znt+CRxbJpF6P0II6D5Hewgm4=
X-Received: by 2002:a05:620a:19a7:b0:8c0:ddb4:2141 with SMTP id af79cd13be357-8c52fb56d6cmr753242985a.24.1768461590612;
        Wed, 14 Jan 2026 23:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:19a7:b0:8c0:ddb4:2141 with SMTP id af79cd13be357-8c52fb56d6cmr753241485a.24.1768461590146;
        Wed, 14 Jan 2026 23:19:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba104124csm1423788e87.65.2026.01.14.23.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:19:49 -0800 (PST)
Date: Thu, 15 Jan 2026 09:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
Message-ID: <idz7dsvyrrf5t46hvogmertavqvszwzw4pwzdy6bg23gst4yo3@cqvklmtp2djy>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-9-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-9-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NyBTYWx0ZWRfX8WB9UG9vqV9O
 NjgVQ01Ay0MM1umotH+k/Z9axPAYpo5wfHqffx1XcSoWqpMoyIQ9FGrsJ01Rt0jNGVR5Ne8zPCi
 c9tZJL+NTrEYUjDOVu/2dASZRk33fUx1RpQlDVGdjY8Al1+wYiquci9nv5ouetmYuJZ1k9P1NSE
 67ruDxbqveTn0epiR3ViBaLzx0Alxx3Ru/QIuSYulChE8csONRL83sU9ZMveTEbqXuEXGyiWw4G
 OeK7DPP6kCTtb7d8SPlAawGMFbtTnCFn4edtvHd+GVQUXSMPXkGQilrW8IjhcBAz79cBDLqSF86
 lr759qDMsChAOLftfcOBOSKC3COmUddln1Oo9XSH4K2qRSugSLEdsJ/AxRemrmCQenq3C8GEhRg
 qE+uLgSs+/vYUc5ZJgcLoJh8/gzllM+5WCmLF8uS2AgY94vkFEX5ymDDDrPfWVr2Q0jaIGa1zam
 eYT763M0OFKdMoL7qcg==
X-Proofpoint-ORIG-GUID: VY6fQKA0G4dd7U3SFhQqTrmHJghqWDi-
X-Proofpoint-GUID: VY6fQKA0G4dd7U3SFhQqTrmHJghqWDi-
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69689517 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nW5VOc3qUOKf0w1BZLgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150047

On Wed, Jan 14, 2026 at 10:49:11PM -0800, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the device nodes for the multimedia clock controllers(cambistmclkcc,

Somebody took away a whitespace from the previous line.

> camcc, dispcc, videocc, gpucc and gxclkctl).
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 102 ++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 30705483ca20..8689715ae24f 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3,7 +3,13 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
>  #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
> +#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1594,6 +1600,24 @@ aggre_noc: interconnect@16e0000 {
>  				 <&rpmhcc RPMH_IPA_CLK>;
>  		};
>  
> +		cambistmclkcc: clock-controller@1760000 {
> +			compatible = "qcom,kaanapali-cambistmclkcc";
> +			reg = <0x0 0x1760000 0x0 0x6000>;

0x01760000 (and similar issue with other reg properties).

> +
> +			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;

Is it a reset controller?

> +		};
> +
>  		mmss_noc: interconnect@1780000 {
>  			compatible = "qcom,kaanapali-mmss-noc";
>  			reg = <0x0 0x01780000 0x0 0x5b800>;

> +
> +		dispcc: clock-controller@9ba2000 {
> +			compatible = "qcom,kaanapali-dispcc";
> +			reg = <0x0 0x9ba2000 0x0 0x20000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&gcc GCC_DISP_AHB_CLK>,
> +				 <&sleep_clk>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>;

One zero per line. Or two, if you want to pair DP and DSI clock entries.

> +
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>,
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

