Return-Path: <linux-arm-msm+bounces-30883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D096D73A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9A6287B13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFA1199934;
	Thu,  5 Sep 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtT6+K7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2A194A52;
	Thu,  5 Sep 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536024; cv=none; b=H4p1HUeWNzkUeCAIgqgKH4Rl3xVkF6Kc/xPNfh5Pwqb19rB4z1PKNC340G1w/K4a7mJe21yUM8ZVbG6wjjfVoh0SgLkEIujjchzo2Ss5d5UVPH5+nvY+3awjAfw7OmLzpIu/KN4+v1iWes21aVhqvaREljuAYy3T39xBC1xXQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536024; c=relaxed/simple;
	bh=LXkNK7tbZpK9Bwrdl5kfMRV9eTB9+L844J1TGRnWWrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHLc5zyLZ8mTTzbo1oRYxWm7RCeCQVWz6Rd5wIUY6118TcdGeUim9fawbVzALslxbf7BBOq/d77/+iKlq4RX3aSi/L6NLAFWYPOVjt3qc3ObRWkK8wpwqovZg3P0GDux3gLmKOAs/9w4l96BP+fvYylwj9vRPe5uwJDxbi5KgNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtT6+K7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A25CC4CEC4;
	Thu,  5 Sep 2024 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725536024;
	bh=LXkNK7tbZpK9Bwrdl5kfMRV9eTB9+L844J1TGRnWWrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KtT6+K7PIGT336TLuzd8AEw9SgB6Yk9RPpWk5wKPtuk2CNKfP3Sk2tPwKhojg0z+B
	 655Qu7DlqaSi17ysvw2+xZlyDpLZ5roo85vMJ8DY1tWz9BGuubtIoxlTa3Ec6LKczS
	 yYJgqvVZ2W9rOYHFrBBfyTbjnTGpJ+DtOm5kFRO71sJ60QfXvIsVUjo1BE0ch38mlU
	 oFNd0prIr00Qi7Ae1MCsGhAu7roUpFCdZsdrit8Fi1XGQ+Uojh4XVO751Aei6rFLlN
	 OZyTFVoLDdLRkszY1T13/RUOzjCm2LyaW3ngC8JGpEJgolFAP7HSn2AF2G1wIqBXOQ
	 GTZRK6RRdp2Ug==
Message-ID: <3878b8e1-00c5-4761-bb1f-c9aa853ec501@kernel.org>
Date: Thu, 5 Sep 2024 13:33:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] Add initial support for QCS8300
To: Jingyi Wang <quic_jingyw@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Xin Liu <quic_liuxin@quicinc.com>,
 Tingguo Cheng <quic_tingguoc@quicinc.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>
References: <20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com>
 <fcfaeed3-8544-4e98-9f95-f43346dc83e8@kernel.org>
 <3535a897-8708-463d-b931-fa344a967f18@kernel.org>
 <aa74f55b-7e14-4ca4-bd79-2104d81a0660@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <aa74f55b-7e14-4ca4-bd79-2104d81a0660@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 7:08 AM, Jingyi Wang wrote:
> Hi Krzysztof,
> 
> On 9/4/2024 6:19 PM, Krzysztof Kozlowski wrote:
>> On 04/09/2024 11:34, Krzysztof Kozlowski wrote:
>>> On 04/09/2024 10:33, Jingyi Wang wrote:
>>>> Add initial support for QCS8300 SoC and QCS8300 RIDE board.
>>>>
>>>> This revision brings support for:
>>>> - CPUs with cpu idle
>>>> - interrupt-controller with PDC wakeup support
>>>> - gcc
>>>> - TLMM
>>>> - interconnect
>>>> - qup with uart
>>>> - smmu
>>>> - pmic
>>>> - ufs
>>>> - ipcc
>>>> - sram
>>>> - remoteprocs including ADSP,CDSP and GPDSP
>>>>
>>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>>> ---
>>>> patch series organized as:
>>>> - 1-2: remoteproc binding and driver
>>>> - 3-5: ufs binding and driver
>>>> - 6-7: rpmhpd binding and driver
>>>> - 8-15: bindings for other components found on the SoC
>>>
>>> Limit your CC list. I found like 8 unnecessary addresses for already
>>> huge Cc list. Or organize your patches per subsystem, as we usually expect.
>>>
>>>> - 16-19: changes to support the device tree
>>>>
>>>> dependencies:
>>>> tlmm: https://lore.kernel.org/linux-arm-msm/20240819064933.1778204-1-quic_jingyw@quicinc.com/
>>>> gcc: https://lore.kernel.org/all/20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com/
>>>> interconnect: https://lore.kernel.org/linux-arm-msm/20240827151622.305-1-quic_rlaggysh@quicinc.com/
>>>
>>> Why? UFS cannot depend on pinctrl for example.
>>>
>>> This blocks testing and merging.
>>>
>>> Please organize properly (so decouple) your patches, so that there is no
>>> fake dependency.
>>
>> Let me also add here one more thought. That's like fourth or fifth
>> QCS/SA patchset last two weeks from Qualcomm and they repeat the same
>> mistakes. Not correctly organized, huge cc list, same problems with
>> bindings or drivers.
>>
>> I am giving much more comments to fix than review/ack tags.
>>
>> I am not going to review this. I will also slow down with reviewing
>> other Qualcomm patches. Why? Because you post simultaneously, apparently
>> you do not learn from other review, so I have to keep repeating the same.
>>
>> I am overwhelmed with this, so please expect two week review time from me.
>>
>> Best regards,
>> Krzysztof
>>
> The CC list is generated from B4 tool, however, thanks for your advice and we
> will decouple the changes to avoid this. And could you please help us to confirm
> the better way to handle binding changes which just add one compatible, should
> it be submitted as a single patch or submmitted together with dts patch series?

The tool did its job here, it's just that this series is very long and a ton
of people ended up being involved due to bindings oneliners

Konrad

