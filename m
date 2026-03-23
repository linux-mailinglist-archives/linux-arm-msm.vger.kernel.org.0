Return-Path: <linux-arm-msm+bounces-99190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBQxFZwXwWmcQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:36:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A92F0366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 386F6305EB91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4702D9ECB;
	Mon, 23 Mar 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8QyRy+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeinExSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F638C417
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261841; cv=none; b=f7fNb04qpsPibnsYASjuXGfp7tYhqgx20VFWPDFtInqcD4Lfn+nLW0SkGRxKDXMW74keROruICHCNmZPEfdr4GjtrvvulirD2qrUA2cIS8usZgr2DNRLiAUJHJFDm+wEzxsuBlsFTdqjAHusxR+mUdbhL6qWmCqakJCTdgzv+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261841; c=relaxed/simple;
	bh=PGeHoXrM0aGa426MFoD81uuMl8iOJpDAX5Lr4oYDAYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8GqjeceNQ0nVLiSI1T4q/vhvRgnuFTgpgJals13sIiK/PiEHO3SlRbk7UKSw1gsl9TyaKmtagzbmoIc1+4p7Ld2dr68n0HKjmy3UHhUxXarSfWAUTQ/9RBuVUQpM519+zskljnbJl00N76nuv9ZANsgfPG67HKnoMVFxkoT1MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8QyRy+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeinExSZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7eeLf3237007
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=; b=o8QyRy+c+UA/P3tO
	V5+b6c5PN7REtH9pSlnDcTkehbuhGo85D5G55B8c0S2boGM0Nj1xDBAq5rJPfk9O
	VhqhBLCE1KG2SaV6Qv9rIZmyx+EzaguCPjoJlB2ndwUFtr41KRuhRrKiMO6Tp3r9
	3cqXmR/UljsklQAe/RBAbm4vqPtRu4TP26MQvuwimq++1MTxAhcd4CYo+cRfya/x
	D3lcBUBYu4iA1jOBWmBqq0I5TqrYKvEIehYMNSo2HIXhRIO9KC2F+RWQtqT7+ZJp
	/3xtHSn+eQA2va2JafD9ouL9RZ7USemFDG6iKIgm1VJh7Nch4kB+WF7bEFUAFQoQ
	rDPXqg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4xx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:30:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a855dc82aso2619253b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261837; x=1774866637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=;
        b=eeinExSZtG2N5ctW0TJ3O4NfzBvgvXnMJIkqBvCi8bujC96sjz1PI+cEcWDnTwJbpb
         dORyecBuXgyvvYXYtacxVXL9FVrrgeG7El+Lk42OZsEfibsvGz7N/Ihd1yEdAxHfveGw
         P5+K00nLJPvmpSd2GxtbtFmJQ/RFqDAM+aODZ81MZy+Hj1N5trk4k7IXj0aOyIBddyUV
         U/22G4URf4Q7+62HtJ+oJX0Z0bxTjgHRcWigdWg8eHKVotGLB4Qt+LgUSY7e2tCZDrW3
         NBKRGZqzGBqGNoP4+tYMkAmavk+hyRjOJW3SDOOUas6zpvYIhBtqqb4Fdb3Rt3aBIvT9
         KFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261837; x=1774866637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=;
        b=Xndf8NprfdldneBveXCQwJ8zYERNeD85hfWWaXYANbwHTukFStADZT3XAIYhTmFTVq
         cOZ3pqJN2G+4hYOBRFccdLx5cN4Eeb8y5K7TQhEVNreafJYffGpDNesdt8YCtWlvZmPU
         dayxFa1s2xHK40Kypsy+j8Xc9VVNt/v4T0miEouUmMa8u8rMOyAOiQC6s87FyShjzb0k
         9M2K3nwMGXLFA8mVzUOb5vbJ9SiDNXcQPsizxMrSuTE+FM/6ddBpJ7ZoTT7/vbSWWoV4
         NvkoB29nUdCfJEVH9g61s1RYILzrGyliqQf22+cH8IeW9rGNJALQ6GYLd1MzCGbJBRuV
         0Vhg==
X-Forwarded-Encrypted: i=1; AJvYcCX45m7TPRanmtkBmtCuRnA/HSNkldhAvrBXH9F0K2VMJaSkSU2fJLvkfseA/sh+9QTOjxp8X7PMD8RMGwkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnuEi2S+uFpgQfOhvm+2eb81pGQGqKkC5yr1pgOgaHiNfsK9b
	DGFOr2D0qHDijrR+p1aJR4otWNJoLngA2PvovT5lKGR+goEx32M8OhujPurc8IcCK/XSb95w7QC
	OVoFGV2pMrQ7xqRh061hQenbQP0cHgC3jGjwvWeD4mE10lIY27HBGFTj8IFJBhXwUYrJM
X-Gm-Gg: ATEYQzwuJ9Exa5H0jnfGo5tU931WFgUlS9lJPjJVrzq3UE6ELFP8MpjpLHAu9az8StW
	v8Mhoe4jjeNLd1WmsnPwKP81TmQoSMtrzrmnIiicWKcs5j1HfgQzqUTGaPbolQzsR5bWpKlGE9C
	VF9bvz4nWqmO3hC21OtYMRYWb4dvo4meL4ATtbftLcnunpeFvPCmfiAvuAMr1p7GyaoBSwcaTva
	ehjMXljM7qskMMn4Vc87u+FGEQda5J6OwTHK/6R8lllotWWyI+KCuoqowyw0tBUJbK2qy7qdGN5
	NoWOXzGpN8wfEi55qQ5nUFPNA9Acz0gZHnRR6rKLmCwIg3PmMunAHmNkw6ncyggXPV/iY3Rvtm2
	kMEtCuzvoYaZBAxLhXlqKw+URXgughOyhCKQUilmNp1qP6FboQHs=
X-Received: by 2002:a05:6a00:90a9:b0:829:7d1c:29ff with SMTP id d2e1a72fcca58-82a8c3bbe78mr8823402b3a.57.1774261837372;
        Mon, 23 Mar 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:829:7d1c:29ff with SMTP id d2e1a72fcca58-82a8c3bbe78mr8823381b3a.57.1774261836829;
        Mon, 23 Mar 2026 03:30:36 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm10764014b3a.61.2026.03.23.03.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:30:36 -0700 (PDT)
Message-ID: <0226804b-daea-4d8c-8b68-d3894a5f323e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:00:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ab0dtAC+bPtc9gdT@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fNage8dEXvFxghQmOvajcKhdTmhm6SzO
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c1164e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xgOq5MlI_ZTffzCLE8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fNage8dEXvFxghQmOvajcKhdTmhm6SzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX7/dTH6lJOg7I
 CiI41e9YHZ0xbJfWm79aUDI8K2LwnR3sILs5iEPfAIq/F/wm4JurHio9XA7Pnqxsx/zj716r+tC
 E+m6WV++uRu64Z5ZeEeAhtg4yze8YIbctxzc3xpOr7ITbbH2Ia87lfbV+zIJLsg8dZuEAJmZsfr
 8Bg62L8Zl2qh1roQZr4KdGpFEFYnQCF29FwVh9lvr186mRtayjomGmmthud41SAwzoZY7C9nITK
 o3DCWGe7rTdSKqwbN2lx/eIKkkWCFz0+EaCFvJRotyrWOlfFerOYk4H4SF14z5N4MSSy0GCM333
 T14u8IeRTw3Z/Alhm3a+XgwIz/i/T0ZAImD8n5DJJEm/FTw9utxfEpPgdLuhy+PIfHUXbODCc9X
 K0VH2tyBvO3g9rj3OiW3yhvP12Nopg9UvYboT0bbEguTbkYWh2v3VaB6ACqSTz0/Mk2IQxrmGfK
 n3DNxpOYMJIumfSLEkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99190-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C07A92F0366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 3:43 PM, Lorenzo Pieralisi wrote:
> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
>> On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
>>> On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
>>>> Successful cpu_suspend() may not always want to return to cpu_resume() to
>>>> save the work and latency involved.
>>>>
>>>> consider a scenario,
>>>>
>>>> when single physical CPU (pCPU) is used on different virtual machines (VMs)
>>>> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
>>>> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
>>>> requesting a shallower than powerdown state. The hypervisor aggregates to a
>>>> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
>>>> resume the execution at the same place instead of jumping to cpu_resume()
>>>> as the HW never reached till powerdown state which would have lost the
>>>> context.
>>>>
>>>
>>> Though I don't fully understand the intention/use-case for presenting the
>>> VMs with powerdown states ....
>>>
>>>> While the vCPU of VM-x had latency impact of saving the context in suspend
>>>> entry path but having the return to same place saves the latency to restore
>>>> the context in resume path.
>>>>
>>>
>>> I understand the exit-latency aspect, though the register set involved is not
>>> very large unless the driver notifier list is sizable on some platforms. This
>>> is typically the case in Platform Coordinated mode.
>>>
>>>> consider another scenario,
>>>>
>>>> Newer CPUs include a feature called “powerdown abandon”. The feature is
>>>> based on the observation that events like GIC wakeups have a high
>>>> likelihood of happening while the CPU is in the middle of its powerdown
>>>> sequence (at wfi). Older CPUs will powerdown and immediately power back
>>>> up when this happens. The newer CPUs will “give up” mid way through if
>>>> no context has been lost yet. This is possible as the powerdown operation
>>>> is lengthy and a large part of it does not lose context [1].
>>>>
>>>
>>> When you say "large part" above, do you mean that none of the CPU context, as
>>> visible to software, is lost? Otherwise, we would need to discuss that "large
>>> part" in more detail. From the kernel point of view, this is a simple boolean:
>>> context is either lost or retained. Anything in between is not valid, as we do
>>> not support partial context loss.
>>>
>>>> As the wakeup arrived after SW powerdown is done but before HW is fully
>>>> powered down. From SW view this is still a successful entry to suspend
>>>> and since the HW did not loose the context there is no reason to return at
>>>> entry address cpu_resume() to restore the context.
>>>>
>>>
>>> Yes, that may be worth considering from an optimization perspective. However,
>>> if the hardware aborts the transition, then returning success regardless of the
>>> software state should still be counted as a failure. That would keep the
>>> cpuidle entry statistics more accurate than returning success. And it is
>>> a failure as the OS expected to enter that powerdown state but there was
>>> as H/W abort.
>>>
>>>> Remove forcing the failure at kernel if the execution does not resume at
>>>> cpu_resume() as kernel has no reason to treat such returns as failures
>>>> when the firmware has already filled in return as success.
>>>>
>>>
>>> This is not possible with the current PSCI spec:
>>> "Powerdown states do not return on success because restart is through the
>>> entry point address at wakeup."
>>>
>>
>> OK, my bad. Sorry for that.
>> For some reason, I read "do not return" as "must not return".
>>
>> The spec allows this:
>>   |  The caller must not assume that a powerdown request will return using the
>>   |  specified entry point address. The powerdown request might not complete due,
>>   |  for example, to pending interrupts. It is also possible that, because of
>>   |  coordination with other cores, the actual state entered is shallower
>>   |  than the one requested. Because of this it is possible for an
>>   |  implementation to downgrade the powerdown state request to a standby
>>   |  state. In the case of a downgrade to standby, the implementation
>>   |  returns at the instruction following the PSCI call, at the Exception
>>   |  level of the caller, instead of returning by the specified entry point
>>   |  address. The return code in this case is SUCCESS. In the case of an
>>   |  early return due to a pending wakeup event, the implementation can
>>   |  return at the next instruction, with a return code of SUCCESS, or
>>   |  resume at the specified entry point address
>>
>> So we need to dig and check if there was any reason for returning "NOT
>> SUPPORTED" when the call returned success.
> 
> Because we have no clue whatsoever about what happened. We need to get
> back to the cpu_suspend() caller and either say "we entered state X instead
> of Y" or report a failure (because an interrupted power down sequence *is* a
> failure for Linux - unless we want to make things up), we just can't know so
> to me the code seems good as it is (we can debate about the error code, yes
> but the gist does not change).
> 
> Is that we want to tell CPUidle that entering the state was successful even if
> the power down sequence was interrupted or the state demoted ? That's
> tantamount to lying IMO and would skew the power stats, no ?

In this case, The power down sequence is interrupted in HW, no SW involved here.

when the SW is at "wfi" instruction (last instruction) and the core power down sequence is in progress
in HW, the wakeup interrupt arrives at the this point (before power down is completed).

Older core would power down and immediately power up back, since power down is completed
(without staying at power down state) and resume started from reset vector, firmware makes
jump at entry address and Linux accounted this as "success" and CPUidle increments the "above"
count seeing the less residency in selected state.

Newer cpus with "powerdown abandon" feature, same is today accounted as failure by Linux and
"rejected" count in CPUidle would increment just because core did not finish the power down in HW
and did not resume execution from reset vector / entry address.

In both older/newer cores case, SW reached till last point of execution (wfi() instruction) without
any aborts/wake ups but one is telling CPUidle a success and other is telling a failure.

For the state demoted part, 

The success filled by firmware along with the return to the same place (instead of entry address) is
kind of indication that we entered demoted state-X instead of state-Y.

From the spec, platform-coordinated mode power state parameter point,

 | In platform-coordinated mode, the semantic expressed by the caller through the power state parameter is
 | not a mandatory requirement to enter the specific state. Instead, the power state parameter indicates
 | the deepest state the caller can tolerate.

Assuming CPU requested deepest power down state-Y which got demoted to shallower retention state-X, such
demotion are not really a failure as it was not mandatory to enter state-Y, it was only a indication of
tolerance till state-Y to firmware.

Thanks,
Maulik

> 
> Let me know, I am just trying to understand this patch's goal.
> 
> Thanks,
> Lorenzo


