Return-Path: <linux-arm-msm+bounces-34930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB589A3BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13609B20364
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9222320103B;
	Fri, 18 Oct 2024 10:47:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE66218628F;
	Fri, 18 Oct 2024 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248438; cv=none; b=XXg7DqHD44YCVOIPCPCzrvvymZhxsamVnEJE9UwN/WH0NMtj/eNP7eCQEMD91aQfD8n1vjaLbyZLQ9xaPzcSRX17cCDt/evBxTACgelZIV2tG+9MkHKA/hxn0iMFirDNjaGifjUX+Z4DDrQLLdOHH5uu65vF2CPn9WiQCgpgYiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248438; c=relaxed/simple;
	bh=U4MO43y2QutJRYvdGmha9sXJSbkX+wcJwKLnrxg41lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IA1GLqJ2fsaZR06zeWmy2GGj5JWWigTUEy10LkPzu3j/SJThJydoVwe5tU3ECrYurFTKfgblbX523gumtCr/iHRM6NcSC1tW/LvhElAvFTu8BEOrcCvvXjhggO89RQmRHU1393YlyTHhjfEdnZIRXcxbu1My8UHTRTZZYh7udSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDD47FEC;
	Fri, 18 Oct 2024 03:47:44 -0700 (PDT)
Received: from [10.57.22.188] (unknown [10.57.22.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 072503F58B;
	Fri, 18 Oct 2024 03:47:11 -0700 (PDT)
Message-ID: <23828c8d-633d-4705-9ec6-f15a6fdeea41@arm.com>
Date: Fri, 18 Oct 2024 11:47:10 +0100
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
To: Krzysztof Kozlowski <krzk@kernel.org>, Tao Zhang <quic_taozha@quicinc.com>
Cc: Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
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
 <4a6066ed-ead4-4387-8c66-b3e7631c5e90@arm.com>
 <6e408062-9a74-4a2a-8b67-b83244c4ca95@quicinc.com>
 <ce439616-072b-463f-b293-8a186f8282bd@kernel.org>
 <b62435d7-8f25-4555-9e50-3e03e249e0b7@arm.com>
 <3dee4753-9df1-4fc5-8805-34a5d05beaa4@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <3dee4753-9df1-4fc5-8805-34a5d05beaa4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/10/2024 11:31, Krzysztof Kozlowski wrote:
> On 18/10/2024 12:08, Suzuki K Poulose wrote:
>> On 18/10/2024 11:05, Krzysztof Kozlowski wrote:
>>> On 17/10/2024 09:23, Tao Zhang wrote:
>>>>
>>>> On 10/9/2024 6:52 PM, Suzuki K Poulose wrote:
>>>>> Krzysztof
>>>>>
>>>>> On 22/08/2024 12:50, Suzuki K Poulose wrote:
>>>>>> On 22/08/2024 11:34, Suzuki K Poulose wrote:
>>>>>>> On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
>>>>>>>> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>>>>>>>>> On 21/08/2024 04:13, Tao Zhang wrote:
>>>>>>>>>> The is some "magic" hard coded filtering in the replicators,
>>>>>>>>>> which only passes through trace from a particular "source". Add
>>>>>>>>>> a new property "filter-src" to label a phandle to the coresight
>>>>>>>>>> trace source device matching the hard coded filtering for the port.
>>>>>>>>>
>>>>>>>>> Minor nit: Please do not use abbreviate "source" in the bindings.
>>>>>>>>> I am not an expert on other changes below and will leave it to
>>>>>>>>> Rob/Krzysztof to comment.
>>>>>>>>>
>>>>>>>>> Rob, Krzysztof,
>>>>>>>>>
>>>>>>>>> We need someway to "link" (add a phandle) from a "port". The patch
>>>>>>>>> below
>>>>>>>>> is extending "standard" port to add a phandle. Please let us know if
>>>>>>>>> there is a better way.
>>>>>>>>>
>>>>>>>>> e.g.:
>>>>>>>>>
>>>>>>>>> filters = list of tuples of port, phandle. ?
>>>>>>>>>
>>>>>>>>> e.g.:
>>>>>>>>>
>>>>>>>>> filters = < 0, <&tpdm_video>,
>>>>>>>>>                1, <&tpdm_mdss>
>>>>>>>>>          >
>>>>>>>>>
>>>>>>>>
>>>>>>>> Current solution feels like band-aid - what if next time you need some
>>>>>>>> second filter? Or "wall"? Or whatever? Next property?
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Isn't filter just one endpoint in the graph?
>>>>>>>>
>>>>>>>> A <--> filter <--> B
>>>>>>>
>>>>>>> To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
>>>>>>> multi output ports).
>>>>>>>
>>>>>>> For clearer example:
>>>>>>>
>>>>>>> A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1)
>>>>>>> <--> B1
>>>>>>> A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2)
>>>>>>> <--> B2
>>>>>>> A2 <--> .. <--> ../                  p2  \ --> Unfiltered
>>>>>>> <--> B0
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Instead of
>>>>>>>>
>>>>>>>> A <----through-filter----> B?
>>>>>>>
>>>>>>> The problem is we need to know the components in the path from A0 to X
>>>>>>> through, (Not just A0 and L). And also we need to know "which port
>>>>>>> (p0 vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out
>>>>>>> of the
>>>>>>> link "L".
>>>>>>>
>>>>>>> So ideally, we need a way to tie p0 -> A1, p1 -> A2.
>>>>>>>
>>>>>>> would we need something else in the future ? I don't know for sure.
>>>>>>> People could design their own things ;-). But this was the first time
>>>>>>> ever in the last 12yrs since we supported coresight in the kernel.
>>>>>>> (there is always a first time).
>>>>>>>
>>>>>>> Fundamentally, the "ports" cannot have additional properties today.
>>>>>>> Not sure if there are other usecases (I don't see why). So, we have
>>>>>>> to manually extend like above, which I think is not nice.
>>>>>>
>>>>>> Replying to the other thread [0], made me realize that the above is not
>>>>>> true. Indeed it is possible to add properties for endpoints, e.g:
>>>>>>
>>>>>> e.g.: media/video-interfaces.yaml
>>>>>>
>>>>>> So extending the endpoint node is indeed acceptable (unlike I thought).
>>>>>> May be the we it is achieved in this patch is making it look otherwise.
>>>>>>
>>>>>> Suzuki
>>>>>> [0]
>>>>>> https://lkml.kernel.org/r/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com
>>>>>
>>>>> Please could you let us know if it is acceptable to extend "endpoint"
>>>>> node to have an optional property ?
>>>>
>>>> Hi Krzysztof,
>>>>
>>>>
>>>> Kindly reminder, could you help comment on this?
>>>
>>> I don't have any smart ideas and with earlier explanation sounds ok.
>>
>> Just to confirm, are you OK with adding a property to the "endpoint"
>> node that will indicate a phandle that the device allows on this
>> endpoint ?
> 
> You mean the filter property in endpoint? if so, then yes.

Thanks for confirming !

Cheers
Suzuki


> 
> Best regards,
> Krzysztof
> 


