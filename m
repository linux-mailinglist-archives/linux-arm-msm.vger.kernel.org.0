Return-Path: <linux-arm-msm+bounces-34732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4459A216F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450B42892FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA611D4609;
	Thu, 17 Oct 2024 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TuDnVNgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D41925B2;
	Thu, 17 Oct 2024 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165907; cv=none; b=SAE4UNVAAjz5W4nOTWh9I4nAxjAm2UmvbV3hGrbyJygd5yWPobNIZyC3IhyfzkWSiH1dz0tb4wcicLAued/6NhuGLUfhHo9NwxlUK8SWz5Uz+E8L5zf5pquEBhhICScjNbIbLYUKdUAJ5RfbIU8EQepzLPhUuIoa0gjXO++LEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165907; c=relaxed/simple;
	bh=inv45XADrsDt1jFABPVX4fZMFQQMPrs5UxK1KmYRdZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nJ2wMfAg0IerS5zJRUOGZRb1P5QNn0JhQbbksf3ueAGr8FLk2IT/Url7sa5DKIMXq2ReGZ/84fpN5aj/oaqWh7CWmTXuQrc4IQcwTHE0L3hYO1LckCtUquYtlfXwPw6TfdT9diPB762wWh45sz70T1yPSSCyqg1S5j20dOUlpLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TuDnVNgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7xIbd020048;
	Thu, 17 Oct 2024 11:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07LEl3QOyvGw3wLHY/eLmcg8dUTTIv1s/tqYJg7zcrc=; b=TuDnVNgNNOEI6W+K
	lpjcve5PwsFVzAlVXzPLHm6DevTGqxYLmgAcDeZ6t4yZ0BntpPLHIjZTPJ5/F84k
	7tOstVBk84cE0QwsYLmofzQQWxcbPZUZRtWgVbyZ/bEqw3F5H/261yaBCRvmuVlF
	Lly/qQj6htyyRLCtdcZ02I+hG8ay8ke4EUTtVKIUxpKxBjgfsGvlFeCytV02WR1/
	w/zaggLLQlrCpv2p9Xho7Y1yEfl2NMEmhwzBD6gG0FjNJmY8vRzqp/Y2H5P1yo5R
	1du6eGE7IeXjC+YPCwHxZng8R7WuRC/YJ/liJFCRRcoj0bu2sWoFerjHNuodAQy7
	aSNj3Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0fg36s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 11:51:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HBpaP7022290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 11:51:36 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 04:51:33 -0700
Message-ID: <32cf828b-91c8-4710-8943-f2d174ada53b@quicinc.com>
Date: Thu, 17 Oct 2024 17:21:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
To: Bjorn Andersson <andersson@kernel.org>
CC: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Ramakrishna
 Gottimukkula" <quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
 <grvdxaiakv62nfom5r5m7zv43xpxfwhxnp7x5byfubbvecfers@pqydhpu7a2vm>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <grvdxaiakv62nfom5r5m7zv43xpxfwhxnp7x5byfubbvecfers@pqydhpu7a2vm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RmnCT6i0ypCqfqcsorFjrrJEuIQB0qQr
X-Proofpoint-ORIG-GUID: RmnCT6i0ypCqfqcsorFjrrJEuIQB0qQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170081



On 10/6/2024 8:05 AM, Bjorn Andersson wrote:
> On Tue, Sep 24, 2024 at 10:39:41AM GMT, Shivnandan Kumar wrote:
>> Add the CPUCP mailbox node required for communication with CPUCP.
> 
> I'd like to see a description of why that's useful...
> 

I will add in next patch set.

> But perhaps more importantly, why are there no user(s) of this?
> 

We will later add features such as BUS DCVS (memlat algorithm in CPUCP) 
and CPUCP logging based on this series.

> Regards,
> Bjorn
> 


>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 3d8410683402..4b9b26a75c62 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -4009,6 +4009,14 @@ gem_noc: interconnect@9100000 {
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>
>> +		cpucp_mbox: mailbox@17430000 {
>> +			compatible = "qcom,sc7280-cpucp-mbox";
>> +			reg = <0 0x18590000 0 0x2000>,
>> +			      <0 0x17C00000 0 0x10>;
>> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
>> +			#mbox-cells = <1>;
>> +		};
>> +
>>   		system-cache-controller@9200000 {
>>   			compatible = "qcom,sc7280-llcc";
>>   			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
>> --
>> 2.25.1
>>

