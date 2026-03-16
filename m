Return-Path: <linux-arm-msm+bounces-97879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHUNIErOt2mDVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:32:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FAF29710B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 128A73019176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D84F37C10A;
	Mon, 16 Mar 2026 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JePlYEyh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fA9sBT96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F733FE06
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653529; cv=none; b=eNR+E8znpckR6L8e6fUfRIRnPR9cieHZW6AaKdUqG+LtNZAtsCgKeRqA3ZVa5fXIUDpK1l1VSKdD7+h2LS6EI2UFzyfHOZNNI44UW2fhwOBar76TS+p+rkIvwfBXBEPqc/QeztigBlHzDl3cuc1g/wQkeqGfqCrv2MoyipQ9t0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653529; c=relaxed/simple;
	bh=XJqokLOZsKTYJReR4cyIg3v1eo4NKzO7ugmYAgK7NWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXvKZec6HXLHjMdnmEqw6ervAHqWcqfIPpl+vY0GKeXET3T3Sz4ih+368dpcuio72BVi4KOlCnllIjIveZuLZpo6gdu+tJOgGRW+BVwpv3fuPA5wwJqw0ee90849dqfgUx72PRQ30aOzbAf1mwoZCuKQ4MMySYu9ZYmDIfsAbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JePlYEyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fA9sBT96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G652Nr2129563
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8X5kFWCBMHnHAO6UFq3igterPL5sWg/kPVCVlpvea4=; b=JePlYEyhlCzzXls6
	LZ2P+MaAKZ5JahO6nscuCySZNkWfk30ZcQ4xJ3/Y2uRH9nqnblZTMAF8OWFrSEPI
	rVZKqXQ+5kVKsIkUHmWONICVePSvzDKAwyafuhyFOkm9QJbxjEOhbRJwqKT9MBze
	GWTklqboGjbvlxhDPB2bOvjrT0jo1vYaQpXiKUE4tUYgTuyJLDnEeon8wnzskyYw
	EnUl0cPicCScLFq60prGJNts9wbABE1N1USnzRoqdhOyw5HOaq4QPGBUPvQTwV2+
	wYxhW4jj/rtyx8j2LDo8YI6hpOf2osdafuLhe8NAS8B3OSZ11RtLATUPNkIWSraR
	s2yThA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00an3yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:32:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so3967693485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653526; x=1774258326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8X5kFWCBMHnHAO6UFq3igterPL5sWg/kPVCVlpvea4=;
        b=fA9sBT965t7Dd9ov+TbJ2AHU/+GUF71qsf52yQV649o2SUau0ZAhVlXJqlr7iZugDM
         Zi8n7v9OBKZqw1CD/quikp9lfAhsjao/um5XDPZAZ1FQOEppNZb039X0uv9z76t0NGa8
         HLGCgRkLY9jyPGRau1mQ+44S+5S4YJyPFrwciX53uVqUBGOHT1m6RFFgRdWcj5w2QZez
         PE7gIfVhlrUgjgaVSkaRha3YIIVdZIdBSn08fkrKDphOfxl1/5sMaA6YdYrhCml37fJQ
         3ZlcO/ONtqR66U4NXtnijHmf266Wc1pNDyMsCWenYQQYtBf8KERpJJSKZWLvFVVEup9C
         BHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653526; x=1774258326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8X5kFWCBMHnHAO6UFq3igterPL5sWg/kPVCVlpvea4=;
        b=HAUM45mXYFyAc1eP+aEkhYbFHN/wFY/nsq+SRLdO0LHfsx/+gVD0ATKCduLZ8TDXfH
         UaIJscTAQIzK6OK9sBA2/NirwHFu2dgsuDxltCVLpJC9sF69r0i6Aeqq5XU9oOQcanY0
         1t3+xCkaOKukzOTkbWP2nRHaz12dyVgtVe+HN+5jB9IcEPaD/Wt53daGtAw92ypnC3Tz
         f+oWtSIHEYDw9Cz0FpD+hrL7i9wkP5r6Haokzsx3b6oDHSyM6LJbbB9q6mIaV08zhIPT
         Lxi696xja6plbullrK48d+Wk9otP2vSuThxwtNcXAGqDltdw7rlpSU0Ielou+/1NvbKk
         Utzg==
X-Forwarded-Encrypted: i=1; AJvYcCXoXwRU/gu0pQIU4BrLvuNStsr7D9AIbIbEJY3GxdNsSovtM4TwVG6Q6uUYKCjfNpXjJ0SttWlC+d4Dr0qx@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgc2q84LOSJ7isSjgqde4nphVKaRj5gbjvwujv8s4s9GUGSgH
	flAw3pgrkW52z7xhw/OF7x+G2NPi0XV6gY+QMYUVk4Jq+79tiL6r1ow6jSLAgpVDM8Q6vtasvVW
	vW9bTdjjxt4ldjTgf2gafgYVoeWZQePXyjFc9M54NthJUETU5ZoPHne66J5h2dC6C9hqT
X-Gm-Gg: ATEYQzz4y09DZGnnsdiCMwNjhrW+zTJkIvi4s1ktOXmB82sSaxP2rZHQkB3GFYnHnzh
	CJgLKxMa7JJ2JP8yTQCR/5YEZvkW1WEDJZapDdaD5iZ9lbC0HS0K/Em742H5Nx4R2NVSMvtknYY
	Ll/L9cr/dk9wXLOxlgmYgK8Vy8MSzuYkFuNHGXiBOfUta2pdptygDPI4ol9AfVhHYz4X9uwLUxl
	NBu4cpi5gyIKq17ZnGXs0QQGVcUkwJHhVP/KzfgJ6dzFN1Dalg4t0f1QXZYaLhlrFbIiqmbAv7X
	zG/xgVOIWQMNmeU1qWkdsoLlxhsYURQi4FAqja4cO17yOSCYCLlwhFoJgMeNX/bvraBZLYlnSpu
	Juvh6AqxeoLiB2unKSKhYQ3n33XAax3cQV26LwquRrhCZiGelnl+B9o0sABxbpnbOn7oTQEBQKH
	yr1dQ6zbsU
X-Received: by 2002:a05:620a:4441:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cdaa8c59c8mr2259642185a.45.1773653525763;
        Mon, 16 Mar 2026 02:32:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cdaa8c59c8mr2259638385a.45.1773653525298;
        Mon, 16 Mar 2026 02:32:05 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm871921055e9.10.2026.03.16.02.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:32:04 -0700 (PDT)
Message-ID: <ba23f8c8-a842-4498-b52f-528baed62325@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:32:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
 <39ffe4f6-5716-400d-963b-06675a727225@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <39ffe4f6-5716-400d-963b-06675a727225@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qV2VVABJ4xxItTsRX1R2uKJ8y0n7edSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX26fJNfUXeLV8
 WNdVPAgkcXWzB2uqMxCflV4/jnITrmnGX+zxP4P2dE7SiP9R/YLyGTF3UdB4MGgUKl3iNRhL7P0
 NubQLPr44biJQVuzCvgQ0hx8azjcArfZBSsHIIXNrWZlhWxshprFu9RZv6yHcmSsbSKLofhMaWu
 N2NUk7U2GOotCUsbQw0EPfB+gFKgG9b3VB5v3qJLQ7SRHCh47GAyTpM1oHR0NR31eon25bXga45
 LtPAqrT76H9pnhbX9Cn019s/TIXlpBrdlHUmClAE0dMHmXolh19Nbsm9N6L7WLTrfEezhjAXe4I
 O8kt/MQbQkcwCXFKtMctoC0PjPRUdLj4b6UvvA+Acw73xeSrfOnU2cuM3nM9BepTjwlVvHTrtxe
 3ysh4EWwHUJhEYs9cUdPeHeFCeaThBO98HU0AX893Ow8nr3jt+lTO4Z6i3M8wkCEAsOu1vIcaD2
 9Curi95N0lxFy5zeqYQ==
X-Proofpoint-ORIG-GUID: qV2VVABJ4xxItTsRX1R2uKJ8y0n7edSD
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7ce17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lggpn7pwzXPsZ0vCzx8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97879-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42FAF29710B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 09:55, Christian Loehle wrote:
> On 3/16/26 07:37, Maulik Shah wrote:
>> CPU can get IPI interrupt from another CPU while it is executing
>> cpuidle_select() or about to execute same. The selection do not account
>> for pending interrupts and may continue to enter selected idle state only
>> to exit immediately.
>>
>> Example trace collected when there is cross CPU IPI.
>>
>>   [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>   [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
>>   [007] 154.892162: cpu_idle: state=2 cpu_id=7
>>   [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
>>   [007] 154.892211: irq_handler_entry: irq=2 name=IPI
>>   [007] 154.892211: ipi_entry: (Function call interrupts)
>>   [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>   [007] 154.892214: ipi_exit: (Function call interrupts)
>>
>> This impacts performance and the above count increments.
>>
>> commit ccde6525183c ("smp: Introduce a helper function to check for pending
>> IPIs") already introduced a helper function to check the pending IPIs and
>> it is used in pmdomain governor to deny the cluster level idle state when
>> there is a pending IPI on any of cluster CPUs.
>>
>> This however does not stop CPU to enter CPU level idle state. Make use of
>> same at CPUidle to deny the idle entry when there is already IPI pending.
>>
>> With change observing glmark2 [1] off screen scores improving in the range
>> of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having two
>> clusters each with 4 CPUs.
>>
>> [1] https://github.com/glmark2/glmark2
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>   drivers/cpuidle/cpuidle.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>   	bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>   	ktime_t time_start, time_end;
>>   
>> +	if (cpus_peek_for_pending_ipi(drv->cpumask))
>> +		return -EBUSY;
>> +
>>   	instrumentation_begin();
>>   
>>   	/*
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-cpuidle_ipi-4c64036f9a48
>>
>> Best regards,
> 
> So we already do a per-CPU IPI need_resched() check in the idle path.

The need_resched() is not the same check. Here the interrupts are off, 
the test check if there is a pending IPI before entering the sleep 
routine which will in any case abort because of it. This check saves the 
costs related to preparing entering the idle state, the call to the 
firmware and the rollback. Those add an overhead in terms of latency and 
energy for nothing. As stated in the description, this ultimate check 
before going idle was introduced also for the cluster idle state and 
showed a significant improvement [1].

[1] 
https://lore.kernel.org/all/20251105095415.17269-1-ulf.hansson@linaro.org/

> Your patch uses drv->cpumask, which will contain all CPUs, preventing idle entry if
> any CPU has an IPI pending?



