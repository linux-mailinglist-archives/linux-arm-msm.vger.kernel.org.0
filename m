Return-Path: <linux-arm-msm+bounces-45649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07862A17869
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 08:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA941882377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 07:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AB719E968;
	Tue, 21 Jan 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IoJjSj3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D42166307;
	Tue, 21 Jan 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443629; cv=none; b=ji+xHdRssWUlpOOFtNQtbduDqOutgjNOI1IuRrPJv4iAMj8dB6TPmaP2dL4aOvgkC6vaJCu/vgNOZmle3ZmEkPRiw4JCU/X0Sz1pnDbtknyaSdkTkM2vjggXl1QGKQ4Rm3IBSKfUPu7eyhKRo+eAl1TS40jvhyhllHa1FXpC/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443629; c=relaxed/simple;
	bh=mA94EdZ03v/4HtT0ZOl7yem04cyRmWUPj4XhtYRU6jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ILFNMSlnWjwcITzyhPxbsxTxTclK1uCj0cnAH7tD7OvHxjVTMs4idjNklFTfXoiiC/ZhTdlXzp2fpjvRbCmXZN6VFnJA2iT2c0ffzKsF0roC0kgEi1wb3YI7zt3J+1yErCQzRmqKVOFUu4ZDRoLsJXmfnv/bitRDuKAFRDSR2LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IoJjSj3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L2JZXI017914;
	Tue, 21 Jan 2025 07:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+Vn0Ug9JU6+clTGINvG6sBhseUNjSaHZCPTnYRIKIw=; b=IoJjSj3zrOU02YeI
	dSNgmNDsNogNAMS/SojlXXaRsMw0X5DSNXiFTSSWojA7F9EcbpYRMO9JhO1mSemE
	dg8loPFmstJmsoDOoAlYlOeWv4NUc6CEk8hR1j2EwSm2Ey7RztNSP47CDrZzxPIR
	+xUigfFBqIBP4Fy8BxfxiNzLDP2m9gN2xLDl1OqHE0Fnc2+UIKYMnmzp+BCiFyqV
	dygKDyhZyArXiH2fyFO4flZCSMnAA7SYBOIljC5C7TiVAsQM54vTLRz+E6hN5ftv
	a0IxHuHurJqdGBLBGsV/zSsmeKJSTy6Wc7tEQE/8TooM/S89XLgeqZrwg2Bvq9T3
	BIK2Rw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2pugkjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:13:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7DKPc031133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:13:20 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 23:13:14 -0800
Message-ID: <89d4df79-a202-407a-bcfd-6af5315c403c@quicinc.com>
Date: Tue, 21 Jan 2025 15:13:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
 <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
 <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GvL8wDOpkugmdU1D06R9_Tiw5YRakzH9
X-Proofpoint-GUID: GvL8wDOpkugmdU1D06R9_Tiw5YRakzH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_03,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=886 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210058



On 2025-01-21 00:49, Andrew Lunn wrote:
>>> So this indicates any board might need this feature, not just this one
>>> board. Putting the board name in the driver then does not scale.
>>>
>>
>> Should I ignore this if I choose to use the following standard properties?
> 
> You should always follow standard properties unless they don't
> work. And if they don't work, your commit message needs to explain why
> they don't work forcing your to do something special.
> 
>>>> This means the time
>>>> delay introduced by the PC board may not be zero. Therefore, it's necessary
>>>> for software developers to tune both the RX programming swap bit and the
>>>> delay to ensure correct sampling.
>>>
>>> O.K. Now look at how other boards tune their delays. There are
>>> standard properties for this:
>>>
>>>           rx-internal-delay-ps:
>>>             description:
>>>               RGMII Receive Clock Delay defined in pico seconds. This is used for
>>>               controllers that have configurable RX internal delays. If this
>>>               property is present then the MAC applies the RX delay.
>>>           tx-internal-delay-ps:
>>>             description:
>>>               RGMII Transmit Clock Delay defined in pico seconds. This is used for
>>>               controllers that have configurable TX internal delays. If this
>>>               property is present then the MAC applies the TX delay.
>>>
>>> I think you can use these properties, maybe with an additional comment
>>> in the binding. RGMII running at 1G has a clock of 125MHz. That is a
>>> period of 8ns. So a half clock cycle delay is then 4ns.
>>>
>>> So an rx-internal-delay-ps of 0-2000 means this clock invert should be
>>> disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
>>> should be enabled.
>>
>> This board was designed to operate at different speed rates, not a fixed
>> speed, and the clock rate varies for each speed. Thus, the delay introduced
>> by inverting the clock is not fixed. Additionally, I noticed that some
>> vendors apply the same routine for this property across all speeds in their
>> driver code. Can this property be used just as a flag, regardless of its
>> actual value?
> 
> Maybe you should go read the RGMII standard, and then think about how
> your hardware actually works.
> 
> RGMII always has a variable clock, with different clock speeds for
> 10/100/1G. So your board design is just plain normal, not
> special. Does the standard talk about different delays for different
> speeds? As you say, other drivers apply the same delay for all
> speeds. Why should your hardware be special?
> 
> RGMII has been around for 25 years. Do you really think your RGMII
> implementation needs something special which no other implementation
> has needed in the last 25 years?

I do not intend to violate the regulations of the RGMII standard and aim 
to maintain the same delay across all speeds. But the RX programming 
swap bit can only introduce a delay of 180 degrees. Should I assume the 
1G speed clock to calculate and determine if this bit should be enabled 
for all speeds?

> 
>>> Now, ideally, you want the PHY to add the RGMII delays, that is what i
>>> request all MAC/PHY pairs do, so we have a uniform setup across all
>>> boards. So unless the PHY does not support RGMII delays, you would
>>> expect rx-internal-delay-ps to be either just a small number of
>>> picoseconds for fine tuning, or a small number of picoseconds + 4ns
>>> for fine tuning.
>>
>> The delay for both TX and RX sides is added by the MAC in the Qualcomm
>> driver, which was introduced by the initial patch. I believe there may be a
>> refactor in the future to ensure it follows the requirements.
>   
> You can do it in the MAC. But you probably want to clearly document
> this, that your design is different to > 95% of systems in Linux which
> have the PHY do the delays.
> 
> 	Andrew

-- 
Best Regards,
Yijie


