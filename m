Return-Path: <linux-arm-msm+bounces-29279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E697D95B43E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256E11C230EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BA81C9457;
	Thu, 22 Aug 2024 11:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92A91C9428;
	Thu, 22 Aug 2024 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327427; cv=none; b=ZIJM0bv41TaNTDwQgmFb7pptNdXQ5W3fNOOw9MSdPhF6gnBxC+fCijoSQEGaq5oY6EXsKIl99QOhICg0DwPQA9tOKe+1aAzxAa2nLRa29DiCON8LWiwGRto4iT166ni3gv9ObDUNfbmi5EZBcU1DJ96cCSpcxPnyYkJLcyDZb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327427; c=relaxed/simple;
	bh=XXKGzE7Rd62JJickoifzIAp34sE8kiiPeOtfKnQBOws=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VxHCQAkhobLmI2n/MouPuWP9OaEAyZnjWmVPJJfttDjOWwOJKzq9lj+dPEKotKnh0m/4ftv8htj0lQC/gXXhWaXTmPCrCsPcEdgesafRCWfDbyMK/jDReL7TYF/+qSA29wN2oC3R3ZKy7NNoVy5WBMxCcY3q4EMKailrH6S3LkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B53ADA7;
	Thu, 22 Aug 2024 04:50:50 -0700 (PDT)
Received: from [10.57.71.237] (unknown [10.57.71.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E29023F66E;
	Thu, 22 Aug 2024 04:50:21 -0700 (PDT)
Message-ID: <53ec46af-3438-44e0-82b2-9432fc7f0fcb@arm.com>
Date: Thu, 22 Aug 2024 12:50:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
Content-Language: en-GB
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
In-Reply-To: <44e2617c-62b0-436f-ac6a-0bd3e3855473@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2024 11:34, Suzuki K Poulose wrote:
> On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
>> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>>> On 21/08/2024 04:13, Tao Zhang wrote:
>>>> The is some "magic" hard coded filtering in the replicators,
>>>> which only passes through trace from a particular "source". Add
>>>> a new property "filter-src" to label a phandle to the coresight
>>>> trace source device matching the hard coded filtering for the port.
>>>
>>> Minor nit: Please do not use abbreviate "source" in the bindings.
>>> I am not an expert on other changes below and will leave it to
>>> Rob/Krzysztof to comment.
>>>
>>> Rob, Krzysztof,
>>>
>>> We need someway to "link" (add a phandle) from a "port". The patch below
>>> is extending "standard" port to add a phandle. Please let us know if
>>> there is a better way.
>>>
>>> e.g.:
>>>
>>> filters = list of tuples of port, phandle. ?
>>>
>>> e.g.:
>>>
>>> filters = < 0, <&tpdm_video>,
>>>              1, <&tpdm_mdss>
>>>        >
>>>
>>
>> Current solution feels like band-aid - what if next time you need some
>> second filter? Or "wall"? Or whatever? Next property?
> 
> 
> 
>>
>> Isn't filter just one endpoint in the graph?
>>
>> A <--> filter <--> B
> 
> To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
> multi output ports).
> 
> For clearer example:
> 
> A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1) <--> B1
> A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2) <--> B2
> A2 <--> .. <--> ../                  p2  \ --> Unfiltered        <--> B0
> 
> 
> 
>> Instead of
>>
>> A <----through-filter----> B?
> 
> The problem is we need to know the components in the path from A0 to X
> through, (Not just A0 and L). And also we need to know "which port (p0 
> vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out of the
> link "L".
> 
> So ideally, we need a way to tie p0 -> A1, p1 -> A2.
> 
> would we need something else in the future ? I don't know for sure.
> People could design their own things ;-). But this was the first time
> ever in the last 12yrs since we supported coresight in the kernel.
> (there is always a first time).
> 
> Fundamentally, the "ports" cannot have additional properties today.
> Not sure if there are other usecases (I don't see why). So, we have
> to manually extend like above, which I think is not nice.

Replying to the other thread [0], made me realize that the above is not
true. Indeed it is possible to add properties for endpoints, e.g:

e.g.: media/video-interfaces.yaml

So extending the endpoint node is indeed acceptable (unlike I thought).
May be the we it is achieved in this patch is making it look otherwise.

Suzuki
[0] https://lkml.kernel.org/r/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com



> 
> Happy to proceed with anything that seems acceptable for you folks.
> 
> Suzuki
> 
> 
> 
>>
>> Best regards,
>> Krzysztof
>>
> 


