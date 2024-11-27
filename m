Return-Path: <linux-arm-msm+bounces-39250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3A9DA296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C28FB23FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325601442E8;
	Wed, 27 Nov 2024 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dLmyIKdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246417BA2;
	Wed, 27 Nov 2024 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732690854; cv=none; b=JOrYA+gQyxg6x2j1/GXoKVEsgyL2GpnPqWc7jjLrRggVbVA6vTiae/AMPsdeu3lC6zp1VGe0NL6ClG5sgPGyaeo9R5y/Wags8UFPb7eIdg4hW+1y43RGEWQZjwapeF49N5oFSuKGwpKXysPiGU6ooPAsIN3R9IbsGgei50ZtDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732690854; c=relaxed/simple;
	bh=rYrtuOnGhlmsVE8BBvxk8yY4kUvnUhoSOGfV5MZkSgg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=O4xwHZX7nmlF/IflwkOpJ7wtHv5DUWgD6jL4Xd6AbCr41le+ynzwD6VClsGmULozJLoOeLOSGXBqMsqG/AL+uFN08fGcT92xUnBQO5vR1BFOKcF0vOydYGCeeab4wJ0D7HyMMk12CkVtkhL1BwgYwtYh8jBMCdV75n7tajsKdek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dLmyIKdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLXvc007146;
	Wed, 27 Nov 2024 07:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgRtXKp6Ib0r1ecUjQWlmkTsRbpS2b5Cwd/uwfaa+wk=; b=dLmyIKdU8IhBp0lK
	e37ZIYmWNVrS2ophDrZc+zUDy1X0qmMQUYLjBjP1X47sGxWnkHQU+8lPIKub8NxS
	lAUejjvg8ssU0BzR5vaNZj0x38AiBjW568LorSqgLTP9SN5xI58by0hVNMUEtnYW
	Nct6zc0k9Afcfj3b6Z1c5UPYzhlJlHCYFJU1UomRygAK7tAN6N48pZLA+pRQTuE8
	iJ4sEiEZ5iQuBJZLyVaIqXxku873jT8K29jWEmpeh//fe5+hbuhthWshVvgcqXc2
	tZmArM94Sfn/srbihWzfNZgtI0DPcsIaO/TdWYpk3ytV/WnLRI2/x284RX07BNxL
	4BwAuw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9ds2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:00:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR70kuY026035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:00:46 GMT
Received: from [10.253.38.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 23:00:42 -0800
Message-ID: <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
Date: Wed, 27 Nov 2024 15:00:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
From: Yijie Yang <quic_yijiyang@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
Content-Language: en-US
In-Reply-To: <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _Sw2n69pV_5KQZultUUqlaXlxy3wsuoo
X-Proofpoint-ORIG-GUID: _Sw2n69pV_5KQZultUUqlaXlxy3wsuoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270056



On 2024-11-27 14:17, Yijie Yang wrote:
> 
> 
> On 2024-11-22 21:19, Andrew Lunn wrote:
>>>>>>    +&ethernet {
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    pinctrl-0 = <&ethernet_defaults>;
>>>>>> +    pinctrl-names = "default";
>>>>>> +
>>>>>> +    phy-handle = <&rgmii_phy>;
>>>>>> +    phy-mode = "rgmii";
>>>>>
>>>>> That is unusual. Does the board have extra long clock lines?
>>>>
>>>> Do you mean to imply that using RGMII mode is unusual? While the 
>>>> EMAC controller supports various modes, due to hardware design 
>>>> limitations, only RGMII mode can be effectively implemented.
>>>
>>> Is that a board-specific issue, or something that concerns the SoC 
>>> itself?
>>
>> Lots of developers gets this wrong.... Searching the mainline list for
>> patchs getting it wrong and the explanation i have given in the past
>> might help.
>>
>> The usual setting here is 'rgmmii-id', which means something needs to
>> insert a 2ns delay on the clock lines. This is not always true, a very
>> small number of boards use extra long clock likes on the PCB to add
>> the needed 2ns delay.
>>
>> Now, if 'rgmii' does work, it means something else is broken
>> somewhere. I will let you find out what.
> 
> The 'rgmii' does function correctly, but it does not necessarily mean 
> that a time delay is required at the board level. The EPHY can also 
> compensate for the time skew.

I was mistaken earlier; it is actually the EMAC that will introduce a 
time skew by shifting the phase of the clock in 'rgmii' mode.

> 
>>
>>>>>> +    max-speed = <1000>;
>>>>>
>>>>> Why do you have this property? It is normally used to slow the MAC
>>>>> down because of issues at higher speeds.
>>>>
>>>> According to the databoot, the EMAC in RGMII mode can support speeds 
>>>> of up to 1Gbps.
>>>
>>> I believe the question Andrew is asking is "how is that effectively
>>> different from the default setting (omitting the property)?"
>>
>> Correct. If there are no issues at higher speeds, you don't need
>> this. phylib will ask the PHY what it is capable of, and limit the
>> negotiated speeds to its capabilities. Occasionally you do see an
>> RGMII PHY connected to a MII MAC, because a RGMII PHY is cheaper...
>>
>>     Andrew
> 
> It does unnecessary, I will remove it.
> 

-- 
Best Regards,
Yijie


