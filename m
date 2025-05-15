Return-Path: <linux-arm-msm+bounces-58071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEADAB8AA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8501BC20B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9EA2135DE;
	Thu, 15 May 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMlwYp/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF81B0F0A;
	Thu, 15 May 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322873; cv=none; b=ikL/6byBapW6zTZDMLcz5zDtnDIaZ0JSile8vzSNMkchqnJ6mV2JEBIrs16TbZmukqdMbAcYe//9ny23HiY+ujzLPMAsJ0ZesR8c74i6XrbDqdFnGVsayXotiBA8SKz/HB/1co6LrdxmSC4k8gKoum5Eqg7iyPBUqPdw93ropJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322873; c=relaxed/simple;
	bh=AFbnl7iYsM77tJmnhgspgeDkTh7qRrF2v/z+OZ2pDeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ia8LDYX+dBw+8AQS9Su/IWMdeSEGQuaPcxDOjT46ZDefsboLWJkNJbkxDAxwsbdsXj5u3WNiAwVJ4j8xBExQzst3BIDykqn3X6AbFtF7YNewWWqr9BMu4PnhgO7+dJhuSokSpmZv27lqLmXYe5jVCMJjrJtT+xGqYlKWbohkCH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMlwYp/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDd2007863;
	Thu, 15 May 2025 15:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEiNqRk+4l+7/so1goaUJ3FoRd+3YgzIy7HdtwFsmw4=; b=hMlwYp/DVXPnxZa5
	rFHdzdwblaRKN2aLoaOFTqBSwJC39g+Y6pPuHPrhiCalyp530XmZNEqq5Vm6CJpT
	NP9RXPLWdkLB+yOpleZE+c9dEcBmFJxh49T5P0w1nGIrTNsNDzcgMniFdUVhu6iX
	w/o5u2H7MiJ6qaWNgX9H6DqSFtph7C1Ph99QjMrh9J0/eiE/0hi0/GZGMd1eVKbs
	kAvlGCexPoINekbEHPryngQVWcUW4N6gy6ssP2pIP5OeexXhoyBFW7GbghVndZMe
	Z65g95CCpVd3Elt3w00LN6b40qpoSxZdztdusQ42b6TNZLGfhe+wBzE0WJNFtgBr
	qj7kjQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxmup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:27:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FFRPre030967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:27:25 GMT
Received: from [10.253.35.32] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 08:27:20 -0700
Message-ID: <df2fa427-00d9-4d74-adec-c81feda69df5@quicinc.com>
Date: Thu, 15 May 2025 23:27:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: Alex G. <mr.nuke.me@gmail.com>,
        "Russell King (Oracle)"
	<linux@armlinux.org.uk>,
        Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org> <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
 <0c1a0dbd-fd24-40d7-bec9-c81583be1081@gmail.com>
 <c6a78dd6-763c-41a0-8a6e-2e81723412be@quicinc.com>
 <62c98d4f-8f02-43cc-8af6-99edfa5f6c88@gmail.com>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <62c98d4f-8f02-43cc-8af6-99edfa5f6c88@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UqakDml6aQ4XoY6IhAoSuWfsV6OqauvR
X-Proofpoint-ORIG-GUID: UqakDml6aQ4XoY6IhAoSuWfsV6OqauvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1MyBTYWx0ZWRfX7uzuokqVX0lJ
 y0IMG7IAC2Ee4BbI9vxh5fG/jO8ruTGJ7DLSaNyrdbtiv6AO0pNDsDNEu6MoaitoNVB+CiuY3hV
 kJH3mstX6JVCyqo0t6e8F21q0xz1lQE1TP1R5M90pdxKXVEYWp+xEqtvaUDcKJtj3cgOwwkdTrk
 txTq4eisPDV+GjsG3e1ySvmEFJ92Ja5POz3lZsrVoseOJFqOAMPS9M7EVcob1cAEA0KsK9xkYos
 Co5hXEnjLEMHqkrExg+JgxEEmeZTQRk3FR8biQDh6lJGmlb9BeiIh+ZLQ/NJgRChvP76P3qrZKO
 PTo3U0A0WTdyCgTr1VODn18iI0EUJGUmstMj/ROS7aIk/VsDURF/ar+mSOKbQzkcgAMnwD4F2k1
 o8w9qM7kyYsPn25SRe6CPKXtXrzm3kEj1LFHVWQBtNu3UGZJwVWDxeu8IKNv8nZrSVOKJcMv
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682607df cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=qEwB1NL6JPeVh4UoWnIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150153



On 5/15/2025 10:32 AM, Alex G. wrote:
> On 5/14/25 11:03, Lei Wei wrote:> On 5/13/2025 6:56 AM, 
> mr.nuke.me@gmail.com wrote:
>>> On 2/19/25 4:46 AM, Lei Wei wrote:
>>>
>>> I tried this PCS driver, and I am seeing a circular dependency in the 
>>> clock init. If the clock tree is:
>>>      GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)
>>>
>>> The way I understand it, the UNIPHY probe depends on the MII probe. 
>>> If MII .probe() returns -EPROBE_DEFER, then so will the 
>>> UNIPHY .probe(). But the MII cannot probe until the UNIPHY is done, 
>>> due to the clock dependency. How is it supposed to work?
>>>
>>> The way I found to resolve this is to move the probing of the MII 
>>> clocks to ipq_pcs_get().
>>>
>>> This is the kernel log that I see:
>>>
>>> [   12.008754] platform 39b00000.clock-controller: deferred probe 
>>> pending: platform: supplier 7a00000.ethernet-pcs not ready
>>> [   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
>>> mdio_bus: supplier 7a20000.ethernet-pcs not ready
>>> [   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>> [   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>> [   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>> [   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>> [   12.057579] platform 7a00000.ethernet-pcs: deferred probe pending: 
>>> ipq9574_pcs: Failed to get MII 0 RX clock
>>> [   12.067209] platform 7a20000.ethernet-pcs: deferred probe pending: 
>>> ipq9574_pcs: Failed to get MII 0 RX clock
>>> [   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
>>> platform: supplier 39b00000.clock-controller not ready
>>>
>>>
>>
>> Hello, thanks for bringing this to our notice. Let me try to 
>> understand the reason for the probe failure:
>>
>> The merged NSSCC DTS does not reference the PCS node directly in the 
>> "clocks" property. It uses a placeholder phandle '<0>' for the 
>> reference. Please see below patch which is merged.
>> https://lore.kernel.org/all/20250313110359.242491-6- 
>> quic_mmanikan@quicinc.com/
>>
>> Ideally there should be no direct dependency from NSSCC to PCS driver if
>> we use this version of the NSSCC DTS.
>>
>> Hence it seems that you may have a modified patch here, and DTS 
>> changes have been applied to enable all the Ethernet components 
>> including PCS and NSSCC, and NSSCC modified to have a direct reference 
>> to PCS? However even in this case, I think the driver probe should 
>> work if the drivers are built as modules. Can you please confirm if 
>> the NSSCC and PCS drivers are built-in to the kernel and not built as 
>> modules
> 
> The NSSCC and PCS built-in. I also added the uniphy PCS clocks to the 
> NSSCC in order to expose the issue.
> 
> I have a heavily patched tree with PPE driver and EDMA support. That's 
> the final use case in order to support ethernet, right?
> 

Yes, all the drivers are eventually for enabling the Ethernet function
on IPQ9574.

> 
>> For the case where the drivers are built-in to kernel, and the NSSCC DTS
>> node has a direct reference to PCS node, we can use the below solution:
>> [Note that the 'UNIPHY' PCS clocks are not needed for NSSCC clocks
>> initialization/registration.]
>>
>>      Enable 'post-init-providers' property in the NSSCC DTS node to mark
>>     'UNIPHY' PCS as post-initialization providers to NSSCC. This will
>>      ensure following probe order by the kernel:
>>
>>      1.) NSSCC driver
>>      2.) PCS driver.
>>
>> Please let me know if the above suggestion can help.
> 
> I see. Adding the 'post-init-providers' property does fix the circular 
> dependency. Thank you!
> 
> I have another question. Do you have a public repository with the 
> unmerged IPQ9574 patches, including, PCS, PPE, EDMA, QCA8084 ?
> 

May I know the source of your PPE/EDMA changes using which this issue
is seen?

The openwrt repository contains the unmerged IPQ9574 patches, Although
this version will be updated very soon with latest code(with some 
fixes), the version of the code in the repo currently is also functional 
and tested.

https://github.com/CodeLinaro/openwrt/tree/main/target/linux/qualcommbe/patches-6.6

> 
>> Later once the IPQ PCS driver is merged, we are planning to push the 
>> PCS DTS changes, along with an update of the NSSCC DTS to point to the 
>> PCS node and mark the "post-init-providers" property. This should work 
>> for all cases.
>>
>> Also, in my view, it is not suitable to move PCS MII clocks get to
>> "ipq_pcs_get()" because the natural loading order for the drivers
>> is as below:
>>
>> 1) NSSCC driver
>> 2) PCS driver
>> 3) Ethernet driver.
>>
>> Additionally, the community is currently working on an infrastructure to
>> provide a common pcs get method. (Christian and Sean Anderson has been 
>> working on this). Therefore, I expect "ipq_pcs_get" to be dropped in 
>> the future and replaced with the common pcs get method once this 
>> common infra is merged.
> 
> That makes sense. Thank you for clarifying.


