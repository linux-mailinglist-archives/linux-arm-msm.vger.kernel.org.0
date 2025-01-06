Return-Path: <linux-arm-msm+bounces-43989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52BA0253A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C8CD3A2189
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 12:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C781DA636;
	Mon,  6 Jan 2025 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dcw7NksA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5740BE0;
	Mon,  6 Jan 2025 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166185; cv=none; b=ro6XTHWpbTHE2zgLfLvBzPFLV3QzwQIx4rejAOPeP+fyW4pbbL8a+uFWD9rKZaTn7gRmo3dP/x/V4ogUpzkgRLB4vBGfSTU0t034kOGfGQlrUjxgklLmoxVHmgk1qixHfyJsHkUaYnzvWe9KkEu5ye5twCrsafszthYzsZsJHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166185; c=relaxed/simple;
	bh=ZMGRX3Mra3v5ZOYRBNXo3pn0KTEaqRJHAxd0GJ/5/Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GyJUWO5cpnaj6Y39l0LaGuzXlnbjDxzeHAzrujFVJwNhoDN2CThNrqBGG3vzxdpKc0duvJ6APvy83+bUveofdR6Epe9Hjc9qT9KuQYYGEJSAxvQE9b4S/Mp4k4C/Zfkg4cCHY+OTOahiYKjCtMf6AcqdOUjGJO9J+OWILuUEKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dcw7NksA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063XbvR016390;
	Mon, 6 Jan 2025 12:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLInfvpbumgb5v3yKdH+TY3r7nz3E7Tsp5cZJ3q7Se0=; b=dcw7NksAuFeoohDX
	AZ9LaZ3aX7TbWxImJk2Bct6mgu7OpMs75h8qJBQetUQj74cMnjywZvQGPqKqAmU6
	C/ris7zlVphxV0NjUG+nWZPG9JVBGHvDaMWvpSDd2NkP2Psezsln8d+Y0ySyay3D
	5hkwjg0RIUqXwrKxSo8mc3QPotBvoeEvhfHTS2F1Nwi5WQicY0tjdsqSuCI2WyxF
	FzXECL+cV2JWi0+R0T/nuaH2yYIu4MYlQLChdyVvqgaWHY6NTtkSS8VmoqqPLsQW
	5tGiFLAOkc0gAVXIGPen3wzyoDSurknM8VvIbfcHclkau9zfcirdgJgZV7wDDVr7
	1Wmczw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4407ck11fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:22:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506CMuDL028025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 12:22:56 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 04:22:51 -0800
Message-ID: <f504b325-e4a8-c297-a09f-6a2158fa1a1b@quicinc.com>
Date: Mon, 6 Jan 2025 17:52:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <quic_nkela@quicinc.com>, <quic_psodagud@quicinc.com>,
        <abel.vesa@linaro.org>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com> <86plnf11yf.wl-maz@kernel.org>
 <ZyTjiiGc2ApoID9Y@hovoldconsulting.com> <86o72z10b6.wl-maz@kernel.org>
 <ZypOY-NCDN9fdMAR@hovoldconsulting.com> <86ed3p1rdq.wl-maz@kernel.org>
 <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
 <Z1HK4qIF9dT3x1OY@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1HK4qIF9dT3x1OY@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Uvx12WxCEOZnet5YOCg9AnPxi5v7WDl1
X-Proofpoint-ORIG-GUID: Uvx12WxCEOZnet5YOCg9AnPxi5v7WDl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=984 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060109



On 12/5/24 21:16, Johan Hovold wrote:
> On Thu, Dec 05, 2024 at 04:53:05PM +0530, Sibi Sankar wrote:
>> On 11/5/24 23:42, Marc Zyngier wrote:
>>> On Tue, 05 Nov 2024 16:57:07 +0000,
>>> Johan Hovold <johan@kernel.org> wrote:
>>>> On Fri, Nov 01, 2024 at 02:43:57PM +0000, Marc Zyngier wrote:
> 
>>>>> I wonder whether the same sort of reset happen on more "commercial"
>>>>> systems (such as some of the laptops). You expect that people look at
>>>>> the cpufreq stuff closely, and don't see things exploding like we are.
>>>>
>>>> I finally got around to getting my Lenovo ThinkPad T14s to boot (it
>>>> refuses to start the kernel when using GRUB, and it's not due to the
>>>> known 64 GB memory issue as it only has 32 GB)
>>>
>>> <cry>
>>> I know the feeling. My devkit can't use GRUB either, so I added a
>>> hook to the GRUB config to generate EFI scripts that directly execute
>>> the kernel with initrd, dtb, and command line.
>>>
>>> This is probably the worse firmware I've seen in a very long while.
>>
>> The PERF_LEVEL_GET implementation in the SCP firmware side
>> is the reason for the crash :|, currently there is a bug
>> in the kernel that picks up index that we set with LEVEL_SET
>> with fast channel and that masks the crash. I was told the
>> crash happens when idle states are enabled and a regular
>> LEVEL_GET message is triggered from the kernel. This was
>> fixed a while back but it will take a while to flow back
>> to all the devices. It should already be out CRD's.
>>
>> Johan,
>> Now that you are aware of the the limitations can we make
>> a call on how to deal with this and land cpufreq?
> 
> As Marc said, it seems you need to come up with a way to detect and work
> around the broken firmware.

The perf protocol version won't have any changes so detecting
it isn't possible :(

> 
> We want to get the fast channel issue fixed, but when we merge that fix
> it will trigger these crashes if we also merge cpufreq support for x1e.
> 
> Can you expand the on the PERF_LEVEL_GET issue? Is it possible to
> implement some workaround for the buggy firmware? Like returning a dummy
> value? How exactly are things working today? Can't that be used a basis
> for a quirk?

The main problem is the X1E firmware supports fast channel level get
but when queried it says it doesn't support it :|. The PERF_LEVEL_GET
regular messaging which gets used as a fallback has a bug which causes
the device to crash. So we either enable cpufreq only on platforms
that has the fix in place or live with the warning that certain messages
don't support fast channel which I don't think will fly. I've also been
told the crash wouldn't show up if we have all sleep states disabled.

> 
>>> </cry>
>>>
>>>> and can confirm that it
>>>> hard resets when accessing the cpufreq sysfs attributes as well.
> 
> Johan

