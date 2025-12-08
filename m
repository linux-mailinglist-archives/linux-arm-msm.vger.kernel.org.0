Return-Path: <linux-arm-msm+bounces-84639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A49CAC75C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 09:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8433A301DB99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 08:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73602D8764;
	Mon,  8 Dec 2025 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQw3SSnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8YG2gA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5862D5A01
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181322; cv=none; b=W1i0B1qDS3ulcbDYi1tlXdmQEQC8GR1uxlw6CT7y0KLdeQrkPYs40rVnEMPiyXbkBtdT8j0ZfYO4J8JdkmY07wbkZnnB6KQzsi3BpexL+nEm8gi9uWupLVeoXMhV/pUh0wl44T6X9HYUDh6ytRb9cV3nxBTkF+LuEAtw1bv4rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181322; c=relaxed/simple;
	bh=d4cmxjQ9T0vhviYDUATZv1xGcphNEDJbzgkdeEq9i18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8LYmxk8wVdSDNHgDPeR2BD/IAFOUux7pbNZUWEvZPHQ5+HLnF0S3Z5ptiYkX+ZBig5A8ddW3rOvP0RSmGjR67ggCibZ5cz8caSlxda1sUQkAiLWXRit/zb/RHhAsLL6h7KYnuVIjxLtCFThmHonX8vDchI459WodjHjbFnUbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQw3SSnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8YG2gA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8434gJ109925
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 08:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXE8Us4HQezhN7P3ZKvVjnLTE/42o6C1t98PczSwFEw=; b=NQw3SSnQs5XReFN9
	Z5yHXR3cvzVWWIP1JVEtFegcl/+Btn2go5n7mS2h/WmQKqQDxUD8a2Yew1vwbLCg
	tDZ1pfaTKwxoT5UF0QPwZ7DfgDTUqD5Xgmvmmde/c/RmmHg2bp0RINIQVkuGH7e8
	LpXXQRiWOTw3XeNbpQnf/xmWRK2rKKr+R8n0p/fknCF0PFOeozRWtkHNHQJU8aas
	nn9rl4GjDqoP1vbFVBcAFrOwSxyKC6K6AYDnqfjDHif+oxvPDpwOY/oXUavthbuQ
	VxM0W4GCvNadginFVNRJa11LY/X9NNa/+ppT33/wlKUshogMJxVivOqEKmw+c4ur
	TYHnRw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awqabgkfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 08:08:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a1bca4c2aso1250824a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765181312; x=1765786112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXE8Us4HQezhN7P3ZKvVjnLTE/42o6C1t98PczSwFEw=;
        b=e8YG2gA+RSllXzdugsZ+J7MVBKg/2XtwFK5hIGb2wOYhbEm/mQKD/53jqL8tP93w7i
         Sa8hBmxgfIJu8cSdLoteRCIFsgzWPqUs7V4i+Mvap2+KOvGP57jaCa8GVFz1PRYQkNjv
         USuXc1TFBsc1oonJnE07M0Rn6PGwlr6aTR7OesC6PGG50VfJF+noZmKFm8p/g0PeaN5q
         kOgukitYxox2A3gGVxulGYU3EqpaclgUR9y/yla1q923p53hv5Zdk6tv5nLDOFnJGWGd
         oaY6SZQBG8OMNReZ7/fbaoJItTop+9FqkRrVfeajf2UEFqAWhBToBLVjT3vyJ+8rNg6O
         goCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181312; x=1765786112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXE8Us4HQezhN7P3ZKvVjnLTE/42o6C1t98PczSwFEw=;
        b=rmx5zt0oncU3MqFZe3soIVbE1mCjWsYMAF3L8MXatgMm6M5kxpINj0BDyIAyhtzsUW
         pDAC69OX6BTrY0QORTT76uU1p4qtvwjK3mTfxBc0maKF0dMh5XMSd0+JRVOUaP5DnujJ
         x44Y/iChls7xyCsKJ1OHwEqAUfJ1n7jYbMuxeSRFh9wsW51lhbkPFnIPseaZdKGo5TAr
         x0hDsnlqnsxJjRD3BaZAQI5+psm/307o6bwb8myvV2ts1csAgplBCb7lh9PEm6WsXHoc
         P8GupMDAi0yr4XTOdE0o/qpLfG516HtX8Mbwkr8RTl6NHttqsHMbfDwlEqZtSrnZwkYv
         OE/g==
X-Forwarded-Encrypted: i=1; AJvYcCV8sXhxHiO0ab5qhGxqw4czcMWrMk5W56N4Yteq5dRfSqufpW772vWMN4FgbMl6STGYfMAmPnwa+XZF173r@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3h7sv9BxivxrTdO22l9Dwbq12NsrI1+Yy3hf4WcIY7R7C3jY
	nixo8Kb6QstxJpNyaRrN33feWt5aGdKb3UjdyjV+QuCEFlUAE60S2TNM5J/bmGJeDvqreEqMvKN
	RryLSj7jxRNl87Hu+2R28mWtqUUcECN6A2ZxGRpYEwQ++Ru9RakHxqA/XipYw8WgBnax2
X-Gm-Gg: ASbGncsO1UclYSMxcyuqSh94lRwviMZFd5kLW/MQLb3XDExeKIlvGW/kFhJlFxeCj0B
	cwSYdqufbXhhp6xrevYRefb9oKRnosA8kxbWXPtaqsnxJUE7Zbq2q9/bTbTZf1Q4r7IzMUGmEuN
	QHEGhNh6Lz+YNcGJeO4wS1ekvaqttPYU9A5oLl5dHT5BvezgSERh1PJ1wrT6Qe6cLButrdiG6O7
	HpX/GK8PyUUded3uqqzaGUrSQbBxydcEUb1kBUVz5S75VlLbEDZiBxFvd+22NA1CT7vse9yRDUr
	ElYAaohYD0u/fsIjOrab+0MaJGT48eWs4yaQj5EQmvWDgRh3um6B/PynVRAaFgyN4juXq4wrpt4
	6VV3z0/7vfxCcInvWVxCWjwDotIqBvDWBuLQW1fo3tCLxAH9T8rLvziusJ7NsHEA3x0BWshBaen
	jXwbZEjw==
X-Received: by 2002:a17:90b:3851:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-349a2614266mr6848492a91.18.1765181311584;
        Mon, 08 Dec 2025 00:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwvJU/epl8tEJrc+UK3ITHgWPpUqvwCKgVXZSjhqBYiierWf4bIhLJerT0fY4R+doCJ8THHA==
X-Received: by 2002:a17:90b:3851:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-349a2614266mr6848453a91.18.1765181310876;
        Mon, 08 Dec 2025 00:08:30 -0800 (PST)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm11031423a91.1.2025.12.08.00.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:08:30 -0800 (PST)
Message-ID: <a99ccd44-1650-484e-a302-aee467461bfb@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:07:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Provides support for Trigger Generation Unit
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, kernel@oss.qualcomm.com,
        mike.leach@linaro.org, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
 <4f53766f-6338-4d94-a947-19b95952e08a@arm.com>
 <b2f3c31a-76fa-4f59-9ba4-0f93f861ffb2@oss.qualcomm.com>
 <a3d2f8a8-900d-4cf7-bd12-2d2ec85c4da2@arm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <a3d2f8a8-900d-4cf7-bd12-2d2ec85c4da2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V7PUc-mW0naVkVhrKSPb0Jf4cPGFPmLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2NyBTYWx0ZWRfXxKB9neCNJbgZ
 NIIaGvz1TuaBKnnoMxMsxvvk8dRS5KndrmanP79wVDqJbZDoW86OaM4YVsI/Cr2LLOQFteL0Vok
 TST6wc5RDspTSXYjcxZ9H4mu/Pkxsv/3u4gq7qxtJ6i0omJx9lbbXwDPLfljQhLBIZXxbJRA7Ni
 +LCIdQE+V5mLNdmvdkRYhfwFgulyUkDVIfY0NeRe1HZkqIH3TtbKVPUlZeBe/7nS/vTIFjHVjbS
 z8cZL1R0ao/blWaOFtFMGgysAeLZWYvkN9ZMdKrOfuDq9twJBUQmQVuPbuoDCQys4q4naAwLiVI
 dkw78pMpJcM4AGPvbj+4NJxtI7e7N5a4AGYe+bLtM8y9lfH5cQeHyhNE/G0LfmRpFz0/VDndTed
 tGRjJfe7ygxx8+3p5tRwFZpPwD1FxA==
X-Proofpoint-GUID: V7PUc-mW0naVkVhrKSPb0Jf4cPGFPmLN
X-Authority-Analysis: v=2.4 cv=f7lFxeyM c=1 sm=1 tr=0 ts=69368780 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KH5aQrV3TWGUDB8w8d0A:9 a=Mm_3ml_JzrRrl0x6:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080067



On 12/5/2025 9:51 PM, Suzuki K Poulose wrote:
> On 05/12/2025 01:13, Songwei Chai wrote:
>>
>>
>> On 12/3/2025 11:48 PM, Suzuki K Poulose wrote:
>>> Cc: Greg
>>>
>>> On 03/12/2025 09:00, Songwei Chai wrote:
>>>> We propose creating a new qcom directory under drivers/hwtracing
>>>> to host this TGU driver, as well as additional Qualcomm-specific
>>>> hwtracing drivers that we plan to submit in the coming months.
>>>> This structure will help organize vendor-specific implementations
>>>> and facilitate future development and maintenance.
>>>>
>>>> Feedback from the community on this proposal is highly appreciated.
>>>>
>>>> - Why we are proposing this:
>>>>
>>>> TGU has the ability to monitor signal conditions and trigger debug- 
>>>> related
>>>> actions, serving as a programmable hardware component that enhances 
>>>> system
>>>> trace and debug capabilities. Placing it under drivers/hwtracing 
>>>> aligns with
>>>> its function as a trace generation utility.
>>>>
>>>> We previously attempted to push this driver to drivers/hwtracing/ 
>>>> coresight,
>>>> but did not receive support from the maintainers of the CoreSight 
>>>> subsystem.
>>>> The reason provided was: “This component is primarily a part of the
>>>> Qualcomm proprietary QPMDA subsystem, and is capable of operating
>>>> independently from the CoreSight hardware trace generation system.”
>>>>
>>>> Chat history : https://lore.kernel.org/all/ 
>>>> CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
>>>>
>>>> Given this, we have been considering whether it would be appropriate
>>>> to create a dedicated drivers/hwtracing/qcom directory for
>>>> Qualcomm-related hwtracing drivers. This would follow the precedent set
>>>> by Intel, which maintains its own directory at drivers/hwtracing/ 
>>>> intel_th.
>>>> We believe this structure would significantly facilitate
>>>> future submissions of related Qualcomm drivers.
>>>>
>>>> - Maintenance of drivers/hwtracing/qcom:
>>>>
>>>
>>> Fine by, me.
>>>
>>>
>>>> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
>>>> directory — we’ve discussed this with him and he’s aware that his task
>>>> list may grow accordingly. Additionally, Qualcomm engineers familiar 
>>>> with
>>>> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei 
>>>> Chai],
>>>> will be available to review incoming patches and support ongoing
>>>> development.
>>>>
>>>> - Detail for TGU:
>>>>
>>>> This component can be utilized to sense a plurality of signals and
>>>> create a trigger into the CTI or generate interrupts to processors
>>>> once the input signal meets the conditions. We can treat the TGU’s
>>>> workflow as a flowsheet, it has some “steps” regions for customization.
>>>> In each step region, we can set the signals that we want with priority
>>>> in priority_group, set the conditions in each step via 
>>>> condition_decode,
>>>> and set the resultant action by condition_select. Meanwhile,
>>>> some TGUs (not all) also provide timer/counter functionality.
>>>> Based on the characteristics described above, we consider the TGU as a
>>>> helper in the CoreSight subsystem. Its master device is the TPDM, which
>>>> can transmit signals from other subsystems, and we reuse the existing
>>>> ports mechanism to link the TPDM to the connected TGU.
>>>
>>> Please remove the coresight_device and other dependencies. You may use
>>> generic bits, CS_LOCK/UNLOCK etc. But including coresight-priv.h is
>>> not something I would prefer. It brings in unnecessary dependencies
>>> between two subsystems and I don't see any reason for using -priv.h.
>>> It is named as it is, for a reason, coresight private definitions.
>>>
>>>
>>>>
>>>> Here is a detailed example to explain how to use the TGU:
>>>>
>>>> In this example, the TGU is configured to use 2 conditions, 2 steps, 
>>>> and
>>>> the timer. The goal is to look for one of two patterns which are 
>>>> generated
>>>> from TPDM, giving priority to one, and then generate a trigger once the
>>>> timer reaches a certain value. In other words, two conditions are used
>>>> for the first step to look for the two patterns, where the one with the
>>>> highest priority is used in the first condition. Then, in the second 
>>>> step,
>>>> the timer is enabled and set to be compared to the given value at each
>>>> clock cycle. These steps are better shown below.
>>>>                |-----------------|
>>>>                |                 |
>>>>                |       TPDM      |
>>>>                |                 |
>>>>                |-----------------|
>>>>                         |
>>>>                         |
>>>>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
>>>> ------
>>>>      |                  | 
>>>>                                                  |
>>>>      |                  | |--------------------| |
>>>>      |    |---- --->    |                          |  Go to next 
>>>> steps  | |
>>>>      |    |             |                |--- ---> |  Enable 
>>>> timer      | |
>>>>      |    |             v                |         | 
>>>>                     | |
>>>>      |    |    |-----------------|       | |--------------------| |
>>>>      |    |    |                 |  Yes  |                    | 
>>>>            |
>>>>      |    |    |   inputs==0xB   | ----->|                    | 
>>>> <-------- |
>>>>      |    |    |                 |       |                    | No | |
>>>>      | No |    |-----------------|       | v         | |
>>>>      |    |             |                | |-----------------| | |
>>>>      |    |             |                |          | | | |
>>>>      |    |             |                |          |      timer>=3 
>>>> |-- |
>>>>      |    |             v                |          | |   |
>>>>      |    |    |-----------------|       | |-----------------|   |
>>>>      |    |    |                 |  Yes  |                    | 
>>>>            |
>>>>      |    |--- |   inputs==0xA   | ----->|                    | 
>>>> Yes       |
>>>>      |         |                 |                            | 
>>>>            |
>>>>      |         |-----------------| v           |
>>>>      | |-----------------|   |
>>>>      |                                              | |   |
>>>>      |                                              |      Trigger | 
>>>>    |
>>>>      |                                              | |   |
>>>>      | |-----------------|   |
>>>>      |  TGU                                                   | 
>>>>            |
>>>>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- 
>>>> --- -- |
>>>>                                                               |
>>>>                                                               v
>>>>                                                      
>>>> |-----------------|
>>>>                                                      |The 
>>>> controllers  |
>>>>                                                      |which will 
>>>> use   |
>>>>                                                      |triggers 
>>>> further |
>>>>                                                      
>>>> |-----------------|
>>>>
>>>> steps:
>>>>      1. Reset TGU /*it will disable tgu and reset dataset*/
>>>>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>>>>
>>>>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>>>>         priority 1 to 0xB = 0b1011.
>>>>      - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_priority0/reg0
>>>>      - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_priority1/reg0
>>>
>>> Why do they need to be coresight devices and appear on the coresight 
>>> bus if they are not coresight devices ? As I understand they are simply
>>> devices with some sysfs knobs.
>>>
>>> Otherwise, happy with the proposal
>>>
>>>
>>> Suzuki
>>
>> Hi Suzuki,
>>
>> Would it be a good idea to register the TGU device as a platform 
>> device so that it will appear under "/sys/devices/platform/" and the 
>> code could also be decoupled from coresight-priv.h
> 
> It is already an AMBA device, why do you need this as a platform 
> device ? You are welcome to add a sysfs group "tgu" under the device.
> 
> Suzuki
Practical advice!

Will move it to "/sys/bus/amba/devices/."

Songwei>
> 
>>
>> BRs,
>> Songwei>
>>>
>>>
>>>
>>>>
>>>>      Note:
>>>>          Bit distribution diagram for each priority register
>>>> |-------------------------------------------------------------------|
>>>>      |   Bits          |       Field Nam   | Description              |
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      |                 |                   | 00 = bypass for OR 
>>>> output   |
>>>>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND 
>>>> output  |
>>>>      |                 |                   | 10 = sense input '0' is 
>>>> true|
>>>>      |                 |                   | 11 = sense input '1' is 
>>>> true|
>>>> |-------------------------------------------------------------------|
>>>>      These bits are used to identify the signals we want to sense, with
>>>>      a maximum signal number of 140. For example, to sense the signal
>>>>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>>>>      represents 1010. The remaining bits are set to 1, as we want to 
>>>> use
>>>>      AND gate to summarize all the signals we want to sense here. For
>>>>      rising or falling edge detection of any input to the priority, set
>>>>      the remaining bits to 0 to use an OR gate.
>>>>
>>>>      3. look for the pattern for priority_i i=0,1.
>>>>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_condition_decode/reg0
>>>>      - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_condition_decode/reg1
>>>>
>>>> |-------------------------------------------------------------------------------|
>>>>      |   Bits          |    Field Nam        | 
>>>> Description                |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |For each decoded 
>>>> condition, this       |
>>>>      |      24         |       NOT           |inverts the output. If 
>>>> the condition   |
>>>>      |                 |                     |decodes to true, and 
>>>> the NOT field     |
>>>>      |                 |                     |is '1', then the 
>>>> output is NOT true.   |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |      21         |  BC0_COMP_ACTIVE    |comparator will be 
>>>> actively included in|
>>>>      |                 |                     |the decoding of this 
>>>> particular        |
>>>>      |                 |                     | 
>>>> condition.                             |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |                 |                     |comparator will need 
>>>> to be 1 to affect |
>>>>      |      20         |   BC0_COMP_HIGH     |the decoding of this 
>>>> condition.        |
>>>>      |                 |                     |Conversely, a '0' here 
>>>> requires a '0'  |
>>>>      |                 |                     |from the 
>>>> comparator                    |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |      17         |                     |comparator will be 
>>>> actively included in|
>>>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>>>> particular        |
>>>>      |                 |                     | 
>>>> condition.                             |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |                 |                     |comparator will need 
>>>> to be 1 to affect |
>>>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>>>> particular        |
>>>>      |                 |                     |condition.Conversely, 
>>>> a 0 here         |
>>>>      |                 |                     |requires a '0' from 
>>>> the comparator     |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from Priority_n    |
>>>>      |                 |                     |OR logic will be 
>>>> actively              |
>>>>      |     4n+3        | Priority_n_OR_ACTIVE|included in the 
>>>> decoding of            |
>>>>      |                 |    (n=0,1,2,3)      |this particular 
>>>> condition.             |
>>>>      |                 |                     | 
>>>>                                        |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from Priority_n    |
>>>>      |                 |                     |will need to be '1' to 
>>>> affect the      |
>>>>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this 
>>>> particular            |
>>>>      |                 |    (n=0,1,2,3)      |condition. Conversely, 
>>>> a '0' here      |
>>>>      |                 |                     |requires a '0' from 
>>>> Priority_n OR logic|
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from Priority_n    |
>>>>      |                 |                     |AND logic will be 
>>>> actively             |
>>>>      |     4n+1        |Priority_n_AND_ACTIVE|included in the 
>>>> decoding of this       |
>>>>      |                 |  (n=0,1,2,3)        |particular 
>>>> condition.                  |
>>>>      |                 |                     | 
>>>>                                        |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from Priority_n    |
>>>>      |                 |                     |AND logic will need to 
>>>> be '1' to       |
>>>>      |      4n         | Priority_n_AND_HIGH |affect the decoding of 
>>>> this            |
>>>>      |                 |   (n=0,1,2,3)       |particular condition. 
>>>> Conversely,      |
>>>>      |                 |                     |a '0' here requires a 
>>>> '0' from         |
>>>>      |                 |                     |Priority_n AND 
>>>> logic.                  |
>>>> |-------------------------------------------------------------------------------|
>>>>      Since we use `priority_0` and `priority_1` with an AND output 
>>>> in step 2, we set `0x3`
>>>>      and `0x30` here to activate them.
>>>>
>>>>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the 
>>>> conditions
>>>>         are met then the next step will be step 1 and the timer will 
>>>> be enabled.
>>>>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_condition_select/reg0
>>>>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step0_condition_select/reg1
>>>>
>>>> |-----------------------------------------------------------------------------|
>>>>      |   Bits          |       Field Nam   | 
>>>> Description                |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This field defines the 
>>>> next step the   |
>>>>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the 
>>>> associated     |
>>>>      |                 |                   |Condition and 
>>>> Step.                    |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |For each possible output 
>>>> trigger       |
>>>>      |    13           |     TRIGGER       |available, set a '1' if 
>>>> you want       |
>>>>      |                 |                   |the trigger to go active 
>>>> for the       |
>>>>      |                 |                   |associated condition and 
>>>> Step.         |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will cause BC0 to 
>>>> increment if the|
>>>>      |    9            |     BC0_INC       |associated Condition is 
>>>> decoded for    |
>>>>      |                 |                   |this 
>>>> step.                             |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will cause BC0 to 
>>>> decrement if the|
>>>>      |    8            |     BC0_DEC       |associated Condition is 
>>>> decoded for    |
>>>>      |                 |                   |this 
>>>> step.                             |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will clear BC0 
>>>> count value to 0 if|
>>>>      |    7            |     BC0_CLEAR     |the associated Condition 
>>>> is decoded    |
>>>>      |                 |                   |for this 
>>>> step.                         |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will cause TC0 to 
>>>> increment until |
>>>>      |    3            |     TC0_ENABLE    |paused or cleared if the 
>>>> associated    |
>>>>      |                 |                   |Condition is decoded for 
>>>> this step.    |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will cause TC0 to 
>>>> pause until     |
>>>>      |    2            |     TC0_PAUSE     |enabled if the 
>>>> associated Condition    |
>>>>      |                 |                   |is decoded for this 
>>>> step.              |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will clear TC0 
>>>> count value to 0   |
>>>>      |    1            |     TC0_CLEAR     |if the associated 
>>>> Condition is         |
>>>>      |                 |                   |decoded for this 
>>>> step.                 |
>>>> |-----------------------------------------------------------------------------|
>>>>      |                 |                   |This will set the done 
>>>> signal to the   |
>>>>      |    0            |     DONE          |TGU FSM if the 
>>>> associated Condition    |
>>>>      |                 |                   |is decoded for this 
>>>> step.              |
>>>> |-----------------------------------------------------------------------------|
>>>>      Based on the distribution diagram, we set `0x20008` for 
>>>> `priority0` and `priority1` to
>>>>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
>>>>
>>>>      5. activate the timer comparison for this step.
>>>>      -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step1_condition_decode/reg0
>>>>
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |      17         |                     |comparator will be 
>>>> actively included in|
>>>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>>>> particular        |
>>>>      |                 |                     | 
>>>> condition.                             |
>>>> |-------------------------------------------------------------------------------|
>>>>      |                 |                     |When '1' the output 
>>>> from the associated|
>>>>      |                 |                     |comparator will need 
>>>> to be 1 to affect |
>>>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>>>> particular        |
>>>>      |                 |                     |condition.Conversely, 
>>>> a 0 here         |
>>>>      |                 |                     |requires a '0' from 
>>>> the comparator     |
>>>> |-------------------------------------------------------------------------------|
>>>>      Accroding to the decode distribution diagram , we give 0x30000 
>>>> here to set 16th&17th bit
>>>>      to enable timer comparison.
>>>>
>>>>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 
>>>> once the timer
>>>>         has reached the given value.
>>>>      - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step1_condition_select/reg0
>>>>
>>>>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>>>>         i.e. when the timer reaches 3.
>>>>      - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/ 
>>>> step1_condition_select/default
>>>>
>>>>      Note:
>>>>          1. 'default' register allows for establishing the resultant 
>>>> action for
>>>>          the default condition
>>>>
>>>>          2. Trigger:For each possible output trigger available from
>>>>          the Design document, there are three triggers: interrupts, 
>>>> CTI,
>>>>          and Cross-TGU mapping.All three triggers can occur, but
>>>>          the choice of which trigger to use depends on the user's
>>>>          needs.
>>>>
>>>>      8. Compare the timer to 3 in step 1.
>>>>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/ 
>>>> reg0
>>>>
>>>>      9. enale tgu
>>>>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
>>>> ---
>>>> Link to V7: https://lore.kernel.org/all/20251104064043.88972-1- 
>>>> songwei.chai@oss.qualcomm.com/
>>>>
>>>> Changes in V8:
>>>> - Add "select" section in bindings.
>>>> - Update publish date in "sysfs-bus-coresight-devices-tgu".
>>>> ---
>>>> Link to V6: https://lore.kernel.org/all/20250709104114.22240-1- 
>>>> songchai@qti.qualcomm.com/
>>>>
>>>> Changes in V7:
>>>> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 
>>>> 'drivers/hwtracing/qcom/'.
>>>> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
>>>> - Perform the 'calculate_array_location' separately, instead of 
>>>> doing it within the function.
>>>> - Update the sender email address.
>>>> ---
>>>> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1- 
>>>> quic_songchai@quicinc.com/
>>>>
>>>> Changes in V6:
>>>> - Replace spinlock with guard(spinlock) in tgu_enable.
>>>> - Remove redundant blank line.
>>>> - Update publish date and contact member's name in "sysfs-bus- 
>>>> coresight-devices-tgu".
>>>> ---
>>>> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/ 
>>>> cover/20250423101054.954066-1-quic_songchai@quicinc.com/
>>>>
>>>> Changes in V5:
>>>> - Update publish date and kernel_version in "sysfs-bus-coresight- 
>>>> devices-tgu"
>>>> ---
>>>> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1- 
>>>> quic_songchai@quicinc.com/
>>>>
>>>> Changes in V4:
>>>> - Add changlog in coverletter.
>>>> - Correct 'year' in Copyright in patch1.
>>>> - Correct port mechansim description in patch1.
>>>> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer- 
>>>> counters' from dt-binding
>>>> and set them through reading DEVID register as per Mike's suggestion.
>>>> - Modify tgu_disable func to make it have single return point in 
>>>> patch2 as per
>>>> Mike's suggestion.
>>>> - Use sysfs_emit in enable_tgu_show func in ptach2.
>>>> - Remove redundant judgement in enable_tgu_store in patch2.
>>>> - Correct typo in description in patch3.
>>>> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in 
>>>> pacth3 as
>>>> per Mike's suggestion.
>>>> - Remove tgu_dataset_ro definition in patch3
>>>> - Use #define constants with explanations of what they are rather than
>>>> arbitrary magic numbers in patch3 and patch4.
>>>> - Check -EINVAL before using 'calculate_array_location()' in array 
>>>> in patch4.
>>>> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
>>>> - Document the value needed to initiate the reset in pacth7.
>>>> - Check "value" in 'reset_tgu_store' and bail out with an error code 
>>>> if 0 in patch7.
>>>> - Remove dev_dbg in 'reset_tgu_store' in patch7.
>>>> ---
>>>> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1- 
>>>> quic_songchai@quicinc.com/
>>>>
>>>> Changes in V3:
>>>> - Correct typo and format in dt-binding in patch1
>>>> - Rebase to the latest kernel version
>>>> ---
>>>> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1- 
>>>> quic_songchai@quicinc.com/
>>>>
>>>> Changes in V2:
>>>>   - Use real name instead of login name,
>>>>   - Correct typo and format in dt-binding and code.
>>>>   - Bring order in tgu_prob(declarations with and without 
>>>> assignments) as per
>>>> Krzysztof's suggestion.
>>>>   - Add module device table in patch2.
>>>>   - Set const for tgu_common_grp and tgu_ids in patch2.
>>>>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
>>>> ---
>>>>
>>>> Songwei Chai (7):
>>>>    dt-bindings: arm: Add support for Qualcomm TGU trace
>>>>    qcom-tgu: Add TGU driver
>>>>    qcom-tgu: Add signal priority support
>>>>    qcom-tgu: Add TGU decode support
>>>>    qcom-tgu: Add support to configure next action
>>>>    qcom-tgu: Add timer/counter functionality for TGU
>>>>    qcom-tgu: Add reset node to initialize
>>>>
>>>>   .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>>>>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  92 +++
>>>>   drivers/Makefile                              |   1 +
>>>>   drivers/hwtracing/Kconfig                     |   2 +
>>>>   drivers/hwtracing/qcom/Kconfig                |  18 +
>>>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>>>   drivers/hwtracing/qcom/tgu.c                  | 737 ++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/qcom/tgu.h                  | 252 ++++++
>>>>   8 files changed, 1156 insertions(+)
>>>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>>>> devices-tgu
>>>>   create mode 100644 Documentation/devicetree/bindings/arm/ 
>>>> qcom,tgu.yaml
>>>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>>>
>>>
>>
> 


