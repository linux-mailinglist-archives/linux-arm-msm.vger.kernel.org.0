Return-Path: <linux-arm-msm+bounces-114190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioAZOK1wOmpM9AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:40:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2266B6CAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FsMbsDLm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ls3C33MH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA1FF3059092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46313B42D3;
	Tue, 23 Jun 2026 11:40:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509EE3D3CE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:40:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214827; cv=none; b=GZVWKn+n8ckSo+vjKU3hCG6VhuhkgTqpRT9yc/WGgZf3KtnVcL8no5iAHcVjvOdHlS3JGduB/uWcOmrThkCF2y5CkD/qaLQrioW1HZdESZhTQOhZbGw4rWxCcOQOdEXvxe6YA9YFWUllLmef7xsk6dzrF0G1xA8zDiEyz2uGrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214827; c=relaxed/simple;
	bh=cU4q+dAxzjz/DdxxWO6hFG4V0bYZzbvaND34NUZu7PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFUOr9yR0CxIQGDU/NGoVYTKkJQwtVHO83uEQ35cTCMpDYiH24iWcK8hL6up2g7LPFT3twFGoEYzsh0V08i2wipcC7ELdF0du/qMGXCBP4NSKqZiVua5/Xc8RzmYU+boNd04Wm4TfgOi2zQDV+CvE+Xa6f1KvCPQCa2L7BbQqdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsMbsDLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls3C33MH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBb5Tm053716
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gbpIZDM+t+BqRGRuIADnoesPyoKgyGdyq6Z6YoV5lU=; b=FsMbsDLmantxocyn
	GDmJ0rr0zG+63KJzsBAVKtuY84dmLWjSvC0jgE3gzbeE7d6qwHEqYz4OtYrV8USp
	akVXYilcHHwAZZdlALHByn6Q74s9ywJeorYQtaeq18OVTyVuFuVd2gL93TPOJnWS
	5gUysLPiYiie6A10Jwpm8WheWus3ILiRTz2XoPoMoOSOaIEkipFBfj9Zk0oEpDkx
	DQzsPZMl7Hrdjpw2SJ64s/fJX60/Zi94k250/v2aA9OA9KUF2mXYf6HLM+Kt0Pxh
	WILOyBVEyH8GHmVrNJO86tagACKzrX/OjJQlTiNOgeAPO/OKInCcxGwROj5qAFGo
	el++zw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44jbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:40:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso987512585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214825; x=1782819625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gbpIZDM+t+BqRGRuIADnoesPyoKgyGdyq6Z6YoV5lU=;
        b=Ls3C33MHU/77W0GkOR3u0/+7YRm5lmgP8apVeIhthxI02S0ZkAB+YR+9qLuwSbEdp+
         2oa3OEDuYNKJKodmNPCPZgDjkNRTqqKzxghSI/5uGOFl7G6krYczjuBlXwZW3lQEvoZe
         4zjkc5sLx4yJyqnlH0IhJSP9tnuja18UfyWZyUEqjvJwuusCmBe/xeH2rTVB7JOyY/J4
         3gSAMl84ty3KP6tH5lW3XHMX53RkWx3IVt0bk8rLqD4NoHXYw0x9N0IwSgGlP2FH2pQp
         2S06GKWV8EzY9Vg9mU7Mydm5so4c1cn0LGtTwkJ5byD/FelEY4p4BGcaQ+VzIyIYOCDn
         RvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214825; x=1782819625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gbpIZDM+t+BqRGRuIADnoesPyoKgyGdyq6Z6YoV5lU=;
        b=N4Cg+Y0gMlbgmJ/fABKnjfisGooFUaI+tnPUwD83Vm86b/DJXL2J9ialDL7FpngST8
         ISOTaqUgcINq0mlRjCBebNlWkYY942liDEErEhWj3F9dphhX9YsZx/+G5iBoI4aJRzWF
         +3KvpqdOjtluuwrUfw9Uizf/r5Uhy6q7oBELA1M8Z2Fbz/GVJnw8k6G/7l4NvaSbY8FH
         2T54GzkaEm7iSowzB+WQMb7B6lFLX/aLaLrCx7QNes0Lxx0ri3YuPTtuajrNlpO7YgP6
         qfEYiMa5I0WDpDhdVV5mFw2XDQfB2bp/nVdNunGXkoslkuF25/MoWKGbSgvIzJx6uYGx
         eKog==
X-Gm-Message-State: AOJu0Yz3hS8GDOCmjG9sZ82VqyaPOFFXkoL/vBGfcN+vTzmylU+IxWuq
	TL00h2yTCqQUanpAhuIFrQ6jZB9GtHme4xJ+oKWZJ/oSEqucZC7fVidxutcmjGnM+itswIxuGYn
	m6x+dviuauOJvAwfUKA2Z2EKlWXyHlLJPw3Gi/7Zh26XSVf9+9bSnhwpZbD7u3uVDwJzya/oO78
	8u
X-Gm-Gg: AfdE7cmM9MRa7vf7Fb9Dhisc4yEnuCAXuzPy+O9542vSiWIP1RRutvVtntGKKsRhiTv
	09cbaxTkahs/UzRu6HcroDhppzWNvEyyPqRIMt6LQK/mw0fcl25Fg8RokrRWFuNfKS0aPG9+0KD
	cYizG40YcO53BREpEIapJ51C5Q2GGeBTmzYxUkZfBKfY6J1IKMHeVu2lAnrUYEpUUf0jF3YnJLQ
	u0UHC/BI7thTfejsmWulLCzVafPjBNQjxyjUcoMGcvI2ieTma2mx2zOxjw57BU6Omkq8VuN7LVI
	VVaiYaMelZ//zxdbq5l+S2fU3q/C+7uZ66VW3JgoJ8R9cj0D18s8+xQ0nlguF4plgNSmjF0NT2C
	GbPEABREZOC9RcHyL+kGigwLCvyZ3v4B7gKC9bcYGVq9tdCpLjWuB6H17oeqA89vGZjpUBHFgKA
	==
X-Received: by 2002:a05:620a:2616:b0:914:babf:9f45 with SMTP id af79cd13be357-92646583c1cmr430163585a.26.1782214824562;
        Tue, 23 Jun 2026 04:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:914:babf:9f45 with SMTP id af79cd13be357-92646583c1cmr430156385a.26.1782214824036;
        Tue, 23 Jun 2026 04:40:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:21db:9254:19d9:645e? ([2a05:6e02:1041:c10:21db:9254:19d9:645e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm34668027f8f.23.2026.06.23.04.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:40:23 -0700 (PDT)
Message-ID: <9b5ea951-6880-4ce8-8764-fd6bf2bd57a0@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX+DiDOIMYPiCk
 MH2qMx2WwC8BWcy0kjPQd+XLcPXw95VYYOda8BggePhcEh4M7XPczFoo1/aPyMZhRLPUa9PClT+
 XaWYrqMPyowTHSs9akLbnh9fM3Ubs94=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a70a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W5qrNhqdD0BlkYEQxcQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZY5OVj0eQmmnkAtrMF1vEED7ecmP6Ktr
X-Proofpoint-GUID: ZY5OVj0eQmmnkAtrMF1vEED7ecmP6Ktr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX8yw0ciCtO0G5
 cBZJto1bQXd2nhETG+Xcdfo4lPAplYVIecNdZBkijerCoHErcorRithE5kWUbvFB2WRjm1Gf7+G
 28z5crK1FHUC05LtRAQuEapOYMDJZcIDnfsjvhZ06VnPPR4PAEtWXITVasGuqOryvmJ7iPF9U93
 37UuLSmx/eRPK0/ToR1TF1zMocgF2V4qbIPlyg7yDfv5wzZUiqQltLnA/WG7w7YtD9qN2kTNf4W
 jO3oQbQL2gjfi+ldc/J0clTWk4cwRByiOQBK+sTcaJrHNlY9KP0en1o6kf0U6ozUQDpPIm1rPrN
 Y+7CPvTVcrI1S2RISVP3iw27ujf7jy1UGPXYfUy2He3X459fFAZ5EGKJc+Z9f8yWsUTmEj1d/1m
 ypjeLmV4b8ZDaqNNaDD6Bo0JWJ3zzrTepTiu+KrfLw+si/BCcYt6XON6YS7QXoxiNqIMOSlfQhd
 okys5yHtY25CZOk5/Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A2266B6CAB


Hi Sned,

On 6/5/26 12:30, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> retained.
> The hardware design on these SoCs forces a constraint to suspend and
> resume the system on boot CPU / CPU0.
> 
> If CPU0 is already offline before starting suspend to ram the
> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
> proceed further to invoke PSCI SYSTEM_SUSPEND.
> This leads to a system crash.
> 
> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
> config and when enabled prohibit the CPU0 to be offline.

What is the status of this change ? Are you planning to send a new 
version with the check inside arch_cpu_is_hotpluggable() ?

> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>   kernel/cpu.c         | 4 ++++
>   kernel/power/Kconfig | 8 ++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index bc4f7a9ba64e62d76fbb2b362f243c918defe5bc..1c878db1d9cb6df0e31cb55343851aab4e38a3a0 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1478,6 +1478,10 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
>   	 */
>   	if (cpu_hotplug_offline_disabled)
>   		return -EOPNOTSUPP;
> +#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	if (cpu == get_boot_cpu_id())
> +		return -EPERM;
> +#endif
>   	if (cpu_hotplug_disabled)
>   		return -EBUSY;
>   	return _cpu_down(cpu, 0, target);
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 05337f437cca29da57864583166d7f9abd526507..0b342b3a4a5650a1927dc4805d1515e1d9e067c6 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -401,3 +401,11 @@ config ENERGY_MODEL
>   	  The exact usage of the energy model is subsystem-dependent.
>   
>   	  If in doubt, say N.
> +
> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	bool "Disallow boot CPU (CPU0) offline"
> +	depends on HOTPLUG_CPU
> +	depends on SUSPEND
> +	help
> +	  Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
> +	  has to be executed by boot CPU.
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
> 
> Best regards,


