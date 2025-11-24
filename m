Return-Path: <linux-arm-msm+bounces-83006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC231C7EFA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C40B3A3585
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 05:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D108C29D29A;
	Mon, 24 Nov 2025 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huGqx5uI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC62BEC26
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763960828; cv=none; b=Xn17aeZVGncFpy1p6PkTyWb61qKJtfmHZtQBR/+ICk5bmUmDfFHtShOIHhbnI+VAkgieXW2lu8vvtorGMHjb/OkCFzm4YMV2gueDZcfNKNjjpUODZiS/90Ly58PlpunvEJV0TH4aCtQLNZUoZfIl4zc+IGuhRKVADv2ofCxF43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763960828; c=relaxed/simple;
	bh=bHA6HQFx71grWgiZiVMPzotW5/atqoFERPTknZaJaPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxY67dF4LtmDr8lptkDJ3cuZAhfY9KNmeQ8F7SUQ+jUKoMjLRCV0/xR3c/RsT1wmMUPGsEJlV0U56rqA0ILmBF1eAQjI5nwx2fjK4hoifhp7bv1j3ECW8y/QY+/jIgkD2/whDVMPG8WXb1EBWEVoUcz4XSkhrIj4o6e2OnuLuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huGqx5uI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b80fed1505so4375275b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 21:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763960825; x=1764565625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhcCOqzgmJN6F2HgJqP8P4Fbp35gJAyNyrXxslklYZ0=;
        b=huGqx5uIKVRf6rRVNgAwpLRH9hHg/J967BGfyWnEldqfUmnfsQL32/T6ao/s6o3z9l
         PJRdQFwwDNXcYY2oMhQi6tLruSlgMB3BWeptdbg+N6ewNnQhCrzxqLxoPO0xmeFDifea
         Sy3xHELjnHgMbyKvcqmnekGN/iuWbNWRaQAH48G4+aNFMLBqMQAFQdkKvpXbS3oElkIU
         +H/k8bURFhQon6jX6dL2F9dVvswTc3mnmuZz1V7Us1uKZqE001rY9VkymxrBphGC77fZ
         kH4DWE0auHx80DD9hhvaNBAwbDlfwAeF72/GcUVaTtsQYfmNGE6d9sVhkNH7fXUVKbiH
         aGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763960825; x=1764565625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhcCOqzgmJN6F2HgJqP8P4Fbp35gJAyNyrXxslklYZ0=;
        b=Fh8HYPhMSuirNM6Y3f1sEUkjle1iqNI8XWntqZAH9w2dbfICk+brIXAoT364GTpDlV
         z6Vzb83JyYdzxYen7+kqEYCt/ltxAtYPcpUxjtOXv5KTZLjjcYxUj2cNMZYiJ5w1Mbpn
         Dmp22AZvRSoi1CaqUVjJZa3zM5C6CDwCe3KeSBovuXhnoBxfxYHEpWRCrnkKY8tVaEPr
         3klTsxoxOgNe9VmRG4BhFlHXwwj2WtssqbNf9NTNhz0wXdyGko4VVfHPnfxS7E5/IkDi
         FeLwU1gJaJ66piNZES9POI771WRIWZZW9I91vyk+CRzt9BBRLG7H3cODiPXY1ZwONqNb
         B8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWVkBh1aiEWFhzCd2J7h3jTtf0GFpckck/+JxDzWkX1+QP4msxuOZ0Mi2olzKT+XAZarUqRnAWHivuYNA4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/o2tvcpl4xqA8RXE5QjspDCra0ygyIMNOMJCPqYo6WCkutYd
	OHMv2LIgtD64J4xVL+vO4mInRiDjWIUdoyupWoNYf5w7g5NrtJ6gcvEN
X-Gm-Gg: ASbGncus7p0I9Cegfte3egQQ62Zh2PSujmTig5w62OTGLOk9RqAtmLwFJEtWIX58sHi
	mFVKfzovsojeIbJtGBKJYn9jYlSqRH8Z0s/MGNnFP3qB+W1nHGghNtdZ2ygQcqWUE7pm4t2EU0g
	HYU7y1tzS5YHwNTXeO9CNo+EtTRkgvdmyv7lC9tpAWlJEmv8c7LoP1ralFLvfWDSMuc6Ja0RiA/
	dfru17ZXdtsUiG72B1BcgitP5OZPJHJQNc6uPbpVA5hqXKV9AXM3ayKXmTQTcksoRHKrDG3WxLH
	IqD3HvaBpI+sYJvlc2xazJ0rpc85SlicI22PMPXgpp0Yj8LQbQTm/27F89Y66MYIc1FLE38yrys
	a5FSAth6Rr1hzswWL4EpyuPPyOkXlm7gcEIdPx/4pxq93tpdTy6FJ+7C8F2aZTL63wMW6gnfB4F
	9M8o4iKK7P8++WkxkbzJagdTZEIgSy9fegAaI=
X-Google-Smtp-Source: AGHT+IEM2Kgb8TlQyecx0p4KgN/dW/pTxN9bPMT3jawCrbVzBpSC9udaTjUxa6J6NHq2xeaq5SEBAQ==
X-Received: by 2002:a05:6a00:12e1:b0:7b9:e4af:719a with SMTP id d2e1a72fcca58-7c58c4a7d77mr10655880b3a.1.1763960825405;
        Sun, 23 Nov 2025 21:07:05 -0800 (PST)
Received: from [172.16.20.12] ([136.226.244.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b69e1dsm12949353b3a.51.2025.11.23.21.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 21:07:04 -0800 (PST)
Message-ID: <2e0a7e3e-eb20-449a-84a5-6d4e2f147ef9@gmail.com>
Date: Mon, 24 Nov 2025 10:37:36 +0530
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
 <17085f43-22fc-4590-bf42-6869ca3d7bd3@gmail.com>
 <46k4uvtoit5tty3ojh7da7yliqz27tdcscu2co5tuowy33uicc@v3f3cojpwvzp>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <46k4uvtoit5tty3ojh7da7yliqz27tdcscu2co5tuowy33uicc@v3f3cojpwvzp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21-11-2025 22:16, Dmitry Baryshkov wrote:
> On Thu, Nov 20, 2025 at 01:02:39PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 19-11-2025 15:55, Dmitry Baryshkov wrote:
>>> On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>> platform is composed of a System-on-Module following the SMARC
>>>> standard, and a Carrier Board.
>>>>
>>>> The Carrier Board supports several display configurations, HDMI and
>>>> LVDS. Both configurations use the same base hardware, with the display
>>>> selection controlled by a DIP switch.
>>>>
>>>> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
>>>> defines the interfaces and peripherals common to both display
>>>> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
>>>> can describe the selected display configuration.
>>>>
>>>> The initial device tree includes support for:
>>>> - CPU and memory
>>>> - UART
>>>> - GPIOs
>>>> - Regulators
>>>> - PMIC
>>>> - Early console
>>>> - AT24MAC602 EEPROM
>>>> - MCP2515 SPI to CAN
>>>> - ADV7535 DSI-to-HDMI bridge
>>>> - DisplayPort interface
>>>
>>> You got the question for v6, responded there but didn't update commit
>>> message. What is not enabled here? E.g. why isn't venus enabled?
>>
>> In earlier patch, we have added 'Wi-Fi/BT and ethernet is not 
>> supported'as a commit message. Later,based on 
>> Krzysztof Kozlowski’s review comments, we removed the same. 
>> Please find the below review comment for your reference.
>> https://lore.kernel.org/all/20251028053248.723560-1-tessolveupstream@gmail.com/T/#mda58996a7abac13780f8ce2cd49b84c32d4c50a6
>>
>> We are not clear whether 'Wi-Fi/BT and ethernet is not supported'
>> should be added back to the commit message or not. 
>> Could you please confirm your preference?
> 
> If you are unsure, you can add this info to the cover letter. Or you can
> write something like 'Ethernet and WiFi/BT are not (yet) supported.'.

Okay, we will add the info 'Ethernet and WiFi/BT are not (yet) 
supported' to the cover letter.
> 
>>
>> Venus is enabled in this patch.
> 
> Ack, excuse me.
> 
>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>>>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
>>>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
>>>>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
>>>>  4 files changed, 598 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>>>
>>>
>>
> 


