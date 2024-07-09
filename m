Return-Path: <linux-arm-msm+bounces-25601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2392B578
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD04285201
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89ED156F32;
	Tue,  9 Jul 2024 10:38:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C86156883;
	Tue,  9 Jul 2024 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720521490; cv=none; b=YzroQ5znugVQaorXbsP4vMlvhMyVY5dwuWgLJa6gA7nziDoZxsOZ6OHrmgTfmnpLciBdtQgJNJwxRRTM7isDN+0GtiADI5+Lyi9Q0xleg/RA0OW1m6a8Tj0t6vVnCyhNzbFZdlh+7MOLRZtSzGPjc/j51uB9qnnjdFcln2oc874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720521490; c=relaxed/simple;
	bh=B9MLiWwhvjIVDmzpViCggJ8PFLNRpRaLQkP3nygbQXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B76qVpN2lriruAVeb6P9zfAAJPDI5aM/4tn75EyK3Y/qNSVw16lOHzllA6hrOuRcuyWoxYPq8PVEBxf067hoaunTswSDWhajcp2qJ3pSCSuO4I7PCzN2rKGOmD13BeIMjjt0XzmR0C69kyNPs9bj5NaMxW/M8KtkbaFvoZuRR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 246AF153B;
	Tue,  9 Jul 2024 03:38:33 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 839A23F762;
	Tue,  9 Jul 2024 03:38:04 -0700 (PDT)
Message-ID: <97bb37b0-d700-440e-bc21-f4fa338ee9f9@arm.com>
Date: Tue, 9 Jul 2024 11:38:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tao Zhang <quic_taozha@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-2-quic_taozha@quicinc.com>
 <907ec6a8-da8b-4b9a-aac0-c650bab04905@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <907ec6a8-da8b-4b9a-aac0-c650bab04905@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



minor nit: Subject: 
s/qcom,coresight-static-replicator/arm,coresight-static-replicator ? 
There is no "qcom,coresight-static-replicator" compatible.

On 05/07/2024 10:02, Krzysztof Kozlowski wrote:

> On 05/07/2024 10:51, Tao Zhang wrote:
>> Add a new property "filter_src" to label the source corresponding
>> to the output connection for a static replicator. By combining
>> a funnel and a static replicator in devicetree, a new device that
>> supports multi-port input and multi-port output is implemented.
>> In order to match the output port with the input port and
>> successfully build the trace path, add this new property to
>> indicate the data source corresponding to this output port.
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   .../arm/arm,coresight-static-replicator.yaml   | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>> index 1892a091ac35..d9538563f9c6 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>> @@ -45,7 +45,21 @@ properties:
>>       patternProperties:
>>         '^port@[01]$':
>>           description: Output connections to CoreSight Trace bus
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
> 
> Ehm? How is this video interface?
> 
>> +
>> +            properties:
>> +              filter_src:
> 
> There are no properties with underscores...
> 
>> +                $ref: /schemas/types.yaml#/definitions/phandle
>> +                description:
>> +                  defines a phandle reference to an associated CoreSight trace device.
>> +                  When the associated trace device is enabled, then the respective
>> +                  trace path will be built and enabled.
> 
> How does it differ from remote endpoint? What is "respective trace path"?

Apparently, there is some "magic" hard coded filtering in the
replicators, which only passes through trace from a particular "source"
device. The documentation above doesn't explain this clearly.

it could be:

"phandle to the coresight trace source device matching the hard coded
filtering for this port"

This could be different from the "remote endpoint" as there could be
intermediate components between the phandle "source" and the port.


Suzuki



> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
> 
> 
> Best regards,
> Krzysztof
> 


