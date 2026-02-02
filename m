Return-Path: <linux-arm-msm+bounces-91449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN5MMFNugGnC8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:28:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACFCA20B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 993043014137
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6E62D3725;
	Mon,  2 Feb 2026 09:28:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4E82D1303;
	Mon,  2 Feb 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024526; cv=none; b=trZp3PxTH6VMGwZislcfD0NNrPNFCVDJMs2mqKEAKB3SDcigJx2KEgkre6g2E2PRIyg8HQvI2AJEQSZsIguQQ9YZ28C5wQ7E0ORe2wzJ1CZ0o0cqnQi+quMTWDbhKxGbiCaHOk8ToM74VtPs9djuB2zE4zwYl6Mwri15VYh6d/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024526; c=relaxed/simple;
	bh=G6PtPzroV9EeBbsBjvm/hrn+ocgXS6tCTSUukUqNUUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQuBrDi+35cI5oJ1Zts8bhdX8b6VMfhBSwP/EXFA8fRAywd7WlthgqYxJtTeqEO9MvZlpSjdnJq13DeEgngX8o0fyzSMqdqKD3f/MOO+gvPIl3i14xRppkP+EQKSgZIb46TncVU19DWIdx4WPv6fEnJNuf9IQDoRJ/lcB2oRyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 124D3339;
	Mon,  2 Feb 2026 01:28:38 -0800 (PST)
Received: from [10.57.7.119] (unknown [10.57.7.119])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55B53F740;
	Mon,  2 Feb 2026 01:28:41 -0800 (PST)
Message-ID: <3f20ae13-a206-4ddc-8556-f929d8727b50@arm.com>
Date: Mon, 2 Feb 2026 09:28:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, webgeek1234@gmail.com,
 Xilin Wu <wuxilin123@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
 <fec5907a-5619-4997-9e8f-034efdd31993@oss.qualcomm.com>
 <l6vdnit4sd5rx3k236dwrmywudkmydxfjprn2c5i7fsfmlqfnu@tabbezrje36b>
 <76c24508-bb75-475a-b973-d7ad18c302ce@oss.qualcomm.com>
 <2ca3a260-d05f-4f2d-bf3f-08b4a3908792@arm.com>
 <26e2aa8a-912b-4e83-ad00-130cc137aa4b@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <26e2aa8a-912b-4e83-ad00-130cc137aa4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91449-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85ACFCA20B
X-Rspamd-Action: no action



On 1/29/26 11:56, Konrad Dybcio wrote:
> On 1/29/26 12:38 PM, Lukasz Luba wrote:
>>
>>
>> On 1/29/26 11:23, Konrad Dybcio wrote:
>>> On 1/29/26 12:05 PM, Viresh Kumar wrote:
>>>> On 29-01-26, 12:00, Konrad Dybcio wrote:
>>>>> On 1/28/26 8:11 PM, Aaron Kling via B4 Relay wrote:
>>>>>> It should be noted that the A715 cores seem less efficient than the
>>>>>> A710 cores. Therefore, an average value has been assigned to them,
>>>>>> considering that the A715 and A710 cores share a single cpufreq
>>>>>> domain.
>>>>>
>>>>> Regarding the CPUFreq domain shared across cores with different power
>>>>> characteristics, I think we shouldn't be lying to the OS, rather Linux
>>>>> should be able to deal with it, somehow.
>>>>
>>>> cpufreq-domain == cpufreq-policy here I guess. All CPUs that change
>>>> their DVFS state together should be part of one policy. Not sure if
>>>> there is something else you were pointing at.
>>>
>>> Yes, they change their state together.
>>>
>>> The question is whether it's okay for these CPUs to have different
>>> dynamic-power-coefficient values, and whether the EM code won't be
>>> thrown off by that.
>>
>> The Energy Model won't support that, since it's a single
>> instance per-cpufreq-policy and we have to pick 'some' values (in this
>> case).
> 
> Do you think taking an average, like suggested by the original author,
> makes sense here?
> 
>>> Again, they differ because within that shared policy, there's 2
>>> separate kinds of cores (2x Cortex-A715 + 2x Cortex-A710).
>>>
>>
>> For this SoC I assume the physical HW (power rail and frequency domain)
>> is linked to those 4 CPUs. That's quite novel configuration...
>>
>> Maybe I could give you some hint at least for the EAS part (the EM
>> for EAS), because for something in other areas (e.g. thermal) might
>> be really tough.
> 
> In this case, these cores have **fairly** similar power/perf
> characteristics, as evidenced by the measurements in the root of
> this thread, see:
> 
> https://lore.kernel.org/linux-arm-msm/20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com/
> 
>> What are the other CPUs in that SoC and their DVFS configs?
> 
> Domain 0: 3x A510
> Domain 1: 2x A715 + 2x A710
> Domain 2: 1x X3
> 

I have analyzed that data both: power and performance
(the 7-zip benchmark). It looks good and might fly upstream.
Although, I wonder if that benchmark truly reflects the
workload for that gaming handheld...

For 'normal' usage (mix of stuff running on a device, not
mainly games) these derived numbers are promising.
The plot that I got for the Energy Model shows fairly
similar efficiency for a710 and a715 - which is expected.
There is also a nice size (60%) of an overlapping region to operate
on for the EAS. That would be typical model for day-of-usage
with mixed scenario.
The platform engineers can later modify the EM data in run-time
to better reflect their workload's behavior on the SoC.

Since this is mainline change for sm8550 and looks - LGTM.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Regards,
Lukasz

