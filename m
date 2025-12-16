Return-Path: <linux-arm-msm+bounces-85391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00210CC41D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98DF0304DA0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819241D86FF;
	Tue, 16 Dec 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFrTuZ86"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E63B7A8;
	Tue, 16 Dec 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900948; cv=none; b=MOj2cfVG86bP2iMeaEbzPbV5fGyNXDk88ZFYaMkX1Abdkra+bvfUFhUqdWiN0BlnnbT5qKtOO9ANCoLAlKlR267MTR6QF7vIHdhqAP3tItld4TqBmbUNUtecnf34pTBg73sTKjB5d63Opb015spMhd4Uk2SDuqzqqroaQdEAnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900948; c=relaxed/simple;
	bh=4dgCEM4nTnnn0sFZ8m1aMoo3gsMxbEEftNNJrXbVIlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaK54N7C0OSbfLqKcSw0PmIHiu+juVZW17g1lUUcMPhBjHY7NOU/ZzFQJfri/hOPgyaCW/McHeH5Mb78ubFSay7bNW8YEtnAtcoquWit7xYc7VYSwUPSEnW9Gf7aMhy4os/DB1brscVgRz9vM5JFh7E+bIcOvT1IBs8y6dVFRx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFrTuZ86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F644C4CEF1;
	Tue, 16 Dec 2025 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765900947;
	bh=4dgCEM4nTnnn0sFZ8m1aMoo3gsMxbEEftNNJrXbVIlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rFrTuZ86QqRyQSV08D118p9n5vQ2OyOm5MiEyFd++uezU33AUrwth1Qy1nCHkXJU0
	 Im+OB3jqWGddoWb7tGoDgefOwseKq4qJnJ5I1+NZ6zz6VXvbLIsRva+OnJ3wI6d44l
	 t7CgtgjOT9gUFjUuprW0G8r+joVRkeW14S42NNMNf5+7iOdZhRj8ojHjjeBNNJadNx
	 iK/oN9/wisFa3oN8JNlqFfbwEfGpIFCyT0BzZXmsh5i4CpOYP9Qz90lcw1Uo4WKTCs
	 6A57ThEZuaO5+QECzQ07ZVfG5GxUCMVGpFtqXr6M0ObNkHST7jCw7wQJRw8Pe7f+D8
	 39IJ/ntB+1YQg==
Message-ID: <047e0283-75be-4ce1-b6f4-e500e0a653e8@kernel.org>
Date: Tue, 16 Dec 2025 17:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: Add sdhc dll-presets
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_pragalla@quicinc.com,
 quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-3-quic_rampraka@quicinc.com>
 <0f7c0d5c-7f77-4669-9648-62d008f15b1c@kernel.org>
 <9f5fcce3-b9c0-4aae-b4e0-10475eb5ec9e@kernel.org>
 <b98eb114-6967-4ac4-8b4d-936966a58171@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b98eb114-6967-4ac4-8b4d-936966a58171@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2025 13:41, Ram Prakash Gupta wrote:
> 
> On 12/15/2025 5:37 PM, Krzysztof Kozlowski wrote:
>> On 15/12/2025 13:05, Krzysztof Kozlowski wrote:
>>> On 15/12/2025 13:00, Ram Prakash Gupta wrote:
>>>> Add sdhc dll-presets for qdu1000 target.
>>>>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>> Please use subject prefixes matching the subsystem. You can get them for
>>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>>> your patch is touching. For bindings, the preferred subjects are
>>> explained here:
>>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> sure I missed to add qdu1000:, will add in subject.
> 
>>>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>>> index 846e5e5899aa..bc31504d5c8c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>>> @@ -912,8 +912,8 @@ sdhc: mmc@8804000 {
>>>>  
>>>>  			bus-width = <8>;
>>>>  
>>>> -			qcom,dll-config = <0x0007642c>;
>>>> -			qcom,ddr-config = <0x80040868>;
>>>> +			qcom,dll-presets = <0x000F64EC 0x0 0x01	0x2C010800 0x80040868>,
>>>> +					   <0x0007642C 0x0 0x10 0x2C010800 0x80040868>;
>>>
>>> That's non-bisectable. You just broke the users of this DTS. Also, case
>>> change is not explained and your binding said nothing about deprecating
>>> other properties.
> 
> right I will update the sequence of dt as last change in the series.

This will fix nothing. Please read maintainer soc profile how DTS is
handled. It's still no go, shall I be explicit with NAK?

> 
> I couldn't get "case change is not explained" but I guess ask is for
> explanation why is this change needed. As the soc is using artanis

No, why are you making it upper case. What is the preferred style for DTS?


Best regards,
Krzysztof

