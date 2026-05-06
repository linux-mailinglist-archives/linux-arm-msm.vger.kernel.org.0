Return-Path: <linux-arm-msm+bounces-106072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DS4PGrP2+mmkUwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:07:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D14D79A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC981300D957
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E173CF697;
	Wed,  6 May 2026 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="td1IkYNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EE29AAFD;
	Wed,  6 May 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054830; cv=none; b=Zbs0ePQ5EBq7OlHBEyM/kkgiItiDT2Ncd8VVZ5ynlk3jhL3mDyTikl3p/N7cefTzCyh6YZw87R6Ax1Qv4cY0CyK76QcrPYgt3jRTE5BShxZIsibkVtwSJRduNmkv017GTiWc0H7D6T0HSJJ7NQUVwMkU67gv6R0Gped0wxNTWVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054830; c=relaxed/simple;
	bh=iKMzxwfQI6HXyEHu7gIpTADMD7Fgc5kRXy4XheAHrB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkbNOYkS1q5joti8tGRe9Urg+bC/fx9NIXfJLsnn2lMN+h2vpbEhcfm6Z4CUukoKjDF5FJWWUthw4yykf+SC0e47qTLqNEXn87k00NB5lPuvpo1XA3g1iLQKs+L6VB94Kxasie8WlqSiKZJAlBGzZ4SHyKFV2TkMX0KgWC5ZCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=td1IkYNC; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778054815; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SemQ4rk+1S+T2WbH6vQx/Uai5q2lfPayKiOeZcu/Etc=;
	b=td1IkYNCGXvZX40n+49UoY4177f6Eui+oAj+Xlu5XlpIEpAQnWTpvZPYewYEH8IG3WKAPuK58ouBISyXBAtRBaXipkG0oXm7RC7wQsqB8aBPHR0ugrL7DAVVgWVvazrcP2u5n+oMET3bHD5W5gtjzelseXAsDbTKEQcdcdPEX1I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X2NRCzf_1778054813;
Received: from 30.221.149.96(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2NRCzf_1778054813 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 16:06:54 +0800
Message-ID: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Date: Wed, 6 May 2026 16:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Ruidong Tian <tianruidond@linux.alibaba.com>, Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
 will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 633D14D79A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106072-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	RBL_SEM_FAIL(0.00)[172.234.253.10:server fail];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tianruidong@linux.alibaba.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[linux.alibaba.com:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linux.alibaba.com:dkim,linux.alibaba.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



在 2026/5/5 20:23, Umang Chheda 写道:
> The driver unconditionally calls panic() whenever an unrecoverable,
> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
> for the user to suppress this behaviour, which makes it difficult to
> test UE injection or to run in environments where a kernel panic on
> every UE is undesirable.
> 
> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
> logs the UE and continues instead of panicking.
> 
> Usage:
>    # Boot time (kernel cmdline)
>    aest.aest_panic_on_ue=0
> 
>    # Runtime
>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

Hi Umang,

Thanks for the patch.

I understand that this parameter is intended to facilitate UE injection 
testing and to avoid kernel panics in certain environments. However, we 
need to carefully consider the potential risks.

When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the 
hardware state may be unpredictable, and data integrity cannot be 
guaranteed. Allowing the system to continue running instead of panicking 
in these scenarios could lead to silent data corruption or other 
unforeseen side effects, which poses a significant risk to system stability.

For the sake of robustness and data safety, I do not believe we should 
expose an interface that allows users to suppress panic on such critical 
errors.

If the goal is primarily to ease testing, I suggest handling this via 
local driver modifications in your test environment rather than 
upstreaming it as a configurable runtime option.

Best regards,
Ruidong

> ---
>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
> index b4f4c975da1d..9ce782a66edf 100644
> --- a/drivers/ras/aest/aest-core.c
> +++ b/drivers/ras/aest/aest-core.c
> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>   #undef pr_fmt
>   #define pr_fmt(fmt) "AEST: " fmt
>   
> +static bool aest_panic_on_ue;
> +module_param(aest_panic_on_ue, bool, 0644);
> +MODULE_PARM_DESC(aest_panic_on_ue,
> +		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
> +
>   #ifdef CONFIG_DEBUG_FS
>   struct dentry *aest_debugfs;
>   #endif
> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record, void *data, bool fake)
>   			aest_record_info(
>   				record,
>   				"Simulated error! Skip panic due to fault injection\n");
> -		else
> +		else if (aest_panic_on_ue)
>   			aest_panic(record, &regs,
>   				   "AEST: unrecoverable error encountered");
> +		else
> +			aest_record_err(record, "UE detected, panic suppressed\n");
>   	}
>   
>   	aest_log(record, &regs);
> 


