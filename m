Return-Path: <linux-arm-msm+bounces-51592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0711A64714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 10:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3167A16AD01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 09:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2169821D3DF;
	Mon, 17 Mar 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="etk2tHo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3E221540;
	Mon, 17 Mar 2025 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203374; cv=none; b=mA2HPGk95TrByNtQozAlkUp6dZfUAxdNCbLwSKYkOil+2jVwSU30nIWzKCEQhNzBRYInLMEkVXhoBmRV8fDNST0ufZxu1ambeMNA7he9VS18Pan63Qf/jaNBnf7i9HPV/YjepCEpvzjFHW3kHycfXAPqZqp35ZhPXyrXUb85tR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203374; c=relaxed/simple;
	bh=WwqRo4Rn7rEhs3itYeIlnsJWkBlj136JMQ4Q4PGyZVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YcjTexSIzdWX61eTKpj073pEKj+yisnrSSf54M2SmAFgvtWcc6TRiWI2mNNIkyOgcYp6lSJ8871XUspcCjYVp9bokqDDd4jk6HSRqOIFn1onuM0BMTKB0U83XsRzQ8Ghmt1g6goemdX6Le+OOZWyluwjdcsVtxjLlRDLvENwRPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=etk2tHo0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H0To6h022723;
	Mon, 17 Mar 2025 09:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ciq3E2J8gZcfsBrXRmTg7dip/MJPjpBOViIXCSBzh0=; b=etk2tHo0qcDbk48a
	ETn9yORn/s8p4FTJnrgFM+C1wh2v8GnYpZQMjcPBCZwdyLP+I9ULzYQb3KMLTZ0H
	Ry0/J7IhghQZjpXZh9khoWxGY4rzatVLVNYPY+L6t7dGbnIaqHUetqABKBRrfCri
	lbywiF6J7urrWNSRXfQbMEH+SycS79TpcfOxViKKrjE3t42IitM7x1fjJSRSGt+x
	xd3970BFRbZVNrd5iR9U8CUrosswKK7nj4SBoa7ctIsuGOAZMBh0Owi3LI8hUJbC
	DASQ4dYgjHE63orCrEZKxWTMPFE+SHxfMMI3VkFh7Ll6yMC8wGTtZol9OpAuJGsb
	Qfg6Xg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r1440t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 09:22:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H9Mldr020485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 09:22:47 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Mar
 2025 02:22:43 -0700
Message-ID: <a1cbab24-d931-4946-ba58-4c37f0bb9cc0@quicinc.com>
Date: Mon, 17 Mar 2025 14:52:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: fix and relocate uart1 gpio
 configurations
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
References: <20250312091418.3265352-1-quic_mmanikan@quicinc.com>
 <8efdc560-d061-4f03-bed5-8571044119cc@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <8efdc560-d061-4f03-bed5-8571044119cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d7e9e8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=5MmNdGAJjUIhlSV6Oz8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNJfs_13QIiYcIrPbywa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Dg2oimBU9dGSoakBt7E_wkNcSyVfrxX8
X-Proofpoint-ORIG-GUID: Dg2oimBU9dGSoakBt7E_wkNcSyVfrxX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_03,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=770
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170068



On 3/12/2025 10:10 PM, Kathiravan Thirumoorthy wrote:
> On 3/12/2025 2:44 PM, Manikanta Mylavarapu wrote:
>> Update the bias configuration for UART1 TX and RX pins to ensure correct
>> settings for RDP466.
>>
>> Additionally, move the UART1 GPIO configurations from the common .dtsi
>> file to the RDP-specific .dts files to account for differing bias
>> configurations across RDPs of IPQ5424.
>>
>> Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 16 +++++++++++++++-
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  7 -------
>>   2 files changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index b6e4bb3328b3..7b85aaa11ee8 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -147,10 +147,24 @@ data-pins {
>>               bias-pull-up;
>>           };
>>       };
>> +
>> +    uart1_tx_state: uart1-tx-state {
>> +        pins = "gpio44";
>> +        function = "uart1";
>> +        drive-strength = <8>;
>> +        bias-pull-down;
>> +    };
>> +
>> +    uart1_rx_state: uart1-rx-state {
>> +        pins = "gpio43";
>> +        function = "uart1";
>> +        drive-strength = <8>;
>> +        bias-pull-up;
>> +    };
>>   };
>>     &uart1 {
>> -    pinctrl-0 = <&uart1_pins>;
>> +    pinctrl-0 = <&uart1_tx_state>, <&uart1_rx_state>;
> 
> 
> Change LGTM. But can we define both TX and RX pin definition under one node like below, to align with the SPI and SDCC gpio definition layout?
> 
> qup_uart1_default_state: qup-uart1-default-state {
> 
>         uart1_tx_state: uart1-tx-state {
> 
>          ...
> 
>         };
> 
>         uart1_rx_state: uart1-rx-state {
> 
>          ...
> 
>         };
> 
> };
> 
> and refer it like pinctrl-0 = <&qup_uart1_default_state>;
> 
> 

Hi Kathir,

	Thank you for reviewing the patch.
	I will incorporate the suggested change in the next version.

Thanks & Regards,
Manikanta.

