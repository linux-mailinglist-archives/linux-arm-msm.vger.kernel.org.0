Return-Path: <linux-arm-msm+bounces-87998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E08D01690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 08:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADAE5301DE09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 07:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D366930AD15;
	Thu,  8 Jan 2026 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVwIoei6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911E286400
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767857780; cv=none; b=fNDDpGOqrDQk7C9uwDwly4H4G8CkTnD7PUnosvDxZwc84xEh5Pu689LjAT8DeN/2wD0MNnpyluOoubnjvHCRWbsE44OtV0OfbsOMhyDq3LtUaqe63DGR99L1AhfqKad3EVi9IvLAcuNc5fz3DKHKiS/Zde5999imPj20etIlgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767857780; c=relaxed/simple;
	bh=qRm6fe60g43t+3aop8VfXvEShhkPmEb+qMsIbWntVdM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z6D3/k2jit5z5474hpZ1pb4ui/n18l6jRXPjccRArNtCm9N/qdl5adE1o7M42dPGUD76r2NfF8S3kEnRqiSyqwtJ1Bo3NY3EEEzkdug/wpDgvG21707B34MEtD9PpCMbU+y1tV3Dzoy45b2C9LibPWg/HKMx6s9mAZumHlPtRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVwIoei6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso892186a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 23:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767857778; x=1768462578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Raf6rMxyKbtpGA0a0neUDVB8KhO13Yy7WiRRs10GZEs=;
        b=PVwIoei6TgIlW7E6gsqP5aV0tytGsyqA6znnyqUbrt8hY3BDJX88NiKLcxbFTQnxG0
         nq27/8LXaKoXYO4TVZTd5R5dwsM7eS6bR3JzqRN60WfgEoF6hQUi7QF+ig+BYeOPRAhb
         5XV0yTJzQZXkpggx90jWmB7yHFSeKBQpDowCJ0uu9/BTsliI09Z89GNsNRNJUXMb5a3A
         T/XxZZB2LrMdIocjbHMBSuWZunfiz8h6WNGGr4z0iRV3VxaQ4qK7q5YpwwVfkOamtsgi
         gRCxm3NHE9BmW18Qyrjndl/kGLzkKngCt1Id1nLS2yQfLQBg24/bu59TziQi6shIwBc5
         yalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767857778; x=1768462578;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Raf6rMxyKbtpGA0a0neUDVB8KhO13Yy7WiRRs10GZEs=;
        b=FPF1EnvFEWura3ojtAAyZfhs2i3DcJZ/JlJiCHa/7wf5G54EDjmWb7+DFdEQvllq4u
         KyKv3krYs+g1QaeR+0f90Kqs0lod9FMdyofJJ9hd27RslMg7z/OzaWYzFKPExhv0pqoA
         lDtXjKEpGtERo9FvW0xHSjPrwSGWAbJRf7KJzSLI/3XtP+/Kf8vnaKpn3M3oZiaSurvB
         FVg/Bs/qbdIGhez1eijmtSNQPu9w+5b61x1prAZwUipb/3fQd5cGW9WLbAXor4PjauXE
         xIeFF+M5DDucTTAl8VqI7DEy3i7H+wLvAM2K4ddBFbhxdRx+2+qdxKQ8EI0xq/cHBlGr
         PSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6KcCdNzGatkdjsx9oL4Lpiy7Zsl10ZvCSC2z6B1whUK6IbI8ceNaTDTd8eLHgyFCt2T7I8zH892GFOwDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYuQxEBemXU/RclYDBmcLxL7dNpBP0WdVzj4P1Tw15SxdxGaQ
	IDCxq7dHbB65o+IsGwO4KRCreziK1MqcfJtg7ByZ/LWoVgYm+4pVuQJP
X-Gm-Gg: AY/fxX7+Rcg3aGU5KUPnM5UYGVBJHdj1jilBHeu+NEVyGSJCDKboRtQUjnZEF3UT4YL
	CDxqL8qWeLnL9VhPuksNxrMs3AKCsmlt8BysX/Cg7tz2DTINOts4b//24OqXP/up6MV4dLt25Cj
	Ir/OGyk4hRz4R1seGN+4kuXaWD0bOd6dDM+E2ijbpSMKv8D8DCHte+S1kxD/6MggkALUUMC+K4q
	8YquaAgc6uhsyML1pvU3d08WQ+g4Fm+iMzs+v6vYsdwFmx0ac3YwjChjfPlMfo6KRy9aDXriGV9
	54iCHJYWVtr1tsvkO+6zqj0YR8iFHw0U/0ftxvuPXtoSApXcPghZcMuWJeSOywKb+9/7r4deIRV
	Zw/lfE95tGuCFUXzhbBX2UYBzk1BTTeYVg8nPmkSfLC6CsdnkO5fUdzTBw6CZQkqLpllaeG6K8W
	894O4ixh5qRXb7PtUwciI9IrZQZvTrFmtC
X-Google-Smtp-Source: AGHT+IFwn+9pYeZHD6rKzeZEcx/p1yKt2xjGQQ57ur5fOKGbe8ThUndVkKFkwC5dqjKIev8DHMkOaw==
X-Received: by 2002:a17:90a:e705:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-34f5f95a1damr8303062a91.18.1767857778424;
        Wed, 07 Jan 2026 23:36:18 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64d7asm6861454a91.11.2026.01.07.23.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 23:36:18 -0800 (PST)
Message-ID: <c3492b90-bb48-4584-99fd-b1b6832d22ff@gmail.com>
Date: Thu, 8 Jan 2026 13:06:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
From: tessolveupstream@gmail.com
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
 <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
Content-Language: en-US
In-Reply-To: <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04-01-2026 19:16, tessolveupstream@gmail.com wrote:
> 
> 
> On 30-12-2025 20:21, Konrad Dybcio wrote:
>> On 12/30/25 2:02 PM, Sudarshan Shetty wrote:
>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>> platform is composed of a System-on-Module following the SMARC
>>> standard, and a Carrier Board.
>>>
>>> The Carrier Board supports several display configurations, HDMI and
>>> LVDS. Both configurations use the same base hardware, with the display
>>> selection controlled by a DIP switch.
>>
>> [...]
>>
>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>> @@ -0,0 +1,126 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +&{/} {
>>> +	backlight: backlight {
>>> +		compatible = "gpio-backlight";
>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>>> +		default-on;
>>> +	};
>>> +
>>> +	hdmi_connector: hdmi-out {
>>> +		status = "disabled";
>>> +	};
>>
>> This should be a &label_reference
>>
> 
> Okay, will add it in the next patch.

I noticed that in several existing .dtso files, the root node is
commonly referenced as &{/}. In your comment, you suggested using &label_reference. Could you please clarify which specific label or 
node you would like me to update here.
>> [...]
>>
>>> +	wifi_1p8v: regulator-wifi-1p8v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "wifi_1p8v";
>>> +		regulator-min-microvolt = <1800000>;
>>> +		regulator-max-microvolt = <1800000>;
>>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>> +		enable-active-high;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
>>
>> property-n
>> property-names
>>
>> consistently, please
>>
> 
> I didn’t fully understand your comment.
> Could you please elaborate a bit more so I can make the
> necessary changes correctly. >> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +	};
>>> +
>>> +	wifi_3p85v: regulator-wifi-3p85v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "wifi_3p85v";
>>> +		regulator-min-microvolt = <3850000>;
>>> +		regulator-max-microvolt = <3850000>;
>>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>> +		enable-active-high;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
>>
>> ditto
>>
>> [...]
>>
>>> +&tlmm {
>>> +	bt_en_state: bt-en-state {
>>> +		pins = "gpio85";
>>> +		function = "gpio";
>>> +		bias-pull-down;
>>> +		output-low;
>>
>> output-low/high should be unnecessary as these pins are governed
>> by the kernel driver
>>
> 
> Okay,got it. Will make the necessary change in the next patch.
>> lg otherwise
>>
>> Konrad
> 


