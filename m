Return-Path: <linux-arm-msm+bounces-43150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41A9FB052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EFD61615FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D271A8F89;
	Mon, 23 Dec 2024 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pSkKVEe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70045979;
	Mon, 23 Dec 2024 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734965368; cv=none; b=aJcI+bdstKhM2TjPEyIkFUnFuXT8EYtK/CmHd7uK8nJcFI5yLzAEbhxp1zJ95Ahbl0OBaI0WVqTYtXyOgfUyoAAkYzixYGPBXyqUXYeLNs0O4nRTQAidilPhTn75sKDaeCA2mJzGBT1dmp9IJyRZR95Ha0wwgRO9V+RZmVSV/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734965368; c=relaxed/simple;
	bh=OpPiE1UxPQDvT4giDPRn/aB1AdQ5JZ8aA98LoSHWYDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sBNh53yoRaEqv+Y3V1dlPh6asvhSf7XW4woqTzgpaH0LJMbptnxzeRv16XwlFyiAy1wvjW6xsYMjMXQmCgNlAx1mPM/lUDlpubuHCHi4ZOjisSeUnXUB/m6fStTZE6wZTeHYdRryYDj8jhUEfk8UnRIvSva3lCdNns9YGEjMF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pSkKVEe4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBaknd029357;
	Mon, 23 Dec 2024 14:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8Lt3NuGQDTWBGdZEMWnLPVC/RbIBxEdQ0kBXyYpg1w=; b=pSkKVEe4wMG36NpD
	jPCSowIavY9/jDdS84cLXXwMx6j3lsAQcXE2BvlojeMNhW2WiGb7nABDbZXGwPMs
	+xnv56Tfv6lQhzVTk8CY99BFIG/L7jiEl2wx7kikPDnBGB1WD6zAXMHeDfQFUOT9
	Spr5RTqW1GI3raSz3sTuZbsNc0jvzEPfjiz/zZRA1jx6Rhy2AW8KIb2LAeiExlLg
	dr5u18KyHc0ETzXNGPklZjzB60ICB2qv4IJs5xjAwoLtycgMK3LfskSDTaxFFx6d
	XPkIm/aOdyxeqb0e6l7chjDR9dqGep7sY+aDMc/VjFAVBKkgBy0Lnhv6RFdL5BaP
	MobIdw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q74x0e99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:49:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNEnHgn023287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:49:17 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 06:47:27 -0800
Message-ID: <1ca4f5d7-6652-b8d0-3c67-b8b2bdda7163@quicinc.com>
Date: Mon, 23 Dec 2024 19:39:01 +0530
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
To: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Johan Hovold <johan@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com> <Z1HceQegfMl07qj_@bogus>
 <d313e40b-fa8f-a534-5037-98536ee25044@quicinc.com> <Z2GOLFqnexEalBx_@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z2GOLFqnexEalBx_@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YKU0waJ4uMD2-BPx_WuH1P7EJGELfYF9
X-Proofpoint-GUID: YKU0waJ4uMD2-BPx_WuH1P7EJGELfYF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230133



On 12/17/24 20:15, Cristian Marussi wrote:
> On Tue, Dec 17, 2024 at 05:55:35PM +0530, Sibi Sankar wrote:
>>
>>
>> On 12/5/24 22:31, Sudeep Holla wrote:
>>> On Fri, Nov 22, 2024 at 09:37:47AM +0100, Johan Hovold wrote:
>>>> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
>>>>> On 11/8/24 20:44, Johan Hovold wrote:
>>>>
>>>>>>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
>>>>
>>>>>>>> Second, after loading the protocol and client drivers manually (in that
>>>>>>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>>>>>>
>>>>>>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>>>>>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>>>>>>
>>>>>>>> which seems to suggest that the firmware on my CRD does not support this
>>>>>>>> feature. Is that the way this should be interpreted? And does that mean
>>>>>>>> that non of the commercial laptops supports this either?
>>>>
>>>>>> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
>>>>>> patch (5/5) from this series, which according to the commit message is
>>>>>> supposed to enable bus scaling on the x1e80100 platform. So I guess
>>>>>> something is missing in my firmware.
>>>>>
>>>>> Nah, it's probably just because of the algo string used.
>>>>> The past few series used caps MEMLAT string instead of
>>>>> memlat to pass the tuneables, looks like all the laptops
>>>>> havn't really switched to it yet. Will revert back to
>>>>> using to lower case memlat so that all devices are
>>>>> supported. Thanks for trying the series out!
>>>>
>>>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>>>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>>>> and the memlat driver probes successfully.
>>>>
>>>> On the other hand, this series seems to have no effect on a kernel
>>>> compilation benchmark. Is that expected?
>>>>
>>>
>>> Hijacking this thread to rant about state of firmware implementation on
>>> this platform that gives me zero confidence in merging any of these without
>>> examining each of the interface details in depth and at lengths.
>>>
>>
> 
> Hi Sibi,
> 
>> Hey Sudeep,
>>
>> Thanks for taking time to review the series.
>>
>>> Also I see the standard protocol like PERF seem to have so many issues which
>>> adds to my no confidence. I can't comment on that thread for specific reasons.
>>
>> ^^ is largely untrue, a lot of finger pointing and a gross
>> misrepresentation of reality :/
>>
>> The only major problem that X1E perf protocol has is a firmware
>> crash in the LEVEL_GET regular message implementation. This
>> pretty much went unnoticed because of messaging in perf implementation
>> in kernel. Given the fastchannel implementation isn't mandatory
>> according to spec, the kernel clearly says it switches to
>> regular messaging when it clearly doesn't do that and uses
>> stale data structures instead. This ensured that level get regular
>> messaging never got tested.
> 
> You claimed this a couple of times here and on IRC, but sincerely,
> looking at the fastchannel implementation in SCMI core and Perf, I could
> not track down where this could have happened in the recent code
> (i.e. with or without your recent, welcomed, patches...)
> 
> When FC initialization fails and bailout it says:
> 	
> 	"Failed to get FC for protocol %X [MSG_ID:%u / RES_ID:%u] - ret:%d. Using regular messaging."
> 
> ... and it clears any gathered address for that FC, so that in __scmi_perf_level_get()
> you end up skipping the FC machinery and use messaging
> 
> 	if (dom->fc_info && dom->fc_info[PERF_FC_LEVEL].get_addr) {
> 		...
> 	}
> 
> 	return scmi_perf_msg_level_get(ph, dom->id, level, poll);
> 
> Now this is done ONLY for the FC that specifically failed
> initialization, i.e. identified by the tuple PROTO_ID/MSG_ID/RES_ID
> (as stated in the noisy message above where MSG_ID is specified) NOT for
> all Fastchannel, so you can have an FC successfully initialized only on
> the GET but failing in the SET, so only the GET FC will be used.
> 
> I dont really understand how the Kernel was misbehaving and using
> instead stale data, neither, if this was the case, I can see where this
> issue would have been fixed.
> 
> To be clear, I am not really interested in throwing an argument here, but
> I sincerely dont see where the alleged problem was and how was fixed (kernel
> side), so I fear it could be still there, hidden maybe by a change in the
> platform fw.
> 
> Apologies if I missed something along the history of this..

lol, this is pretty embarrassing :|, It's just like you said
looks like this fw supports get_level fastchannel but fails
to say it supports it. This was the reason behind get_level
regular message for being never tested and being buggy and
had nothing to do the kernel messaging or being buggy.
My bad :(, sry again.

-Sibi

> 
> Thanks,
> Cristian

