Return-Path: <linux-arm-msm+bounces-43142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE69FAF4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA14C1881AE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E961AB528;
	Mon, 23 Dec 2024 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X0TkPPIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624715C14B;
	Mon, 23 Dec 2024 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963296; cv=none; b=UH1XRpZNzdDZs9seEAYflb0uDbFyD5iPgfGZPAQB7npBx9lfXFqkdkqZ249qDUG/IHxzQ3EfVNgILB8LVHqRfdsk80MruA6GTyZZoIZCSvA7eEQ3k7Vi+UJxiqkFXdgNruS5wwsu/7XjCAduVOEN25ycsahkMFz2eMkqz5d/zu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963296; c=relaxed/simple;
	bh=5pR6i1CJkXi9JsOOTipeoipmNDlsAFe7a4HXnU5ktto=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CIYBB98EFqWpYIhOk86i6kVsjzSs7mTVJdff44Cs2Ph1H/0jouUHu8xVdsaBrtakXDIp+7BjGj2Jq6wpDtoa9kYqkDIWiKonDYr6bA6kuNSLUT9upYT/Pcr3lI82L81PtoR6bz2lzZm7fPDtPwotG62AwLFC/G9TWcK/RpFdCpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X0TkPPIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBvgaJ018208;
	Mon, 23 Dec 2024 14:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/cRqASxcjJoQ2A51flm6hDAcAOKMnB8+B6EQPHB7SA=; b=X0TkPPIuLzasWhM3
	k52ZveVmv5iVJR4Xr5Kny/VR35ixbVyFlaxVfXmPFvuXGvYuMe5Qhrh9o3s/tC7F
	v0kTu6eu3I5WKbLuhSCGKXJ98XNmIc4JnEEIbLFXNbKttNQ3TGKXHtW4f2cHqPid
	EcczrGl5Wq5r3zty49aUUxlT3eEutORCkgXKB8veEvo5ioHIB8LgRidx/Nnck5cp
	RAUb0UBRFNAaT2sRbAgrAw/1R1rw+D1q+Ac2C0iXNxINPltRlKr61ZSOkVVBN2b0
	Jn7tDRG7u7wc6vplhUyilu5S8MKoXNI/cD4uJSHEnbUWZ/QRKqMlML74UWHENI+q
	DmR4DA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q7ev09s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:14:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNEEdSq020736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:14:39 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 06:14:35 -0800
Message-ID: <05ecd064-4677-2f39-e6c4-9dfa51ec9052@quicinc.com>
Date: Mon, 23 Dec 2024 19:27:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: Shivnandan Kumar <quic_kshivnan@quicinc.com>, <sudeep.holla@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>, Amir Vajid
	<avajid@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2e9614de-1a93-4e17-a10c-945c50fb3f1a@quicinc.com>
 <61ce8618-cb08-06bc-9159-4ca26d703b14@quicinc.com> <Z1GfGk0yQAVQKEVL@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1GfGk0yQAVQKEVL@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AgKPedOUANGR430uzfoYmignMbCIv5Sz
X-Proofpoint-GUID: AgKPedOUANGR430uzfoYmignMbCIv5Sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230128



On 12/5/24 18:09, Cristian Marussi wrote:
> On Thu, Dec 05, 2024 at 04:33:05PM +0530, Sibi Sankar wrote:
>>
>>
>> On 11/29/24 15:27, Shivnandan Kumar wrote:
>>>
>>>
> 
> Hi Sibi,
> 
> some rants down below :P

Hey Cristian,

Thanks for taking time to put out your thoughts!

>   
>>> On 10/7/2024 11:40 AM, Sibi Sankar wrote:
>>>> Introduce a client driver that uses the memlat algorithm string
>>>> hosted on QCOM SCMI Generic Extension Protocol to detect memory
>>>> latency workloads and control frequency/level of the various
>>>> memory buses (DDR/LLCC/DDR_QOS).
>>>>
> 
> [snip]
> 
>>>> +    /* Set the effective cpu frequency calculation method */
>>>> +    ret = ops->set_param(ph, &cpucp_freq_method,
>>>> sizeof(cpucp_freq_method), MEMLAT_ALGO_STR,
>>>> +                 MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
>>>> +    if (ret < 0)
>>>> +        return dev_err_probe(&sdev->dev, ret,
>>>> +                     "failed to set effective frequency calc method\n");
>>>> +
>>>
>>> Hi Sibi,
>>
>> Hey Shiv,
>>
>> Thanks for taking time to review the series!
>>
>>> Since the MEMLAT_SET_EFFECTIVE_FREQ_METHOD command is not supported in
>>> the legacy CPUCP firmware, it should be kept optional. This way, if the
>>> legacy firmware is used, the driver will not return an error when the
>>> CPUCP firmware returns -EOPNOTSUPP.
>>
>> The vendor protocol with the current major/minor version is
>> expected to work as is on x1e platforms. What legacy firmware
>> are you referring to? All future SoCs that plan to adhere to
>> it are expected to maintain this abi and can decide to make
>> use of alternate mechanisms to calculating frequency based
>> on additional dt properties set.
>>
> 
> Normally in the SCMI world you could leverage protocol versioning and
> the standard PROTOCOL_MESSAGE_ATTRIBUTES(0x2) command to let the agent
> investigate if the SCMI server it is speaking to implements or NOT a
> specific command and which specific version of that command is understood
> (with possibly varying size and fields)...
> 
> ...BUT since your vendor protocol is 'Generic' and, as it stands, it
> basically piggybacks any kind of binary payload (i.e. subcommands of
> some kind of subprotocols of yours) into the same 4 get/set/start/stop
> 'Generic' ops, without even specifying the transmitted/received payload
> sizes into the message itself....all of the possible SCMI versioning
> autodiscovery and backward-compatibility capabilities happily go out of
> the window because:
> 
> - your versioning refers to the generic protocol and you cannot possibly
>    describe all the possible future subcommands (opaque payloads) variations
>    and/or subcommands addition/removals purely on the major/minor version, AND
>    even if you did that, NONE of such future variations will be documented
>    anywhere since you are hiding all of this inside a bunch of binary blobs
> 
> - you dont even specify the payload sizes of the tx/rx 'Generic' payload
>    subcommands so it becomes even difficult for both the server and the
>    client to safely handle your 'Generic' subcommand message payloads
> 
> - you cannot issue a PROTOCOL_MESSAGE_ATTRIBUTE() to see if a specific
>    subcommand is supported, because your subcommand is NOT really a protocol
>    command but it is just one of the payloads of one of the 'Generic' protocol:
>    you commmands are only set/get/start/stop (maybe some sort of hack
>    could be doen around these...bit all will be even more flaky...)
> 
> - you dont implement NEGOTIATE_PROTOCOL_VERSION and so you cannot even
>    check if the SCMI server that you are speaking to will agree to
>    downgrade and 'speak' your Kernel SCMI agent (possibly older) 'Generic'
>    protocol version
> 
> All of this basically defeats all of the SCMI general capabilities
> around versioning and auto-discovery when it comes to your 'Generic' vendor
> protocol, with the end result that you will have to be EXTREMELY confident
> to perfectly match and keep in sync at all times your SCMI Server(FW) and
> Client(Kernel) sides, without any possibility of coping with a such a mismatch
> on the field by using some of the fallback/downgrade mechanism that you
> threw out of the window...

Even though we listed some of the background behind the generic
you have to understand it was done in a vacuum where QCOM might
have assumed that the entire vendor ID space was to be shared
across all vendors.

But your suggestions for adding another messages like NEGOTIATE
PROTOCOL_VERSION in a future major version upgrade would help
solve some of the problems you are listing out here.

Since there are devices that are out in the wild already running this
firmware, the first version of the generic vendor protocol is limited in
what it can accommodate. But like we already said we are open to changes
that will help review/maintain this for future SoCs without breakage.

> (...and sorry but looking at the above xchange about 'legacy firmware' I am
>   a bit skeptic about this as of now :D)

Some people within just used the wrong terminology here. There
are no "legacy" firmware since this is the first version of it
landing upstream and future versions have the options to implement
additional messages and ensure they do things in a way that is
easily reviewable/maintainable.

-Sibi

> 
> ...as I said initially when reviewing this series, you can do whatever
> you want within your Vendor protocol, but abusing the SCMI Vendor extensions
> capabilities in such a way could end up bringing to the table more cons
> (the above) than pros (some supposed 'simplification')
> 
> Thanks,
> Cristian

