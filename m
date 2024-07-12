Return-Path: <linux-arm-msm+bounces-26058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0829392FF95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 19:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2FECB24EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 17:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3510A1DFD2;
	Fri, 12 Jul 2024 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leyTbyBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806917BA5;
	Fri, 12 Jul 2024 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720804606; cv=none; b=l+kVyP8zI4bFl5IcYfjScidjYDkaa79NR8RjFHxa+AhKSVbDHWjLKWxQ7CoasukbsSBgxYeQyf9XCiBfzLCIyy6LUVaQ46/Xqdrf09aQRwIZ4yHkedpsvDyPRFF7GqpqYUtkEmh0sBuqkgDF8iO5CkMIUijy+uSjnqA2LY2/zlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720804606; c=relaxed/simple;
	bh=cIeRpwyXudze2L/Qe/4YXLi0B4Xlw+7NiqL/GpThVJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3kInj+WDvWNqu5Eay7waz42xRO8eem9jtCSBpEulFg/ZFFE4P472RuBL+SyeL+zndd1As7OAYG9sB0WA7qKM844sTfBsgTeJKRVMmH2mRxfsjcI6REIsEUNXniFwGBwNiyGU1hbYp4FDnQHGgQx9I+kD6VOeEExp7/5CzxrIQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leyTbyBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71278C32782;
	Fri, 12 Jul 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720804605;
	bh=cIeRpwyXudze2L/Qe/4YXLi0B4Xlw+7NiqL/GpThVJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=leyTbyBj05GddHFo3qbKuMWeF2V6yoJa3QFzJOmvc/flb1K3NRz2Py6XLv3mRWWEh
	 0BROYS9Yfilk5s5kLSqgWOH6cwTgVEd2aB/0S8IN/hZR2/TlWkxemee9aR5YYdW3xB
	 gbkGzKvVKzpbQbdDHaCTRsbDsRhMbfsm+pfVFAUGfyxI2X0KyhSxgKRhqryFQ2Ssyq
	 M2uLLzJqxsi56L3k10ViXTqB2u96/61RPE86PpcyNTDJYwwgn5fi1YtVg+vIMJcAbM
	 1OnVOxua1H0wJ0jnVPsJGxc4Nymyx+SWDRfFo3ualQ7yFMQped1xC1NOIQGU8uyTpp
	 sj2dM+MPWGgCg==
Message-ID: <d3b53c3c-e94a-4c3e-8ba9-5bf6144fa5e0@kernel.org>
Date: Fri, 12 Jul 2024 19:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add UART node
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20240710094149.13299-1-quic_vdadhani@quicinc.com>
 <2e309d52-8180-4922-9a5a-022fc8bf8ef5@kernel.org>
 <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
 <fa189b4c-d407-4d48-9677-528f07f81efa@quicinc.com>
 <b2c88f85-eefb-411c-bfe0-6a476b449753@kernel.org>
 <045d7a80-378d-4622-b2e1-01665f627818@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <045d7a80-378d-4622-b2e1-01665f627818@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2024 11:32, Viken Dadhaniya wrote:
> 
> 
> On 7/11/2024 11:47 AM, Krzysztof Kozlowski wrote:
>> On 11/07/2024 07:04, Viken Dadhaniya wrote:
>>>>>> +				clock-names = "se";
>>>>>> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
>>>>>> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
>>>>>> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>>>> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
>>>>>> +				interconnect-names = "qup-core", "qup-config";
>>>>>> +				power-domains = <&rpmhpd SA8775P_CX>;
>>>>>
>>>>> All the clocks, interconenct and power domains look to me questionable.
>>>>> AFAIK, most of it (if not all) is going to be removed.
>>>>
>>>> Yeah.. I'm lukewarm on accepting any sa8775p changes until that qcs9100(?)
>>>> situation is squared out first
>>>>
>>>> Konrad
>>>
>>> Thanks for clarification. Please help to sign-off or let me know in case
>>> of any concern.
>>
>> I think I was quite explicit, so I feel above suggestion as still
>> pushing your choice even though to reviewers gave you their opinion.
>>
>> In such case:
>>
>> No, NAK, for the reasons stated above.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Sure, taken the notes from both of you.
> Shall we wait for the shifting of DTSI file from sc8775p to qcs9100 ?
> OR is there any other way to move ahead ?
> Please suggest, we shall do whatever guidance from you both.

Do not add code which we already know that it is incorrect or
incomplete. Instead align with your colleagues about proper upstreaming
of this platform.

I am not going to sign off such patches.

Best regards,
Krzysztof


