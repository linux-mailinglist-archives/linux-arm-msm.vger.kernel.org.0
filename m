Return-Path: <linux-arm-msm+bounces-59103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AEAC13CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB4C17E681
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5851FC10E;
	Thu, 22 May 2025 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRVjCTHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72731F4CBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940266; cv=none; b=TGQ31edDwbbZuiKSVrtFcj2HhXjdRmPuNsA+N64s3gYx/BbHPIQGS1VBwnHcNTL0KOtEK7P4rQpzNspb8EQ2/gfb/BFC+dKi+BFjp2h+3AjtseJDtAXZhV2j0U3Or4Jt0PEJ7KqW40cUUxLxpeSJv2yBQrsXma8VZi6G81A9EJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940266; c=relaxed/simple;
	bh=mPlNrrCI141hViqbpNn117gV9qNMkImYPGI0pNIto0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0cEEooYtRH67Q5GSpai2oss6BqBh+BRS/UmadM/zKc3n63jsAi/mXGyETKwhw/ueMuNnL6nc7mUD359oYAliWVwolqS4+5RLe65MoponFKnYd/rUXyUXRWDoMuaKbAgnFap9/GO4pI1qVK3mkY8iaE8cYt1GrlVrGd5Wtt+ZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRVjCTHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFM3cR006590
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71LWWlp5SYfChnA55iTdDO5g05kpTKpC2r6RSF9U7JA=; b=fRVjCTHRmvLWpxzO
	GxgNgfIailcJT6v997Rzt+cf6KApN0CnkkaH62WHoRvEhrlYfROGKcsTLNgZvD/h
	+tVmmncATVwk82BWh24H18khkEKcoiO/mXwaSgkRWBxlqGhBTe6fKSkBYrg1s8Aw
	dosLO53XzHxkQS3drObfjbhrZD0T/kX5tgbbKWneGM9nafY3pDHSR4d117w4BTBt
	1WZUB8vcGSHCp/RARaMpBvZdFh6HxemmDDad2/8/iREwKQVY3TkRJnbOuT4wT9cO
	FTznE/cIvuv2zVXK4fVR2K8DnHSVLyNKX+berPyciXwpieFCm/OnXHuOgq0KXzL/
	mFZ4lA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qk5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:57:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c0e8a5e3so13478276d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940262; x=1748545062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71LWWlp5SYfChnA55iTdDO5g05kpTKpC2r6RSF9U7JA=;
        b=E1qUcAwFJ0ma2eMC5rjnkPTECBurEC/Ri1gfj8lJ+4aariLOrqNS+78i4ye8iFiBE4
         ya0hs6F7sCgz4oZ/BLxxfcb3VF+WbfovUaQw+Y4uHjo67jC1uGzf2Th/0TCmDPQ9QK+a
         Q9rwgGzue0DXC11qdYTn7VvbP3FDcT2VJBAKHu68wbS1+uLZUdRGNyz1MiYDhx0CmCyA
         LqwUp2J8ooCxsvcT9JaCoof/KwDpEqWGtL/C8uYzDNiIWeSfGNqEHvKNu6krlUrRbC23
         /BKUfsruMIEdhtugptWmwrQK6CkWZpxhPM5EF6w5DLPkzeG7/nkGoNUqJGNgUVF96w4f
         Y++g==
X-Gm-Message-State: AOJu0YyJjRGpCp+lAkMLt5NK0hCUn4FkNzqWiV7qLNwTJC0ZO2qq9uTj
	ZXd07kYssxWTaBJoY3sVaw9v/EeYyDVjZm+yXocRXon+assNS003KtuW/okbAmBaL4iQem1Hnei
	uAZxWXY146gSeenrMpWwtsl9autIpj/7HL08kxnFm17s4pory/1T9QMYQYZHz0sRiGGvv
X-Gm-Gg: ASbGncuw4L3tqF3BA9iLw7+/JwoE4qVQbeeQWnxFxR8K2AwqFvls6aFa1st0BNR2aUc
	dJbXg1hxWuBrjJBcg8TzKdW1rS/gGAR1NkUkOdjpduBm7e/U8V0KDLorJebpC9wI9WG10Mio4ix
	Wj5zb3IPDl4ZGTSNeKDXd88bAj1p71WGC9/sR29UmPSzMZE8IOAqDCnqIzZEpTYTG+CRSwPhyTg
	CyXOYWfLIJ4atEPiU8IX8eN3FJteAgomFLLHvp/NGaPNwL8IPdXjrcoWAh+naDv9k4CSzlOi17b
	9wYr8uNSw27ER9/unNO5M/FqBN7nVATQqCUlXaSenUTMSuiAfE2N5PZj9mAzyFpEJw==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr133321836d6.4.1747940262406;
        Thu, 22 May 2025 11:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Tg78//GXVGyUOTwSdhWdbldHlKHurX2DdCfZUSaKQB4eMLZOcnriL6F1zLK9zyfr5P5G/Q==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr133321656d6.4.1747940262015;
        Thu, 22 May 2025 11:57:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c90sm10947316a12.12.2025.05.22.11.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:57:41 -0700 (PDT)
Message-ID: <23b2c6bf-1dc5-442d-b276-9f55ba00980f@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QL7d8qunYRgMQ8miqHocVDFGDU5GS3ie
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f73a7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=op7gvYc-dbaEY5YB2yQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QL7d8qunYRgMQ8miqHocVDFGDU5GS3ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfXzYu3DFSUKzaf
 606RBZGPZYbwgeBBFKi4BKGxZnVCRpizoZ/fsstd4AQM82A1DEMpnx3ugf2frsK1VOg217KIM0d
 85L2rTWIgvNBoKnS160c0uBjCUT89xGRwZD69GbU6B97P70S1+J+5wuFoA3Ne04hPGfb4pJ+Zvh
 sAX442Jxute0kHT5S55Bcisj1wfDznM3TPNS/3zYw2Ja+eXhfN8R3Cd8ygkoVR9A3+Idh3mIQOW
 ZtOUgkIDxGs87mFn4TA1pMipQvJADO9+P60xeH9EV3+ceHc//81BNq6LxgmtTGoDrekvut3K3rG
 IovVpdtHAKZ7tf+rZE+oOooSdjD0tSG7iTfUJsyB9pZQB1jEPHIvQXqA00UD02zPyWEo49TPE7W
 g7TL3EDmsCVobk06ViJI2+FbZBTzMAdn2ZM5vsAFJuPGHkQ4Ew0KQSj9Twazcs24S8IOFPdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=932 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

On 5/20/25 10:56 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> QCS615 provides
> - 2 x VFE, 3 RDI per VFE
> - 1 x VFE Lite, 4 RDI per VFE
> - 2 x CSID
> - 1 x CSID Lite
> - 3 x CSI PHY
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK_SRC>;

Drop all _src clocks, the common clock framework has been handling
turning these on when their children need it for 13 years now :D

[...]

> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF0 0
> +					 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "ahb",
> +					     "hf_0_mnoc";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite";
> +
> +			iommus = <&apps_smmu 0x820 0x40>,
> +				 <&apps_smmu 0x840 0x0>,
> +				 <&apps_smmu 0x860 0x40>;

x1e defines a bunch more streams than its phy/csid count

plus entries 1 and 3 are equal after the mask is applied

(0x860 &~ 0x40 == 0x820 ~& 0x40 == 0x820)


Konrad

