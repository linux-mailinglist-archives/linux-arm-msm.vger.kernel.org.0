Return-Path: <linux-arm-msm+bounces-84258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444FCA10F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 19:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ED9D3058A49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 17:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E73330301;
	Wed,  3 Dec 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afV29PkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E686320A20;
	Wed,  3 Dec 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783664; cv=none; b=GchdLR0+d/FkpRB6bkR3tWtGZeU290/8dFh8vU+vdEc0xZXMVbAXls5a8uSGPzIZwWdEZ3Ew3Rcnah8P3b3Ms0iUSin+RBNayKn0EoyuhRVTlvN+vZOI1B+S6lpx/RT51omQ4VKdJ5XBO7+CrgyVjY1jiB0q48edk8j0TnmLHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783664; c=relaxed/simple;
	bh=jTlU5J/98LTFa8J+R3k6ZqKjTL28tIJLoSC1pqUeBVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlSDN9tuQMP5ApAFrOSjuBw6crT0iL5PGDs88yEN6hEMxme7ZADN0z4+SlXFQwMOSISS6463NCbjO5f6D6RtKkLbB865UBq+g9bbwnqQFeEh9vUk2LlOjweYgaOhujEdOwVsmx90Nb0Io17Es68sleFP20l/LIiUcSBcUT3C1fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afV29PkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09DDC4CEF5;
	Wed,  3 Dec 2025 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764783663;
	bh=jTlU5J/98LTFa8J+R3k6ZqKjTL28tIJLoSC1pqUeBVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afV29PkZh6PtkLzFLM5H/qCAld/CW1SUQVF/GgdDg8vjppn8Xndbu+mk2PRefbPGw
	 QG9Lz8tq2dN3s8kHLYZojZDA6vAMYy9Rv/SZ2ngoXtnirvPuYxZvr87qokNMLGyO7C
	 YwQOfKx5ITn7YGt7I2pn8p2R4ffTlBS/eouv2DdyHi3G2zfbbqkrcdwknJqFy7SzKj
	 fonkbiTPqUIBowuissvczes74oSOGLHUpz3LgtliwLOmxYem3wHaJwiljedhKbeP5f
	 0SE+T2KyCZENGNFkKwq2ZyXL8WHU4it3luCmYjXHajgi3Li7xclgpCm/pmZ3VKJnnh
	 yfPL1L3HB5KZA==
Message-ID: <ce8acb9c-4cfc-4a4e-bbfb-05002c882f42@kernel.org>
Date: Wed, 3 Dec 2025 18:40:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-hdk-rear-camera-card: move
 camss status property
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-7-vladimir.zapolskiy@linaro.org>
 <4149ccd0-0583-4d7b-a37a-df899b3e15fb@kernel.org>
 <1e5562ad-a53c-4a06-9428-f7c010cac85c@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1e5562ad-a53c-4a06-9428-f7c010cac85c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2025 13:02, Neil Armstrong wrote:
> On 12/3/25 09:32, Krzysztof Kozlowski wrote:
>> On 03/12/2025 05:05, Vladimir Zapolskiy wrote:
>>> Conventionally status property of device tree nodes is the last one in
>>> the list, move it there.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>>> index 21bfba6a1182..544cec93353a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
>>> @@ -13,10 +13,9 @@
>>>   /plugin/;
>>>   
>>>   &camss {
>>> -	status = "okay";
>>> -
>>>   	vdda-phy-supply = <&vreg_l1e_0p88>;
>>>   	vdda-pll-supply = <&vreg_l3e_1p2>;
>>> +	status = "okay";
>>
>>
>> NAK, making such changes in multiple patches is absolute churn.
> 
> While it may be a "churn" for you, the patch is perfectly valid
> and a NAK is not appropriate since Konrad asked this to be changed
> on the already merged original patchset.
> 
> While you're right we should group such changes, it happens that
> he sm8650 files already have an unified and clean style, and it's
> not a churn to keep the style unified.

We exactly had this discussion and the judgement expressed by Bjorn,
which I general support, was don't change existing source code till we
have the linter for that. And patch one-node-by-one is not valid. Such
patch is still NAK.

Best regards,
Krzysztof

