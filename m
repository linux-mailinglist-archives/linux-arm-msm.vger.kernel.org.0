Return-Path: <linux-arm-msm+bounces-91164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMOOEt1Ge2kdDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:39:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FBAFB64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DADC30115BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478303806D9;
	Thu, 29 Jan 2026 11:38:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF6F2E2665;
	Thu, 29 Jan 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686726; cv=none; b=TaZ64ZZk5j6tSMISpLJpbg4BMDhiFjXSDm+L4D87lQXJeWz3w29fIR211I08wPkHMy05Eauc9sqyrIkm9+wRCC087UQJBPWWLQUnf16zog6SLU5GVrA6sVZ2jMUxZEVhIuyyoqE6RPy8maZvsW3ru6SwrTSdXEIpe6DRv7JzKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686726; c=relaxed/simple;
	bh=gn1GTeanFS2tyXtDUWwyjgOPS2OlfxQ6NFktIwKSUEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0f8B//N2ojtRY+SyBTub7CViu9BRht9n/IMzF3cb4Zb1PEExJyRwgbgDhJCfAnrUltwgDQ2dR0AmksnMR3m0OuW4j2YU8unw82OLYrPU6Cj0i8MCFbc062zgWrUbs/xvKawe4o3qyOjNwzNsks3w4vew9TsxBIwfr0S5bNvnjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 849AC1516;
	Thu, 29 Jan 2026 03:38:36 -0800 (PST)
Received: from [10.57.17.98] (unknown [10.57.17.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046403F73F;
	Thu, 29 Jan 2026 03:38:39 -0800 (PST)
Message-ID: <2ca3a260-d05f-4f2d-bf3f-08b4a3908792@arm.com>
Date: Thu, 29 Jan 2026 11:38:41 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xilin Wu <wuxilin123@gmail.com>
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
 <fec5907a-5619-4997-9e8f-034efdd31993@oss.qualcomm.com>
 <l6vdnit4sd5rx3k236dwrmywudkmydxfjprn2c5i7fsfmlqfnu@tabbezrje36b>
 <76c24508-bb75-475a-b973-d7ad18c302ce@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <76c24508-bb75-475a-b973-d7ad18c302ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91164-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD8FBAFB64
X-Rspamd-Action: no action



On 1/29/26 11:23, Konrad Dybcio wrote:
> On 1/29/26 12:05 PM, Viresh Kumar wrote:
>> On 29-01-26, 12:00, Konrad Dybcio wrote:
>>> On 1/28/26 8:11 PM, Aaron Kling via B4 Relay wrote:
>>>> It should be noted that the A715 cores seem less efficient than the
>>>> A710 cores. Therefore, an average value has been assigned to them,
>>>> considering that the A715 and A710 cores share a single cpufreq
>>>> domain.
>>>
>>> Regarding the CPUFreq domain shared across cores with different power
>>> characteristics, I think we shouldn't be lying to the OS, rather Linux
>>> should be able to deal with it, somehow.
>>
>> cpufreq-domain == cpufreq-policy here I guess. All CPUs that change
>> their DVFS state together should be part of one policy. Not sure if
>> there is something else you were pointing at.
> 
> Yes, they change their state together.
> 
> The question is whether it's okay for these CPUs to have different
> dynamic-power-coefficient values, and whether the EM code won't be
> thrown off by that.

The Energy Model won't support that, since it's a single
instance per-cpufreq-policy and we have to pick 'some' values (in this
case).

> 
> Again, they differ because within that shared policy, there's 2
> separate kinds of cores (2x Cortex-A715 + 2x Cortex-A710).
> 

For this SoC I assume the physical HW (power rail and frequency domain)
is linked to those 4 CPUs. That's quite novel configuration...

Maybe I could give you some hint at least for the EAS part (the EM
for EAS), because for something in other areas (e.g. thermal) might
be really tough.

What are the other CPUs in that SoC and their DVFS configs?

Regards,
Lukasz


