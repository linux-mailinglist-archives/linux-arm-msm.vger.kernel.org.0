Return-Path: <linux-arm-msm+bounces-99225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SICDCY4vwWmkRQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:18:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9992F1C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0333C300D9C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6246E39B491;
	Mon, 23 Mar 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmb7UHgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qh3kq8EH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227EC37E319
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268005; cv=none; b=akyJSuSjk/wCoqiaRdasXvq4hOm4Eb7m78UpexZxu0CQ2e4AOOp/gJcG+e2vH1ccJ/zol/TjnM3XzIlUc7SPMQbkfT7ueDlkptf/g73ePBSROxVtIPh02d0Ed1xlAEck2BAox3hNDMroJlDY4fDbmiwyUX9+78BYtGTYGUuB/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268005; c=relaxed/simple;
	bh=o+JFJtu6y7N5kdyo3DdaubQZRMksn2QckUlkaFBAxlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikUVKyBd3UpV2F0THRcGa7dgHZwZuMl/8kF8eD/ifazyoDAOudKI6uNhf6ETNOO4rwzAPAw/u3fbkaLDrgm8n69V6qysPGT6M929pAiLHxdwfSdNnEIeEwONF/BFrSXTEy5bbCOlNFrYpIJcEUZGn1RG4Neymn7G2dLzxBfcYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmb7UHgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qh3kq8EH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72lYj3295180
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kZ8mRHoal7TjebVoiJ3QW1/Vt28tdmOa/xyLh0UN7o=; b=bmb7UHgUYndyvqdS
	38xJGwuRiN4KyoMiZDow2PhbsOtlhFY7sCSntZgoPsWuiOxbZv6NRZvdBVc2OXfO
	RAw7fk4CE7BGiBOu82MYlYrCkO/3BVsJhNoSR6Ewob8jYYdoziZKQO94cvh10oaX
	/LU/jZksG6VhREqdsHgnOEJSK+JLc/xQqpHG09wVjDO4KmW6ZPmVLnMe7nrJ8qYY
	DqydSs/j+nr1+DLSpd20p6u74aYHiJo7QGnS+alQwbh4MluoVz4e5vN4kHjzlHVE
	cS5KKMy8dibv1oBy9mxtxO2Sy+DCeiDsNJ5aMHHk/9gsCzz1pBztpvK7gOeIvVJ1
	oDzX+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k6rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:13:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso5962966a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268002; x=1774872802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kZ8mRHoal7TjebVoiJ3QW1/Vt28tdmOa/xyLh0UN7o=;
        b=Qh3kq8EHXj3F4QjbCb89HPd7KRRjyXeSpj7tRZ0h3QojPSsX5WN2tsBkFJB3zaQfXo
         QaYZuYQa8UNULgbBnsR6sr2b7kITqTnJa1NW00me0GXds1DDwy0zZIkNgkVon2Lf6J3t
         7N71soSeOgPsdrNHnh2iy9WXoeiQmUQZe8w9Kr5n1SAILHHqrsO5w9LjwVAF3x1WtsDo
         j9L1xnbe9I81IAOHyNm1HOuPbOXZaNJIlsEPAV+rFjXgMieZvQ1Mf3yDMFrw6BKZ883d
         ZoBtpukm6iP+OrsogkaRJJb+563cYWECbzCe9VWzy2KvAMW1XjdJzQxPlV2k5qIn8jf9
         Bwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268002; x=1774872802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kZ8mRHoal7TjebVoiJ3QW1/Vt28tdmOa/xyLh0UN7o=;
        b=g7j9bAMrnfGzc+WY2qt0RMrBQ8tm56w9cov7L0e0ybEYvKqkMlRKlfbX2c14KyNA0u
         td9sBM48gpdBkHxKqm7Ygnmz2nDba9JOsqXjD6/FmCYcCrqvip+Zat1pAclIdidkwW0g
         O5w9sqWyP0h9ovqygBcEKloHZYWDIKeol+rEbSB5AJQe778VnqUrZAGrN+3JJMRNbHiA
         zYmAQ3jGFfpUkvnJnXmx7XmtrDsDZHb8Kgk7PLXQTKsIzAZ48sIqou6Zq9sJJDinz3Wb
         7dqNWIziZBEzsRQOVMdomLRDELhPa5rl53yDlIuLClzKo6WtBLXtAR/sS/UJ23h8Rtgo
         8aiA==
X-Forwarded-Encrypted: i=1; AJvYcCU8VO899/zanNAYoN3yxr7k3Z0LQwkv4VRQesL4sFpN6jM0ixfxzJqPhERVvDzMKKY4GZErS2geJ1hzMl7V@vger.kernel.org
X-Gm-Message-State: AOJu0YxEomjkNCDEdeDB4eJdZ63AjwYTDORfIDJLHzNzhbgwcMzranjq
	71+/x0/BdTUwRw75L8xMYBw+/8B8ObvxdAlZ7bVrsoqV9RMKt1/08XHdY+cAAMFlZLC2Ebm6WpL
	2AuVO6ltoRriHdAQgK0E/hMhmjrCRpYkDArLxONqjtsMupLbNp0zVIh9l4iD6gg7ijxA+Fnt+nm
	Ff
X-Gm-Gg: ATEYQzxkQOXhwPjfWNX44JLhRiD0N/DAJvK+HlOfQ6z5WJ2qNMhCR6/BhFMVPEeDUsf
	ViUYRlTm9TUowk7uREorVALT8dkXVA8gsa+Oyts5OsYewsjMn0OFJPQioL7iBL7gb3QBqMOEm+A
	ulU6o8eGYB/QvWs5iTP3BG4ZVkCToXvSax8emIhFZtJw06wNiowgHgxv6yksE/HX/7iVAjTOyEe
	VCSE/Yd7mcuwftypcgRa9nOvO2nkIF5EqG3Ca5vI8SrE7dwwbXI/zUbrhVg8bmYoeQILDKeXz/R
	9uCA9O3Vv/h1ma9KQP0EvW3kuRyaZVtKI810ILriHxHtCPeM72UXEPic8peKXDmtbcXfibo95eR
	l0J8u+pxEuHjmifbUeFBSUUi/Fh9Sr2kUaLg6iiCVLDeP5eoOse0=
X-Received: by 2002:a17:90b:5203:b0:359:8e1c:542 with SMTP id 98e67ed59e1d1-35bd2d217b9mr9330691a91.18.1774268002449;
        Mon, 23 Mar 2026 05:13:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:359:8e1c:542 with SMTP id 98e67ed59e1d1-35bd2d217b9mr9330655a91.18.1774268001912;
        Mon, 23 Mar 2026 05:13:21 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6017492sm12976530a91.5.2026.03.23.05.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:13:21 -0700 (PDT)
Message-ID: <fcb05fb8-ed4f-4df1-9aa2-18bc3320cad5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:43:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
 <CAJZ5v0hv+t8=mT39-xOkGUS5i6vckJxwfQfqGZ4foxK2rFn8gw@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hv+t8=mT39-xOkGUS5i6vckJxwfQfqGZ4foxK2rFn8gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NSBTYWx0ZWRfX/1e4o/ilzUTj
 c/Xbk3FF62fpahfbyzSaqESQs67imFxGdb5m606SVUSf3db6B5qhpJq7yTqDWmn/3tuf3ZnxSYD
 8Th37c+Bk4ct3mCdWEuho6YNrLQy+dfRW9Ng9iak1MU/ITsAAPzVyfi6EYelnNOOahoIrTYcGn3
 +Vy5mUn2MlhnQUDuucDGd4LxR4670zgWXNqzDJyxibCL8PLPVCmK0xTqGpDOidN6yuNMhXvnunn
 BOvNR+5T/p7LF61bwqkPv0QsAMfLIGNX6UHCnv1IIb0+S/4OGUQOeSyuuEXJaaQlYYCRgwBvGNP
 gWcZVd7iW+ImpS2sHLVZ4AJLASEeBBdK51BC0EiIYZ8M0faFIx5ULwCvv8JVhgGkrYzpKovNku4
 P6ffVYNPgECyszR+VdHOwuSqJ/qoIhG2o479FmNdGx7INS9mYeX16dHOwnrWUDF1WZpRz8Ovq4p
 yJk58THXc12x2x1KClQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c12e63 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=lggpn7pwzXPsZ0vCzx8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: m9_9GEOCoaRJSDN5Mgz9Qt61jZeaZN3Q
X-Proofpoint-GUID: m9_9GEOCoaRJSDN5Mgz9Qt61jZeaZN3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230095
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99225-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 8F9992F1C77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 11:59 PM, Rafael J. Wysocki wrote:
> On Mon, Mar 16, 2026 at 8:38 AM Maulik Shah
> <maulik.shah@oss.qualcomm.com> wrote:
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
> 
> You seem to be overlooking the fact that resched wakeups need not be
> signaled via IPIs, but they may be updates of a monitored cache line.
> 
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
>>  drivers/cpuidle/cpuidle.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>         bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>         ktime_t time_start, time_end;
>>
>> +       if (cpus_peek_for_pending_ipi(drv->cpumask))
>> +               return -EBUSY;
>> +
> 
> So what if the driver handles all CPUs in the system and there are
> many of them (say ~500) and if IPIs occur rarely (because resched
> events are not IPIs)?

Missed the case of driver handling multiple CPUs,
In v2 would fix this as below, which checks pending IPI on single
CPU trying to enter idle.

     if (cpus_peek_for_pending_ipi(cpumask_of(dev->cpu)))

I see IPIs do occur often, in the glmark2 offscreen case
mentioned in commit text, out of total ~12.2k IPIs across all 8 CPUs,
~9.6k are function call IPIs, ~2k are IRQ work IPIs, ~560 Timer broadcast
IPIs while rescheduling IPIs are only 82.

Thanks,
Maulik

> 
>>         instrumentation_begin();
>>
>>         /*
>>
>> ---


