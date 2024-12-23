Return-Path: <linux-arm-msm+bounces-43149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9919FB04E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0321885E99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653E1A8F89;
	Mon, 23 Dec 2024 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBPepMeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE1145979;
	Mon, 23 Dec 2024 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734965195; cv=none; b=UfoDOIlfVIqfDwuG45U8tY2TPn482imRwHPY8jRnArmPxSNXFGk51LeapYdc0D7xoAq68x9mqHDyFcnEIN4HR3uSTGivlrc5PSrkIGSb1dX6TADtgtUdYFpuERc8c5rWpXWjy7BSlI1yTaEoN7PFABCN5uvw8aXteNrsJSWOqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734965195; c=relaxed/simple;
	bh=QvmsSOXq3sop5Ct4jazwtfW9ssQWlojjbfYOKC9mB2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AEwbqJVfx0IopPXRiYCsCpdrywZ5BhockotzJ9KqhvKUVerKLGYI2xZVd+AvRG1HnS07fLBtWlDQjZu6CspleLHjqhhzlxph0UNu5Yq3yuWlue2N2MQkxYQiZfw6UfTU/AftyWTwM4eaeynGwzek7gEHBE6bLaUdjl4qJ6UY/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBPepMeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBwwGF020173;
	Mon, 23 Dec 2024 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkQFu57Xw7aHa6drSo6fMkLlf1A2SffvDf56Onaz0Os=; b=JBPepMeSyd3m2Q4o
	UWlf4SzmyZb6fWYrgGmWOhK7FIetzKzvaGjDVNl6z3qRUplofX4lDxFS+MrSApf3
	lmgZzqNOZRToXggbnlVWlUaWcY7LIkMLPpQ+3grO5LuucOPb+D/FbpmJQ37C1En8
	lyC4y4DUUxMYFZMEQ1ubFLbWGRkzPJnipc97EnS7+nkXMvXJRjaMnEK50AJVx1Na
	IcDV1W7IFxlUEnzWGTfKElm+JVr8ZyU8ehyWWzJCeQG2JaNeFTBzFUGv8SdNkPFh
	KUnVxcXaA6IVMdl6TM7tICr0TS9eTSS42ipq7qOOg6tGrJ7+WAlZXUpkLEqAXCYB
	/HRrYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q7ev0dep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:46:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNEk9Bt009224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:46:09 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 06:44:13 -0800
Message-ID: <00c27553-5466-e59a-633a-e368a6e26167@quicinc.com>
Date: Mon, 23 Dec 2024 19:30:46 +0530
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
To: Johan Hovold <johan@kernel.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, <sudeep.holla@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
 <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
 <132d1404-9009-9fb5-1fb9-63eca03ce9fc@quicinc.com>
 <Z2P3bh04xXsreBF7@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z2P3bh04xXsreBF7@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0j4k8P_OsHqZvPH_hm1q_GerogBkN_h6
X-Proofpoint-GUID: 0j4k8P_OsHqZvPH_hm1q_GerogBkN_h6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230133



On 12/19/24 16:07, Johan Hovold wrote:
> On Tue, Dec 17, 2024 at 05:19:25PM +0530, Sibi Sankar wrote:
>> On 12/5/24 21:22, Johan Hovold wrote:
>>> On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
>>>> On 11/22/24 14:07, Johan Hovold wrote:
>>>
>>>>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>>>>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>>>>> and the memlat driver probes successfully.
>>>>>
>>>>> On the other hand, this series seems to have no effect on a kernel
>>>>> compilation benchmark. Is that expected?
>>>>
>>>> I can have a look at your tree. But memlat in general
>>>> depends on the cpu frequency when your benchmarks max
>>>> the cpu's the ddr/llcc are scaled accordingly by it.
>>>
>>> A kernel compilation should max out the CPU frequency on all cores.
> 
> Answering my own question here; bwmon should scale the buses for
> benchmarks like kernel compilations so I guess the non-existing impact
> of memlat is expected here.

you would see impact only in cases where you would benefit from
having ddr and llcc at a higher frequency i.e. latency workloads.
I usually run geekbench with and we are expected to see a big
difference with and without it.

> 
> Ettore helped me run some further benchmarks, including cachebench, but
> also saw no positive (or negative) effect with this series running on an
> X1E CRD (with recent firmware).
> 
> Do you have any suggestions of benchmarks to run where the effect of
> memlat should show up? What have you been using for testing?
> 
> I did measure a possibly slightly higher (idle) power consumption with
> memlat, but I guess that is also expected given the intended more
> aggressive ramping of the bus clocks.
> 
> These are the branches (and configs; johan_defconfig) we've used for
> testing:
> 
> 	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3
> 	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3-memlat

Thanks, we'll get this sorted out.

> 
>>>>> And does this mean that you should stick with the uppercase "MEMLAT"
>>>>> string after all? The firmware on my CRD is not the latest one, but I am
>>>>> using the latest available firmware for the T14s.
>>>>
>>>> We should stick with "memlat" if we run into a device in the
>>>> wild that doesn't support "MEMLAT"
>>>
>>> Ok. So the updated firmware supports both strings?
>>
>> Sry for the delay, was out sick. Yes the updated firmware supports both
>> strings.
> 
> No worries, hope you're feeling better.
> 
> I noticed that the firmware on the T14s indeed accepts both strings.
> 
> Johan

