Return-Path: <linux-arm-msm+bounces-57124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0647AADA87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D311BC4A32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F6A1FE471;
	Wed,  7 May 2025 08:52:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B13C81AC8;
	Wed,  7 May 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607927; cv=none; b=msy9u9GqlBVg+lE4VyLkGEo4mVYzWDpH7JT5St+QYpe8ZdeWQQ8naEqR4E/9tLjPj1KCIpp12eSo6a6DrV1M8jM1rSlFdH7oL32fEcIG5/81dmSzVCRF8RslPCrWWwfckKHy3GsjCSxeXESMcFcnFRIf+Swh7IqgHIQzXIQUJ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607927; c=relaxed/simple;
	bh=MgC7MChP2fK6enVEFZ69XfxJRlM6m0+mU3GHSR5+Bbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQ6vvvAwsjvf5tXClrgZJ+4ENSH0ZSJHk4qPZS5kSY2AYQVw6G32xv2ewoAqBX+7E1G4UF3AR7JE+ankAJA8jox+/W8E3uIa94IgeB9cd0CLK4qZdV4fDA5+RBrIcNRZiqvXDlVMyEOqme+50nJYR3D4fNm3piMzUsaSudvlHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478962B;
	Wed,  7 May 2025 01:51:55 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89853F673;
	Wed,  7 May 2025 01:52:03 -0700 (PDT)
Message-ID: <069e920c-7023-4a6d-b1c6-dc87ac9d2360@arm.com>
Date: Wed, 7 May 2025 09:52:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
 <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
 <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
 <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/05/2025 05:26, Yuanfang Zhang wrote:
> 
> 
> On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
>> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>>
>>>
>>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>>> and funnels. It aggregates the trace and transports to coresight trace
>>>>> bus.
>>>>>
>>>>> Compared to current configuration, it has the following advantages:
>>>>> 1. Reduce wires between subsystems.
>>>>> 2. Continue cleaning the infrastructure.
>>>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>>>
>>>>>      +------------------------+                +-------------------------+
>>>>>      | Video Subsystem        |                |Video Subsystem          |
>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>      |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>      |            |           |                |              |          |
>>>>>      |            v           |                |              v          |
>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>      |   | Video funnel  |    |                |        |Video TNOC |    |
>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>      +------------|-----------+                +------------|------------+
>>>>>                   |                                         |
>>>>>                   v-----+                                   |
>>>>> +--------------------|---------+                         |
>>>>> |  Multimedia        v         |                         |
>>>>> |  Subsystem   +--------+      |                         |
>>>>> |              |  TPDA  |      |                         v
>>>>> |              +----|---+      |              +---------------------+
>>>>> |                   |          |              |    Aggregator TNOC  |
>>>>> |                   |          |              +----------|----------+
>>>>> |                   +--        |                         |
>>>>> |                     |        |                         |
>>>>> |                     |        |                         |
>>>>> |              +------v-----+  |                         |
>>>>> |              |  Funnel    |  |                         |
>>>>> |              +------------+  |                         |
>>>>> +----------------|-------------+                         |
>>>>>                     |                                       |
>>>>>                     v                                       v
>>>>>          +--------------------+                    +------------------+
>>>>>          |   Coresight Sink   |                    |  Coresight Sink  |
>>>>>          +--------------------+                    +------------------+
>>>>
>>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>>
>>> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
>>> from Source to sink. In the example, only the aggregator TNOC has traceID.
>>> Decode trace relying on TraceID + Inport number.
>>> It can has mutiple TNOC/TPDA in one path.
>>
>> So do we only describe the TNOCs that need traceId in the DT ? (e.g., Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
>> trace id for it by default, when it is described ?
>>
>> Suzuki
>>
> yes, now only describe the TNOCs which need traceID, Video TNOC is another type, it is interconnect TNOC which collects trace from subsystems
> and transfers Aggr TNOC, it doesn't have ATID. Its driver is different from this patch, I want to describe it when upstream its driver.

Thanks! Please could you make sure to describe all of this when sending
out a patch in the cover letter ?

Cheers
Suzuki


> 
> Yuanfang
> 
> 
> 
> 
> 
> 


