Return-Path: <linux-arm-msm+bounces-49839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64EA49823
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 12:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF69A189560D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 11:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6748F261365;
	Fri, 28 Feb 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IigT0Kw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8A25D209;
	Fri, 28 Feb 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740741171; cv=none; b=BDSOPzZKa168OQ+mBUBXnmgYKofNSBjWu0/ryhhCYExQ0IMpHi2QY73qmEbXBzBVKFXUJ4CT4SOtnbSf5qIXskHSUL+kFbipI18h2zrsASQhXtE6OCX1uKTKdinoFjxqjNSBqgzNUerQ1a4TgG9Sh3L4hDvpixxfChQ6E1BYg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740741171; c=relaxed/simple;
	bh=uooaO+AYmybIR97lahj04lxe6GYC/8kahQFIIAj4gT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pn59IRSB/hDSL9ilr92zIndKx2LPrxtQZqd0o8+x1HreNYPr9KP4xNTUHfebjH6/+KHFa+SD4yQX/mUBOWQeCtjLDkCpQ/JezJpAlqeky3uK/05LBh1lTurOpwuNPIchFJjgoddJOdNpg56nLFYINazss26OA36z5gEGZi4ZHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IigT0Kw1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXGpW011006;
	Fri, 28 Feb 2025 11:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4glEA5GmIAy9FLor+mvnyGuW3ESRrPbcTI9DSy7jqU=; b=IigT0Kw1RztNdV/q
	T7ElRyGu2lxezGYxe6EFjYr8omqepWwaXhMrC8mCPZzHN9o8vACoc1M6ss1JCVFG
	q9lmfIQyCBKdtiwZW3rx1H7DTb9fhyFVe3hIcmA8KxHzlRuvPD6C9y2bcQNEzMFE
	GGUtk+pWDf+CJpVvKpphOSkpMfybQtCPo92jvjFJRnMghpQ+mAeq7S0NvROn9iJV
	qw6kqLpL2iYnqlFFqBbo6Uw5/38VRhxiydT9F4qjWfye3yHo2AI3c5pYR7UUdRhG
	2/TfNfapwSkI1X/iyGw3ti/YmRG7vmISJaTq4yRhcRmhcgyvU4EmEpNeFNrUYxLV
	9uFb4Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk947a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 11:12:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SBCiIV026781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 11:12:44 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 03:12:41 -0800
Message-ID: <94cba308-4c5c-d968-0a4b-e12ce8784bbf@quicinc.com>
Date: Fri, 28 Feb 2025 16:42:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: ipq9574: Add SPI nand support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
 <20250224113742.2829545-2-quic_mdalam@quicinc.com>
 <6980c805-92b8-4011-af94-a701a8218548@oss.qualcomm.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <6980c805-92b8-4011-af94-a701a8218548@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kINb6u4Y87Tw7EYKfzVXap-MOHCpq_m4
X-Proofpoint-ORIG-GUID: kINb6u4Y87Tw7EYKfzVXap-MOHCpq_m4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_02,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=832 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280080



On 2/25/2025 2:06 AM, Konrad Dybcio wrote:
> On 24.02.2025 12:37 PM, Md Sadre Alam wrote:
>> Add SPI NAND support for ipq9574 SoC.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>> * Moved changes in ipq9574-rdp-common.dtsi to separate patch
>>
>> * Prefixed zero for reg address in qpic_bam and qpic_nand
>>
>> * For full change history, please refer to https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-8-quic_mdalam@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 28 +++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 942290028972..acbcf507adef 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -447,6 +447,34 @@ tcsr: syscon@1937000 {
>>   			reg = <0x01937000 0x21000>;
>>   		};
>>   
>> +		qpic_bam: dma-controller@7984000 {
>> +			compatible = "qcom,bam-v1.7.0";
> 
> v1.7.4
Ok
> 
>> +			reg = <0x07984000 0x1c000>;
>> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
>> +			clock-names = "bam_clk";
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		qpic_nand: spi@79b0000 {
>> +			compatible = "qcom,ipq9574-snand";
>> +			reg = <0x079b0000 0x10000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			clocks = <&gcc GCC_QPIC_CLK>,
>> +				 <&gcc GCC_QPIC_AHB_CLK>,
>> +				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
>> +			clock-names = "core", "aon", "iom";
>> +			dmas = <&qpic_bam 0>,
>> +			       <&qpic_bam 1>,
>> +			       <&qpic_bam 2>;
>> +			dma-names = "tx", "rx", "cmd";
> 
> Please make clock-names & dma-names a vertical list, like clocks and dmas
> and shift the nodes so that they're sorted by address
Ok, will fix and post in next revision.
> 
> Konrad

