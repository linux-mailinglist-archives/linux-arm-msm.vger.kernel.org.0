Return-Path: <linux-arm-msm+bounces-42532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB99F4AE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118067A15FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262381F03FA;
	Tue, 17 Dec 2024 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mezGFMVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5109413A3ED;
	Tue, 17 Dec 2024 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438354; cv=none; b=TtWfHK69PbNXgXdyRVm+3J00wnBfKXVcDxOpnRYvPWbVD+lO51LGjtkpy6jv7LoboZcsgvYOXiwaT8vAklDZCe6JtsSpGOo6VLE2Kl3zgbPEYyBApdzxBXOxhJFqSmNnRHbyLL8KgW1JpQKAQutI9NOk7wA0vCsz9JMukXeC5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438354; c=relaxed/simple;
	bh=hgXsE1vghQing5mGrA/dwgq6YY989B2SSVwJGr/LJkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gg8Gj/womlRUO007FDU8V+NOKrzN5Q5HOZKEgxyjwzCZ85YKNkW6usVGGEKddJ7nKOR1b9FFWi058asxvdPp1tKISDDw/4VTK+lJ4td4zs9WQHnUaaA4VO8fQlbomLigHSNGm4bvhttmsD2InJp0wEVz6BcSzYmtUwCVdMRbjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mezGFMVb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH82QIp002766;
	Tue, 17 Dec 2024 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stzuow3i/bAtDC6wkdHohD6Ky3C1i6cxbfXRqKoZ4Kk=; b=mezGFMVbGWBZV0vo
	3ZOQEU8zvVxVvkFEafUwul6+ltxMzxpopF8Qwe2Bk0zG34PqwXccONS3Cc4enZB1
	6tPTKSZC8v38rzDaE9+mVdlCAyDujCjYL0n2MN6ilSCS4H3yjQ5GbVU2O5KiGVHE
	5QtWgQk6kOEmnjqTc7PSA5o/m+TaWNFyDdjnO1MkzYs+ReOyyvlm6073e0yMpg6b
	Aoqx1aIwOnsopaYxIRY1T9teSZUxlppbNRaVbIQVGysVepoYYra/ne83th38FqiF
	t7cj3RqMxjvAPGE1zlgwUQOvITtNfFVEXKvX+SWmCFyNsbUEAnBBNFGbaY65sYOt
	O0msOA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5ek0q5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 12:25:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHCPgSe004493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 12:25:42 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 04:25:38 -0800
Message-ID: <d313e40b-fa8f-a534-5037-98536ee25044@quicinc.com>
Date: Tue, 17 Dec 2024 17:55:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Johan Hovold <johan@kernel.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com> <Z1HceQegfMl07qj_@bogus>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1HceQegfMl07qj_@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 66499BlWR5vtsV4rEvFrgN4Ij51U-qso
X-Proofpoint-ORIG-GUID: 66499BlWR5vtsV4rEvFrgN4Ij51U-qso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170100



On 12/5/24 22:31, Sudeep Holla wrote:
> On Fri, Nov 22, 2024 at 09:37:47AM +0100, Johan Hovold wrote:
>> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
>>> On 11/8/24 20:44, Johan Hovold wrote:
>>
>>>>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
>>
>>>>>> Second, after loading the protocol and client drivers manually (in that
>>>>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>>>>
>>>>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>>>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>>>>
>>>>>> which seems to suggest that the firmware on my CRD does not support this
>>>>>> feature. Is that the way this should be interpreted? And does that mean
>>>>>> that non of the commercial laptops supports this either?
>>
>>>> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
>>>> patch (5/5) from this series, which according to the commit message is
>>>> supposed to enable bus scaling on the x1e80100 platform. So I guess
>>>> something is missing in my firmware.
>>>
>>> Nah, it's probably just because of the algo string used.
>>> The past few series used caps MEMLAT string instead of
>>> memlat to pass the tuneables, looks like all the laptops
>>> havn't really switched to it yet. Will revert back to
>>> using to lower case memlat so that all devices are
>>> supported. Thanks for trying the series out!
>>
>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>> and the memlat driver probes successfully.
>>
>> On the other hand, this series seems to have no effect on a kernel
>> compilation benchmark. Is that expected?
>>
> 
> Hijacking this thread to rant about state of firmware implementation on
> this platform that gives me zero confidence in merging any of these without
> examining each of the interface details in depth and at lengths.
> 

Hey Sudeep,

Thanks for taking time to review the series.

> Also I see the standard protocol like PERF seem to have so many issues which
> adds to my no confidence. I can't comment on that thread for specific reasons.

^^ is largely untrue, a lot of finger pointing and a gross
misrepresentation of reality :/

The only major problem that X1E perf protocol has is a firmware
crash in the LEVEL_GET regular message implementation. This
pretty much went unnoticed because of messaging in perf implementation
in kernel. Given the fastchannel implementation isn't mandatory
according to spec, the kernel clearly says it switches to
regular messaging when it clearly doesn't do that and uses
stale data structures instead. This ensured that level get regular
messaging never got tested.

We pretty much have been good upstream citizens, finding bugs and
sending fixes wherever we can. We clearly don't deserve such a hostile
stance.

> 
> I will briefly mention my suspicion here. This Lenovo ThinkPad T14s being
> primarily targeting other OS using ACPI might have just implemented what is
> required for ACPI CPPC which conveniently doesn't have to discover lot of
> fastchannel details since they are supplied in the tables straight away.
> But that also would mean it could be not fully compliant to SCMI spec.

Not fully compliant to the spec? I am pretty sure this series would
have been shot down completely and NAKd on the list by you if that
was the case lol.

-Sibi

> 
> Either we need to run some compliance test suite(which again may need more
> work as it is unfortunately make platform specific - referring to [1])
> or use the raw interface in the kernel and throw /dev/random at it and see
> how well it can cope up.
> 
> --
> Regards,
> Sudeep
> 
> [1] https://gitlab.arm.com/tests/scmi-tests (Not so great and needs platform
>       specific vectors to check compliance)

