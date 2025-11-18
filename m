Return-Path: <linux-arm-msm+bounces-82198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4FC67EA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F13464F132C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9812FFDD2;
	Tue, 18 Nov 2025 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO/mWiOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A16E2FD1AD;
	Tue, 18 Nov 2025 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450391; cv=none; b=YHEW7sa6bxt42iOmV1N68l2hmeYWmkRTC43ytQZUyN9c1ti2U3oIoh0IMw0MwDtGH9y1H2XMO17q2DI+9yWL6SSpg8ituzHBBt5hExFQIE2hFD8LkkXK5n3O9SKr96yiLTCN+drLaIddF2qAp9JcbRauZBxk/uhnChQx9Jj2V4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450391; c=relaxed/simple;
	bh=ED27CMwNHU5TWXJaOSp3hBelRHeBOw08OxVZ+KML8VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8TT8kKIsp+brX42b2YyXK+zmLE7AMNUnXe6IQ+ong5jdMI+vpDsEGcHEXPaf5rLzwT/rWtU97zWyxel9IO3CtKsg4wlIRkQMKNEqNNGFbzhVUgsocNhsqP6tmbFvd+UnCNaOv4mwpwOdE3grpqWC1mqSOCx6kvwPVsEdEP//oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO/mWiOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD96C4CEF1;
	Tue, 18 Nov 2025 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763450390;
	bh=ED27CMwNHU5TWXJaOSp3hBelRHeBOw08OxVZ+KML8VM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TO/mWiOthigSwC4OfjnyKN/r1MCvZLZSrSJHlkapjDQmXyz3bp32UQP3DG/J2Dxs9
	 z13ffMeafD15i1LmhYP9x+zpcaCkI8B9oBSdbG/MSdSg0a2UDY9ZO+pJwwLDdNi2Ck
	 mYTriBJXqniEjI5ifZlCx627ZRGbAyXsIh/IY8B6ShwowoG7yj3cW4TbjMOK2dO1iY
	 HEHwNyUcd8SUVMseSiEX4rtZ7wlSty8AbrUoVnZUGdHChC/7mDj/Oeyz2+r2ydBEoR
	 XcsGYEm/CUNhkhkxHZloZmjeTdnOK9cSmQZwl3TqmC2M7VALCV/bZGq6z663JTCFg7
	 cL7ZJUtevPjpQ==
Message-ID: <0428a5a5-fd4e-4309-9b28-f94664177692@kernel.org>
Date: Tue, 18 Nov 2025 08:19:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Bluetooth support
To: Wei Deng <wei.deng@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 quic_jiaymao@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 cheng.jiang@oss.qualcomm.com, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, quic_shuaz@quicinc.com,
 quic_chezhou@quicinc.com
References: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com>
 <176313578860.3262114.17056319042303889483.robh@kernel.org>
 <CAL_JsqJX3doLFv-Nc6o+L1W_o8VjtvGp9dqdpsotuyG17zU7Lw@mail.gmail.com>
 <ca6b02d8-07cc-4bc9-ac99-e75d8e3548fe@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ca6b02d8-07cc-4bc9-ac99-e75d8e3548fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2025 08:07, Wei Deng wrote:
> Hi Rob,
> 
> Thanks for your comments.
> 
> On 11/15/2025 12:18 AM, Rob Herring wrote:
>> On Fri, Nov 14, 2025 at 10:06 AM Rob Herring (Arm) <robh@kernel.org> wrote:
>>>
>>>
>>> On Thu, 13 Nov 2025 18:35:19 +0530, Wei Deng wrote:
>>>> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
>>>> Bluetooth work, we need to define the necessary device tree nodes,
>>>> including UART configuration and power supplies.
>>>>
>>>> Since there is no standard M.2 binding in the device tree at present,
>>>> the PMU is described using dedicated PMU nodes to represent the
>>>> internal regulators required by the module.
>>>>
>>>> The module provides a 3.3V supply, which originates from the
>>>> main board’s 12V rail. To represent this power hierarchy in the device
>>>> tree, add a fixed 12V regulator node as the DC-IN source and link it
>>>> to the 3.3V regulator node.
>>>>
>>>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 99 +++++++++++++++++++++++++
>>>>  1 file changed, 99 insertions(+)
>>>>
>>>
>>>
>>> My bot found new DTB warnings on the .dts files added or changed in this
>>> series.
>>>
>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>> are fixed by another series. Ultimately, it is up to the platform
>>> maintainer whether these warnings are acceptable or not. No need to reply
>>> unless the platform maintainer has comments.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>   pip3 install dtschema --upgrade
>>>
>>>
>>> This patch series was applied (using b4) to base:
>>>  Base: attempting to guess base-commit...
>>>  Base: tags/next-20251112 (exact match)
>>>  Base: tags/next-20251112 (use --merge-base to override)
>>>
>>> If this is not the correct base, please add 'base-commit' tag
>>> (or use b4 which does this automatically)
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251113130519.2647081-1-wei.deng@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcielp3-supply', 'vddpcielp9-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
>>>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p3-supply' is a required property
>>>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpcie1p9-supply' is a required property
>>>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>>
>> This is the 3rd report of your typos. Is there some reason you are
>> ignoring the reports?
>>
> 
> Sorry for the delayed response. These warnings are worth addressing 
> and will be resolved in the next patch.
>


Three of your patchsets have bugs easily pointed out by tools, so please
answer - are you ignoring the reports? Are you doing any tests before
sending?

Best regards,
Krzysztof

