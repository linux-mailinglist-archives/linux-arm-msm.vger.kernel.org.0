Return-Path: <linux-arm-msm+bounces-59881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFCAC8CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1609A17F022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4AE21CA1F;
	Fri, 30 May 2025 11:32:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B70207DFE;
	Fri, 30 May 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604749; cv=none; b=VHE11aIqxHTAgcWpp5rZXdJU6JyNRBKQOJP7SF2f1cIl80mmX+Cgt86xXVy++M2f2JIz5cl1i6RhdoPZAOJWUMP64efJ/ez9FhJJYdiA8+qJskdr1NBgDTyQgcd9FK4ffPYRN6lpkzm8YXkVACNEH10QF2tPbc2JBdR6bq3/LYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604749; c=relaxed/simple;
	bh=IZRoatKPztqnNabIL/RjXl6LMAJuzxeTdCveg1nxxjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDLsjCiwrHiTOrL6toemIHuH8OT2pqIQsT+oq0ATnzoT4QipdM/7iWf5sWfzLthnaixF6vEOm0kS0mc38JRVjH7N6EVyvamxyVr5aI2k8BlCsIfiuFK/tyKtyGHtdQt7xVjdhFrXYHk6hdRcv7sV0q5I7MNDzCDHBvc5OOjlFVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 342DC16F2;
	Fri, 30 May 2025 04:32:10 -0700 (PDT)
Received: from [10.57.48.160] (unknown [10.57.48.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E1363F5A1;
	Fri, 30 May 2025 04:32:24 -0700 (PDT)
Message-ID: <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
Date: Fri, 30 May 2025 12:32:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/05/2025 11:28, Yuanfang Zhang wrote:
> 
> 
> On 5/27/2025 6:19 PM, Suzuki K Poulose wrote:
>> On 23/05/2025 09:56, Leo Yan wrote:
>>> On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:
>>>
>>> [...]
>>>
>>>>>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>>>>>> +{
>>>>>> +    int atid;
>>>>>> +
>>>>>> +    atid = coresight_trace_id_get_system_id();
>>>>>> +    if (atid < 0)
>>>>>> +        return atid;
>>>>>> +
>>>>>> +    drvdata->atid = atid;
>>>>>
>>>>> Do you need to expose this via sysfs ? Otherwise, how can you map
>>>>> a trace to a TNOC at decoding ?
>>>>
>>>> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
>>>> this TNOC. so dont expose it on this driver.
>>
>> But why ? How does that work ? The packets that come via TNOC (irrespective of the source(s)) will have the same ATID as that of the TNOC. So :
>>
>> 1) How does it help if the source exports the ID that was allocated in the TNOC driver ?
>>
> The sources connecting to TNOC will have the same ATID which allocate in TNOC.
> This is convenient as users do not need to know which source is connected to this TNOC,
> to get ID can through reading the trace_id sysfs node in the source directory.
> 
>> 2) How does the source driver know the TraceID for exposing via sysfs ?
>> Does it expose its own traceid ?
> No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
> TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
> 
> Here is the patch to expose id in source:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/

Please don't do that. We don't have to fake a traceid for all sources.
It is only of use to the decoder, with manual input from the user. So,
someone using the TNOC based system must be aware of how to collect the
traceid and as such expose it from the TNOC and not all the other
sources connected to it.

Simply expose it on the TNOC device node


Suzuki


>>
>>>
>>> If so, why the ID is not maintained in coresight_path::trace_id?
>>>
>>> A source device allocates ID and maintains in coresight path, then
>>> this ID is passed (when enabling the link) to TNOC driver to consume it.
>>
> This is because there can be multiple sources connected to one TNOC, and these sources share one Trace ID, so the ID is allocated in TNOC.
> 
>> Good question, since we have the "path" maintaining the TraceID, we
>> should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
>>
>   
> yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
> To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.
> 
>> Cheers
>> Suzuki
>>
>>
>>>
>>> Thanks,
>>> Leo
>>
>>
>>
> 


