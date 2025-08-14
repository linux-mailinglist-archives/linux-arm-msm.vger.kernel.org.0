Return-Path: <linux-arm-msm+bounces-69166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE0B26070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E6E721C2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5772E9ED9;
	Thu, 14 Aug 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swuCJtvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907091519A0;
	Thu, 14 Aug 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162359; cv=none; b=nwmRwtf8YUgGCrwI+SjQ30cRw7mn2+2CoqaXzfZBjOfipLLnR42+4ESe1FDKnnR8Ue985dR4gJsKjm+qF9WuVqDJ7i4XrzkQKIzxIx6ZdNm7OUQJP4l+XuKvn0WiiGT/ok/MVJTnHhmiUm+SeFoAbUreu0mkm6YOqRztbpoyGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162359; c=relaxed/simple;
	bh=LUbywY3YfDTNoHHV4qnd2fVcqpFN++L9SJu6sAi7hzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcTHSbJUiEYcboZ4404JYynna0/cuZH46z9zS4+elqVEzuC8DeHBICyLQoYwNSUiItDWaHwvW+Gnf0EA/yTs0Luns9M6LmvVBgNtfFnqlRP9/V21COWZBvJfnEBYNvUYD8HJywOu0fXmXW8Nn1A+koMyS5M17V1N9at2dd7VpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swuCJtvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D20C4CEED;
	Thu, 14 Aug 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755162359;
	bh=LUbywY3YfDTNoHHV4qnd2fVcqpFN++L9SJu6sAi7hzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=swuCJtvDHsR5tQ6+flBNcT70kRUDzg1qTznk67efEWozjfC8CFoO0E4K+NsaeS/1m
	 ZgAHghtb4348tL2YKFHSeDat2KnN22d4ZbpPoS2t3cHmIuZ6aagyMDmjqJDG9TADSd
	 tt0Z7EVnNj3NJfdCsu9MgKgGSI4BUfHELjEkUv8nMKnsGdQEyISsbZtan7xqEkfMTG
	 /zwBNDG64TN8wFRu9d+z2cv1P7zre8Wq2r+B3eISlukw6/gciafAZ62GCDbVGERdE1
	 nsE8tMSYGtgkF+IsksX/a+g143KpTpx9uH14T7LMojLhLgEvxlkblwkzNskQU211Xp
	 9HQqMa4rKqw9A==
Message-ID: <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
Date: Thu, 14 Aug 2025 11:05:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Yingying Tang <quic_yintang@quicinc.com>,
 Shuai Zhang <quic_shuaz@quicinc.com>, Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
 <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 10:54, Yijie Yang wrote:
> 
> 
> On 2025-08-14 16:24, Dmitry Baryshkov wrote:
>> On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
>>> Introduce the device tree, DT bindings, and driver modifications required
>>> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
>>> a UART shell.
>>> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
>>> and the HAMOA-IOT-EVK carrier board.
>>> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
>>> GPIOs, and PMICs. It is designed to be modular and can be paired with
>>> various carrier boards to support different use cases.
>>> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
>>> It provides essential peripherals such as UART, on-board PMICs, and
>>> USB-related components.
>>> Together, these components form a flexible and scalable platform, and this
>>> patch set enables their initial bring-up through proper device tree
>>> configuration and driver support.
>>>
>>> Qualcomm SoCs often have multiple product variants, each identified by a
>>> different SoC ID. For instance, the x1e80100 SoC has closely related
>>> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
>>> can lead to confusion and unnecessary maintenance complexity in the device
>>> tree and related subsystems.
>>> To address this, code names offer a more consistent and project-agnostic
>>> way to represent SoC families. They tend to remain stable across
>>> development efforts.
>>> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
>>> Going forward, all x1e80100-related variants—including x1e81000 and others
>>> in the same family—will be represented under the "hamoa" designation in the
>>> device tree.
>>> This improves readability, streamlines future maintenance, and aligns with
>>> common naming practices across Qualcomm-based platforms.
>>>
>>> Features added and enabled:
>>> - UART
>>> - On-board regulators
>>> - Regulators on the SOM
>>> - PMIC GLINK
>>> - USB0 through USB6 and their PHYs
>>> - Embedded USB (eUSB) repeaters
>>> - USB Type-C mux
>>> - PCIe6a and its PHY
>>> - PCIe4 and its PHY
>>> - Reserved memory regions
>>> - Pinctrl
>>> - NVMe
>>> - ADSP, CDSP
>>> - WLAN, Bluetooth (M.2 interface)
>>> - USB DisplayPort
>>>
>>> DTS Dependency:
>>> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
>>>
>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>> ---
>>> To: Bjorn Andersson <andersson@kernel.org>
>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>> To: Rob Herring <robh@kernel.org>
>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> To: Conor Dooley <conor+dt@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>> ---
>>> Changes in v5:
>>> - Update base commit.
>>> - Drop an already merged patch:
>>> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
>>> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
>>
>> Please keep full changelog rather than trimming previous iterations.
> 
> Sure, I will restore them.
> 
>>
>> Also, is there a reason why you didn't pick up audio and display chunks
>> as it was requested on the corresponding reviews?
> 
> Display-related changes have been merged into '[PATCH v5 3/3] arm64: 
> dts: qcom: Add base HAMOA-IOT-EVK board' and are already present there.
> 
> Audio support is still under debugging due to unresolved issues, and 
> it's unclear when it will be ready. Would it be acceptable to proceed 
> without it for now?
Audio was sent to the lists, so this is confusing. What was the point of
that posting? It clearly said:

"Basic test is good in Hamoa-IOT-EVK board."

So was that true or not?

Best regards,
Krzysztof

