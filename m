Return-Path: <linux-arm-msm+bounces-40489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1756F9E53D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AF2516A8F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339D020767A;
	Thu,  5 Dec 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hex7OcW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B811F03FF;
	Thu,  5 Dec 2024 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397803; cv=none; b=I0LbHBaRbQJZogZO0d+8zS79onJugNrSJ9xcvqKywk5AK64OSg73buqmRP+7/Q1prZItLB9ICk4mFAjer5zpTk7l4BZKExqHUulSup1X4PLJmYkyr/khX9EwRapu+yGjZwYITL75IN9AEt6tHhn1li0JapGsPoMBtqGhWQE8vhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397803; c=relaxed/simple;
	bh=lQiy4FO1GoxxNwDE/Z4rFs3RJ3BI+IeO1TQ3gqYqkew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b9LQIJ674wmZKATGPyBfgesd2Syk+ifAo27FTbSCPjL/oOvijdBWhoGYMQPg1GuMpD7yia6/qngOKG/tNgN2A4FuosMy9liEyeH/q/04j2qjU28HMUUHFCWta+UQgmxPfp/x1OOEY76YeJRUXOcHbuknigvy/UK71tv77kQMpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hex7OcW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ACjjv026173;
	Thu, 5 Dec 2024 11:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dcxzh3MG8ItdQEyx8ug9OTv9HwjGpOwd/ZPPnpnKuE=; b=Hex7OcW8GtV/qpqa
	XTNKxdSUmwWKop65v8jsRasN0AM4wSNuE+hC9mVLzH7Bbtb2yFL7aWhhF1KmHClJ
	5H+w17pdQMRnA2fsQHCPT1tFRU7aioMP1MvOqvhko7o1quMqZ1Z3IxHecNMaoO4v
	9AbKj7WJeWudo9LYaZkET1WM2reW0QMder4zGgJeDESSrM4M02LJxU5hQOMIbs2i
	p6Pk7zgJ86XcbXL6EJ8/TFHr6jjvtk/J0CtYGNn8kx9606nokzctoK7meFgSC0BG
	jKjCkNdQaGhd5LQwZVkV7Mftqvdw3DMLDy5OTUAfplH+xoLld9wE/vNhhqCBXhsM
	ihBzPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9ptav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 11:23:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5BND3p004305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 11:23:13 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 03:23:08 -0800
Message-ID: <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
Date: Thu, 5 Dec 2024 16:53:05 +0530
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
To: Marc Zyngier <maz@kernel.org>, Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
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
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <86ed3p1rdq.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d8wVJYY3T9WDdfMXNPw3MXppdr5OI1Rd
X-Proofpoint-GUID: d8wVJYY3T9WDdfMXNPw3MXppdr5OI1Rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050082



On 11/5/24 23:42, Marc Zyngier wrote:
> On Tue, 05 Nov 2024 16:57:07 +0000,
> Johan Hovold <johan@kernel.org> wrote:
>>
>> On Fri, Nov 01, 2024 at 02:43:57PM +0000, Marc Zyngier wrote:
>>> On Fri, 01 Nov 2024 14:19:54 +0000,
>>> Johan Hovold <johan@kernel.org> wrote:
>>
>>>> The side-effects and these remaining warnings are addressed by this
>>>> series:
>>>>
>>>> 	https://lore.kernel.org/all/20241030125512.2884761-1-quic_sibis@quicinc.com/
>>>>
>>>> but I think we should try to make the warnings a bit more informative
>>>> (and less scary) by printing something along the lines of:
>>>>
>>>> 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
>>>>
>>>> instead.
>>>
>>> Indeed. Seeing [Firmware Bug] has a comforting feeling of
>>> familiarity... :)
>>>
>>> I wonder whether the same sort of reset happen on more "commercial"
>>> systems (such as some of the laptops). You expect that people look at
>>> the cpufreq stuff closely, and don't see things exploding like we are.
>>
>> I finally got around to getting my Lenovo ThinkPad T14s to boot (it
>> refuses to start the kernel when using GRUB, and it's not due to the
>> known 64 GB memory issue as it only has 32 GB)
> 
> <cry>
> I know the feeling. My devkit can't use GRUB either, so I added a
> hook to the GRUB config to generate EFI scripts that directly execute
> the kernel with initrd, dtb, and command line.
> 
> This is probably the worse firmware I've seen in a very long while.

The PERF_LEVEL_GET implementation in the SCP firmware side
is the reason for the crash :|, currently there is a bug
in the kernel that picks up index that we set with LEVEL_SET
with fast channel and that masks the crash. I was told the
crash happens when idle states are enabled and a regular
LEVEL_GET message is triggered from the kernel. This was
fixed a while back but it will take a while to flow back
to all the devices. It should already be out CRD's.

Johan,
Now that you are aware of the the limitations can we make
a call on how to deal with this and land cpufreq?

-Sibi

> </cry>
> 
>> and can confirm that it
>> hard resets when accessing the cpufreq sysfs attributes as well.
> 
> Right. So this also happens on non-abandonware machines.
> 
>> On the bright side, at least I don't see any warnings due to duplicate
>> OPPs on this machine (x1e78100, latest UEFI fw).
> 
> One bug fixed...
> 
> 	M.
> 

