Return-Path: <linux-arm-msm+bounces-102871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIlsAHh53GmxRgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F23F3E7629
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACE5230166ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 05:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3323859D9;
	Mon, 13 Apr 2026 05:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6OiJLeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaigkrmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2A9386423
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776056607; cv=none; b=gJhze2R1+clY46anV9Q/llB4fnYDln0smrr8RVEsk5oNVCy6fJx3iK4a6sgL5+IXXs6eJQEdEuTgMFbLPpQ4o4d4ZgoJrYrcB8dvddrociUoCQii0ylHwUvdppcDVOU4f545wo3zS2ALjtFlx7YcWd7WdDnHRwjx83eC7T/KyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776056607; c=relaxed/simple;
	bh=2L7O0U0ExmYqZ1og3MD3W3RnaeewohUnJ9nb1qeHewM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bXN/ahcCLd4tExvpkMVma86mFVG0vR6Zr6TatkHEonkqFo6IKt9Nzd1OHVRCLdB1UBhYMZdqtQOcfaIBcTFsPxxZp9xwF26eGWBay4py2mYDvljCEcHp3Tj91ktssd4C+OUJYA7hRZlynwqE3lo7A40vZTTd7YPSGKSBaj0g0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6OiJLeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaigkrmO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4cxW3560421
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1meCnpTLq4hEXz2VH+vYcBDlyL0wD7MXjHoWxKiirs=; b=K6OiJLeKKJMkU3Lz
	EQp1yrm2WA9rbMJ1OS/JgWfwB3ItqZrDwsitd5m8a0uEqHvsuoG8Hdh29qAiNPEE
	R0l7O0JpZIR2WNaD1wlfJ9gX050hHnUQqsK7XSqpEajxb/o22Adn465HoSpbNnfL
	WIlw8asA/4RuqzwJFkDSwe7Q2BrcXPLpE5LHSAdjElvdMCTHeMJh9eJmom4JjOuE
	NNHfwyctJJy1oVncB3lbMFdoZj7dv1lHe606MPoOQ0i4Z0cv3ex/O0DWZdTIZCEd
	taAqq6bXpb8ZNcbUrqw9hAr2nSCyGmxwhg6ulx2u4Je/M2nyGWJ8Ji7pP6HvrBHc
	C0eUeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0kt1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:03:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso2111488a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 22:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776056598; x=1776661398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1meCnpTLq4hEXz2VH+vYcBDlyL0wD7MXjHoWxKiirs=;
        b=UaigkrmOj7vv4z6N0inHjrRPoqs8WVikYslpIxUflxvlYVpSZe8ma0mAWhS4h/TOjy
         Gw8BAwuK+hif/tyWM2T1qr/3MrCDXdVx7zRFxlOxDnmxpejod7luvr/rZKruD5XR9IuE
         FL0MbPdzXL3NTl05+/R6b3MR4KlAs8qrEsry+KJOeJWkR9CVE8BF2KhNKvAiGMmI1mes
         Qm+0qtrzAPJabboo6Jd0yxZrwmQ4B5E17HAOee93qr9dx8UnAYx/qxMdH1RXQ4w+WnIH
         B5IJFGv7fMuO4dT845ujWRI+fUidnU4iVDqX4/9KvgTN+BWaxsKsplQg70u6+6k7yoOF
         IPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776056598; x=1776661398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1meCnpTLq4hEXz2VH+vYcBDlyL0wD7MXjHoWxKiirs=;
        b=HODGVcjgRoeV5w+my0Td38RbLnwtzBUYZqAKAP9lYlRNkj8p+mGuGsO73zPJg6rQa7
         lc9esblL7944L0yuuf+szjjjX4ho78nnJcCB1af8+9BvBwCKIgZPA+bhFVVFZh9Hh17H
         m0Wt9b/5e9i3h4Lupc4nwEmXxxsHNqDKtH+sw+/YkwOed8je3LC/wab3Nb0/mUgmzdVy
         fGEXi/4v9mzYY6w+ecvydiH/Zb9vT74SToXuqVfjDIxAaqoj+vlqtxOaH4U3JG3H7WlF
         W0p1s87ISBNqb1To+/fV5IbKd2+VIN0Eo2vD/Qf712ncVRGk6Hvlse6rs+FTXOBWIdBN
         5YXg==
X-Forwarded-Encrypted: i=1; AFNElJ8MrqHrPqPAb7grfnTx40r9/0IAQSD8/cqBNvjxW3q7Vcw9eEym5kbPRfesDJC9ziicFXjQxsp78/D6fw7W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JhyYpusUY/EL/0VFL6FNHTeMM1spXPk0+rlIjAZjT8FCthwF
	D3qrzK1ww5ZatxFZQCJNqJ3buxlHuFy3RpI68aCF6c2FG1Hd3+D839bF6PXhamuw+0m1lhkM/WR
	Qgd1yExmPIGfCZN0U4ex1auV75AvVVbt2Xi+I569QNAUXt5jGpJLoDw3u1qvpN2/xFqWe
X-Gm-Gg: AeBDieudKYRdZ2wu3J0lNVnbJkKN1FBH6Xn6v+uT7+PiHA+WakGIp8a6Qec/+XD1F7B
	qZqQRifFisWK+G1Rh76pXf55GLNtKfIsc2174XUosSeKuHjlO8ywNP6gdiM9OJWrvE8uVHWq1OB
	/6tT59Ch1NVETv/DKMhvYTIwny162aGDrKG6+wudFq/W4YTrBvp2Ky8vY3AMq6ZMenyAfBqWteT
	T2+pQbTxFuOb6f28rSe3r77Rb0lkmnsoQHJYC4UJKkLhe7s8lQkQVSSA+HIYS1X38MuyfWv172d
	nBbJKZe74mVeHeg7Dn+kqZFtd6THCIR/BD2Cv5N5Y5I3fj0ns2qvpYhAl9uFzX6Lq7aTf1eDOQ6
	FavkloSspY1KEw8/lb1EgkJjrd19fe25rW2uS74HiFwW1dzxn9ug=
X-Received: by 2002:a05:6a00:6c8b:b0:82c:6b23:6d10 with SMTP id d2e1a72fcca58-82f0c1ce9d0mr11933293b3a.3.1776056597523;
        Sun, 12 Apr 2026 22:03:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c8b:b0:82c:6b23:6d10 with SMTP id d2e1a72fcca58-82f0c1ce9d0mr11933258b3a.3.1776056596865;
        Sun, 12 Apr 2026 22:03:16 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm12205132b3a.48.2026.04.12.22.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 22:03:16 -0700 (PDT)
Message-ID: <5cfd774e-8797-4765-a36a-c3dc2d6ac004@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:33:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>
 <CAJZ5v0jXwtBz3z4h3ehJTuaqYN4z7=wOv_LGnjQ4LQMP0TBKmA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAJZ5v0jXwtBz3z4h3ehJTuaqYN4z7=wOv_LGnjQ4LQMP0TBKmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dc7916 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lggpn7pwzXPsZ0vCzx8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA0NSBTYWx0ZWRfX6qTWGze6KGeZ
 TSwivi3C0l0O817CfiKFKnLMuySiQdwZSMPMqagL3cImpILRPsu9y/IbZvcGmT+3VLs92KhUYeB
 MV/VvZf47yN+1GTTlSxLlJv60Qr5Lsafckm1PO5FqPMmTlLogssALFfBdkK1TEa4OhUNAT7pMym
 eaE71/95ib6TMJpOhgGSLwRvY575IT9xuvBW+JQ2nWsxzW0PL7fhEBacGT6GtLBRDESu9Dbcoc0
 /jK9HRKuLPSyWVO9p7SK2+XOVHaLB7AKQvmwepyJgVKjNh/uzGcAl+kDfamtBK0xifH/JEIgKJ3
 01mEQSWq2In/LcOiiTZidCzCjIvyKRr1AE3rrUsyKe6jSMXSXPFDZLiOwydpsPWkLV3zA59LvpT
 Oed48wbIg+vhN9wEbiunchKH7Hzh3ioZ9GOXIGgXs/QSsd9mNz87HIB85E3NyHcbdDEe1/yJ8Gi
 kE6Y+tfe9TOdALFUyYA==
X-Proofpoint-ORIG-GUID: V8z43qopt0GTfYpNMtcL3yoerxwQdqX1
X-Proofpoint-GUID: V8z43qopt0GTfYpNMtcL3yoerxwQdqX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102871-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9F23F3E7629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 8:37 PM, Rafael J. Wysocki wrote:
> On Fri, Apr 3, 2026 at 6:08 AM Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>>
>> CPU can get IPI interrupt from another CPU while it is executing
>> cpuidle_select() or about to execute same. The selection do not account
>> for pending interrupts and may continue to enter selected idle state only
>> to exit immediately.
>>
>> Example trace collected when there is cross CPU IPI.
>>
>>  [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>  [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
>>  [007] 154.892162: cpu_idle: state=2 cpu_id=7
>>  [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
>>  [007] 154.892211: irq_handler_entry: irq=2 name=IPI
>>  [007] 154.892211: ipi_entry: (Function call interrupts)
>>  [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>  [007] 154.892214: ipi_exit: (Function call interrupts)
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
>> Changes in v2:
>> - Fix cpumask argument of cpus_peek_for_pending_ipi() to take single cpu
>> - Link to v1: https://lore.kernel.org/r/20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com
>> ---
>>  drivers/cpuidle/cpuidle.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c01e57df64ca5af8c28da3d971500b3f38306cdf 100644
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>         bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>         ktime_t time_start, time_end;
>>
>> +       if (cpus_peek_for_pending_ipi(cpumask_of(dev->cpu)))
>> +               return -EBUSY;
>> +
> 
> Why do you want to check it here and not in cpuidle_idle_call(), for example?

It can be moved in cpuidle_idle_call(), just before call_cpuidle() too.
The intention is to check after cpuidle_select() is done.

> 
> In principle, this check may be useful in the default idle path too.

Yes, this check may be useful in default_idle_call() too.

Thanks,
Maulik

> 
>>         instrumentation_begin();
>>
>>         /*
>>
>> ---


