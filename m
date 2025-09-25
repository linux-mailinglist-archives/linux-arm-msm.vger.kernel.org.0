Return-Path: <linux-arm-msm+bounces-75054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F419CB9E995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48FE1653FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97102882A8;
	Thu, 25 Sep 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBZpuvDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCE2857C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795516; cv=none; b=AbM/oFLNDTVS0uCUBnwxMGe/XV36M6t5J5n9HllcymAU5fwXNOH0KqNJMMJy6p0WKJQKOmpORNn0IwU7h2lH7w9FFjTi4vqHP2WN6IbUEHvaY/IAUF4SetouZwrnQ68wNzNyqcaIlPMD/AHKRNlShuiR2rl5iPYQqRj0rt6myXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795516; c=relaxed/simple;
	bh=IZgNx1W1QZTrD1Ehfq9YiwjcIhPzLhkZmIWo+Abt0ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQ3EphKthn2R9jf5GTZjmWHrtGCo61BNKHxp8HOo+heUZpH8ZFFq7RxYXAgaQOW90AaC0A4xC+rOPjhZY3bPiX9t3aqwopCUnBK/9JbtBJYoMPJKM23SS+tXgT81JyRLz8Ekhg5PgMp7IsmXeLyKAa3resJFR6rM7vGetJS/5X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBZpuvDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1WOZL029619
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWYVZENZspv4P6/8uM0cY4lKTEnxMEa9Cl47tXv/oVM=; b=SBZpuvDIQjx/DYIO
	+aZAzpqamVnTWwTz0XfPbjx9Aqq2JMIKcCCh825o/FaOPFbVirg9ZpNqLbSSEXoa
	VrYDT9Z3SJYypBndqdsJzAJdCYswDrnVsrkp/ptSXaShDLKQzaD0ADbcmtGULcNp
	uKKpHHje2Bpd+rEIojAWfjlfwfwOb9gedz4BKXq6SBm8jtAqma0ZWFNJaKKtwq+3
	cCW1ye66rIvAXA6okzdkbFH//5LW19o2iTz2cD1MuTteanXofmlQUpS0zXl+ij7h
	qmuT+Xjn8DuxzT8qLaObzmJ5rQcUsegDqd/b+qc48QZ5nqrwNd3+nRa5afFh821h
	5HA++g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqkr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:18:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7c51f566163so2338346d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795513; x=1759400313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWYVZENZspv4P6/8uM0cY4lKTEnxMEa9Cl47tXv/oVM=;
        b=MMyPhhU/G3EfHZs8Ez77c/VwRXVZBrD2JdOkQTYzCY5jEok+lMwEWBuneGX3Y1TZ/y
         OATs7gT8aSxs+A3JYVKqAHyQYhwoIApeAUaqeid745ABRihVUicHFmEtHbMZSfn/O6PP
         BjqWXbSTPoBBQvib9ARGGCPbYChnE5DLt2y41zDD86WR/3s8CE0cy22zazwdxDxBqodE
         gx1SvG0+NoDMiIOJ7pnYLFl4UlCSEi+rE7CuBN4B/I1ynFdPK9Lw6hE3KneBUyFhOvTH
         dEczxD1nZcc/F41T1EcbMSbg4UNdP/DGodDYjAlCPYFYAvUOKUSfmi0LZ407Olb69QlF
         +XLQ==
X-Gm-Message-State: AOJu0YxSXAtQz3eimZ3Tj2pT8mFjEbFGitjPvmJR1fJcaZtuuZXTRFRn
	WCVrHQsrgkYVYEjF4d8cmt1BM1VX4prp0z7/Txg3kDfUhKCEfx+l6LujSzcaFVhyoUp9tWqluT0
	9iUDXJo/Q+7b1vaINcGEkKr1Cp7NwkxOmJAJ4gwFkMIHdI9A4y1Ixw2qiZo1zOAnb6YmH
X-Gm-Gg: ASbGncsTUiPnpusX4HR1dSeKIg6aSWEfL5/NEauFsOL5RXst9UxlS0GFRYzBMPbfzhw
	VxaNvSklYlCFSYdegxqgXh/129cbE8C4Xvt8TRwRAHBkxhwCKufl7+llwdjIfva5byJA8CFGe0K
	SpbE9YECz7SCVyEXD0/wf9VLNEZJPYP2tR9UK9ie5nb0ptbNQ7xHIXCuKpujtUtfG7rKgr30plZ
	YY8M2rAJNgnJ4+OPRYPRdt6+dOxvTITES/ujDOwbktVl5iHVlgoEEiQkU8gWk4kDDlOhXO6tTLC
	a69MxvyBTJxp3wOfXvF7Rt2vzAQAE3T/BsuKKtVrnkkIAE+3Ds9Qp9vHPr5TecZGpk2musPmbae
	SbmhU164jytifIwcHf5eKHw==
X-Received: by 2002:a05:622a:14f:b0:4b5:e76b:d621 with SMTP id d75a77b69052e-4da4bfba467mr20495801cf.11.1758795513125;
        Thu, 25 Sep 2025 03:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeYn583fkq20lV7VuagbZHBYgru0v4T7NMmM2UU22IGNtqwrtQzNW3vAC1VInKdbhbl5CJdQ==
X-Received: by 2002:a05:622a:14f:b0:4b5:e76b:d621 with SMTP id d75a77b69052e-4da4bfba467mr20495641cf.11.1758795512683;
        Thu, 25 Sep 2025 03:18:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f753csm134383366b.55.2025.09.25.03.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:18:32 -0700 (PDT)
Message-ID: <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6wE19ppZ0uidHx64Jx3aKss5nd9ttArV
X-Proofpoint-GUID: 6wE19ppZ0uidHx64Jx3aKss5nd9ttArV
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d516fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PXVopu1NAIokzL3Bk5wA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX8LtgRuv6jAkM
 2U2wYRVS2UB6I8A2VoEq6TbJRTaZPLbQGR1HWCyazm/WbpLoNrcieCAq8aS9rRpo5crFcjR0xoI
 tFy2nLuosvqHLduExefrEz2LtkxPgO26sAj1puqHt6HAZ9Y+Bcvt0M1UegHz1aSclDW7OG8u7yQ
 l5eYbuMQbQaU527IR8+oV8SW4rv3qz80PmOwD9KIoH80E6XtCBUQwNbvxFhEVAeq2tlio1NIwpr
 wgXX5wuOFn+P6Fst62rGejjAaymyDXbf7DJbOZvUXIZsHphyLW5/zjFTOCxgXm+TipikE9SlNI8
 43OhMbWXjtuLI1fabWrHQ89ZO4hxE2plQLAeIVdvkkVJVHUI4NL21wORnSHYoGNpoMfQ7K+rai8
 0G4jva6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Add device tree support for QUPv3 serial engine protocols on Glymur.
> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> support of GPI DMA engines.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +		gpi_dma2: dma-controller@800000 {
> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0 0x00800000 0 0x60000>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			dma-channel-mask = <0x3f>;
> +			#dma-cells = <3>;
> +			iommus = <&apps_smmu 0xd76 0x0>;
> +			status = "ok";

this is implied by default, drop

> +		};
> +
>  		qupv3_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x008c0000 0x0 0x3000>;
> @@ -718,6 +744,339 @@ qupv3_2: geniqup@8c0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> +			status = "ok";

ditto

(please resolve all occurences)

[...]

> +		cnoc_main: interconnect@1500000 {
> +			compatible = "qcom,glymur-cnoc-main";
> +			reg = <0x0 0x01500000 0x0 0x17080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		config_noc: interconnect@1600000 {
> +			compatible = "qcom,glymur-cnoc-cfg";
> +			reg = <0x0 0x01600000 0x0 0x6600>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		system_noc: interconnect@1680000 {
> +			compatible = "qcom,glymur-system-noc";
> +			reg = <0x0 0x01680000 0x0 0x1c080>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};

This diff becomes unreadable really fast.. please play with git
format-patch's --patience option

Konrad

