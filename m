Return-Path: <linux-arm-msm+bounces-29263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35B95B2F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D26D1C20F8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C42417E00C;
	Thu, 22 Aug 2024 10:34:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5561414A0B8;
	Thu, 22 Aug 2024 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724322883; cv=none; b=D8k6ueVfJ2+iEESb/b3KVrHYsxcMNz5xbU5i4Q6U1AZS7zCmae3bA/pMGUvds/xvYe2kl4YFkWpuaIrv/b0AI1vk7H0qdKEnBe+F4QFJ7NDN2R576dys019LRZEEnLMh0spmDGjpU8xS+5VbKCDhNojcXGWNefeBe6xq8uDrI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724322883; c=relaxed/simple;
	bh=ObyHFC5tccRwpQmL7QaHLGgLEm9VertuA9HLXTPamPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbRCZqepUb0+U/UDnLYbOTZxZ41V6lEB2Qxq59DZJt0c/KQLyUTBl+RwmZfXC4RWdkeMw+rewvt9AxYuMXywPCnPdTsUN1A/0v0/Wo7SSlKcpuux0/D8Lj2ZVmTPxqqvzYJCPK8hqmu5Z2gRiHGkD+ttUj+ZzfbzTzB/V/+Y4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFF7CDA7;
	Thu, 22 Aug 2024 03:35:07 -0700 (PDT)
Received: from [10.57.71.237] (unknown [10.57.71.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0769E3F66E;
	Thu, 22 Aug 2024 03:34:38 -0700 (PDT)
Message-ID: <44e2617c-62b0-436f-ac6a-0bd3e3855473@arm.com>
Date: Thu, 22 Aug 2024 11:34:36 +0100
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <xmijaayxveghxx76nnudo5mlpxv6tpxvooiox7wj2jyojf3xpe@ntm67lxikfop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>> On 21/08/2024 04:13, Tao Zhang wrote:
>>> The is some "magic" hard coded filtering in the replicators,
>>> which only passes through trace from a particular "source". Add
>>> a new property "filter-src" to label a phandle to the coresight
>>> trace source device matching the hard coded filtering for the port.
>>
>> Minor nit: Please do not use abbreviate "source" in the bindings.
>> I am not an expert on other changes below and will leave it to
>> Rob/Krzysztof to comment.
>>
>> Rob, Krzysztof,
>>
>> We need someway to "link" (add a phandle) from a "port". The patch below
>> is extending "standard" port to add a phandle. Please let us know if
>> there is a better way.
>>
>> e.g.:
>>
>> filters = list of tuples of port, phandle. ?
>>
>> e.g.:
>>
>> filters = < 0, <&tpdm_video>,
>>              1, <&tpdm_mdss>
>> 	   >
>>
> 
> Current solution feels like band-aid - what if next time you need some
> second filter? Or "wall"? Or whatever? Next property?



> 
> Isn't filter just one endpoint in the graph?
> 
> A <--> filter <--> B

To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
multi output ports).

For clearer example:

A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1) <--> B1
A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2) <--> B2
A2 <--> .. <--> ../                  p2  \ --> Unfiltered        <--> B0



> Instead of
> 
> A <----through-filter----> B?

The problem is we need to know the components in the path from A0 to X
through, (Not just A0 and L). And also we need to know "which port (p0 
vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out of the
link "L".

So ideally, we need a way to tie p0 -> A1, p1 -> A2.

would we need something else in the future ? I don't know for sure.
People could design their own things ;-). But this was the first time
ever in the last 12yrs since we supported coresight in the kernel.
(there is always a first time).

Fundamentally, the "ports" cannot have additional properties today.
Not sure if there are other usecases (I don't see why). So, we have
to manually extend like above, which I think is not nice.

Happy to proceed with anything that seems acceptable for you folks.

Suzuki



> 
> Best regards,
> Krzysztof
> 


