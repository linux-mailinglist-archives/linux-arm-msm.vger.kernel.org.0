Return-Path: <linux-arm-msm+bounces-29739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01109621E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F461C23AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468C715AAC1;
	Wed, 28 Aug 2024 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaowCfH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6515A85A;
	Wed, 28 Aug 2024 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831885; cv=none; b=fQgwpV5PARBbMcHDApYuYstWjRlJEkrkBoL7KRnkGQsKCkg52a+XedOw7PrVt0bDQ7kUepbdBeGRWaOHnN2qV9H4oMvJ0kHVzucoHvQCFcnG2mG6lU7/g9kfKKpiN/VESMt60IDXi404GHMYQeR7qCww+rr1oc8sl1fCcf4m9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831885; c=relaxed/simple;
	bh=vvv2FCnY1N7fEiJiUOKwdxV1C/Cj4rSSfhnvwQz5uvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaUNS4Afe0VZ8uShG33798qAAOHFutE9axB2nAjgRUB0zv12xaMViUCsA+1O0/p6D0XfVDS2WkzfK1J3DwH943Ts18pS0O2R8ygF4jYqzwxqmFFJjYhncElFtNUhq88CrOAcv7Egvmd5IlXGZr1Zpfx+2MkJ8U/O0wBN75UNVIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaowCfH4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D58CC5813B;
	Wed, 28 Aug 2024 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724831884;
	bh=vvv2FCnY1N7fEiJiUOKwdxV1C/Cj4rSSfhnvwQz5uvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YaowCfH4VPEFby947jpJv+S0/3clpZ9Fw9tRygXOxXhF/EQE0+3PONZYAarTqkqfZ
	 46HJi7BWPONdqjSHr8YQcg2+SpAzZMVVI2m5VgNc4pNmHJKx48KAxrKTnN7ImAv14Y
	 2m++emhGydMfGAq55Ckj6ZDhihX5wIUxpTcFNOnsqacr4SYj+9R+pmJSQjegFBIasR
	 O6JKsGW9rStsts5yWHD8Fh9FHBP+YUIgSFBhxhRjcp0I6d/bRombcwbMcWk+sTQ4mj
	 AJg9eknbcgFTJwWXpwow3Ajd3ugUWxj8kpVrjrJaBK1Leovrm6WeNgZMKvL3nP57/n
	 BjBjTxYuXup3A==
Message-ID: <10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org>
Date: Wed, 28 Aug 2024 09:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: add initial support for QCS615 DTSI
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-5-5599869ea10f@quicinc.com>
 <gtoz6fzmukti7mbdihsw5ycltoozhrxgery536rh6dgpcqoru2@gd27iemigqae>
 <955c0fdc-5b04-42d6-a15d-58966c7145c4@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <955c0fdc-5b04-42d6-a15d-58966c7145c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 09:42, Lijuan Gao wrote:
> 
> 
> 在 8/28/2024 2:23 PM, Krzysztof Kozlowski 写道:
>> On Wed, Aug 28, 2024 at 10:02:15AM +0800, Lijuan Gao wrote:
>>> Add initial DTSI for QCS615 SoC. It includes base description
>>> of CPUs, interrupt-controller and cpu idle on Qualcomm QCS615
>>> platform.
>>>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 449 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 449 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> new file mode 100644
>>> index 000000000000..cf7aaa7f6131
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -0,0 +1,449 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +/ {
>>> +	interrupt-parent = <&intc>;
>>> +
>>
>> No need for blank line.
> Well noted. Will update in the next patch.
>>
>>> +	#address-cells = <2>;
>>> +	#size-cells = <2>;
>>> +
>>> +	chosen { };
>>
>> Drop, redundant.
> Well noted. Will update in the next patch.
>>
>>> +
>>> +	clocks {
>>> +		xo_board: xo-board {
>>
>> xo-clk? xo-board-clk?
>>
>> But if board, this does not sound like part of SoC. See other files how
>> they do it.
>>
> Other files also added ‘xo_board’. The ‘xo_board’ is the clock that will 

No. Don't use 10yo code as example.

> be used by other SoC nodes, such as rpmhcc. Currently, the node can be 
> deleted as no one is using it.

I don't think you understood the problem. This is not the property of
SoC. We talked about this many times. DTS coding style has even explicit
guideline for this. Your own go/upstream (which is quite well written
and complete) probably as well. Did you check it? If there is no such,
extend it.


Best regards,
Krzysztof


