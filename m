Return-Path: <linux-arm-msm+bounces-68976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A2B248F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D01D1BC4007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DEE2F83A0;
	Wed, 13 Aug 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mr7IdpWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989622F3C05;
	Wed, 13 Aug 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086203; cv=none; b=h5Bbh0Y/VtjVz5/+PvfiV1gQTn+cntkFvh59fVB+hI2OeHL8DQW4S8nWXxV/M7TwTUbriTo6H9PheZdqxpO13xQzgbUO0LnUwJ21Kj1xPAPPM1C/tR3RQ2Iyx+KuoNKG29HBT62eRZPRtXUPopSXszy0oyi9RQvMfTp0MsOy2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086203; c=relaxed/simple;
	bh=/d6a1yqkECHdUAWWgDLMEHjp7+fyvZon8+GWiqZYD5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJl9P0SPUIO3iOudtoqnIDdK1L8gzVX2h2kXeXXJyAlKh6gimd6ntjqoZ0OTWoSOL8am6JXbrUYEfbWwKC8w7G1VZQ9lTOU0er7dZPjBfyNEgvZyoN3jt+MsCz5Hy6HFIUBVOxwqvTn1ozBzJjMQ0FfC+rVNgjuOaSXBglPGxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr7IdpWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9FFC4CEEB;
	Wed, 13 Aug 2025 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755086203;
	bh=/d6a1yqkECHdUAWWgDLMEHjp7+fyvZon8+GWiqZYD5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mr7IdpWMlZ7IFBxvWnhW3HseAxlcCCFkAZuUKfiXGH79Peq6tfuWkZ7S+uBHFK898
	 9RmWop7yd1dvWh2yTUEDC0nwgcf1P1QR5vDg940gVJSZCQK/gOA/0nql/QBrBoKfHF
	 J/ULhmC0FH1NnwAitX7jLEGeYD2ItGRYAPhml1HZQv/xaUNBu1X3FBJ9rora3rB0X4
	 zuyiar9eIcWf+qGOS6r4eoz0mgCMfNfbPW93HYsiCBPkexWg9hf0iuc2g0eTLQV1SN
	 km1KmjA/5CwYH1IuZ5jqSNFBwBjMXLEpMbMDK5nSUShCGPIoGUHarNLtWqm3Xrz9TE
	 ArZUr/oZqxuRg==
Message-ID: <a93fb5bf-1fd5-4e00-8338-b8608a9ba8fa@kernel.org>
Date: Wed, 13 Aug 2025 13:56:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <8b023e56-435b-43df-8b15-c562a494e06f@kernel.org>
 <ab5d3811-9fbf-4749-9463-4457fbf50023@quicinc.com>
 <4091c488-996c-4318-82ad-c054a9ef5a22@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4091c488-996c-4318-82ad-c054a9ef5a22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2025 13:21, Konrad Dybcio wrote:
> On 8/13/25 1:08 PM, Sarthak Garg wrote:
>>
>>
>> On 8/5/2025 2:55 PM, Krzysztof Kozlowski wrote:
>>> On 05/08/2025 11:19, Sarthak Garg wrote:
>>>>
>>>>
>>>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>>>> The kernel now handles level shifter limitations affecting SD card
>>>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>>>> capabilities in the device tree.
>>>>>>
>>>>>> However, due to board-specific hardware constraints particularly related
>>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>>>> in the board DTS.
>>>>>>
>>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>>>    arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>>>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>>>    arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
>>>>>>    4 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>
>>>>> This will break MMC for all of the users and nothing in commit msg or
>>>>> cover letter explains that or mentions merging strategy.
>>>>>
>>>>> Exactly this case is covered by your internal guideline, no? Please read it.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> Just to make sure I’m addressing the right concern — are you primarily
>>>> worried about the introduction of the max-sd-hs-frequency property in
>>>> the board DTS files, or about the removal of the sdhci-caps-mask
>>>> from the common sm8550.dtsi?
>>>
>>>
>>> Apply this patch and test MMC. Does it work? No. Was it working? Yes.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>>
>> You're absolutely right to raise the concern about potential breakage.
>> After conducting additional testing across multiple boards, I’ve confirmed that the removal of SDR104/SDR50 broken capabilities does indeed affect V1 SM8550 devices.
> 
> v1 is a prototype revision, please forget it exists, we most definitely
> do not support it upstream


You should double check. SM8450 (not v1!) needed it, so either it was
copied to SM8550 (v2!) by mistake or was also needed.


Best regards,
Krzysztof

