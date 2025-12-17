Return-Path: <linux-arm-msm+bounces-85510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35BCC7C0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFC03304C2BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109FA359713;
	Wed, 17 Dec 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJIGqA+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADE2E8DEA;
	Wed, 17 Dec 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976410; cv=none; b=F30C9FJA33+Xr+L4NqagrQIGYeyWu01dnJMjMfc823OieyIfQE4CX3js+6Pu8qYrni1QiHCd5LlUwn/8FiVc/lvH8SK3oqBHv7QA3DVjCp3zUstp+p/Tw9ZGe4x0JVGBIemdCKlcdpo79CuyY0cp9BEdX2l4tw6rTunvIPzhtCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976410; c=relaxed/simple;
	bh=4v5l1tGAudJ17ilEiB5Tnt2dA8Rvzn0+0PSeZxP/OwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW+PHckA8I2niXWBqibxbKQPpPABZXWUW19FEdkF+FQue79lvtFisoX1KuW4ahVFLM9ALcS0NPgERfAujiIpau6DjjW0ebLRDyHu1MVSH3BNJwonlOajEqE9m/iA94uuHUObxTfrKqvVbdLFQS5NfBdvGTGJDQJOkFHGiPc7SoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJIGqA+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C5CC4CEF5;
	Wed, 17 Dec 2025 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765976409;
	bh=4v5l1tGAudJ17ilEiB5Tnt2dA8Rvzn0+0PSeZxP/OwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJIGqA+R3B5COEV94SP/2zVlO6eb19WZkpiqKKRpm+STTz9XP4PXh673XLZBI4Pso
	 ba9O9Tqg8kXE+Y3PquWdjVJ9N1j5Dp7HbwMYUcEj/4OFWCjvh6yFhGEWHXgyfP7Y0E
	 BZmzJeCrpY1YAJJUNT5mJBmiNG5InnMHbvpvP0NhjsABsf/LzbLjr20TqEm+s52z/p
	 5AcxmeM3hMxBPHCMidmrwvMSfvz9N4tIm4EqFQtXsclyO7lZIV1N0gd7ZM0ji+rBLp
	 rHFb0QyyrAUezhzE0mv2xHAV5P2D8f3yOm/IIPnYLvgVzmsdVDh82W6fivz/3sWSNg
	 tQIQZETGuySQg==
Message-ID: <487ff592-e67c-41c8-a398-f79aa6e5f69c@kernel.org>
Date: Wed, 17 Dec 2025 14:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio
 playback over DisplayPort
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
 <2d4953c6-184d-423b-80e9-871c6e00da35@oss.qualcomm.com>
 <564732e7-2c86-417d-8568-69f40ea7d4da@kernel.org>
 <47758ce9-5ec6-4ed6-9f84-13cbdd444d75@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <47758ce9-5ec6-4ed6-9f84-13cbdd444d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2025 13:51, Konrad Dybcio wrote:
> On 12/17/25 1:38 PM, Krzysztof Kozlowski wrote:
>> On 17/12/2025 13:33, Konrad Dybcio wrote:
>>> On 12/17/25 1:00 PM, Krzysztof Kozlowski wrote:
>>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>>> should carry respective DAI name prefix regardless.
>>>>
>>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>
>>> (something's inserting a \n before --- in your latest patches but I
>>
>> No, it is not. It was always like that and only recently git started
>> dropping it, but it is irrelevant.
>>
>>> don't know if this is a problem)
>>>
>>> [...]
>>>
>>>> +		displayport-2-dai-link {
>>>> +			link-name = "DisplayPort2 Playback";
>>>> +
>>>> +			codec {
>>>> +				sound-dai = <&mdss_dp2>;
>>>
>>> How does this work out with fw_devlink?
>>
>> How is this related to this patchset? Please stop nit-picking irrelevant
>> things.
> 
> I'm asking whether this is going to break sync_state because you're not
> enabling mdss_dp2 - I believe that's a fair question..

DTS description is independent of driver, thus this is correct code
regardless whether there is interconnect involved anywhere or not. I
don't have the answer how this affects interconnect, but I see no reason
anyone would create such ICC path - between hardware and fake SW construct.

Best regards,
Krzysztof

