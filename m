Return-Path: <linux-arm-msm+bounces-75072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F0B9EE0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B19B1BC028B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BAB2F617E;
	Thu, 25 Sep 2025 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5iBvZTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE082EA179
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798938; cv=none; b=L+3qBN4S5r3pvmw0+1mb4zL4B4oG+RA+2DRWtRo21neugiPDeVH6pqEexyTZVLlLxqnHfQSvnN6vf5+e/itUBEIvd/DPdsyfAYjAl0hykp/2K5Eq510sqcWdb7UKQivSqbUznsHqmk+Fhq9/wSe+D4TD8SarBmpsGnX7Ku+LFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798938; c=relaxed/simple;
	bh=8k+FXLGT6BoFO4hPBZHvVkoC+FerIwEvPkkYVXLMk6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWzT6L3dOTrBuoZQDtZ07FoT+p4uQ6fSFO/LQ+/LMJEcgw2VaKtRxyTCcu4U4XtJUuO7lmZrKqQnEV/XM0XYZYo/l7fRtkzWEd7DZJ5kOVAupagynRquthIGh6n8ShC5V1vt4mtZm+dJaWMADx94Jt4YSPV81Z0y61/thAyxOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5iBvZTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P93Xng027774
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2yw0Z4BvPgurKhSsvw4sBg0VWbazwvxTj9AIPRCJyGE=; b=i5iBvZTaN0LGuaxo
	doG5w/3qr95jqoykLHJxiYV65mlO8W52EPSh6oLcaNehzu1SLXAU4TkDeUg1robx
	tKkWnr+UhDskDj3GafbzAGizlh/d7JBMo6ZiHAeDifFMk3vLhDOuDfL9+fpmjVFO
	3/jUC/cEbbGxMjaT8qk82hKUfYuq2lxUnKjBxaoFWLsznPXKU7GRCKBYRVHWdppe
	heNhCKRd/HGiJtbY2MUMpve7OItRcVnV1gDGQuL0OyywjFK76Lt05oGvUY7jXyld
	wWwvD6UFPJxNGUAWcOnU2dorlZIlV6Hnpr03bljpehjOw4oHu30GGtgWNsoIS31D
	6PcGLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp080c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:15:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-80de0415155so836746d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798935; x=1759403735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yw0Z4BvPgurKhSsvw4sBg0VWbazwvxTj9AIPRCJyGE=;
        b=IeYiMStHJu4wMJjbX9NdcdKf2GXzzZ9iNbV4DZytfVtBIYCygunBQoBTnheNMh61g5
         m6eH7xfquJ9SIK3RfeWB2Z3PrHqym8zeh1DqUc1D7Vm7IfMKQqSFXsrbzLfLSUV+rtA0
         kKCcOm51aQqHKnv4LNds1JGFA/Kvw/tmpb+QZVEMuiHB5X96OomAC4cZt2eHOGQQGhFC
         TlFa1IgDL2hC5LmqP+UD8ej+NHtTm6fzq9sy+M2MNVHWKou5Pr0Hj+FC/gLLmmm8vG9R
         U49Oelac0f4vGnKZNYL9KWtniy4nnc941v6FnVIYc4XVCNFfPmLDTZJBw938EfOrgye7
         Vx+w==
X-Gm-Message-State: AOJu0YxuEZAE2n8NmhMbQaQr4fXUjSk4YicLfBmLuGxH8r6Wjvouf7za
	U3OIkSLeYZ4nc1Ha8MHqNc5yT5d9H8SsOiOEyUD+deLAkNcy1Kf/gdi7noe45CeJE4EH7cCT9b1
	wnRIsv2DTwdFczwQMbtTVZKGgj9uFVpMwJm0MLBrSqOpaaITyFTucnyXyPiXtNYeDgX2M
X-Gm-Gg: ASbGncspLDvhQ5G00HMe8JAtmpwcQ7fF6EgjWm38cixTIhfQzMjcouoUNSyUwhRWqFv
	GpcjDL/nP4GM9XHLqrq9rTBfUZBPa5GSFb3ZRAKS0iN3NNGXzrMEdTy72R0X76fHUJtySfHFiH6
	uyNCJ/2L1X5a/1eoAEdu/FZJaiS+KFee+2tLfIEIdl/UyB/Z6z83mQjyZ05jQu7UvL7W4uJIQ32
	u7BIGa90X0DpbTQPz1mIyxarcdE4tTsPJ3Tq7lSLz+TBIuuZci4vR/rl5eX3cCD+v9WIHOJmyqe
	QcqjOKLM7h3hbekch7q3jslxBmtp03/AZ3HhiFpMhRQ/EYaV0bUhYvCFzNulJJ4OGNjLWeRs9L7
	NTVGi6PbfOYvBGgsGxsgmMg==
X-Received: by 2002:a05:622a:608:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4da4b6160cbmr22397431cf.8.1758798935171;
        Thu, 25 Sep 2025 04:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8hrH/MRJg7g0i1dNASH8E6X0SfTuOmlXLe0AeUEuIEiHICNaqbckoT8V00+CjXJXuXcjQWA==
X-Received: by 2002:a05:622a:608:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4da4b6160cbmr22397161cf.8.1758798934592;
        Thu, 25 Sep 2025 04:15:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f694fsm147987966b.68.2025.09.25.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:15:34 -0700 (PDT)
Message-ID: <86492536-c14d-422c-add1-a6c60a7cb2e0@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:15:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] arm64: dts: qcom: glymur: Enable tsens and thermal
 zone nodes
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-21-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-21-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d52458 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yUpuV9ZZFvg7IC1Tjx0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fTTJa4Jq6euI7F3Eoi_udyUh5aIRxAJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX9oSx4ExGkzVz
 2MEqlRKHlIU8Uly1MFMRNSiM+TdY7p2W+eTVUcW8afgG93cTFY+nEBmRj1xGlJbDPiHGR2lTMVS
 pvHTnEWdVcDnLNneoS1wyjWdJQcddc4sBCN7JWswGKMdtN6pJkAVeL3SRF6ySJh7LPNBNZjEI4Z
 8jmI6IN30uFbBDYYcAvxO12ZMy7hI2g62spsAtLy7EVI6Y01Fw6420cyoVlfB39E1fU0cj2+aSm
 nU4ohq0msGrm9fTv+WWeWTRSdz5tDyeP+qf1u68R3FM5AhmpTZZboNmD+c40PLzBdMwPF+WT0fD
 CIsrh9IOCY0Ru1V5+F/vOFWvOBKDf69g9JGv9AubrzFjq9MuYcsqjimfrUAL6XAvS0M1BsKWjop
 n7a9KnRb
X-Proofpoint-GUID: fTTJa4Jq6euI7F3Eoi_udyUh5aIRxAJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> Add tsens and thermal zones nodes for Glymur SoC.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 1998 ++++++++++++++++++++++++++++++++++
>  1 file changed, 1998 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 17a07d33b9396dba00e61a3b4260fa1a535600f2..986dc385200029071136068ab79ff8dd66d5284a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2790,6 +2790,134 @@ pdc: interrupt-controller@b220000 {
>  			interrupt-controller;
>  		};
>  
> +		tsens0: thermal-sensor@c22c000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c22c000 0 0x1000>, /* TM */
> +			      <0 0x0c222000 0 0x1000>; /* SROT */

These comments are not useful

I noticed that some patches use reg = <0x0, while others use reg = <0

please unify them for the former

> +
> +			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,

pdc 26

> +				     <GIC_SPI 861 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <13>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens1: thermal-sensor@c22d000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c22d000 0 0x1000>, /* TM */
> +			      <0 0x0c223000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,

pdc 27

> +				     <GIC_SPI 862 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <9>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens2: thermal-sensor@c22e000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c22e000 0 0x1000>, /* TM */
> +			      <0 0x0c224000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,

pdc 28

> +				     <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <13>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens3: thermal-sensor@c22f000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c22f000 0 0x1000>, /* TM */
> +			      <0 0x0c225000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,

pdc 29

> +				     <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <8>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens4: thermal-sensor@c230000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c230000 0 0x1000>, /* TM */
> +			      <0 0x0c226000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,

pdc 46

> +				     <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <13>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens5: thermal-sensor@c231000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c231000 0 0x1000>, /* TM */
> +			      <0 0x0c227000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>,

pdc 108

> +				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <8>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens6: thermal-sensor@c232000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c232000 0 0x1000>, /* TM */
> +			      <0 0x0c228000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>,

pdc 109

> +				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <13>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens7: thermal-sensor@c233000 {
> +			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c233000 0 0x1000>, /* TM */
> +			      <0 0x0c229000 0 0x1000>; /* SROT */
> +
> +			interrupts = <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>,

pdc 110

> +				     <GIC_SPI 816 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <15>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		aoss_qmp: power-management@c300000 {
>  			compatible = "qcom,glymur-aoss-qmp", "qcom,aoss-qmp";
>  			reg = <0 0x0c300000 0 0x400>;
> @@ -4611,4 +4739,1874 @@ timer {
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		aoss-0-thermal {
> +		thermal-sensors = <&tsens0 0>;

You need one more \t here

> +			trips {
> +				trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <5000>;
> +					type = "hot";
> +				};
> +				aoss-0-critical {

Please keep a \n between subnodes and between the last property and
following subnodes


> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-0-0-0-thermal {
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

See:

06eadce93697 ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")

It also only makes sense to keep "hot" trips for devices where we
can actually apply some cooling (e.g. the GPU)

Konrad

