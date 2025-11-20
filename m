Return-Path: <linux-arm-msm+bounces-82629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF12C729C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 72F3F2A192
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97955184E;
	Thu, 20 Nov 2025 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPD/cmlI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F13043D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763623930; cv=none; b=C5wShL9+IzrcTR7LEtIWPVcSkUkAG1pLLulMEBunTtUkkNvtLnMfm8NmKutV04MypyqvNPCFc7PEUqMwIXTONZTJtEwM3RR2ChtXsAX06U/GmXK61IT9CdO3FCqNZcYV9biVzZMvz6Z8Uu2dR0TGEASePI9FtWlGIQk4BHcgvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763623930; c=relaxed/simple;
	bh=HQxLahnb/gBuYP24U4BNPYZhJMAzzZLw9A4kBEhJKZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o97gJQzm6T67tDXm11Zq/vcXOoHHkimT6hR4oEnRlW3QkENCV98aHyphQPjDVuy5Fq1rv9+EDBlJd8IG90BlTd2vzNrpmEYN/AwkKHF5CjFrlSgwywy6j+AQzDThWj4SzCzqAysPd1GYAGTjrXuI78okcyNqOod+WT8VLC5stQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPD/cmlI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d4a56f97so8803085ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 23:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763623928; x=1764228728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IovJKqNa1DO/xBfd+tkVMUbaKlyIIus8shUO1PQ/Pck=;
        b=fPD/cmlIb4onK2E0gJJmTMNuKPhpH54hl9jAEPD9tMNB23MttbHp/gsGigyptVVGPH
         Fk3BAf6/1f7agezcGjfVMUtmuE5uSl1muD0GDa/rjRswYrGO4dyoUVIwIF8FDXIbIBjT
         d05IOc+8vuWQZF3xYE+OHFIlzHbMBPsRWBxb2OopTTL7RfJAOYCT8DOaXr/K/PW+UOBn
         Ys1Q7BCUl8BPwsLvEgXL2BYyG1CWkJ13vqkw0/3aa2LKUnKNtg97NP9K0k4NwXPiJzpw
         RpbocmBaWT9Dx0h2oiufUW6y3xDopDIWaAewCtIp8SF3v8g+KEDBku6o2tcqkFP6sJXG
         YebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763623928; x=1764228728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IovJKqNa1DO/xBfd+tkVMUbaKlyIIus8shUO1PQ/Pck=;
        b=EyI0P4x6scsXgHgD05W1mH2tgwwkYmBPr4L2ubcgc65Shhha4a3NPpc1kzYIlUpQb5
         Ubb+mj8hGdYWbrKOov+uhC8JbJOmbrStIOkJ5DJstUacvpnEXYU2z8ZM5H853HkJA97x
         9VVmabtyWboVeC1cj7Skv8l/KMdkJQgUmfN0Ly+9Jd1jy2ogeOpcLHIPUYtG1fkb2lBs
         V+jU/S59bHuc0l98a1xZMWNy8v8r9DVvV31AuvWDFVb+G9TdE3qABI5BBVmXB/RC8WuB
         Fh2FiY025I8I5kdBu3Rt59MEP8jvV3Hi9MMqFmsKQbp+PngYjZr3GcbD/taCk9nJ1/zx
         +ggw==
X-Forwarded-Encrypted: i=1; AJvYcCUFGeZ7rcSLlkIbxRR3NcCzQlKjw9x7qIcoVJDVLRshPoE7QTPQllH48ZhMoNITaVoPqVg5ZKb0uXBtg8Cf@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0UKYzJyA2/j97pmId+u5Zr0lKiG6+uqwQJujSSyFHHm9pEsP
	3bbn/oz696teLine38yzWDaGQEcmmpCfBZ1jwhegLJthDu0xk4aEtHC4
X-Gm-Gg: ASbGncvqYFs99diClS08g7CmUnmN5hFPfMFYTz7VMzTEEIqG5wy6ieMbCVemvcsSX+4
	39zFifWHUGxy3a/CldQv1hAOcJl7x81XX3aTAm+p/U9WF6Pgy63Yh2TSlIlJjUG0kod9Or/rVC3
	fRFGH/bhJry3jv4+zAlCxKCR87uADxiAlkt5L/OybShZilz662FV2V4bvDw+BQwJqY+BWNMZa/s
	ZJa6p3ipaP/R0/l3c54EFT8AEwQUlYi6BxnnaWg14Ei5DmFk1h9FRXwchfgcCDgXfwGLvWq+hCo
	Qb4vdursFC19OVxsYufvd8a+xDq/+uQDuR9hDFapAQwsFaYyS67HTmcxvXBCY/K51O4g/0Ek3Sx
	5A0YaHjAtFGGvMg/8HeuaN+N5rykxo3XcJx/sVfCbREml8MWRfXgmXeqGLjZjLVTO5xKFilGyvg
	1zvcc1Ll+xpETJ/wJotFopzpvQ/rjZjKCa
X-Google-Smtp-Source: AGHT+IGQUWwZZOJMzDFqMgtCjzZHr9EOao8nq9sPmN3CCmFh9PBvE4vkHnI80FQz0hKEEZBlamifGQ==
X-Received: by 2002:a17:903:110f:b0:295:57f6:768 with SMTP id d9443c01a7336-29b5b10799cmr28830025ad.33.1763623928199;
        Wed, 19 Nov 2025 23:32:08 -0800 (PST)
Received: from [172.16.20.12] ([167.103.23.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075ddsm16559445ad.3.2025.11.19.23.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 23:32:07 -0800 (PST)
Message-ID: <17085f43-22fc-4590-bf42-6869ca3d7bd3@gmail.com>
Date: Thu, 20 Nov 2025 13:02:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
 <20251118130814.3554333-3-tessolveupstream@gmail.com>
 <ug4n5dpsg5v5jwhwmjaktvydhtfx6gagoum6lul2a27h44xexz@uvdu6ma42wei>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <ug4n5dpsg5v5jwhwmjaktvydhtfx6gagoum6lul2a27h44xexz@uvdu6ma42wei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19-11-2025 15:55, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
>> defines the interfaces and peripherals common to both display
>> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
>> can describe the selected display configuration.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
> 
> You got the question for v6, responded there but didn't update commit
> message. What is not enabled here? E.g. why isn't venus enabled?

In earlier patch, we have added 'Wi-Fi/BT and ethernet is not 
supported'as a commit message. Later,based on 
Krzysztof Kozlowski’s review comments, we removed the same. 
Please find the below review comment for your reference.
https://lore.kernel.org/all/20251028053248.723560-1-tessolveupstream@gmail.com/T/#mda58996a7abac13780f8ce2cd49b84c32d4c50a6

We are not clear whether 'Wi-Fi/BT and ethernet is not supported'
should be added back to the commit message or not. 
Could you please confirm your preference?

Venus is enabled in this patch.
> 
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
>>  4 files changed, 598 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
> 


