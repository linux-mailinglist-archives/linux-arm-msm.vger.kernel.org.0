Return-Path: <linux-arm-msm+bounces-49840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E622A49828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5758A189569C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 11:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD11A26136B;
	Fri, 28 Feb 2025 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KIO0uu2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17344260A55;
	Fri, 28 Feb 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740741210; cv=none; b=X3OTLrzHHh7S/2u4N+qWgrm59AzITTNwEfzlIi84JleC7F+7/tZppM59q1qNTQvaIO2gQsbv3TyE5vpJmOO7Db/naU4i9T6xa/IdINdugDemR48ctjTxKS1nEP3LIWYb4TpdZVdYLv5EZc7WL3BQ5B0Qh/JlgMZOeOnW1M/Mh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740741210; c=relaxed/simple;
	bh=tU3ESWBJdJHFgQ9EMSUOom4KFt2zjDy3dIsf+0Q0N14=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IaHdqm/9rIjftY/WUnugNRCmRz7EiKxQiVM/wU9UFbyQ6LLEapsmvghGnhx60OQi2CkfuTToPRC0dAbUOU64BV7SuLUhRY6XLyif0Q/W3wsVXHhS0xZ0H0RqnvYf93m2iglTFAEGwe6eynSumoddNXlKRhXadzgPhqY83oUBQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KIO0uu2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXKgB031086;
	Fri, 28 Feb 2025 11:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+kfSnLgY5Wy5Nt9p7BHAeYDz9i9387LV7FAwpC/7gY=; b=KIO0uu2cqLAsmud5
	vr5r2VHQi4VBQHiKR3ZgJEcQIGxjc/V29IxHbiAnXhu20uizsWwBkFL3FK0ULSex
	RrCR7uHUWVh5qeWB3MJ/LTs1xxo+zBkgFdVo/6Jv1aL4jcixfcPJOB0AcWTkKexM
	+qPi6Z+0gc16rlQYucXShc2sR0luungMyaGngcw+4e3DO0AYCDb8YipopsRTYs5o
	OMFHAbum8myYJ7WgCgUPKwYdnlZUpXlNX4aFO0Qusj+LOfY+44HdxQfwfozwNo4G
	gz3gTDn9Kat0cK8XVGjzeTrKBX35wq2pkXrLzb6t3dre/6ILC5dGTuuyHAiaRuf9
	RxVD1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prms1tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 11:13:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SBDOEi011059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 11:13:24 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 03:13:21 -0800
Message-ID: <eae1f6a4-a407-98ce-7c45-2cdf27af3ef3@quicinc.com>
Date: Fri, 28 Feb 2025 16:43:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: ipq9574: Enable SPI NAND for
 ipq9574
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
 <20250224113742.2829545-3-quic_mdalam@quicinc.com>
 <51ceb7ae-0dbe-4585-a955-e84bcde6c8f9@oss.qualcomm.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <51ceb7ae-0dbe-4585-a955-e84bcde6c8f9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2HRbun5o0aoiCrMImaDlrqOWVWPXtCY8
X-Proofpoint-ORIG-GUID: 2HRbun5o0aoiCrMImaDlrqOWVWPXtCY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_02,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=836
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502280080



On 2/25/2025 2:06 AM, Konrad Dybcio wrote:
> On 24.02.2025 12:37 PM, Md Sadre Alam wrote:
>> Enable SPI NAND support for ipq9574 SoC.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>> * Moved out ipq9574-rdp-common.dtsi changes into this patch from
>>    previous patch
>> ---
>>   .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index ae12f069f26f..6d1e84301671 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -139,6 +139,49 @@ gpio_leds_default: gpio-leds-default-state {
>>   		drive-strength = <8>;
>>   		bias-pull-up;
>>   	};
>> +
>> +	qpic_snand_default_state: qpic-snand-default-state {
>> +		clock-pins {
>> +			pins = "gpio5";
>> +			function = "qspi_clk";
>> +			drive-strength = <8>;
>> +			bias-disable;
>> +		};
>> +
>> +		cs-pins {
>> +			pins = "gpio4";
>> +			function = "qspi_cs";
>> +			drive-strength = <8>;
>> +			bias-disable;
>> +		};
>> +
>> +		data-pins {
>> +			pins = "gpio0", "gpio1", "gpio2", "gpio3";
>> +			function = "qspi_data";
>> +			drive-strength = <8>;
>> +			bias-disable;
>> +		};
>> +	};
>> +};
>> +
>> +&qpic_bam {
>> +	status = "okay";
>> +};
>> +
>> +&qpic_nand {
>> +	pinctrl-0 = <&qpic_snand_default_state>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
> 
> Please add a newline before status
Ok, will do in next revision.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

