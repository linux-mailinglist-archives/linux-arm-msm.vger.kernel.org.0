Return-Path: <linux-arm-msm+bounces-88000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7ED02013
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 11:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CAB4374F91A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0116538E123;
	Thu,  8 Jan 2026 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMOwfOdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1xrXewf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783B38E127
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858911; cv=none; b=r5mUW4ELoATSp8ejrwXPvrY7ulXct6ADBjRK7w8emltZTc1jRv6zkoRisEMAxh2MoNIfIA2knhSxrlidSxU7Ze2GD5FU9FS4UP5NNX54C730HX7KC3xmiBZfeijH54/dCJbhI4rZNmJRKAj27EnziQo1r4RNMDIPJizQxq6OevQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858911; c=relaxed/simple;
	bh=u5AFjsSzR6iKwQTgn/aMlm1sgDHc1adqC2yD6Q5e/Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XPINARrEVD0aq0HJSBjg93N4Qewm3Yh+19hmRo1O4Qz/l0EbNLWlXJvyBVGYaDBg+XCc3AIHXjz6mObJfyYfPXFGCiEBMYAALkKAqhruSSeTbk5H4S+yHiBwSkI5EO0v8bHfKLz4sA++s5Pfmsy7IVNPB2JRsZPWdZEZT8eaMZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMOwfOdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1xrXewf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60872BwP1495648
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 07:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jwje/eK8M5C/9BgsV5p/SGB38NoPwEa4/5GdnweBkQ=; b=TMOwfOdUM/ZuE6BO
	SrMLe2GaOinIzcCTw2VjT2Xtscu6ZvS9nj44Wz7OFUozAUJ16mVfoEWTi5aY/G8D
	akqscHh4sbY8QgcNquY65VmPKA5zLY2MoHygsVavQa7COSdSPnNtderrZtm00pui
	UFPYud8EGQ0cFWz6VfTYHf+9h+BrUJwF/XO+tRqU12IZ6lleuSnyvcfdVXZdc4j0
	2VShbeGq8vRDsBW7Odlc8LQBIqipCsUsGZ9MJcMNHUXCC1m67V5U6cl7voVNXu3M
	siDInX5pNPUBiaPFvgco+/wR8Hc2scrF9tE41zod0ww18r0jtuisUjStYxWyDhEw
	hz2Yzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua84tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:55:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81c5e1e3beeso915258b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 23:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767858900; x=1768463700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jwje/eK8M5C/9BgsV5p/SGB38NoPwEa4/5GdnweBkQ=;
        b=O1xrXewfTGdsUEqsfoQ639Tc7IDwTcdw/7DMnvzw+WPivSeMnveieW57wyE8e+jKwZ
         QYCwWLkhLLuGyfwND/OxptWo8+V7ECQL5LM01LOCskfkUxEWOaXTbugGR4SV4+nkOJLm
         oIl0kmTf5Ux0vNa35/n71XEdWOwdVVAM6cr9tqszXBSpvGTpOu/8f0u/FBzWCW8tuizh
         MjPtiZ5WmNNpwo/e67xvuAKAifzrQL41RbMfNbxLE6ZXGCRZdXikd3pWHi9FCwX9vm+O
         rkYC3fA8hM/Uw04Q+OhgXfohh0lcwZcj4pjTceSLDErImo4gPuDntXeReCJHtIeUoSlN
         Oc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858900; x=1768463700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jwje/eK8M5C/9BgsV5p/SGB38NoPwEa4/5GdnweBkQ=;
        b=NIUGq8fkv2rR66c/y7Dlt65fuq2atakoKvUwxss+ccghnoDdFKxfwXhst/0R8zRJU3
         d+k3hC+ng8nTAw04b90i/s++xMN5MKQeSc2YcBlWr9gxgkru8fZnjuU2Vf3KpleLwo86
         FzPKanTI2elWMSxGoKJEXiCzTRmkwpZeR+g2HvK6eu1P2nN1g7mjDs3xbTxR2ZM4R6Rs
         /7ztIr+Ai3PZeYf29XG6sYUnYUrch7iskVZGywyNlkrfhPgEfTS8gNyuKRAGPX2ojkad
         D4d89rILxT8k+2xJVNWhBgpavKBLhHvd8golMhrt2o/Rp0taLJG65ZX5GKUPHKeFiC4T
         K4Jg==
X-Gm-Message-State: AOJu0Yz3esWByNLg/68P3D5n22IVTVFuv0YdiBXTKSN6Akfl7q8DsUhP
	g8hdf4MTv4aOeGhX2aw/HiGyc3uaqIPq9yg1mLI33sz9OZ1JWFCzcBS9UXRJ+YoCqf0/lR9d4NC
	x+OqyZN+QKijO3syjW38MuBxdXuSuz+WQFJieoTaEbq93AMI1aXX4Y2/50ssG+tpmRH27nsIunk
	PG
X-Gm-Gg: AY/fxX5cHr5uikdIUmkzOgeNo+9K4MAcqvmU2//IavG0vvo7O8jWHXx4viWBmohKy0C
	yl9a9uglZs8s1vwb+Cf/NbVwvjuWyHjZJCyePexgJ4XB07bMtYp/UhoL6j3HUBuXJF3GcsjoNKb
	4lIDkcL4pgspZxlvnSpoInFQ3cAuve17SQ1JWpXdrPqxyY3xRmz0behAMDQgjWCIcv6Nr/nkMoM
	Ks1uhEZLzwxlhg5gpiUjC2IqlJKjin4HrXcBiS5o1z8XJ+8HQ3ZSSiWdQp8kbcUQlbX2t26v5hO
	hFHGAMdfC9JzuICcN2o1DnkyXzixClmGLKfdDQA9MNVotJySyCzb2ZcOvdCpL/wZvz1MalwXWnA
	uAfekYN4rmvZ4bCKenCjg5q2A/nLAyun7a5PO2fEbahMf
X-Received: by 2002:a05:6a00:419b:b0:81a:8ec0:4de with SMTP id d2e1a72fcca58-81b811a1047mr4774679b3a.66.1767858900004;
        Wed, 07 Jan 2026 23:55:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkE0UAtdFPWsHhFTo5H59/d393mgLsD8Uqo39EC23raIgCPA9GNnGVQGBMOJOVzIaf3DBSeA==
X-Received: by 2002:a05:6a00:419b:b0:81a:8ec0:4de with SMTP id d2e1a72fcca58-81b811a1047mr4774656b3a.66.1767858899533;
        Wed, 07 Jan 2026 23:54:59 -0800 (PST)
Received: from [10.204.100.39] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c96d762f8sm1582574b3a.64.2026.01.07.23.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 23:54:59 -0800 (PST)
Message-ID: <3c1ed641-b259-a7fc-04c6-25903df21889@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:24:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
 <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1MyBTYWx0ZWRfX1LU2wanYGy5+
 nVklgxWqN2uBZDHeLkqPbd5e8deLNu/wzDhyJeUpkOP+KQR1YtkF0isE5ilJGT/70kJ2Uk/l0bZ
 SzWLmlPM4bBZZAlrLeRomV138LW0J/9HnxYcECznniI/k8h0CjOm5X7p5p/RDUoeOlRyeGW+0VG
 hmA/6wJmxiiBvBi5sgku5eS1AHG/ezu1J0SH/NqvfBTXL40vV9hjtI1pMxSqh19C5lk7/J2F4VD
 LzjZNBCEvK5WzQtCS2+9EEModysxTC+39Ruh2xhPTbGM4DrE9HVRsbRZXkYArMzRd9gL3XRRkZR
 IlqXJUh9vmX4cQLWqdRU8Yty7/7Jh97Ak2us3X9fn8/yWPlVulgZxFusgOi2qAJ48tf5w83/fc3
 1SMAi0jeL2sRWaGXhrQuShGjNTtIqUteDzFG2dSOcQqTwKCmO+cHM2miDRCxcPasI4piBaaP+pT
 qMuLJhkbcMHgXPxTh0A==
X-Proofpoint-GUID: fo1L_ynXoKbeUeLLr-GrGgQNDRn95m3t
X-Proofpoint-ORIG-GUID: fo1L_ynXoKbeUeLLr-GrGgQNDRn95m3t
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695f62d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NvbPUlHVyKczVWSAzjMA:9
 a=3EfvB6IQCLLuokxE:21 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080053



On 1/6/2026 2:37 PM, Krzysztof Kozlowski wrote:
> Add Iris video codec to SM8750 SoC, which comes with significantly
> different powering up sequence than previous SM8650, thus different
> clocks and resets.  For consistency keep existing clock and clock-names
> naming, so the list shares common part.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 121 +++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 0a6f2a449c20..a76bf5193a70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +#include <dt-bindings/clock/qcom,sm8750-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -2811,6 +2812,126 @@ usb_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sm8750-iris";
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun";
> +
> +			dma-coherent;
> +			iommus = <&apps_smmu 0x1940 0>,
> +				 <&apps_smmu 0x1947 0>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-420000000 {
> +					opp-hz = /bits/ 64 <420000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-570000000 {
> +					opp-hz = /bits/ 64 <570000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>,
> +							<&rpmhpd_opp_nom_l1>;
> +				};
> +
> +				opp-630000000 {
> +					opp-hz = /bits/ 64 <630000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

