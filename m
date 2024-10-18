Return-Path: <linux-arm-msm+bounces-34920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94409A3AD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45671283A25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E831F12EB;
	Fri, 18 Oct 2024 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="az2zBBGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F017D378;
	Fri, 18 Oct 2024 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245929; cv=none; b=Oe5qoSpi/NKt0FX14iBTsS/2ysggFrYkSJjtsWWZYIqLuEgqWsn/DUxJUm1ayyTNoWFXI1YtreULoP//DaR8EXOM/TR6dGcpdfHy30jqrj8WfIGQ1mTbXoCXZXdv9nvennlGflUJus8VKhaNP7CzeXKs2Pw2V+J+G8WV4rzPXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245929; c=relaxed/simple;
	bh=KEGDJMN6eddDhPQD2ltJfuTnJIsAoHWrXDgEUWs0Ewk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upQ7zM+zM4BJkosl0b/QJhrUyySqmGoQNi50YVTOk5B/+tVx1ITZKFtEby0OdLivC6ePdwOft8KveoF1HNQ1u2grRg8ZYvq/C8+Yl0rktnMNORRK4Evm9vljT3VEAQMhCnfZs6cceDD8jNlqz908vIRrd+gJATqD7jxtMd3IGKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=az2zBBGE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CFDC4CEC3;
	Fri, 18 Oct 2024 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729245928;
	bh=KEGDJMN6eddDhPQD2ltJfuTnJIsAoHWrXDgEUWs0Ewk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=az2zBBGEMLy8XxYkz+tBw2ZrQxov9h3SOrgKdd1loU4Csrdj+aGrSczC3V6+8psF9
	 I0xMB9qXhz8RyrPxEd5BVgYK2CChL19uoQzmIQkJIO8fqff5n5lF7Ulb6nJDE656uP
	 B2kn60tQV8bjclG9vm/MFH+2wVowE60ekuhumx89PzFuh4IUoB+TyT4nzCfZXshsTD
	 I2ke6Wtffqm/RPxp5vSub0gn8WxsQI49ENeEV+VbzmRvf4uY27y9NvuF3je2MCYmlt
	 3pJnnyK/hrJUbIHcBkJ9nMOYewUEdXmuV1Zrj+YS29oqV2bCPsuyJWl+rb9L6Ik7eg
	 JhjEW1qordlOA==
Message-ID: <ce439616-072b-463f-b293-8a186f8282bd@kernel.org>
Date: Fri, 18 Oct 2024 12:05:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Tao Zhang <quic_taozha@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6e408062-9a74-4a2a-8b67-b83244c4ca95@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 09:23, Tao Zhang wrote:
> 
> On 10/9/2024 6:52 PM, Suzuki K Poulose wrote:
>> Krzysztof
>>
>> On 22/08/2024 12:50, Suzuki K Poulose wrote:
>>> On 22/08/2024 11:34, Suzuki K Poulose wrote:
>>>> On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
>>>>> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>>>>>> On 21/08/2024 04:13, Tao Zhang wrote:
>>>>>>> The is some "magic" hard coded filtering in the replicators,
>>>>>>> which only passes through trace from a particular "source". Add
>>>>>>> a new property "filter-src" to label a phandle to the coresight
>>>>>>> trace source device matching the hard coded filtering for the port.
>>>>>>
>>>>>> Minor nit: Please do not use abbreviate "source" in the bindings.
>>>>>> I am not an expert on other changes below and will leave it to
>>>>>> Rob/Krzysztof to comment.
>>>>>>
>>>>>> Rob, Krzysztof,
>>>>>>
>>>>>> We need someway to "link" (add a phandle) from a "port". The patch 
>>>>>> below
>>>>>> is extending "standard" port to add a phandle. Please let us know if
>>>>>> there is a better way.
>>>>>>
>>>>>> e.g.:
>>>>>>
>>>>>> filters = list of tuples of port, phandle. ?
>>>>>>
>>>>>> e.g.:
>>>>>>
>>>>>> filters = < 0, <&tpdm_video>,
>>>>>>              1, <&tpdm_mdss>
>>>>>>        >
>>>>>>
>>>>>
>>>>> Current solution feels like band-aid - what if next time you need some
>>>>> second filter? Or "wall"? Or whatever? Next property?
>>>>
>>>>
>>>>
>>>>>
>>>>> Isn't filter just one endpoint in the graph?
>>>>>
>>>>> A <--> filter <--> B
>>>>
>>>> To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
>>>> multi output ports).
>>>>
>>>> For clearer example:
>>>>
>>>> A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1) 
>>>> <--> B1
>>>> A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2) 
>>>> <--> B2
>>>> A2 <--> .. <--> ../                  p2  \ --> Unfiltered        
>>>> <--> B0
>>>>
>>>>
>>>>
>>>>> Instead of
>>>>>
>>>>> A <----through-filter----> B?
>>>>
>>>> The problem is we need to know the components in the path from A0 to X
>>>> through, (Not just A0 and L). And also we need to know "which port 
>>>> (p0 vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out 
>>>> of the
>>>> link "L".
>>>>
>>>> So ideally, we need a way to tie p0 -> A1, p1 -> A2.
>>>>
>>>> would we need something else in the future ? I don't know for sure.
>>>> People could design their own things ;-). But this was the first time
>>>> ever in the last 12yrs since we supported coresight in the kernel.
>>>> (there is always a first time).
>>>>
>>>> Fundamentally, the "ports" cannot have additional properties today.
>>>> Not sure if there are other usecases (I don't see why). So, we have
>>>> to manually extend like above, which I think is not nice.
>>>
>>> Replying to the other thread [0], made me realize that the above is not
>>> true. Indeed it is possible to add properties for endpoints, e.g:
>>>
>>> e.g.: media/video-interfaces.yaml
>>>
>>> So extending the endpoint node is indeed acceptable (unlike I thought).
>>> May be the we it is achieved in this patch is making it look otherwise.
>>>
>>> Suzuki
>>> [0] 
>>> https://lkml.kernel.org/r/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com
>>
>> Please could you let us know if it is acceptable to extend "endpoint"
>> node to have an optional property ?
> 
> Hi Krzysztof,
> 
> 
> Kindly reminder, could you help comment on this?

I don't have any smart ideas and with earlier explanation sounds ok.

Best regards,
Krzysztof


