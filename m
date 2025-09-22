Return-Path: <linux-arm-msm+bounces-74401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39102B8FA81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D264189C8EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1831281530;
	Mon, 22 Sep 2025 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ocddq7Qo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DF274669
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758531257; cv=none; b=mG6O7ASzTqvkJ4siUlvhdzZP9MtD9uRU8YTV7bPesSBO7z5B32zmVraW+XVYBjLlSGYgn6xV27rvBcQTkaZBgqjpcC6QP7p61tOQhfWv+Bagfwno+Aj6v286wq/EDyg4cth8r9lrHbZ9qnPO++mxPHf4hYaDnmtml7Udq5Eg3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758531257; c=relaxed/simple;
	bh=fIxQDWFzDzPVs0j3qsFbaUuYMMb/ZT7gym4kUpMe2fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2MZ7GY6kRAO4cdE4EaeFa8+SnppuI3JSdKAQz0YZBZTfnVR7dy9971qpNkJz3/PP3q/Zr8Brkr3rj/kVDkh5jp68V8rF+gWQ29qbXkavXTd2ZJxDgDHvflhxVpJgnHJ/J/NBnxmH9IWfyOj0A/4jr5mMPidJTNBaD/QPGEU5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ocddq7Qo; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so2653013a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 01:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758531255; x=1759136055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H39k1K0aEvBoQr1mBKXQ5JihuYk+RiG4/kveWZ5LX1M=;
        b=Ocddq7QoZY4NkwSo1icocw2ocMATfPlatPFuLvPFMaLQTMR5+DM/fcbLrcB/sbNeo1
         pVKBZ1fXuix3zodPjelh3K/7j+mNgVqMDPNSpwLm7gdMMzNow9aG636CSM+Jz7sTflCZ
         x8yqrCT+wTlKufJovZ0RXrt6wa3kqcuwP5pbUClpKwYu+EZ68jEenFxxpQZVdB+WXDer
         t6RjM44GA+Lh+6sIHX7TviuK/5VgM0EXRNdVwoCPKyJo2+Bq0aazvLSDrtO+qKTNUJbC
         Kw9zcv53VM59tOg3+V/9CwLpLWoQ8roGQrlIoiPQPBS6j8m7s4KjS6oaQUs+01HbpwMj
         NL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758531255; x=1759136055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H39k1K0aEvBoQr1mBKXQ5JihuYk+RiG4/kveWZ5LX1M=;
        b=WfIMMLVrClQdYIKeTmhLaH4KCZTLbYXHvEYHuWjB0dzA9lhnv+sQglwh6cYI+IvODe
         FNuaTF9Z8qDR9aJ4jAqTFG5sjdgo7v76h5VQZUjBbI4qOgJlvSxMFcbD04R0qDFFg1Sm
         LslDrNl5lFZnOOxnrKHdtqQi7UW6BcSHQtZ70JAM13aZQ6KXlklwX3HELlvyRTwutLOp
         6OPYjaxoJYFC/pyWqKvD6uqBXJ/fSs+HsLRUO15argfuhvVYhaBG+ljGl5DHdR+bbILU
         q4sITg2k97tzXQF2ZwdY64rrstJFBFdwUZcDdHNqUkOCbq4D2bktcad9WuekK2QAmNL+
         nerg==
X-Forwarded-Encrypted: i=1; AJvYcCW9+8AW8FcDlKRix+XTXeXzR7T9sCI+hZAXLpll1i6Nm6vzhznjMptQUW90pRE1JLp4v8JUL8yidjQOaT1J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fJeSMi+WujnXcRFqu4p8EUtDB2gPfEh5dCFMjYKOGCGji6DP
	gjEsaXTAdrrJHk8hZnFYS1WU73qt+QYtyE+nn6/WbzOhYtkCkx2RRk53
X-Gm-Gg: ASbGncsqG1/ERDDpowxJ/DYmxbdVPlf5YxDy0DRgxt5ob1W53CRcdlQvcc/JeOxjsb9
	BjZQKAB3fzy2U28IMj6+RVIUxOUp7DnTgpYW6aUPp2Yu/RAw+RUKA7QB35ecrzgNs4A4Y+QHW1Z
	Bcrg8GmF0eVh6Ufd5PEt1HBHj4XK7uD/BKpyZB5FAqcgqrleyoefn7b8Ks/l77FNvLcljDzAxlg
	Uc7rf+L1V3Medkn5YDI+85ce0hIws/IlY4TOVDPptXYyd6I6yZO0Ps15lUjMvndXv1WFhdt0Tyv
	fGtAictf3MUwtxUfUiRwGRQiNZYrFlLCHIOsRpJqnizyOo2F5jha/t646XfYPSblUbWfSw9Nai/
	ZyYOvaBQBSJVSPH7Xq7D3P7kZpgjFzO6UN4A=
X-Google-Smtp-Source: AGHT+IFiY6tuQs9Ly2byFHESUqEOqHC4JVRymKDPpM6rTB1ptSMUW3Ya07YAM9AAssUUu4Mv+I7hIw==
X-Received: by 2002:a17:90a:d40d:b0:32b:df0e:928f with SMTP id 98e67ed59e1d1-330983a1a88mr14963585a91.37.1758531255192;
        Mon, 22 Sep 2025 01:54:15 -0700 (PDT)
Received: from [172.17.44.75] ([103.218.174.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed273e52fsm15591083a91.17.2025.09.22.01.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:54:14 -0700 (PDT)
Message-ID: <50cec728-fb3e-4ab2-bf53-ecdcb6e027d1@gmail.com>
Date: Mon, 22 Sep 2025 14:24:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <f6kaau5sxgleuim7cgdw6hsvlwl73ye7emwjtrxwvtpl3pxsvr@frxbvtv6ixho>
 <98a92bff-db74-4b14-8a19-1171e60e87bd@gmail.com>
 <4e5hygjnmbnxm7gmdqce5w75nupwxo3b6ehgocmrjmfuhlomf5@6ydkk2yaxazj>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <4e5hygjnmbnxm7gmdqce5w75nupwxo3b6ehgocmrjmfuhlomf5@6ydkk2yaxazj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16/09/25 15:59, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 11:17:31AM +0530, Tessolve Upstream wrote:
>>
>>
>> On 09/09/25 19:56, Bjorn Andersson wrote:
>>> On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
>>>> Introduce the device tree support for the QCS615-based talos-evk
>>>> platform, which follows the SMARC (Smart Mobility ARChitecture)
>>>> standard. The platform is composed of two main hardware
>>>> components: the IQ-QCS615-SOM and the talos-evk carrier board.
>>>>
>>>> The IQ-QCS615-SOM is a compact System on Module that integrates the
>>>> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
>>>> SMARC standard, which defines a modular form factor allowing the SoM
>>>> to be paired with different carrier boards for varied applications.
>>>>
>>>> The talos-evk is one such carrier board, designed for evaluation
>>>> and development purposes. It provides additional peripherals
>>>> such as UART, USB, and other interfaces to enable rapid
>>>> prototyping and hardware bring-up.
>>>>
>>>> This initial device tree provides the basic configuration needed
>>>> to boot the platform to a UART shell. Further patches will extend
>>>> support for additional peripherals and subsystems.
>>>>
>>>> The initial device tree includes basic support for:
>>>>
>>>> - CPU and memory
>>>>
>>>> - UART
>>>>
>>>> - GPIOs
>>>>
>>>> - Regulators
>>>>
>>>> - PMIC
>>>>
>>>> - Early console
>>>>
>>>> - AT24MAC602 EEPROM
>>>>
>>>> - MCP2515 SPI to CAN
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>
>>>> This series depend on the below patch changes
>>>> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
>>>
>>> This was merged August 11.
>>>
>>>> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
>>>
>>> This was merged December 27.
>>>
>>>> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
>>>
>>> This was merged July 16.
>>>
>>> You just wasted 5 minutes of my time, tracking down the status of these
>>> dependencies. Don't list dependencies that are already in linux-next (or
>>> actual releases), or even better, only send patches once the
>>> dependencies has landed (or send them together with the dependencies).
>>>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
>>>>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
>>>>  3 files changed, 457 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 4bfa926b6a08..588dc55995c5 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>>
>>> If you look a little bit harder, you can see that all other entries in
>>> this file is sorted alphabetically.
>>
>> Yes, Will sort it in v2 patch. 
>>>
>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>>>  
>>>>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>>>> new file mode 100644
>>>> index 000000000000..1b9b2581af42
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>>>> @@ -0,0 +1,414 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>>
>>> This is not the correct copyright statement.
>>
>> Thanks for the review. 
>> I used above copyright since qcs615-ride.dts in the same platform tree already follows this format.
>> If you’d prefer me to switch to The Linux Foundation for consistency with older DTS files, I can respin the patch accordingly.
> 
> Please check current marketing guidelines, then you won't have to ask
> such a question. Also please fix your mailer to wrap your responses on a
> useful boundary (usually 72-75 chars per line).

Thanks for the clarification. I’ll update the copyright to match
the current marketing guidelines in the v2 patch and also
fix my mailer settings for proper line wrapping.
> 
> 


