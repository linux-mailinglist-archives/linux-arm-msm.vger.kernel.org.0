Return-Path: <linux-arm-msm+bounces-64253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770FAFEC10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D53D547CCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE572E5421;
	Wed,  9 Jul 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLuXi082"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE3838F9C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071538; cv=none; b=u5/nJuRvvYji6AY5t37V1vj7JXLEDmw4KbSyxzVbBlrpLwOthWBlTC/HEXXoaWrBGaqo+22wTFltPQ8Lctb6tyfMk1jUmxMEdUwg3u9aAgrolvzHLwkr0IsK0bwzVwBuG1w201ZbXziO8Da8+/eRJOVwP5IeOKWiMorwmkbJGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071538; c=relaxed/simple;
	bh=MLDmZWGtCeQUH3jn9zi179PGInEvx2xAfAzciMYvzNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCGTqLr/86EEawYEYXxJegPqv2gC0rAWIS6E4sjHIiAPhaGx9buJHeqfJZEW2oTd3T8ba7LQR6z0XIr4CYU5i2gz09L58+3Q6ALTjSCLvjcQFGikZ7nHV2LpjMhKXxkIIMQtKaV4sjS6ua46yontC8TGk5E9scP1Tt/TdPF/ZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLuXi082; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CoZvp009945
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 14:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fAbmRtBzZx08PigSnVIImcLDXKwCyMY6JVo02jWRg=; b=VLuXi082q/mqp72k
	qRRPuXwuaBc68yx6mPMqNF2M4q+dV7CUBDt0ek5ZRPB9PHP+kPRUA6EGFgQ4e3cQ
	rTvOSiUDbB2DeCYM8OZNvEsLyoBQhp+r9dg4/lsGHL+jsY4qa1bOJ59sk07ReKEl
	5r3V5LSfPu8zhV5/tIjPbiwqtqqNVTko+9aGEejjI9iyFWdQYgikSbX6NJ0rqN5Y
	MyrvWoEKJa7wPIjFbnj43f2FVsBB2eaaVQXaNYezfkp/IDE8wjob4gAWrhkpX2dL
	Rr431YomE1RKlYCkv9Np916V2YMjSKmpKXUwkWeTtCQl96AUOkqEd9Pag49V3H0r
	S8MtDw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dsc5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 14:32:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so4021685a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071534; x=1752676334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5fAbmRtBzZx08PigSnVIImcLDXKwCyMY6JVo02jWRg=;
        b=fpADUMhTueS4k5MhCf+OPbTVG/AgeY9EhqX9U4MnfWOYdA6A8px54/zS7hePaeAsep
         xuiorhplGicIEPnYHbQQZfULrfgFvQ2Km8847L+KOETd/u3VXoVsiTVebAJpA3wWmptx
         em7tA1RgyIj5L3bOJaEthUGRuPykLNoT7sD7YJItvq6zXIYmkzXcPzDUcg/0booQvTWY
         9nmRa5Bvb/OOkdxQeE+TESq3moHAh7rsWXY/aHqEf6U1uW47vNVCfrjGoHe+izIXwwZ7
         Q/2vvahEtGobQzHuuxlc971FSNPnBO6/sD/DQTbJVS2JDpVAZ6/aOVp1aLbROB/bJm1e
         rrIw==
X-Forwarded-Encrypted: i=1; AJvYcCVRYLMsDB+4WokauLEfNZYQQwjftLt1pShK02MPtlI0DY8rdC2p/JbMt8UTXSOxHob9yTwBZhg5lZRarAZO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Gh3F2jHTEFnNN7XNF5di6eLVq1VH3kVAn79NvIaG24j2Fxb1
	3Hn4LoeYM7duNA9HgzFeW/JMmaf4ZLTW2tqV6Vb7/3NaBvZZxW875Io9cXG1AVfC3QrwDkJFgTJ
	so242En/LvkWe4qYPmrjz20Urh/XYJGfOw3SpZYCKv0zU9/xL5rI3S9s52GA9Sk9nBKlp
X-Gm-Gg: ASbGncscfUbQ6VsMoZQ8EUAjdAsM9QXdjYiMCPVT2+6FjRyhvkJomDwavjtMd3cezZU
	vWwQGUW21A9Kq9kD5S7gmV2SvG9pSz6f+5pdFo8mV168/9kkWg/qZ3qHEX9xZ9c84M1R3jgYiCl
	Hxn9d5rJ4E4TjWXC1z0BqX505EguGGsah3wy5t9P7tE6VL8kTq90vDexF8WFMtAZLptwabGuDLa
	nNZxpBwLs142sU3aKMj+4sq2KHPxCablZv4q1KF95EdJyLHcSPvh0nplz89p0/07VYvwpCYwYot
	LNMbmdr8/VlLEISnCn/BXlFP3j2aA9SCCqq4sRXlrO9ddtrA0d8tkJYHLhtPcauehVGVRzVM
X-Received: by 2002:a17:90a:e7c6:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31c3c305023mr138127a91.34.1752071534244;
        Wed, 09 Jul 2025 07:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiLVofoEBD+I/f3QFdZJ1EdevVdfAxr4t5VwdXi6k5sKycdxh1mB+D0EBHKBfBqj6iCpJfTQ==
X-Received: by 2002:a17:90a:e7c6:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31c3c305023mr138082a91.34.1752071533681;
        Wed, 09 Jul 2025 07:32:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3003d2e8sm2382998a91.8.2025.07.09.07.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 07:32:13 -0700 (PDT)
Message-ID: <58baef06-8066-428d-ad72-7bb4cb537085@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 08:32:11 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Youssef Samir <quic_yabdulra@quicinc.com>,
        manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
 <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
 <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>
 <4atrwojcbhzzegixeyzulldmhp655rcqn4pccbchlrp3gvyzvh@mhcgkjkgfkzb>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4atrwojcbhzzegixeyzulldmhp655rcqn4pccbchlrp3gvyzvh@mhcgkjkgfkzb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xWOzqicP-fNaNGXXmVv9POEhxZT1xq_Y
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686e7d6f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=nlpBPMN-2No23xZClQQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: xWOzqicP-fNaNGXXmVv9POEhxZT1xq_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMSBTYWx0ZWRfX69FjXT2vUkcC
 NNtQ3phjLkTt3EC2zN8HW5m7gc4EMQJr8pEr5EmYmlWu40zfeVaCk2D1ff6NGbJxSD7tsA+Oae7
 zIOBCvD7HOQWRmhIKLBE2QVn3D7O2XAisIUSJvHOfjOUp2C1e9DOFjpBtCF8V4KB5PHAKmFAfQ3
 27GmtF3TUXNa+9+LyXXGxGqbakeKYLV/pBQcITurt5guNYs5jHbcy3HlbwUnCgIWClUIzp7pmw2
 XiVYfoKqA1Fq43QBHmv0d+BVHd8dEQ9HyXyxex+e5ti0vOYebLF6fSs3oYfiNURSAE6ffyoClKA
 c71MVVOxrNT0zsiv6/AerRqoJA6f5NmeV+A4NREdD9ik7cTkHRh3xtZYJ6axfwLbDr4fQSMO124
 2YJ94JAVkJz6V9/6czw69kBviToA1du+8+47mF2K422PZZxvGKIRVgfw5x3WRGHsisl6SHea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090131

On 7/9/2025 5:08 AM, Manivannan Sadhasivam wrote:
> On Tue, Jul 08, 2025 at 11:18:10AM GMT, Jeff Hugo wrote:
>> On 7/8/2025 7:26 AM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
>>>>
>>>>
>>>> On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
>>>>> On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
>>>>>> When a remote device sends a completion event to the host, it contains a
>>>>>> pointer to the consumed TRE. The host uses this pointer to process all of
>>>>>> the TREs between it and the host's local copy of the ring's read pointer.
>>>>>> This works when processing completion for chained transactions, but can
>>>>>> lead to nasty results if the device sends an event for a single-element
>>>>>> transaction with a read pointer that is multiple elements ahead of the
>>>>>> host's read pointer.
>>>>>>
>>>>>
>>>>> How can this happen? I cannot relate this with the scenario mentioned below.
>>>>>
>>>>>> For instance, if the host accesses an event ring while the device is
>>>>>> updating it, the pointer inside of the event might still point to an old
>>>>>> TRE.
>>>>>
>>>>> I cannot interpret this, sorry. The host is supposed to access the ring elements
>>>>> till the RP. Even if the device updates the RP while host is processing the TREs,
>>>>> it should not cause any issues for the host which only sees the used ring
>>>>> elements.
>>>>>
>>>>> Maybe I'm missing something?
>>>>
>>>> Hi Mani,
>>>>
>>>> This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
>>>> aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
>>>> involved the device sending an MSI to host for an event that hasn't had its data
>>>> completely updated. the event could be pointing to a TRE that is not local_rp + 1.
>>>> As you mentioned, the host will process all the TREs until the event's rp,
>>>> which allows it to access data that were freed or hasn't been written to yet.
>>>>
>>>
>>> So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
>>> before triggering MSI? If that's the case, we should add a barrier to make sure
>>> that the RP is updated before raising MSI. Though, I thought that the implicit
>>> barrier offered by the mutex_unlock() would be enough to make sure that the RP
>>> is updated before triggering MSI.
>>
>> No, we are saying that an ep without 'commit 6f18d174b73d ("bus: mhi: ep:
>> Update read pointer only after buffer is written")' can cause the host to
>> crash because the host is trusting the ep, when it shouldn't be.  This patch
>> hardens the host by removing that trust and checking that the ep didn't do
>> something invalid (to the extend that we can detect invalid behavior).
>>
>> The ep updated the ring pointer before it updated the ring contents.
>> Therefore there is a window where the host can see the updated ring pointer,
>> but the ring contents won't be updated therefore the host sees stale data.
>> This is identical to the scenario where the ep updates the ring contents
>> with invalid data (maybe a FW bug), and then updates the ring pointer.  This
>> proposed patch catches both issues and avoids the host consuming the invalid
>> data.
>>
> 
> Ok, makes sense now. This information (with reference to 6f18d174b73d) should be
> present in the commit message to make it self explanatory.

Youssef please send a v2 with this suggestion.

-Jeff

