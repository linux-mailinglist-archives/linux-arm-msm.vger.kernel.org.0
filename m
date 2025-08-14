Return-Path: <linux-arm-msm+bounces-69201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53117B26407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BAD31C807ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC45264A65;
	Thu, 14 Aug 2025 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYR2jDwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8CB318132;
	Thu, 14 Aug 2025 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170273; cv=none; b=EldJUixLklCuJGjm/9rUwVHY+z39pQUWfakV4WBt/iCJ3yGIPgMrYMxsncsnBpzyfZz6rbgtio+SGTd8PtXClzRztqYvjnED1Ako46WurNr6bK9H0E8JCUQN7MVsrj7roqqOTMigg/thzGX2S8La5hSeXqkuXAc9qB0d8106lXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170273; c=relaxed/simple;
	bh=CrmSNiQjI6dLmQAHmFV7J3nTb/HRWk5sPuK2vdlJw7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j89YO8iGqjDIe7/yMW0AwZCQaisNeJfoMs14eFTZtbSVj2UeIhNqXVfyS24Z1eL0uO6SyH13sItgxY69SglWTigQsQhfsu/qJLsnY2OM6IkB1zHf/on0T0zLfcwRWZA5p5VzBm5nIuJvTmdlOIfy5pMsI5rcMBSGquCTpB2tdgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYR2jDwo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045A8C4CEED;
	Thu, 14 Aug 2025 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755170273;
	bh=CrmSNiQjI6dLmQAHmFV7J3nTb/HRWk5sPuK2vdlJw7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QYR2jDwoJGCJzTXoQSn3vKvMkKG+BsRM0hiMI+5PhEvY4lHSJkloYlQwZp7mDN+di
	 eNpAmyoLBKw7Cws0NUzD1X+lGN6lgYCSXduaU41VEW0Ps7CKu9snB7gHmFr151Ji4i
	 b2mPTkLn1oqmEEja6gjDxyOF4t4wR+m7fzPUDeyInnPxq0c3UBY43Woa7UksOKiVQx
	 r2FtIWHHGafGkqfg6SvIY7E32eUatZRNUeTy/655Z4/qCMUIePaB803eLapWK9SHhW
	 NCwOGjozaCKcO+iWuCNqfYc/7nzR4oS/an9eSxL9OYnZiFse8N40TNb49kHAjgqLEc
	 LEbsFwmO4kWLA==
Message-ID: <71ad3354-15ab-48b4-9e13-ea497d4fdd79@kernel.org>
Date: Thu, 14 Aug 2025 13:17:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
To: Quill Qi <leqi@qti.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
 <172f1a38-d7a8-4799-ad44-f3eea69f297a@kernel.org>
 <e6e06ab1-6744-4730-a2a7-be8c66bf74a3@kernel.org>
 <MN6PR02MB1062943D66036348728930990E335A@MN6PR02MB10629.namprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <MN6PR02MB1062943D66036348728930990E335A@MN6PR02MB10629.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 11:48, Quill Qi wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, August 14, 2025 4:41 PM
> To: Quill Qi <leqi@qti.qualcomm.com>; Konrad Dybcio <konradybcio@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for Hamoa-IOT-EVK
> 
> 
>> On 28/07/2025 13:08, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 09:16, leqi via B4 Relay wrote:
>>>> From: leqi <leqi@qti.qualcomm.com>
>>>>
>>>> This patch adds initial audio codec support for the Hamoa-IOT-EVK board,
>>>> including WCD9385 configuration, micbias voltage settings, GPIO reset,
>>>> and power supply bindings. It enables basic audio functionality for
>>>> further development. Basic test is good in Hamoa-IOT-EVK board.
>>>>
>>>> Signed-off-by: leqi <leqi@qti.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Updated author email address to leqi@qti.qualcomm.com.
>>>> - Clarified that audio is validated with this change.
>>>> - Link to v1: https://lore.kernel.org/all/20250723-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/
>>>> ---
>>>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 +++++++++++++++++++++++++++++
>>>> 1 file changed, 232 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>> index 843f39c9d59286a9303a545411b2518d7649a059..91618e22e86c46c698b3639f60bc19314705b391 100644
>>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>> @@ -124,6 +124,94 @@ pmic_glink_ss2_con_sbu_in: endpoint {
>>>
>>>
>>> This was not merged, was it? Same comment as other patch, when you have
>>> entire code ready send entire board. Not chunk by chunk.
>>>
>>> You are not following properly release early, release often.
>>
>> Why this is still not included in initial submission which happens now?
>> Either you work Linux style (release early) or, if you decide to wait
>> till everything is ready, you submit board as one patch, not everything
>> as 100 different patches.
> 
> Hi Krzysztof, this audio change initial test is good with sound output and record fine. But with further test in Ubuntu gui only
> 2 speakers have sound output. I am still seeing why this issue is happening. I thought to solve the issues before replying
> and merging this, thanks.

Does not look like problem with kernel, though. If arecord and aplay, as
you imply in your first sentence, work then the code is fine and should
be squashed here.

Best regards,
Krzysztof

