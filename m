Return-Path: <linux-arm-msm+bounces-57144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623AAADDE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37D447B2E06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 11:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64CF2580C2;
	Wed,  7 May 2025 11:59:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B402C221F13;
	Wed,  7 May 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619179; cv=none; b=Cu0qVAdhye1Vw69xTkEpmqnJQP2+ZhZZYNBZsLlduskY2VbXxDeDI6I6NZKskKD7D8F22Ggk9QERrREbNyGhzBtVMFHV1gcc6fep/2eixhVrXVBUIISrcXHUGrQ2LtNxjPXdD01kZ1goGlZLBXLvQzapnyz59MnVNm2we/+pfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619179; c=relaxed/simple;
	bh=AI1HsAKecU9VCI5dP/B+WfjaQBA4Oer2ejuRed1fboI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HoEAfldLJVgQA79o6We7H5X89z0zLyab0D+54LCK86ntbuBqBVZdwY+Ve99xBI7QvgCwG059AdIsVLYgCRVCi3dpo8qwlBeSRW3A6gK9q07p+IOIjGkOW/aeQ9rN9WMGaQ5UPGrLnHK1L3Aecll+gm98UsIBwGf97BoeHdTAk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC905339;
	Wed,  7 May 2025 04:59:26 -0700 (PDT)
Received: from [10.1.30.69] (Suzukis-MBP.cambridge.arm.com [10.1.30.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC54B3F5A1;
	Wed,  7 May 2025 04:59:34 -0700 (PDT)
Message-ID: <f4db016a-0c57-4213-8eca-75a090d7aabb@arm.com>
Date: Wed, 7 May 2025 12:59:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
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
 <069e920c-7023-4a6d-b1c6-dc87ac9d2360@arm.com>
In-Reply-To: <069e920c-7023-4a6d-b1c6-dc87ac9d2360@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/05/2025 09:52, Suzuki K Poulose wrote:
> On 07/05/2025 05:26, Yuanfang Zhang wrote:
>>
>>
>> On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
>>> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>>>
>>>>
>>>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>>>> Add a driver to support Coresight device Trace Network On Chip 
>>>>>> (TNOC),
>>>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>>>> and funnels. It aggregates the trace and transports to coresight 
>>>>>> trace
>>>>>> bus.
>>>>>>
>>>>>> Compared to current configuration, it has the following advantages:
>>>>>> 1. Reduce wires between subsystems.
>>>>>> 2. Continue cleaning the infrastructure.
>>>>>> 3. Reduce Data overhead by transporting raw data from source to 
>>>>>> target.
>>>>>>
>>>>>>      +------------------------+                
>>>>>> +-------------------------+
>>>>>>      | Video Subsystem        |                |Video 
>>>>>> Subsystem          |
>>>>>>      |       +-------------+  |                |       
>>>>>> +------------+    |
>>>>>>      |       | Video TPDM  |  |                |       | Video 
>>>>>> TPDM |    |
>>>>>>      |       +-------------+  |                |       
>>>>>> +------------+    |
>>>>>>      |            |           |                |              | 
>>>>>>           |
>>>>>>      |            v           |                |              
>>>>>> v          |
>>>>>>      |   +---------------+    |                |        
>>>>>> +-----------+    |
>>>>>>      |   | Video funnel  |    |                |        |Video 
>>>>>> TNOC |    |
>>>>>>      |   +---------------+    |                |        
>>>>>> +-----------+    |
>>>>>>      +------------|-----------+                
>>>>>> +------------|------------+
>>>>>>                   |                                         |
>>>>>>                   v-----+                                   |
>>>>>> +--------------------|---------+                         |
>>>>>> |  Multimedia        v         |                         |
>>>>>> |  Subsystem   +--------+      |                         |
>>>>>> |              |  TPDA  |      |                         v
>>>>>> |              +----|---+      |              +---------------------+
>>>>>> |                   |          |              |    Aggregator TNOC  |
>>>>>> |                   |          |              +----------|----------+
>>>>>> |                   +--        |                         |
>>>>>> |                     |        |                         |
>>>>>> |                     |        |                         |
>>>>>> |              +------v-----+  |                         |
>>>>>> |              |  Funnel    |  |                         |
>>>>>> |              +------------+  |                         |
>>>>>> +----------------|-------------+                         |
>>>>>>                     |                                       |
>>>>>>                     v                                       v
>>>>>>          +--------------------+                    
>>>>>> +------------------+
>>>>>>          |   Coresight Sink   |                    |  Coresight 
>>>>>> Sink  |
>>>>>>          +--------------------+                    
>>>>>> +------------------+
>>>>>
>>>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>>>
>>>> Not each TNOC has TraceID, there is only one TNOC has TraceID for 
>>>> one path
>>>> from Source to sink. In the example, only the aggregator TNOC has 
>>>> traceID.
>>>> Decode trace relying on TraceID + Inport number.
>>>> It can has mutiple TNOC/TPDA in one path.
>>>
>>> So do we only describe the TNOCs that need traceId in the DT ? (e.g., 
>>> Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
>>> trace id for it by default, when it is described ?
>>>
>>> Suzuki
>>>
>> yes, now only describe the TNOCs which need traceID, Video TNOC is 
>> another type, it is interconnect TNOC which collects trace from 
>> subsystems
>> and transfers Aggr TNOC, it doesn't have ATID. Its driver is different 
>> from this patch, I want to describe it when upstream its driver.

So, if both are TNOC and there different types of them, how do you plan
to identify, which is what ?

And we also have a dt-bindings which simply says "coresight-tnoc". Isn't 
too generic if it is meant to be "aggregator" ?

Suzuki



> 
> Thanks! Please could you make sure to describe all of this when sending
> out a patch in the cover letter ?
> 
> Cheers
> Suzuki
> 
> 
>>
>> Yuanfang
>>
>>
>>
>>
>>
>>
> 


