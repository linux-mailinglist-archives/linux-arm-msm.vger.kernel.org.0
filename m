Return-Path: <linux-arm-msm+bounces-44364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B37A05B13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F9981888C7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEA51F9F5A;
	Wed,  8 Jan 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C1FQS82u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E571F9F4A;
	Wed,  8 Jan 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338250; cv=none; b=QB2IxjpfNFhNMDV3QKrvlxB7bqqM0ONBVQlVlgBLf2wmNPGtjnAvlGUNCbtQVMFLkiww6/iPztf0JskrAd2NQGCT/pMTZZXLmicjolE1iAFvTn2RaA0zAzmRpCWSIxYgIEYBYg7UVHDMZgy8v7W+isq90zvCsgqdYGJfJ6e4Khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338250; c=relaxed/simple;
	bh=X2hpT9RZ+C7AwMPLCMLMC2njxmd1GKdf9kSyIpwcGoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UJY1k+TJ9+hAbfqx+CE6skHiZ79WAzBTm7W6vreY8xsK7V7lKeNvS/LCe+sWBiQIky2m4v4XkvqaWp0XhpSw5wNWVQAR6q20CN+7MVMyoEdZkBFy/3qHSZ6WQeJb+idZkR1A8Biwi5512+Mn/y2wTDXvwsqorKRYjR3py43dpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C1FQS82u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkVni005657;
	Wed, 8 Jan 2025 12:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3sOqGG2OkEw2pf+ErYCXCy15wMH/C0GY7RxGwxzJEc=; b=C1FQS82u5ZUI1tl0
	mkfZFy08Yy3EVo1e6uWENB8Up6bybpaDJHDiCsJEvlLarY1+smuNGFwYjheRl4yQ
	tuiB7qO9uZfBtHKuySBhJrXDTHzra+tDz7OlkvLEqd9Sme9gNUMl5S4N6RYfv87V
	cBUy0yp5FKlCBkAx9nqQJqlC3yRkrXHRDphmt1HgIsaFct05sMpMEsadwXqx+n8C
	7AgR8DZy0l4wljL02yu38Qk51nbaKa/0anYYn2nrwx3eOkHDG6LU504Xa7kopWmC
	TW9kTE8megb5s0moGNYJRHoxiYb4BzePNOn26H/6NWhBq54aiHcfWD7KdJx5Nhl5
	38+gtw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nj2gn05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:10:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508CAjEL020604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 12:10:45 GMT
Received: from [10.217.198.130] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 04:10:39 -0800
Message-ID: <02e48003-57c7-c385-75e3-91b4c3409d67@quicinc.com>
Date: Wed, 8 Jan 2025 17:40:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir
	<quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <dc6876f2-ede8-4105-86fd-fd7060d9e7fd@oss.qualcomm.com>
 <af982662-85c0-5d21-be40-44cbc8401678@quicinc.com>
 <1798bc04-4cda-45aa-b033-3cbafe7f8f54@oss.qualcomm.com>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <1798bc04-4cda-45aa-b033-3cbafe7f8f54@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8vXaNyoI22wu-B9GZx_0aU2f7fQP6U6w
X-Proofpoint-ORIG-GUID: 8vXaNyoI22wu-B9GZx_0aU2f7fQP6U6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=608 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080099


Hi Konrad,

On 12/31/2024 9:51 PM, Konrad Dybcio wrote:
> On 31.12.2024 12:05 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>> On 12/30/2024 9:05 PM, Konrad Dybcio wrote:
>>> On 29.12.2024 4:23 PM, Wasim Nazir wrote:
>>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>>
>>>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>>>> does corrective action for each subsystem based on sensor violation
>>>> to comply safety standards. But as QCS9075 is non-safe SoC it
>>>> requires conventional thermal mitigation to control thermal for
>>>> different subsystems.
>>>>
>>>> The cpu frequency throttling for different cpu tsens is enabled in
>>>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>>>> has higher ambient specification. During high ambient condition, even
>>>> lowest frequency with multi cores can slowly build heat over the time
>>>> and it can lead to thermal run-away situations. This patch restrict
>>>> cpu cores during this scenario helps further thermal control and
>>>> avoids thermal critical violation.
>>>>
>>>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>>>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>>>
>>>> Add cpu frequency cooling devices that will be used by userspace
>>>> thermal governor to mitigate skin thermal management.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>> ---
>>> Does this bring measurable benefits over just making the CPU a cooling
>>> device and pointing the thermal zones to it (and not the idle subnode)?
>>>
>>> Konrad
>> As noted in the commit, CPU frequency mitigation is handled by hardware as a first level mitigation. The software/scheduler will be updated via arch_update_hw_pressure API [1] for this mitigation. Adding the same CPU mitigation in thermal zones is redundant. We are adding idle injection with a 100% duty cycle as an additional mitigation step  at higher trip to further reduce CPU power consumption. This helps device thermal stability further, especially in high ambient conditions.
> I understood this much from the commit message.
>
> What I'm asking is, whether your solution actually works better than just
> letting Linux software-throttle the CPUs, preferably backed by some
> numbers.
I hope by ‘your solution’ you mean HW CPU frequency throttling. Yes, we 
benefit from the hardware approach compared to Linux software-based CPU 
throttling, both in terms of tighter thermal control and improved 
performance.
For the Dhrystone use case from one of our boards, we observe only a 
0.3°C overshoot compared to 2.5°C with software CPU throttling using the 
stepwise governor for same trip threshold.
>
> I'm also unsure how this is supposed to reduce power consumption. If the
> CPUs aren't busy, they should idle, and if they are not fully utilized, a
> lower frequency would likely be scheduled.

By using CPU idle injection, we force the CPU to enter idle mode with 
the lowest LPM modes during high temperature. This approach is similar 
to hot-plugging a core and will further reduce static power for that 
CPU, helping to manage temperature further.

[1]. https://docs.kernel.org/driver-api/thermal/cpu-idle-cooling.html

Best regards,

Manaf

>
> Konrad
>
>
>> [1]. https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/qcom-cpufreq-hw.c?h=next-20241220#n352
>>
>> Best regards,
>>
>> Manaf
>>

