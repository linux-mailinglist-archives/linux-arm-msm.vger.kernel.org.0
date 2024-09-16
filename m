Return-Path: <linux-arm-msm+bounces-31814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792F979DBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 11:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9CEE1C21EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 09:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A023146589;
	Mon, 16 Sep 2024 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkMrg9Do"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8113DB9F;
	Mon, 16 Sep 2024 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477414; cv=none; b=AVKMRj9DAa0zVcx37PKcnDXpreaj9j3GBQI9LAaA29+vPLyyHEpn62BPImfhiCmcHqKSMyW6Zyv4BaaBSEQ2LjSfdCR21f94yY86PCWUIwzJLk9QGCzPo3zjVbIlQVN9fEB7nr088e2srJI2/3TPaLjmUa+gI3T4mIBgMkV1r2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477414; c=relaxed/simple;
	bh=o+oy6yz8phkO+UfYBB1PUM39dfktmBISvJLGaPaMgEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7pAzOlovpyvFiG1si3EgBb9JWGghVDh18BwdfrtLzsNipX82ctktmoo0lc3u2MJzRKY3fwNwGatcMEIH75iOgmtNlUxJepBk6kgTijqzHzI3wyrpmjJ/pxF2IPyKEZ/IDInGSzFAWqHE7VP7JxH/O/RbkbY6QN8CeHnNHtTsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkMrg9Do; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76041C4CEC4;
	Mon, 16 Sep 2024 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726477413;
	bh=o+oy6yz8phkO+UfYBB1PUM39dfktmBISvJLGaPaMgEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UkMrg9DocoTWd5N/Yy67FZDXoWQkQEYKOCAAmz+L3A+3N6Og6RL20vgurfdax8Vjr
	 gBefU5ycvT3vQKywJlfKSNzmzUHfy7qyCwREet4l1L8lhE0sVx6IfNzQqfzifUIN4O
	 KD4j5KhU3KDqephWhRMt4xxnHx6HzTOy/0F4p8bA91zE3mOYGxIxu8w87+6HYJsXvN
	 +myJH+AELRJyK1d4IYEPu+XkZduMKY4kTvaLvCQ8cwRDNvN8YB6RU7G5GDORwuNonZ
	 ysA8W5EjasxMyZ5c8513H9qJ9lVe9k4lBgWoHyvOhYnbFtf32pZ+yZPw/137q4w01Z
	 9tAxwX8Qy/zcg==
Message-ID: <80ca3719-1c7f-4899-b533-faf3c9093444@kernel.org>
Date: Mon, 16 Sep 2024 11:03:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 quic_imrashai@quicinc.com, quic_jkona@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
 <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
 <936f151e-6951-4dea-95ed-35374ab249cf@quicinc.com>
 <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>
 <ya6aqhq27mizdozfhaa6evwt6kqjdryafozdxvwdm3l75cfd24@wloodcwrgkyu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ya6aqhq27mizdozfhaa6evwt6kqjdryafozdxvwdm3l75cfd24@wloodcwrgkyu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2024 10:55, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 10:33:21AM GMT, Krzysztof Kozlowski wrote:
>> On 13/09/2024 07:31, Taniya Das wrote:
>>>
>>>
>>> On 8/17/2024 2:55 PM, Krzysztof Kozlowski wrote:
>>>> On 16/08/2024 10:32, Taniya Das wrote:
>>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>>> controller functionalities. But the LPASS resets are required to be
>>>>> controlled from the high level OS. The Audio SW driver should be able to
>>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>>> support for the resets.
>>>>>
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>> ---
>>>>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>>>>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>> index 45e726477086..b64393089263 100644
>>>>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>> @@ -1,6 +1,7 @@
>>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>>   /*
>>>>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>    */
>>>>>   
>>>>>   #include <linux/clk-provider.h>
>>>>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
>>>>>   	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>>>>>   };
>>>>>   
>>>>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
>>>>> +	.name = "lpassaudio_cc_reset",
>>>>> +	.reg_bits = 32,
>>>>> +	.reg_stride = 4,
>>>>> +	.val_bits = 32,
>>>>> +	.fast_io = true,
>>>>> +	.max_register = 0xc8,
>>>>> +};
>>>>> +
>>>>>   static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>>>>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
>>>>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>>>>   	.resets = lpass_audio_cc_sc7280_resets,
>>>>>   	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>>>>   };
>>>>>   
>>>>>   static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>>>>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
>>>>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
>>>>
>>>> That's odd to see sc7280 reset added for qcm6490, but not used fot
>>>> sc7280 at all. Didn't you mean here lpass_audio_cc_qcm6409_desc?
>>>>
>>>>
>>> The resets descriptor(lpass_audio_cc_reset_sc7280_desc) is not part of 
>>> the global clock descriptor(lpass_cc_sc7280_desc) as these are part of 
>>> different regmaps.
>>>
>>> On a non-QCM6490(SC7280) boards the resets are registered after the 
>>> global descriptor is registered.
>>>
>>> But on QCM6490 board we need to register only the reset descriptor and 
>>> no clocks are to be handled/registered and thus passed the match data 
>>> for QCM6490 boards only.
>>
>> Yeah, but why this is sc7280?
> 
> Because it's more or less the same HW, different TZ and hyp firmware?
> 

Hm, ok, probably I missed something from the context.

Best regards,
Krzysztof


