Return-Path: <linux-arm-msm+bounces-35971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F99B0F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E971C1C21B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFBC20EA3A;
	Fri, 25 Oct 2024 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyFonUoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25B20EA56
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885244; cv=none; b=YaWalinWztyBZKQRehrTUUwn0MotoBZK388V18aBNQuB9eOIlBeh3LB1Vghld8Z5dS6Y28KRHC4ee6XA8HP7u2g+b8V7tcOLQQ4RxD6JMW8W/hot/mR/WR34xxNTsL2hp6vSqyWQn2c+hF61Vc5YUpeLBP1i2yqBp/bTXY54YSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885244; c=relaxed/simple;
	bh=G/Z6Anw20AvLicT7TkmfUVlXSF34bsbnJfddMl4QaAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8INCK6Ojbxpd7pgDn6yiHs4w3w3sL2W2uvWE+XS+id4cydZPesf/yfPYJSbpxfuqAPKKEsxaiC8YRU76c0JgQA9Wn3nWArygpH4GLZU0Xmv3djZz+v8IfqhbVex0LH17HJ58+m2BOQirCtHzyJPAccYqqytU3Hg9DULqDxT2AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyFonUoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEsWbf011840
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkl9T2i4R+q+2wMdvpjq1/psZmqfc591SVz11qs6NLE=; b=WyFonUoBtbCzigZ9
	W24hSON4mBrdnMbZCq3zVw/yTdlX9f3hRkVhqOsLl/V3sR25rXeGFbNNEtRHQPLW
	5vBDJBQrm6MWsv6ST8eMRT+RYE1X11PNqlaXid0mXV2iPp4AeA2c2z8G7rxk1iKG
	pHetip4KxCnaeEXQGzZfBUjjEiaNhxv6ZXmXh0JYfsZAS3r81Des/28YUgCVlgdr
	dKywQaukkWJIZN4wZu7objL+JHQwwISysm4oUMph3w5Agc9vJNpmKWRuWNbDEMuQ
	jjjPGNX+G5aNXyYODfZXbWVFDXXoNWGSce3dvuMLKGxIXNPLWJuD079utpfc2/Zj
	MZeN7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g5q827ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:40:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e57b64711bso325294a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 12:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885240; x=1730490040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkl9T2i4R+q+2wMdvpjq1/psZmqfc591SVz11qs6NLE=;
        b=MDaJIGJmlrYmRTxsEG/VQHI0zeuFEHLk0VDNiq/LDSeZ6aGnVDn4nE7dBhsGaoeOLD
         gfpvIQCAwiUl9d0zUIbnc5zzcun5lyu78ZbSmzr7i4mozb38JcG242l2kpXQYDuDh2Tj
         6NkNB3NfIz0QgEaWef4vRF7cgjZFUZoTa4Oc1dBti5wCVttu4Np1lmFDy24tcuVaikfT
         ZdyGVgeYwCLxBNyQOsL2J30DELPtgZDTN3Glgseh/bJQCwncwezr6U5RxpxJbAuqOMcd
         vmyqnaCK+HMNAiroCgl0UqfKqw8sKjyt4Coz59Z8BeCyU/9BOSsuQfEk/M6F5PghLSnr
         nW3g==
X-Forwarded-Encrypted: i=1; AJvYcCXIBlv5yQhjGVmVLYI0BDe4Y8Y91dFGC0tPiGz9FutJ/upqam/oPehSRtHkTKaK1kMRQQ9A6fFWTihmvIEf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1E/9gMe+rC269MbQ8AWSDYV91TApAoqMiQcw8dGI+Rkc19TTo
	nx3XNpUjR84QK8EbNDrvuxDtC+FPEM9HHbI3QdU/tHqbKW5fbm0xzf8gqj7foGFsa9CiTc6dFMM
	1xemHJlB+XXMGHcLZUTnAEGdwEkaaZ7gJeMfTcARe/FX57pxU2zRx0f5T8YXquj0g
X-Received: by 2002:a17:902:ea07:b0:20d:345a:965b with SMTP id d9443c01a7336-210c6ae4767mr1609615ad.7.1729885240297;
        Fri, 25 Oct 2024 12:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDbEkA9J7EzxFpUTffSKqSYZjdovy9ku+MQA7c1H4oUw/eZUXYvs1TG2JDRWh5H/JpYWW+Eg==
X-Received: by 2002:a17:902:ea07:b0:20d:345a:965b with SMTP id d9443c01a7336-210c6ae4767mr1609495ad.7.1729885239890;
        Fri, 25 Oct 2024 12:40:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f296c66sm100369966b.109.2024.10.25.12.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:40:39 -0700 (PDT)
Message-ID: <15238992-4ede-4b85-9947-391baaa4c8a9@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 21:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QtDTcEuXJJsnY_g57dUjDjvLPhquA9E-
X-Proofpoint-GUID: QtDTcEuXJJsnY_g57dUjDjvLPhquA9E-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250151

On 11.10.2024 12:33 PM, Viken Dadhaniya wrote:
> Add DT support for QUPv3 Serial Engines.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

[...]

> +	qup_opp_table: opp-table-qup {
> +		compatible = "operating-points-v2";

opp-shared;

> +
> +		opp-75000000 {
> +			opp-hz = /bits/ 64 <75000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-128000000 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
> @@ -392,6 +427,24 @@
>  			#size-cells = <1>;
>  		};
>  
> +		gpi_dma0: qcom,gpi-dma@800000  {
> +			compatible = "qcom,sdm845-gpi-dma";

You must define a new compatible for qcs615, sdm845 is used as a fallback
(so that we don't have to add new driver entries). You will however need
to submit a separate dt-bindings change.

> +			reg = <0x0 0x800000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <8>;
> +			dma-channel-mask = <0xf>;
> +			iommus = <&apps_smmu 0xd6 0x0>;
> +			status = "disabled";

Any reason?

> +		};
> +
>  		qupv3_id_0: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x8c0000 0x0 0x6000>;
> @@ -400,6 +453,7 @@
>  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>  			clock-names = "m-ahb",
>  				      "s-ahb";
> +			iommus = <&apps_smmu 0xc3 0x0>;

This looks like a separate fix

>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			status = "disabled";
> @@ -412,13 +466,377 @@
>  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
>  				pinctrl-names = "default";
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> -				interconnects = <&aggre1_noc MASTER_QUP_0 0
> -						 &mc_virt SLAVE_EBI1 0>,
> -						<&gem_noc MASTER_APPSS_PROC 0
> -						 &config_noc SLAVE_QUP_0 0>;
> +				interconnects = <&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>,
> +						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;

Why?

Also, please use QCOM_ICC_TAG_ALWAYS instead of zeroes

Konrad

