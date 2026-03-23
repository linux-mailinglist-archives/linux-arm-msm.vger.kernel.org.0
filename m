Return-Path: <linux-arm-msm+bounces-99151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EWpOqQHwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 661212EF0EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A13F130387FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE973890E4;
	Mon, 23 Mar 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bd3tzLgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMv7lVDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF738737A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257601; cv=none; b=RmzpGKnzS4JhZcB/sjAQz0+DC3FD368JEEZMespEIc9aX9nvfAlr6z7d2RV6BiqCFuTcDqlcEPGrf1aeda9pOM2Ful7KTIMvn+CBws89FByX8T5ssfPiAG0IKC8coWhW6Iq+RViGfBW3fwLsgoduJ5AlTtucI7i63s1iA+lTlgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257601; c=relaxed/simple;
	bh=E6PeMWwuZ7Do5d7jRekumyJIWFatcfbhRUHhMcf/ruQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icOR0uJXTBaIYGmOuVottNu1qGdx0wmQAzHZ/1lbX1SX+hH0xQr1yatMVeL39SrlMfMBGKUyErKElIkXlmFNuUXICDDdY5/8yYA1nClfDQLPgSKQhqI9Ry9bap7PjGbIXFlD314/FxV0+QLSJY5XxjPDJypOyDtH7jQUHgEK324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bd3tzLgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMv7lVDL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tBG92291169
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=; b=bd3tzLgw2XKHW0eB
	ipSduEB3ZjuxRqg1bj9diqyAor3UB33obLEN6gWa3cIp07r6YIKdw6171CHLRca5
	cORQuDA1RnO+3jbWwjR06l/8yfE31+aPs7khvqvo+8tIUO84PF1OYpGDqKXVD32N
	UeHiZcXrVHbRVfA8+Rc9ggry02Vbz276rzEKr3HM06G2s5AZbpkcJ30VFJ/Ap/N2
	isjZCUN/U5kbKCDocWgca30YCAyNyGC8BrrevJ5HbETS5mr7htzx/CRG3Zsc9k6+
	3n14lR8EMd3ElgtAo2oSO5KUCko9dZUWeHZPqTwoz0/OEOs6I7qGpeqUvvZdYeNU
	uQBSlA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j7099k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73781252edso17668915a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257598; x=1774862398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=;
        b=aMv7lVDLqR8QYqXYZLphY7eS7u0A2GKPfRPdwkeTAGpzIKe5ssE+G6FDVoRD6Y62H7
         i9ojWO2uimEcsW5hQio00vcMn7XZivWJ+preLDKroINUetWu61/W+/OCd0K03WoDzqQ+
         gihPDjiktPV/IfqlsI3dybDR06XCRVSpDJv44zEEXRy4eTAu6XzY6u53RLx/xMwLpn2d
         mwlBIwweWZcIHidsvVDJOJ9wxMUvHEOwnKdNmAjkaJAkyiHDDBM0Adr9+cmhOwrAg3Sz
         1vMogMmbyaAfblvBwwl5s/SO7oSiYL3XMDJkYIpuhkKpBbkcX6hNLzWv4EGRr6WNuo5b
         r1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257598; x=1774862398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=;
        b=R/ZdvW4F/ZK5EptsKwDLUwxPyEgWbFkvWmyHa5VR82uERAp4hCSO3z9Wa8zI6K0tMj
         tppIVmw/L0r15tPgt1QAFUbhx4i3JMDyOslWfMmLiuKQJ+V777q97tbWuwdNRY6Dxoog
         FGlQgWOpBhSbeb1BnqLy/qPzSRDGLms0FRcTzD1jjGHzuJ8XVsNm0ExhkL8ILNrQ+WNB
         2tirhmNqmc8caWX2P2F/bRQ7Px4SVJcpHvgVQbO7TuZj/izUc/q877xwhVEkwZaIZB1e
         jJMrSIYk9cY7XN18ZZRb7sZsYflB1HM+EY3wgONIYUrKLRbsAypb5inp5pKEMXLqMlHR
         G9bw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+0ALkR9i5lDUs2aSWdoIrGBJ/R/GM3OmYJGapdonqenNjlqhSX7dacM1uPtG8B3xaOYx2aaC9vzQ64wk@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzpW7SNqh+N+sTtiiZV+CX2Qy7WkZL1mYWDzZZrks+fV4HVy7
	D6hb0zOHsf+oVILAN4dR5xev6gvmUvGURdxzkqJJ6PQGvsyo5Ai3z17uIBmpikoV1Qw368961SW
	DahZ/VtquFCJChr08aJn7XYQ9HtuOfC7H+D6Pz7g6SAW0NEoNS8gk0C2DwR+V85lSq6P7
X-Gm-Gg: ATEYQzy9wuuNa7hU61r6w71wE/W2RRd73HbSCZ3tbo79S5CmAlkgc536aKW8ZH/DPJb
	ejP1eCkA9A4gqnYo6EGCQOgy4btbHLWeP+bsAcKzJV8QrT4o0q8abiN+qWSviw9vqeXCf0B+lR7
	WxOpkBcOVI7aoYQvQAG5oPYCAFZ9Iglmf2KCwAeWh9OwyALGW8iKDiJ2vktuYLLcD0xx720hH9F
	XJplh6Jqw4/g6dbNYhtMkEatkYihYMh8xqCnQP/CsVeuvkKZ7X3PlPBI/GX1VnqBT+4X+Mv/Me7
	eaIx24kVMAvAi6t8zN8Qv9Gaxst7aw6tHyXo3A+wD6PUTA0TtTJtAJOLSSdjTe+lqE4fkbD954e
	S0hp8cT95ADjVZJVMSM0xMh0ndskdotsxQymray1tEbBbCLnehNE=
X-Received: by 2002:a05:6a20:430c:b0:39c:1f90:2867 with SMTP id adf61e73a8af0-39c1f903186mr1629755637.59.1774257597938;
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:39c:1f90:2867 with SMTP id adf61e73a8af0-39c1f903186mr1629732637.59.1774257597418;
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74453295a8sm7783715a12.28.2026.03.23.02.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
Message-ID: <9bd9e5c2-fe9a-4329-bf5a-4971ee94faa6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
 <20260320-spirited-gentle-swift-86f50e@sudeepholla>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260320-spirited-gentle-swift-86f50e@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c105be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OBOuRWtVn1CyCTqyaKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ef7XLXAJ3OEyOVi866MTzSVhwxfPDUi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXwBWvqdmdM6vU
 LDo+cQtu7OeZZep/q/qhcEchOKLxBABJm+c2Wvlxxj+Dz4D97iAzH+V6n/fFzaEEMpwIibM1i9X
 /SQL3i75aVC1GHEk4vF0iX8Bev49++la5a9fYVKXPG52aVEBT3RxWeHS2w9RvT8+Kh8j4Xq4PoR
 jwutg4+2zQ8tLa+XVD2hJmKxCU7k0AA/6lT2kTk8w9io1LN/xtEZawmyTNwbTADZEwVvtOuO75R
 SNtmF89UK0ZnTkJmyS1atEE1hMpOjSsy4LbDrs9VGlPJEToZBCBDmzusabwLu+qjPHeCp4dDlbq
 24ZjKlmCddLoLp7W1zk89XId2zVAYgc6HcIpuDzsu/cNo5kcVuGcz4zq+SyDdUJoWtOGBl9nY4G
 1lBBuY35mgdftSKwrzmvrutDiNq/Ob/RbKQvppW/4rZJfSi8GOHUwko0X5YkE8Xc5SEZlrhctts
 1SSzquodX8M77GPVrsQ==
X-Proofpoint-GUID: ef7XLXAJ3OEyOVi866MTzSVhwxfPDUi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99151-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 661212EF0EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 4:40 PM, Sudeep Holla wrote:
> On Fri, Mar 20, 2026 at 11:13:08AM +0100, Lorenzo Pieralisi wrote:
>> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
>>> On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
>>>> On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
>>>>> Successful cpu_suspend() may not always want to return to cpu_resume() to
>>>>> save the work and latency involved.
>>>>>
>>>>> consider a scenario,
>>>>>
>>>>> when single physical CPU (pCPU) is used on different virtual machines (VMs)
>>>>> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
>>>>> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
>>>>> requesting a shallower than powerdown state. The hypervisor aggregates to a
>>>>> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
>>>>> resume the execution at the same place instead of jumping to cpu_resume()
>>>>> as the HW never reached till powerdown state which would have lost the
>>>>> context.
>>>>>
>>>>
>>>> Though I don't fully understand the intention/use-case for presenting the
>>>> VMs with powerdown states ....
>>>>
>>>>> While the vCPU of VM-x had latency impact of saving the context in suspend
>>>>> entry path but having the return to same place saves the latency to restore
>>>>> the context in resume path.
>>>>>
>>>>
>>>> I understand the exit-latency aspect, though the register set involved is not
>>>> very large unless the driver notifier list is sizable on some platforms. This
>>>> is typically the case in Platform Coordinated mode.
>>>>
>>>>> consider another scenario,
>>>>>
>>>>> Newer CPUs include a feature called “powerdown abandon”. The feature is
>>>>> based on the observation that events like GIC wakeups have a high
>>>>> likelihood of happening while the CPU is in the middle of its powerdown
>>>>> sequence (at wfi). Older CPUs will powerdown and immediately power back
>>>>> up when this happens. The newer CPUs will “give up” mid way through if
>>>>> no context has been lost yet. This is possible as the powerdown operation
>>>>> is lengthy and a large part of it does not lose context [1].
>>>>>
>>>>
>>>> When you say "large part" above, do you mean that none of the CPU context, as
>>>> visible to software, is lost? Otherwise, we would need to discuss that "large
>>>> part" in more detail. From the kernel point of view, this is a simple boolean:
>>>> context is either lost or retained. Anything in between is not valid, as we do
>>>> not support partial context loss.
>>>>
>>>>> As the wakeup arrived after SW powerdown is done but before HW is fully
>>>>> powered down. From SW view this is still a successful entry to suspend
>>>>> and since the HW did not loose the context there is no reason to return at
>>>>> entry address cpu_resume() to restore the context.
>>>>>
>>>>
>>>> Yes, that may be worth considering from an optimization perspective. However,
>>>> if the hardware aborts the transition, then returning success regardless of the
>>>> software state should still be counted as a failure. That would keep the
>>>> cpuidle entry statistics more accurate than returning success. And it is
>>>> a failure as the OS expected to enter that powerdown state but there was
>>>> as H/W abort.
>>>>
>>>>> Remove forcing the failure at kernel if the execution does not resume at
>>>>> cpu_resume() as kernel has no reason to treat such returns as failures
>>>>> when the firmware has already filled in return as success.
>>>>>
>>>>
>>>> This is not possible with the current PSCI spec:
>>>> "Powerdown states do not return on success because restart is through the
>>>> entry point address at wakeup."
>>>>
>>>
>>> OK, my bad. Sorry for that.
>>> For some reason, I read "do not return" as "must not return".
>>>
>>> The spec allows this:
>>>   |  The caller must not assume that a powerdown request will return using the
>>>   |  specified entry point address. The powerdown request might not complete due,
>>>   |  for example, to pending interrupts. It is also possible that, because of
>>>   |  coordination with other cores, the actual state entered is shallower
>>>   |  than the one requested. Because of this it is possible for an
>>>   |  implementation to downgrade the powerdown state request to a standby
>>>   |  state. In the case of a downgrade to standby, the implementation
>>>   |  returns at the instruction following the PSCI call, at the Exception
>>>   |  level of the caller, instead of returning by the specified entry point
>>>   |  address. The return code in this case is SUCCESS. In the case of an
>>>   |  early return due to a pending wakeup event, the implementation can
>>>   |  return at the next instruction, with a return code of SUCCESS, or
>>>   |  resume at the specified entry point address
>>>
>>> So we need to dig and check if there was any reason for returning "NOT
>>> SUPPORTED" when the call returned success.
>>
>> Because we have no clue whatsoever about what happened. We need to get
>> back to the cpu_suspend() caller and either say "we entered state X instead
>> of Y" or report a failure (because an interrupted power down sequence *is* a
>> failure for Linux - unless we want to make things up), we just can't know so
>> to me the code seems good as it is (we can debate about the error code, yes
>> but the gist does not change).
>>
> 
> Completely agreed. The current code clearly survives a successful return, so,
> in my opinion, nothing is broken. It is really just a matter of exploring
> whether there is a better way to express this error condition. I doubt that is
> possible, since it is either success or error; it cannot be both.
> 
> Just to clarify, my earlier comment was purely about the error code, not about
> success versus error.
> 
>> Is that we want to tell CPUidle that entering the state was successful even if
>> the power down sequence was interrupted or the state demoted ?
> 
> That sounds like the ask to me, but that would be incorrect.
> 
>> That's tantamount to lying IMO and would skew the power stats, no ?
>>
> 
> Yes, I agree.
> 
>> Let me know, I am just trying to understand this patch's goal.
>>
> 
> I will let Maulik present his opinion, as I am aligned with you, Lorenzo.
> 

Thank you for the review.

The goal is to optimize the exit latency even if register set involved to restore
may not be of considerable size, saving scales up with multiple CPUs and multiple
VMs running.

This is achieved when the cpu resumes the execution at the same place,
however with this, i am seeing that idle states are rejected because of forcing the
error from Linux.

Consider an example scenario listed in commit text for multiple virtual machines,

VM‑X: Power‑Down ─┐
                  ├─ Hypervisor Aggregation to Retention
VM‑Y: Retention ──┘

A resume to the same place is today treated as failure in VM-X's cpuidle statistics,
A cpuidle governor may then become less aggressive towards next entry to power down state
as it has seen a error for the previously entered mode.

Such a scenario should not impact VM-X to re-select a power down state for CPU,
for this reason the VM-X need to treat the resume at the same place as "success",
when the firmware says so.

Thanks,
Maulik

