Return-Path: <linux-arm-msm+bounces-33684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCA9967B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 12:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585191C23F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D985918FC80;
	Wed,  9 Oct 2024 10:52:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8F6189F20;
	Wed,  9 Oct 2024 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471148; cv=none; b=qFL/uiGOFsfDhp81vLt+MuSXI3Qirp3P/LBwhJYBFNdvUQNWh+KogPytlCQSBlKesiEIYKI0nCPj7BpyKYaNHKEEmHmq+rSBCoBwGrXtqnUoYsRmM+jh7rpU1QXoXO4EHCJsT4MuPfyQobG8GF4ZBA9AB1bGSr8SC/a6KV8GinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471148; c=relaxed/simple;
	bh=PknlLcryNm75GsVtVIIRXRryldwlIq8U4BKG8JoBMUU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bvEHnNNXSlK4HkyuabYaQvnaso7b/J5AjLr/zYFeFSM4Yo55Dh5214KswbJGinJQg9bvAWOYVKlIj1YwrLQhOZaiRfLAjLLWIE/Qle3/HSuyb/rpxQkv0S2M8MsVXXjPlI921a4cSgSkYKh2mGMNBQvDI9yfGPimjuMcT/rQTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6F31139F;
	Wed,  9 Oct 2024 03:52:55 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763AD3F64C;
	Wed,  9 Oct 2024 03:52:24 -0700 (PDT)
Message-ID: <4a6066ed-ead4-4387-8c66-b3e7631c5e90@arm.com>
Date: Wed, 9 Oct 2024 11:52:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
 <20240821031348.6837-2-quic_taozha@quicinc.com>
 <a01d2f2f-d963-4eb1-98ee-3dc6f86c9397@arm.com>
 <xmijaayxveghxx76nnudo5mlpxv6tpxvooiox7wj2jyojf3xpe@ntm67lxikfop>
 <44e2617c-62b0-436f-ac6a-0bd3e3855473@arm.com>
 <53ec46af-3438-44e0-82b2-9432fc7f0fcb@arm.com>
Content-Language: en-US
In-Reply-To: <53ec46af-3438-44e0-82b2-9432fc7f0fcb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Krzysztof

On 22/08/2024 12:50, Suzuki K Poulose wrote:
> On 22/08/2024 11:34, Suzuki K Poulose wrote:
>> On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>>>> On 21/08/2024 04:13, Tao Zhang wrote:
>>>>> The is some "magic" hard coded filtering in the replicators,
>>>>> which only passes through trace from a particular "source". Add
>>>>> a new property "filter-src" to label a phandle to the coresight
>>>>> trace source device matching the hard coded filtering for the port.
>>>>
>>>> Minor nit: Please do not use abbreviate "source" in the bindings.
>>>> I am not an expert on other changes below and will leave it to
>>>> Rob/Krzysztof to comment.
>>>>
>>>> Rob, Krzysztof,
>>>>
>>>> We need someway to "link" (add a phandle) from a "port". The patch 
>>>> below
>>>> is extending "standard" port to add a phandle. Please let us know if
>>>> there is a better way.
>>>>
>>>> e.g.:
>>>>
>>>> filters = list of tuples of port, phandle. ?
>>>>
>>>> e.g.:
>>>>
>>>> filters = < 0, <&tpdm_video>,
>>>>              1, <&tpdm_mdss>
>>>>        >
>>>>
>>>
>>> Current solution feels like band-aid - what if next time you need some
>>> second filter? Or "wall"? Or whatever? Next property?
>>
>>
>>
>>>
>>> Isn't filter just one endpoint in the graph?
>>>
>>> A <--> filter <--> B
>>
>> To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
>> multi output ports).
>>
>> For clearer example:
>>
>> A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1) <--> B1
>> A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2) <--> B2
>> A2 <--> .. <--> ../                  p2  \ --> Unfiltered        <--> B0
>>
>>
>>
>>> Instead of
>>>
>>> A <----through-filter----> B?
>>
>> The problem is we need to know the components in the path from A0 to X
>> through, (Not just A0 and L). And also we need to know "which port (p0 
>> vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out of the
>> link "L".
>>
>> So ideally, we need a way to tie p0 -> A1, p1 -> A2.
>>
>> would we need something else in the future ? I don't know for sure.
>> People could design their own things ;-). But this was the first time
>> ever in the last 12yrs since we supported coresight in the kernel.
>> (there is always a first time).
>>
>> Fundamentally, the "ports" cannot have additional properties today.
>> Not sure if there are other usecases (I don't see why). So, we have
>> to manually extend like above, which I think is not nice.
> 
> Replying to the other thread [0], made me realize that the above is not
> true. Indeed it is possible to add properties for endpoints, e.g:
> 
> e.g.: media/video-interfaces.yaml
> 
> So extending the endpoint node is indeed acceptable (unlike I thought).
> May be the we it is achieved in this patch is making it look otherwise.
> 
> Suzuki
> [0] https://lkml.kernel.org/r/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com

Please could you let us know if it is acceptable to extend "endpoint"
node to have an optional property ?

Suzuki


> 
> 
> 
>>
>> Happy to proceed with anything that seems acceptable for you folks.
>>
>> Suzuki
>>
>>
>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
> 


