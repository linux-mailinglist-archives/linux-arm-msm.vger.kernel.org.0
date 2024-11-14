Return-Path: <linux-arm-msm+bounces-37918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C79C8DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06581F24AC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 15:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F2C15C156;
	Thu, 14 Nov 2024 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBpPpixa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896951531E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731597727; cv=none; b=lGU29g6MlKJSbA3oJU5DEkK3CeglpGyFhhF8iIp4LJkaflt2vBSjhcxjo4C0ABw0EZMynvUPtohQX6pDjuJfwhfOk3EaFDeburSLww9RBBxvo7j8URbSKAtbpr3jFHKf80gf+GctnDDV5q830n3PjXXOg1iexCQ4b3pcMKZRCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731597727; c=relaxed/simple;
	bh=VOeL1LHJj4CvlcHfJAl3EqutCbGarb1Yfp1+RrNPg2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/ovIUuNJJWMDXabYeJxMpJr8kjaudFMmwFwYkRQXNoyV/IIxyC9PfkRewDYIAEqVxkAw70+1rx0vWGreceN3Qm/YNMLYJEmgtM/KxOaCSha4U/Ej5YZvKep//MWvbiHwFg2MpOBBz0o0nus+tGP0Ak81nubrGSQICZjHlCmxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBpPpixa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6l0uQ028186
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxIxF5hLq4iWtxlLGn/AClHN0cke6/bTjCz83ShCJhM=; b=dBpPpixaORjHXdne
	FhM/5LByOOD48ay/NrzQnuZz1NTmI9HXNMn9QQRbQlmGvyRvJsDmhXvLM6g8RBFm
	PIWIpEo3Xm10Rq/jKOM+Mgiio+6p9iZ+GY9/TSCGy9fGzYJs096Mj4g0Ec/AxJkm
	4gcdwXUZlxbd5RyXbZOncclyHwBdee9x+UpidfyPLayRoIUqUcaYo7/Sbx3zJhpH
	SdXVpRvkNZkETLHuol1dl3GAtcL6ZOrhOdqqb+4OHbwCzwryIXDYxMrQN6UjfMw8
	Zzw1qu8LteVxfjDtNBUKTfETax3KNZYzAG+O7CiF4qgEnEXTl3T5P1tikTfBQ+be
	rSChpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jv262-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:22:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4609c883bb6so1678911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 07:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731597723; x=1732202523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxIxF5hLq4iWtxlLGn/AClHN0cke6/bTjCz83ShCJhM=;
        b=i64StNGNRwvwqj8e1iYejW1uAnZ45gAOFrs0iBplokvQsYwlrj4f+1Jl+aOUj/43QC
         cOrsBjJ1ZSh2jjScY4/JTxscaYCYjQf2oMp9OzigmbvoEZEeQvPRgN0xYU2Fl4KWcuNk
         3do3URk9rpcc0ZGyPEhXUYBvBZQYid14XzISV4FZlSEwGwuerEeojW1p02bW/FuHBsus
         ogmLOFUaZvPR8u1X29B1ttWPKQelsn5YPNdujn5fzdYOXmSYcWh8clMQoHUKMzqxnac7
         05s1V+BmarB1bCEwJgd2K8WH0qxX1HRc32AqVC41ucJoDRuHQYX6PQrJY10Evu90J7jQ
         gGWw==
X-Forwarded-Encrypted: i=1; AJvYcCU8czAF4pb9c3gu2CwbBoB87u1n993HBSvjc2wcZW/OgwhmN/+hT7vv9iWVjWgNnBFX9J9ETlrDWbhsLcqE@vger.kernel.org
X-Gm-Message-State: AOJu0YxOy8wmJA4AELAD07LRPs+u3m2v+JKsdZmxUTWUa4xscRnouguw
	zWzjVjuQAk6G3cDdrRp1fIYTgzezq1SCUK7IqZX+JklkzN8F6s/l5hkfuOpofuEOfnqikjT5kYL
	wgCvnLZM4j4UnH3dqAdLN6dxgzbaiQOprM8Et72dYG4i2Qadx1SRdOKWrqNMwFLf7
X-Gm-Gg: ASbGnctVEnaHIo/gMZ1mKCdTPzx0ieCZ7q42dKAzR++7GaFjuk/IbZPFfAD4II6eZEr
	kK5CG6sijDynDAlZIwK48wAyqRxXzd8EG03/u9/HFk1T4MzL+qmi3G5qSp/4kXH53P4/ZWN/X42
	l4ZFv76/KWu4dHKdjc01k+1+JdVJ2iTvOTMRuto9OnCQvHSsE2/PVI3B4Fan/0ii4Vm0TD/jK/6
	l3VuRHiHs2LD2Pkx01A+mXsSW+PbiRVf6mlwnzn3nAlMMTxRCArQG5QrMZCAS/ARfAr8CDoKmvp
	VAIgSTbFM2leUt8JIWk5zghViPMrSFA=
X-Received: by 2002:a05:622a:1183:b0:460:787f:f51f with SMTP id d75a77b69052e-4630941ab7fmr141068341cf.13.1731597723549;
        Thu, 14 Nov 2024 07:22:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9U14TALS4SGOL99dlTJ9kdKVasrprn7rCmbpPBy5qi53TR2NVmA6bM59U5xTlcuiHukHjsQ==
X-Received: by 2002:a05:622a:1183:b0:460:787f:f51f with SMTP id d75a77b69052e-4630941ab7fmr141068101cf.13.1731597723213;
        Thu, 14 Nov 2024 07:22:03 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e045385sm73577866b.144.2024.11.14.07.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:22:02 -0800 (PST)
Message-ID: <0344465e-89b9-4867-85fa-670060fa1761@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:22:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: add QCrypto nodes
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113055830.2918347-1-quic_yrangana@quicinc.com>
 <20241113055830.2918347-3-quic_yrangana@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113055830.2918347-3-quic_yrangana@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jbhS98xfJ2gGEJVg5VItQ8crAKxcSCyN
X-Proofpoint-GUID: jbhS98xfJ2gGEJVg5VItQ8crAKxcSCyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=904
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140120

On 13.11.2024 6:58 AM, Yuvaraj Ranganathan wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..d7007e175c15 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -710,6 +710,30 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +			iommus = <&apps_smmu 0x480 0x00>,
> +				 <&apps_smmu 0x481 0x00>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,qcs8300-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x480 0x00>,
> +				 <&apps_smmu 0x481 0x00>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

Konrad

