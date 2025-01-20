Return-Path: <linux-arm-msm+bounces-45559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A1A168E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 10:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C223188135D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 09:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2EF19CC20;
	Mon, 20 Jan 2025 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fAh7oNwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA319D881;
	Mon, 20 Jan 2025 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364113; cv=none; b=ouP3sCTAlBpecTK8OOOAQUlwYgAJqt62p1xhFBAFcZe0JU+G6T+4U6gN5gFho641dtTm6EM44Natd8FSHjFOuntpBgmNRj01MZ9GkdRkUtiWjnwz+W6P0FEghu9Wjyv5DYAdk9zJ9P0cegMAvB/hkKPrxB8O8Zgv5gR+z7W+Mg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364113; c=relaxed/simple;
	bh=hFB3PSVa/F+n3n//zozwY6R1j2j1kcMrXo7Ds38U9D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=efwbUYX4tUVWIOlWaceeGcGIOlQHCm2TOtpbvA10GruFPr59SxVuaiLtfi7yH0xSd0MR/Rp3X6dXXUFiwhSWpkNn8icrLmYDMDlxDPf8edSeLxMqLRpZ5jFAb0HcZ1et1CIlH3wYDQV9CZqm7BFT+aIJTnK6B/i1WulNIdXibTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fAh7oNwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6gxTe007185;
	Mon, 20 Jan 2025 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+vNN5xoXznfhtWxbNTpB0BOmc+kHjlUL1TlQ4NcoLk=; b=fAh7oNwBtqeKxsr/
	fAGGaGIlv45aqyoUZ1uuLXsvMK6RLqfuK0MmO+v6SbdHOqcx1APVSidPeZYptY3w
	+VVmvRBKOJpjaB3LKJwz5s9Lp41AQLP0iRLs8cdtfuf4quDBvapyyPVmk7zokJhR
	VAv+66oTnyyGc46nBmVxXdreukpthVekIeQqq+3eE5SCkj5tHYxWs3UxiVLHW22O
	KEofz6aBebzUOuZVQvWlfvuMlkIIsClv4+9HH8PMo+ZALonRKj3+Em8VFaqRTv0+
	eFMgVlCiNS/n2e2FLAHBGFc5W1k5PuNzmzwq/qUIbstcXJ1lP9Mb1ucgBP6HAYtz
	WWcQ6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hfb0b61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:07:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K97sMP024218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:07:54 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 01:07:48 -0800
Message-ID: <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
Date: Mon, 20 Jan 2025 17:07:44 +0800
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
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NP9eBnT9zEvKqkraLR4B_uiSrrYEmpmo
X-Proofpoint-ORIG-GUID: NP9eBnT9zEvKqkraLR4B_uiSrrYEmpmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=615 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200075



On 2025-01-08 21:29, Andrew Lunn wrote:
>>> Why is it specific to this board? Does the board have a PHY which is
>>> broken and requires this property? What we are missing are the details
>>> needed to help you get to the correct way to solve the problem you are
>>> facing.
>>>
>>
>> Let me clarify why this bit is necessary and why it's board-specific. The RX
>> programming swap bit can introduce a time delay of half a clock cycle. This
>> bit, along with the clock delay adjustment functionality, is implemented by
>> a module called 'IO Macro.' This is a Qualcomm-specific hardware design
>> located between the MAC and PHY in the SoC, serving the RGMII interface. The
>> bit works in conjunction with delay adjustment to meet the sampling
>> requirements. The sampling of RX data is also handled by this module.
>>
>> During the board design stage, the RGMII requirements may not have been
>> strictly followed, leading to uncertainty in the relationship between the
>> clock and data waveforms when they reach the IO Macro.
> 
> So this indicates any board might need this feature, not just this one
> board. Putting the board name in the driver then does not scale.
> 

Should I ignore this if I choose to use the following standard properties?

>> This means the time
>> delay introduced by the PC board may not be zero. Therefore, it's necessary
>> for software developers to tune both the RX programming swap bit and the
>> delay to ensure correct sampling.
> 
> O.K. Now look at how other boards tune their delays. There are
> standard properties for this:
> 
>          rx-internal-delay-ps:
>            description:
>              RGMII Receive Clock Delay defined in pico seconds. This is used for
>              controllers that have configurable RX internal delays. If this
>              property is present then the MAC applies the RX delay.
>          tx-internal-delay-ps:
>            description:
>              RGMII Transmit Clock Delay defined in pico seconds. This is used for
>              controllers that have configurable TX internal delays. If this
>              property is present then the MAC applies the TX delay.
> 
> I think you can use these properties, maybe with an additional comment
> in the binding. RGMII running at 1G has a clock of 125MHz. That is a
> period of 8ns. So a half clock cycle delay is then 4ns.
> 
> So an rx-internal-delay-ps of 0-2000 means this clock invert should be
> disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
> should be enabled.

This board was designed to operate at different speed rates, not a fixed 
speed, and the clock rate varies for each speed. Thus, the delay 
introduced by inverting the clock is not fixed. Additionally, I noticed 
that some vendors apply the same routine for this property across all 
speeds in their driver code. Can this property be used just as a flag, 
regardless of its actual value?

> 
> Now, ideally, you want the PHY to add the RGMII delays, that is what i
> request all MAC/PHY pairs do, so we have a uniform setup across all
> boards. So unless the PHY does not support RGMII delays, you would
> expect rx-internal-delay-ps to be either just a small number of
> picoseconds for fine tuning, or a small number of picoseconds + 4ns
> for fine tuning.

The delay for both TX and RX sides is added by the MAC in the Qualcomm 
driver, which was introduced by the initial patch. I believe there may 
be a refactor in the future to ensure it follows the requirements.

> 
> This scales, since it can be used by an board with poor design, and it
> does not require anything proprietary to Qualcomm, except the extended
> range, and hopefully nobody except Qualcomms broken RDK will require
> it, because obviously you will document the issue with the RDK and
> tell customers how to correctly design their board to be RGMII
> compliant with the clocks.

Yes, I will make a note of it.

> 
> 	Andrew

-- 
Best Regards,
Yijie


