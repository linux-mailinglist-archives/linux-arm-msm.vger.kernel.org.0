Return-Path: <linux-arm-msm+bounces-73853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E844B7E0D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96707581313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 05:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B36427C178;
	Wed, 17 Sep 2025 05:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk7WdYeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C726E6EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087045; cv=none; b=cyC6oZDJM1hnCdJpx0jCCvzFJqKkV474G+AvxhAD9OdBssczXnYIEEuziwu/r8Val6ksPvEWfK8lQTjzAL29Cbr3pe4DGmAsgKQEnVfPV6kTsg4YjcISvfEjs+LGT+rfFVTNhfp1V1y6vsF5OokMlfo0F10582ZiuLqqvw+nFnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087045; c=relaxed/simple;
	bh=ojcEEPJefpnCUVr9pVG02gpYlf8ErQMG41Qqu959wmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X54EF5StGnWtAFxNeHPI/omTb7D6LHeyR3mJFx2Z8L0nttkoBM0mIKcQGPBy0rqG3EKkJDmqcp2R2b0FWnMudACWQ2Dec8DZTjsNEBuytGXd/pAFFTLtKSFsQw1HPW3ibP6Ij6f18wZ8n7bbpJ3Vm8f+lZiDj8TanWK4VX3w2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk7WdYeB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-25d44908648so62181275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758087043; x=1758691843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RLDgsVG/9yzmSOd51trY/YU6lrZVjPVVmLXoww2Ukw=;
        b=bk7WdYeBMYO1wwPHYIB9Zo1lF2X916w7ZcDopOCIwQiOG0JdBYt2B15F5w7Lw+re4f
         ygm2zJHU+Eg/aalsGjGn11EZJgt7qMn/qNEpFiU+cuYuuBq0vPIPUwih/qRgpjRGLaR5
         W+Jl4jtQRd7fi+Tt0M4xqDTO6oVrmHg9Rz6td93TYKB/7v1QoqK8BVelg78MU3sq6Fbs
         TeTWsTImQifrb/EbolBNZVi3ZlL2pqzdnH7zxPlK3j1uEId8ARkQLznW6sioN/lmINy9
         6vFg8VfEKvTW5VKu7Ak/wdsrS10jKN9+aBIDRvSy0y+9puativoVvvlHtcWdlGcN6D95
         P6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758087043; x=1758691843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RLDgsVG/9yzmSOd51trY/YU6lrZVjPVVmLXoww2Ukw=;
        b=UtruA+ll1a8PN7RnpMvypJQBCF/fGLnD2A6FOIG7AomzdKC1ssvqOy2b3KmK7TyWCV
         lAtoBYts+NGY3wkIRyUvNXcUP0atFUuuvcGAHc9Lk9Ru6h/TThbbHE87EGcby5l+cewL
         0I0xWAI9Hi9KX/WN/9oCc3e5Ud7gQQiqeeQ/UEavvNmqmFnC8lKepGdUChzWHNCakaF5
         zvi9wA2qmeNC2cmQabrwm6fKMwoQJ9bbgAswwBe1eKqCRtbl+tkMwGzNHabMbHr1moFJ
         +7mY3hPWzorqOWv6JWTzNUrV2fapbBhEyHzF3U4v4Kc6b2Ox8j6/WzO+IygLOzrRfYTR
         /g9g==
X-Forwarded-Encrypted: i=1; AJvYcCXAKof1+2dlvHfiBalQaXUlhqdaVxDvwsEtAej5AApIGY2oGH9F2I1oQbt2Io5RDtvQ0ST1cFQMUZNqFv+b@vger.kernel.org
X-Gm-Message-State: AOJu0YyIw2fsEBNX9c4lJjSPrO73N2l1KgIr6FUgMsHXKVT22vzpQnSA
	a16e7G2SHmmnNJvqMvIlQyNOhChke+NXfL0b5XU4ksN8D0VQdBgx4+y3
X-Gm-Gg: ASbGncuS102tVPwuEM05l7rKXPm+2ybgTy8L0YvVH7rJ1ZR7mQlkdy1vezvwhIT2/08
	K885YAkpiBNRDbuGnjcYTLBAtM0wHq+V4revwkT22hfvVi1BMmkqBF52nB3xypSz+2OPtnTonEE
	Cjiwtydzw6o4vo1a33/AjoanzoXsOuX8Ls/3ZW6YYBxPIOiIK6vNR/5oHYMNynhLFv45vUMosC3
	GKlwupbtkfh2BwhB2AoRoWrxjWzWFPGPoHQW1AGuuaS/7folzPh7T7cXhurxbpXywsBHXDcdnIH
	U0j2kLEbbQUapLKYhtTmB1POe98IK250ig0cjqj0jBB/RWcRysL1Igx8uH31yFkz0JZLymOwKX0
	rXANF3aeZmiELMVnAHy1ivBTG9o/DwNLy
X-Google-Smtp-Source: AGHT+IEAVa+T6fRcCJa37o376SoMU7onInRHzwpwOfD+pCgZlxIWR6i2Ecy3rSFDP4O2WFq9GPHBKQ==
X-Received: by 2002:a17:903:4109:b0:25b:fad8:d7c2 with SMTP id d9443c01a7336-268137f2945mr7319385ad.39.1758087042781;
        Tue, 16 Sep 2025 22:30:42 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25db018df8bsm142006335ad.151.2025.09.16.22.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 22:30:42 -0700 (PDT)
Message-ID: <3fae286a-dc5b-4024-be28-ab51dc907ba5@gmail.com>
Date: Wed, 17 Sep 2025 11:00:36 +0530
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
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
 <70c2f78b-c3ce-4b7b-a961-9f3957ce40f8@gmail.com>
 <axtz5euoa5lyg5clwj44jhdn5gvfubic6un3ilndzzoy22rici@rqqk4eyw7yas>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <axtz5euoa5lyg5clwj44jhdn5gvfubic6un3ilndzzoy22rici@rqqk4eyw7yas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/09/25 15:55, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 11:22:02AM +0530, Tessolve Upstream wrote:
>>
>>
>> On 09/09/25 19:28, Dmitry Baryshkov wrote:
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
>>>
>>> No WiFi/BT/ethernet?
>>
>> Networking peripherals such as WiFi/BT and Ethernet will be enabled in follow-up patches.
> 
> Why? WiFi/BT are supported for the RIDE platform. Is EVK using something
> different?

We used a Quectel based AF68E module (PCIe for WiFi and UART for Bluetooth),
which is different from what is used on the RIDE platform. I plan to
enable these in a follow-up patch series.
> 


