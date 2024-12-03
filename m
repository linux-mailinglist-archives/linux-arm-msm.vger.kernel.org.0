Return-Path: <linux-arm-msm+bounces-40022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 087249E1426
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56D20B25F48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 07:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9051D0F5A;
	Tue,  3 Dec 2024 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKfUSdsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C4418FC90;
	Tue,  3 Dec 2024 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733210746; cv=none; b=LvCzCh7lVKue59ZM4RR5ANCsgozPkkVSOtizdN/cHrjlq/id/tMlBJlL+0tEVpvQLI8OUkBZQDPs3evAbSwS85WwqAyEBYehQina7LtCNNS8oyuuLgpyRc/11o2VhWnrrhAr637FtMO2DJG3GMoPIARu2tnReIa+ww6pX/7aIWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733210746; c=relaxed/simple;
	bh=Dowwf5vOCbH6Ot1zhsb+tcWHaPLxDB1jAvKz9HFlY4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wc3HNIjspQstTWYFHk+hE1bG3XkUu9gpcZwu32kRZ8UrqbgY+Apsd5FSDZOHdC/ZV70sMk6hnbuKHiBs8wtAa+nrGlA1N/yXXhfVzZ4SrxauF4W90pEVEZDTDRFAD5h3eqv8AShegf0MLPU4S+jt+xQVvCfPHnKQNxE157qo2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKfUSdsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA524C4CECF;
	Tue,  3 Dec 2024 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733210746;
	bh=Dowwf5vOCbH6Ot1zhsb+tcWHaPLxDB1jAvKz9HFlY4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oKfUSdsBIJwlO6rUdfy6UFCBfTvSJmL/AhzIRHJQpr9YRCJp1kdT4SUuujrHGgfl+
	 4tNS5JWFvcPNuLraiIuGAqPQOMkYfH624sC4A5fm/I5VC/23cpztI0Y3QGeKQ1hR4b
	 rYYLPaRuquO6GPkNhWe4kDXn1PIYIcEj1sPzQ+YWL8eSFjA8D4wU8Q9pRlhZOtUo/B
	 9F+GKEfpDP1zycQ2TiOnoLIhr+UNHw/7V6DYPsLpmGe50LfUQsNvCx1e4zxQWRM6Cp
	 O1OfolnUfu5AwKFl6Le4czkOInYHXNVvI6cF8q5weXjcyyH/5J5iq89iedwUShzMRl
	 A+d+MsMQR54AQ==
Message-ID: <1b5ebd38-1f2c-42fe-b863-e93916252e8c@kernel.org>
Date: Tue, 3 Dec 2024 08:25:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add bindings for wcd937x static
 channel mapping
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, kernel@quicinc.com
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-2-quic_mohs@quicinc.com>
 <br4vo2iygjc6p5zezss6wccuakodthej4cut3cpw76ltxyxkpb@pjalqvpszxvo>
 <ab9d5e1c-ffb6-88df-80e6-243bfae8cf59@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ab9d5e1c-ffb6-88df-80e6-243bfae8cf59@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 05:52, Mohammad Rafi Shaik wrote:
> On 11/27/2024 1:35 PM, Krzysztof Kozlowski wrote:
>> On Tue, Nov 26, 2024 at 10:12:56PM +0530, Mohammad Rafi Shaik wrote:
>>> Add wcd937x static channel mapping values to avoid
>>> having to use unclear number indices in device trees.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> ---
>>>   include/dt-bindings/sound/qcom,wcd93xx.h | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>   create mode 100644 include/dt-bindings/sound/qcom,wcd93xx.h
>>>
>>> diff --git a/include/dt-bindings/sound/qcom,wcd93xx.h b/include/dt-bindings/sound/qcom,wcd93xx.h
>>> new file mode 100644
>>> index 000000000000..45bcc30d0393
>>> --- /dev/null
>>> +++ b/include/dt-bindings/sound/qcom,wcd93xx.h
>>
>> Filename matching compatible, always.
>>
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __DT_SOUND_QCOM_WCD93xx_H
>>> +#define __DT_SOUND_QCOM_WCD93xx_H
>>> +
>>> +#define SWRM_CH1 1
>>> +#define SWRM_CH2 2
>>> +#define SWRM_CH3 4
>>> +#define SWRM_CH4 8
>>
>> Bindings define interface between driver and DTS. The values are
>> abstract, so alwys start from 0 or 1 and are incremented by 1, not by
>> power of 2. Also missing some sort of prefix, w.g. WCD9390_xxx
>>
>> Anyway, this does not look like binding.
>>
> 
> Ack,
> 
> Will add the Prefix WCD9370_SWRM_CH1,


No, this is not a binding, so drop. You skipped my entire reply
explaining why this is not a binding.


Best regards,
Krzysztof

