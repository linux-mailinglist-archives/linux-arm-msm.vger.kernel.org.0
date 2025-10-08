Return-Path: <linux-arm-msm+bounces-76397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD893BC4C95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963F419E1E40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804921FF61E;
	Wed,  8 Oct 2025 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI4DYbkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A524677C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759926621; cv=none; b=i5v0JBk18+RSCn0f47rJ7AyCMAnuqnS8xI13ObXTNO3yml+svKmCai/qx3V8P8nJcs0rs8D/hRYmq5QiOVA+bkdMkzQsbJHXB0WK6OTExb3K7RnhD1xJ7Acg078aZW7zjPwi0r+NxA55DcW5M9jYT1f1lX5Zmu9RYo1lVdttZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759926621; c=relaxed/simple;
	bh=3NutFA/lGn0R2mNE8a1/k3ypM4Mn0sub0aw8bFRL2HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P50OwJRZ07pcEy8bidkLmYDEiKPMdZXG4bQF0OFDF6W3vfTgsPDA1KN3Sudi2bkfEENRz6Dbg+iSnL2+cm3gOLx2j4y+IKDPE6W3Qq4mNVHokoNqHvg44vujJynM1b6HpgxDZjTHDGS59HT2X8XyqdkaD7jLk9SqtywqQ+z+rUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI4DYbkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890R9f001683
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwOmmq6eh7c1BlgA/tZn39no0yivZDY9RCiDcAFj/w=; b=oI4DYbkWuaD6yH94
	nOZtDEflYZ5xYXXjFMhsljICpLt/7npA7QQoc66K/oRpaHpkYa8OgviwiXofRYBp
	08atq97uw49H8M7CEsDfpErHmHNcgQHOc6/fzjC6Np34FrxGo/zF0s2KzbEM+hhs
	w5ar8HUJZL9mucZ4KWnkdchApE9TCJLOh2ppNLO+J3uG46c5BeaqgGa5Nv9BQDY/
	KFZO0WRkztMRsQ1FJ+y6YcH/x+wxzSrQxU/S965lejl646L5GzQI1xjlMt1WXGla
	y9nGquhxWkbQECj089H/pYvNAKPwF2hdgbX6KAfuypGmczb025yeOJODkshfg14W
	xPaW3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnas2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd3c89ad67so6112701cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926616; x=1760531416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYwOmmq6eh7c1BlgA/tZn39no0yivZDY9RCiDcAFj/w=;
        b=Vgy/7DkQA13sBxOWfrLCwKrxWyYOXNfH+VBHGa4Bes6/kocb6isbYvM/chWx2UWx8H
         TCaphRx4aL1ZtclYkj7X4veb8iR8/QwJIT/Sp2nwrLSqazY4zCkzI40N6ZidLNArID+6
         N6iE7qlPRciEGB3q3p+5Moc0tZgz8d+3bpZ62k9UKW5DCN5s9bh0DxTwuDkh/KVEHv3s
         5r4MMZMCd0rkmYX5uzWZvO0Tuu1d+Ldf/qCDtHa2zG+vlknR0rdjU3ASOlsg8HpMME+Q
         Y9G4QVj0SniONiQa3VW8wIk1/93roiQplFZNtHgazMfpg16tK5j2tZIcVm3NUQFgASNf
         QiIw==
X-Forwarded-Encrypted: i=1; AJvYcCXZMUDuLD3Zfen2/y+15eK+R8sBXokMiBDazYoBeElRw80tzzrOqiqIqe95CAbFdIoJVCGFWnJAOULL+2mK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo6d/kkgf3XAW6FoBEkPWJbsTa1wokh7zYOmLzQdzEc4mpR2WD
	+i7V/PDZxOW3SWwKu8vhjWpZly9MH3DrGCNirW0n1nfGjuzfDMDs1+2ZYk7DU9n78jpT0GjzPVM
	L9RKnGPCoURFDy008Pk5Zczux8xMkxx+A+bLKfmrKDOTCCqUNBC9fzqTioSjpXdmAG5jl
X-Gm-Gg: ASbGnctJsNFLf8AE7avGLS370ub1M8sXv0Sq3jAVod8OlxtR5agQWj2jKJ9LS9vhQSJ
	PZO8O57gj/p9WTpmOEsDLONbqEDFWQef76Kr2wv0jXqtesNosazg3xSP5fIU/ciDwHbkoakAUUp
	3bZs3dKPSh5/jDTkTXXCIOaFPEKQ94eLB4+wkGr6XC/gF207ynzhMGTiML5f442GnFnNY2IGCOR
	Csm8o3NuQSPyF2KmDrw7zjYn7Jn1brIKgAH+PhGuaGZMpcTsN+6HtZMlE+V1MXiACgTA42qso+7
	bvQeAlbtslbRSwvhPwcYCb3AqnfEPvtJAQtYf1D5gnmg3JWwtJp2K6ikPVDUa2qakm4J4Cwj4eg
	P3QGsJG1zJ7YhLmRU/wpJX7RmgZU=
X-Received: by 2002:a05:622a:30c:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e6f4acde1fmr5303551cf.8.1759926616072;
        Wed, 08 Oct 2025 05:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/AlwhfCmrZxt1Uz+PeJCgLqUiBaGU6v5l4sYwpfDnGoDIJcA7elnm7lMZ7gtM4iXdb4tK9Q==
X-Received: by 2002:a05:622a:30c:b0:4d9:5ce:374e with SMTP id d75a77b69052e-4e6f4acde1fmr5303051cf.8.1759926615439;
        Wed, 08 Oct 2025 05:30:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1633510466b.16.2025.10.08.05.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:30:14 -0700 (PDT)
Message-ID: <c7848ee9-dc00-48c1-a9b9-a0650238e3a1@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:30:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: ipq5424: Add QPIC SPI NAND
 controller support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251008090413.458791-1-quic_mdalam@quicinc.com>
 <20251008090413.458791-5-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008090413.458791-5-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXzrV4PQUZVrpp
 H7zDytH90C/MRjQe+jgCYmlJCCbkccdr9PtzeND+B1GqpXwqCnkRbtPyLi6BNtZ3qBlbUbWsmKU
 48nb5vJ669JYeeQwG5OkDaEHh7kKlmrqQX/QBjwEduDiNrdL0R1C1bV/XnTN9Bn6p7v6cAqHk3x
 p5TcGr5Yzq4UefT+FwgP9poSFWtSNn5uG7k7DiHLOzGX/Elnr6DOqQRNZvw97KwurYChlt8ISvC
 ZyiPPksyI7YqRaJ/j3hQNAnJ+o96DVtGNnNlfKmBkcyM6z4c7QVOa1ZkSIBLawqarURT3dr0O8Q
 sskGQt8W6ae1bqBUak8qHK6lgzJzsfQEa2gF5yDUFUKvBo1AN64VBAmhRYva+U584oPTA9Wdj2f
 4JHWVUHYjoUvQT3rDix/rkFRbh+mUQ==
X-Proofpoint-GUID: AuF6cowXJchEzDgp1bxSiGtYYXBVrTN6
X-Proofpoint-ORIG-GUID: AuF6cowXJchEzDgp1bxSiGtYYXBVrTN6
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6595a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=-ept-RJRzOG-hoP0ccsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/8/25 11:04 AM, Md Sadre Alam wrote:
> Add device tree nodes for QPIC SPI NAND flash controller support
> on IPQ5424 SoC.
> 
> The IPQ5424 SoC includes a QPIC controller that supports SPI NAND flash
> devices with hardware ECC capabilities and DMA support through BAM
> (Bus Access Manager).
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

[...]

> +		qpic_bam: dma-controller@7984000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x07984000 0x0 0x1c000>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			status = "disabled";
> +		};
> +
> +		qpic_nand: spi@79b0000 {
> +			compatible = "qcom,ipq5424-snand", "qcom,ipq9574-snand";
> +			reg = <0x0 0x079b0000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&gcc GCC_QPIC_CLK>,
> +				 <&gcc GCC_QPIC_AHB_CLK>,
> +				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
> +			clock-names = "core", "aon", "iom";

1 a line, please, also below

> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";
> +			status = "disabled";

Is there anything preventing us from enabling both these nodes by
default on all boards (maybe secure configuration or required
regulators)?

Konrad

