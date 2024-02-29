Return-Path: <linux-arm-msm+bounces-12951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E186C6C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 11:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8BBB2866A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 10:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE7964CD4;
	Thu, 29 Feb 2024 10:22:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A4A64CC9;
	Thu, 29 Feb 2024 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202146; cv=none; b=L/SWL9O1ZCmRH5GHveGuNW2FmzS3nVpN31Zuy2nfDVRsFctdv7r5oMYqP9Ka0DE1kIhkxQqOT05UdL53fFBr7rWGur0Um6jQ0hRWNU1S0IQso0y3U8B1V3BqGwf3fS6xLtWAb4KMdyVup95sqw6hyr3Gw1g59jl5OKUOTVIeRi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202146; c=relaxed/simple;
	bh=zC+rOfgZk0FjySsxZFgupFvl2AUI4LOD52LgDdh6ffk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gHQzYXJwBPgnFMXl0/qDKoglVckRTasG1+UVYiM3nxhUr5Q2OVVOgQC4+RdifcwZ1hgznLw05JPj4lEO96+00irChYugRmjtKOUlbcFw/MqTUQUum32geTuc3fqawmBk4LPzUEfFSMikuE8kvq+Nq+YV+O/26KFrFxaeu0vaUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA8831FB;
	Thu, 29 Feb 2024 02:23:02 -0800 (PST)
Received: from [10.57.12.184] (unknown [10.57.12.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99F903F762;
	Thu, 29 Feb 2024 02:22:21 -0800 (PST)
Message-ID: <18c249b2-ce8c-435b-8d65-a1770a1f294e@arm.com>
Date: Thu, 29 Feb 2024 10:22:39 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] cpufreq: scmi: Register for limit change
 notifications
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com
Cc: linux-arm-kernel@lists.infradead.org, pierre.gondois@arm.com,
 dietmar.eggemann@arm.com, morten.rasmussen@arm.com, viresh.kumar@linaro.org,
 rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_mdtipton@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20240227181632.659133-1-quic_sibis@quicinc.com>
 <20240227181632.659133-3-quic_sibis@quicinc.com>
 <f8bfc666-c216-44d5-a63b-99f04ff3b8ef@arm.com>
 <2608b2d8-f3b0-b4f5-f8e4-1f2242043ded@quicinc.com>
 <64c6a1bc-92f2-4f44-ab10-cbd2473746f3@arm.com>
In-Reply-To: <64c6a1bc-92f2-4f44-ab10-cbd2473746f3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/29/24 09:59, Lukasz Luba wrote:
> 
> 
> On 2/28/24 17:00, Sibi Sankar wrote:
>>
>>
>> On 2/28/24 18:54, Lukasz Luba wrote:
>>>
>>>
>>> On 2/27/24 18:16, Sibi Sankar wrote:
>>>> Register for limit change notifications if supported and use the 
>>>> throttled
>>>> frequency from the notification to apply HW pressure.
>>
>> Lukasz,
>>
>> Thanks for taking time to review the series!
>>
>>>>
>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>> ---
>>>>
>>>> v3:
>>>> * Sanitize range_max received from the notifier. [Pierre]
>>>> * Update commit message.
>>>>
>>>>   drivers/cpufreq/scmi-cpufreq.c | 29 ++++++++++++++++++++++++++++-
>>>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/cpufreq/scmi-cpufreq.c 
>>>> b/drivers/cpufreq/scmi-cpufreq.c
>>>> index 76a0ddbd9d24..78b87b72962d 100644
>>>> --- a/drivers/cpufreq/scmi-cpufreq.c
>>>> +++ b/drivers/cpufreq/scmi-cpufreq.c
>>>> @@ -25,9 +25,13 @@ struct scmi_data {
>>>>       int domain_id;
>>>>       int nr_opp;
>>>>       struct device *cpu_dev;
>>>> +    struct cpufreq_policy *policy;
>>>>       cpumask_var_t opp_shared_cpus;
>>>> +    struct notifier_block limit_notify_nb;
>>>>   };
>>>> +const struct scmi_handle *handle;
> 
> I've missed this bit here.

So for this change we actually have to ask Cristian or Sudeep
because I'm not sure if we have only one 'handle' instance
for all cpufreq devices.

If we have different 'handle' we cannot move it to the
global single pointer.

Sudeep, Cristian what do you think?

