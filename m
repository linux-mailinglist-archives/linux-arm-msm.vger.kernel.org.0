Return-Path: <linux-arm-msm+bounces-58204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AAAB9AD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE7250225E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DD4230BDB;
	Fri, 16 May 2025 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GJU0Mw3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0281288DA;
	Fri, 16 May 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394324; cv=none; b=TyDnTKSKmTR3oWjq4TrdevLNHG4Ltzr/uZ8AfHIZZGhk6scBh30oOZ8DXtPKZTlp9RjictTK3m4HfgBAfY5dKhAzVsoAtTNNpk7Y3HPUj0p5ZhtK7u3HtS4JHEqVaUnrsOt4EgFue50CHpCdJUu9WnQWmZGcG0ZaYBl8yUuN/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394324; c=relaxed/simple;
	bh=Z6ix2AobmqPSTyYspV+r9Ykk1K6VOdLVqiA4ZaQNw4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gODO9BkcN+bExTIvTtNTkXe2G76I8sumcSL7xpQ9J7XKS/eF76YIVeyJ1gg6mXxYLP6FSADTiavp2FBH5nXcgO4tRuversC4LiCaRCuRCq1RmNzedC2LSCbFpqBahYXApuenhfdBuN/xvqZDzIFz/OiathWYu3Vsn92ZBZv3t6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GJU0Mw3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3ZFU5014464;
	Fri, 16 May 2025 11:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zs8WGsYXClyT002JkjXgz6mVO9bx4X9BuJeaUjLHDcA=; b=GJU0Mw3dp7ivwKjd
	03j37FKLL7IBI9TxUZzTgzhLt/OhNLJVeuoynqdYsxQrGLXB3XbT6ws8GzKhkv1+
	GY2RX29yiTtG3yvEZNYhv8zmeQpz0Alm6cKmpOFs4QUXuQSXUeitec3dcWhpIHIc
	fqCcCsiGqM/6m3bhI+hT/Cur1ow0A2vP7MK0LGJmQbawdncKF6yDrwGDn5H3wQQk
	X+a6Z+owadqEftP6QBmb6UvLqGydkugTrQJHO2fMaK8UFC5skbPJcwtvvKk/ekbn
	ITWVWqhDFfX+QNMfTWXMmJCO0gaTNBCgc9QW3OVbggbUuzLs8vtCvxZTobkX2nhZ
	rmOz1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcphvgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:18:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GBIN5p026069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:18:23 GMT
Received: from [10.253.35.32] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 04:18:18 -0700
Message-ID: <582a87e0-ed91-452e-8acf-eeff79990802@quicinc.com>
Date: Fri, 16 May 2025 19:18:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
To: <mr.nuke.me@gmail.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
 <df2fa427-00d9-4d74-adec-c81feda69df5@quicinc.com>
 <be7f0fda-ac21-4f94-a6cf-b4c3ca59630a@gmail.com>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <be7f0fda-ac21-4f94-a6cf-b4c3ca59630a@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3HYvdMJmqexQwJIflig_w5gep5NqMpfU
X-Proofpoint-ORIG-GUID: 3HYvdMJmqexQwJIflig_w5gep5NqMpfU
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68271f00 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=mI-91yCrK8bXjQCpjj0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNyBTYWx0ZWRfXwAPMj1GnZuSc
 uvIe7qO3WJYHNH43U8cE3YRvkx+mcYBuNmr0bS1lo2CXbz1LTZNG3oDbcoxrWFO+np5EU2F2hBU
 KE59MH2l1xFTmn/yFd7fDCUaKW/x7kzcMZfxNzkzOjdUqRnLW5KJXfNxr3Zn/3iKIedgi2+TNQG
 rNktdj7/NAraehAvf5ojVnkJQyJofaEHE3dqbrzQUrXM2bjeoc2TlgY/r4ySYMDicBcCzshV/0Z
 7wbuUWU94SElXotpSdemShIAK2Mf0lk37n7eHZdXfq7egRoJYCWDJf2a6NrmrNLpXzjQ3BxozKs
 DYhr850hnrcxyXSJVW7BXG5FygpEwHBlWXodmJUUMbaPZr6sSfaeBzKJLbn2CDRyygu+fv8izLm
 jpvfZynT28J3X9HpL/oUV9bRvebb1wEi7LpbVcBGIUnZA7G0ynpivzVx86cQyb/SJOlDbvED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160107



On 5/16/2025 9:40 AM, mr.nuke.me@gmail.com wrote:
> On 5/15/25 10:27 AM, Lei Wei wrote:
>>
>>
>> On 5/15/2025 10:32 AM, Alex G. wrote:
>>> On 5/14/25 11:03, Lei Wei wrote:> On 5/13/2025 6:56 AM, 
>>> mr.nuke.me@gmail.com wrote:
>>>>> On 2/19/25 4:46 AM, Lei Wei wrote:
>>>>>
>>>>> I tried this PCS driver, and I am seeing a circular dependency in 
>>>>> the clock init. If the clock tree is:
>>>>>      GCC -> NSSCC -> PCS(uniphy) -> NSSCC -> PCS(mii)
>>>>>
>>>>> The way I understand it, the UNIPHY probe depends on the MII probe. 
>>>>> If MII .probe() returns -EPROBE_DEFER, then so will the 
>>>>> UNIPHY .probe(). But the MII cannot probe until the UNIPHY is done, 
>>>>> due to the clock dependency. How is it supposed to work?
>>>>>
>>>>> The way I found to resolve this is to move the probing of the MII 
>>>>> clocks to ipq_pcs_get().
>>>>>
>>>>> This is the kernel log that I see:
>>>>>
>>>>> [   12.008754] platform 39b00000.clock-controller: deferred probe 
>>>>> pending: platform: supplier 7a00000.ethernet-pcs not ready
>>>>> [   12.008788] mdio_bus 90000.mdio-1:18: deferred probe pending: 
>>>>> mdio_bus: supplier 7a20000.ethernet-pcs not ready
>>>>> [   12.018704] mdio_bus 90000.mdio-1:00: deferred probe pending: 
>>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>>> [   12.028588] mdio_bus 90000.mdio-1:01: deferred probe pending: 
>>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>>> [   12.038310] mdio_bus 90000.mdio-1:02: deferred probe pending: 
>>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>>> [   12.047943] mdio_bus 90000.mdio-1:03: deferred probe pending: 
>>>>> mdio_bus: supplier 90000.mdio-1:18 not ready
>>>>> [   12.057579] platform 7a00000.ethernet-pcs: deferred probe 
>>>>> pending: ipq9574_pcs: Failed to get MII 0 RX clock
>>>>> [   12.067209] platform 7a20000.ethernet-pcs: deferred probe 
>>>>> pending: ipq9574_pcs: Failed to get MII 0 RX clock
>>>>> [   12.077200] platform 3a000000.qcom-ppe: deferred probe pending: 
>>>>> platform: supplier 39b00000.clock-controller not ready
>>>>>
>>>>>
>>>>
>>>> Hello, thanks for bringing this to our notice. Let me try to 
>>>> understand the reason for the probe failure:
>>>>
>>>> The merged NSSCC DTS does not reference the PCS node directly in the 
>>>> "clocks" property. It uses a placeholder phandle '<0>' for the 
>>>> reference. Please see below patch which is merged.
>>>> https://lore.kernel.org/all/20250313110359.242491-6- 
>>>> quic_mmanikan@quicinc.com/
>>>>
>>>> Ideally there should be no direct dependency from NSSCC to PCS 
>>>> driver if
>>>> we use this version of the NSSCC DTS.
>>>>
>>>> Hence it seems that you may have a modified patch here, and DTS 
>>>> changes have been applied to enable all the Ethernet components 
>>>> including PCS and NSSCC, and NSSCC modified to have a direct 
>>>> reference to PCS? However even in this case, I think the driver 
>>>> probe should work if the drivers are built as modules. Can you 
>>>> please confirm if the NSSCC and PCS drivers are built-in to the 
>>>> kernel and not built as modules
>>>
>>> The NSSCC and PCS built-in. I also added the uniphy PCS clocks to the 
>>> NSSCC in order to expose the issue.
>>>
>>> I have a heavily patched tree with PPE driver and EDMA support. 
>>> That's the final use case in order to support ethernet, right?
>>>
>>
>> Yes, all the drivers are eventually for enabling the Ethernet function
>> on IPQ9574.
>>
>>>
>>>> For the case where the drivers are built-in to kernel, and the NSSCC 
>>>> DTS
>>>> node has a direct reference to PCS node, we can use the below solution:
>>>> [Note that the 'UNIPHY' PCS clocks are not needed for NSSCC clocks
>>>> initialization/registration.]
>>>>
>>>>      Enable 'post-init-providers' property in the NSSCC DTS node to 
>>>> mark
>>>>     'UNIPHY' PCS as post-initialization providers to NSSCC. This will
>>>>      ensure following probe order by the kernel:
>>>>
>>>>      1.) NSSCC driver
>>>>      2.) PCS driver.
>>>>
>>>> Please let me know if the above suggestion can help.
>>>
>>> I see. Adding the 'post-init-providers' property does fix the 
>>> circular dependency. Thank you!
>>>
>>> I have another question. Do you have a public repository with the 
>>> unmerged IPQ9574 patches, including, PCS, PPE, EDMA, QCA8084 ?
>>>
>>
>> May I know the source of your PPE/EDMA changes using which this issue
>> is seen?
> 
> I use a mix of upstream submissions, and openwrt patches. As noted, 
> using 'post-init-providers' takes care of the problem.
> 
> https://github.com/mrnuke/linux/commits/ipq95xx-devel-20250515/
> 
>>
>> The openwrt repository contains the unmerged IPQ9574 patches, Although
>> this version will be updated very soon with latest code(with some 
>> fixes), the version of the code in the repo currently is also 
>> functional and tested.
>>
>> https://github.com/CodeLinaro/openwrt/tree/main/target/linux/ 
>> qualcommbe/ patches-6.6
> 
> 
> Will you be updating a clock example with IPQ9574 + QCA8084 to the repo?
> 
> Alex
> 

Yes. We are planning to post the updated version of QCA8084 PHY driver 
along with the QCA8084 PHY DT example in the DT bindings. This should be 
available by the next review cycle.

>>>
>>>> Later once the IPQ PCS driver is merged, we are planning to push the 
>>>> PCS DTS changes, along with an update of the NSSCC DTS to point to 
>>>> the PCS node and mark the "post-init-providers" property. This 
>>>> should work for all cases.
>>>>
>>>> Also, in my view, it is not suitable to move PCS MII clocks get to
>>>> "ipq_pcs_get()" because the natural loading order for the drivers
>>>> is as below:
>>>>
>>>> 1) NSSCC driver
>>>> 2) PCS driver
>>>> 3) Ethernet driver.
>>>>
>>>> Additionally, the community is currently working on an 
>>>> infrastructure to
>>>> provide a common pcs get method. (Christian and Sean Anderson has 
>>>> been working on this). Therefore, I expect "ipq_pcs_get" to be 
>>>> dropped in the future and replaced with the common pcs get method 
>>>> once this common infra is merged.
>>>
>>> That makes sense. Thank you for clarifying.
>>
> 


