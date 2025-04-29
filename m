Return-Path: <linux-arm-msm+bounces-56169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C6AA1B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 21:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3DD1BC2183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 19:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF0925E474;
	Tue, 29 Apr 2025 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqoXRHI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0495253B71;
	Tue, 29 Apr 2025 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956276; cv=none; b=AU2SdAGfrXnEIB8Wv5HtFW/IlggxP8AAeQ/LODOWckVouKT0sLXjV/orEpIkCGR3nE9FfFIYyZ5I5uz286W3LdouYxvPkSzeJdTMwRIsqiPENipM9yyKrFiPkBXKKwkT2wCblfZxEriBi5ageHIHy3q9cMZJNmAFXts8EyBEKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956276; c=relaxed/simple;
	bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RQ3GACest8vCgqpXUfC+qKhosNw5qfHvOlAPJMuvpRjK6bvM1EIVp/rxtUkZEy57opeRKjWH5zRaVGhMy0iM/HtZoxXaSCRUYscmUDdpa4kKXMqILPjkJHbDDioFz/2+wXncuiXOQ+CVfUWJHKOo2coEpduls3IONO0Vk6M4aOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqoXRHI0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5889222f8f.0;
        Tue, 29 Apr 2025 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956273; x=1746561073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=;
        b=VqoXRHI0Idp9t5Z/hwoYNE/qfiP712gltugKamwo9NF10pbOoa3SIRMKXa1lk8GY3r
         +6q5v+dCPd7cn9aP254vveCZ43o7d2EbJf1EXZ7RFsFElegh3PC1xTPz+YEXzS2065kP
         p40LHYSaMpxGefaw26hVW2L2xDfUZJtYsa0GVL95y2NlR21JTZ16g6wiHPj84CPXjIYL
         /z7b5cxffcKKCz5Q0EIOwji3Ia9kpPdl3Nzvzq3uXiqYieqdm5mi5v7DN1tJs0I5ytNp
         MlpZSUmtItK2p2JTr0tIPWb/wILKn+3opQs+xUzJEJz3dHJCS+em1WIULlaucSHERk6V
         rIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956273; x=1746561073;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=;
        b=SSJAOvjEr848XA/XhO7UUcHWtRfWzrCkiC/rR1eILIPK7K93cKTiDlkmL5JYrFtBIN
         TCThCeaZuiUR8DF4aaREAzuAfxrhVdTuZPEEK/D5qsqX0OuEi89WCAUO7FHL0G7NjbN+
         AvtmlzA+qEpwBdlZ3tlRbKYb8GOF24IftiAnr7HLRhR304GxIeRXp5Dr1FXkbVPMqW0j
         YP3bfHGdEU30yDbtuZtnv16macwUWoFXt4nOZj9QFv/N0cUzDlsnHTzioOMyZ29D590F
         sszhtbkKb8jG6Hco5Wqp5ykhZwcWdaZUlxgak4AGcIk0o1EgbA1753aZ24Otclx2b5ca
         GN8g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Y+6PMOrp2mq3B2o/gOZK9cJoKlLM36YgKX2BmYCPIKQ3bjnXJju8mOLH1YvQiaZjyjwqYpbiOFB8LhT7@vger.kernel.org, AJvYcCXygh/EN+//5vHwzITBoASwK0/FRR/eon81rzGc0HijPI7BIwKx3S7L8gxugwkgUFqBFjlfUSYkL4rX3IXM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhR+KFNl6GQK+hs1M7qfSFlnwn40wLy96PbhCFRqp93x51+uX+
	XVes3OCNzXb87+87LYhbN807fy1EPP20kycKCIwtf/PGM/1Xe0O/
X-Gm-Gg: ASbGnctyN3eM6pwxUuePA4VpBXQVgIkZ23y71FYkHbJMXNVonbkhDmmm/8lAtryHthX
	31mNCzu7saAjbi6B61U0XYBWnhicIWxHJ8WhBtnRHxBvXa88DNGia5nnjONGs1qaMyFtRERaTcz
	olvD14X/opsnxLhOt/C2+RyrTAeOltk4twr/I1SdwGK9ZU/Odt4HSM/vRFiVzejtQ0VRkstu0mg
	B12zai0/4kuGWpH8g88aEvlK9H2M2Fqvp8MMiQzXl8WZD5VPA8hqMjtEc/Sh9Kcwo3fW/nMsCuN
	IM/aG9imMD5dGn/3+rOEDcQRtm1ZFH4mH4C0MMfzCrrFupPnaNhf
X-Google-Smtp-Source: AGHT+IEjgsJPfac2XxBU5WYmuZlZ/uRKQBSizR1fl3RJO5bgEc0OUCbXE2MDpOf6drk91+Ec3iF26w==
X-Received: by 2002:a05:6000:420e:b0:39e:dd1e:f325 with SMTP id ffacd0b85a97d-3a08f77c26fmr606792f8f.31.1745956273149;
        Tue, 29 Apr 2025 12:51:13 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46869sm14883373f8f.72.2025.04.29.12.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:51:12 -0700 (PDT)
Message-ID: <c84e8246-8104-4409-8d95-389d61bc07af@gmail.com>
Date: Tue, 29 Apr 2025 21:51:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
Subject: Cannot boot imx8mm symphony board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I write this to ask for help in booting linux on a slight variation of the development board imx8mm-var-symphony.

At the moment I am using an u-boot version that can boot a linux 6.6 kernel and a 5.15.60 that I have
adapted to my custom board: https://github.com/NeroReflex/linux-imx/tree/old

I can boot that without any problem: the gpu works as well as networking, backlight, RTC and every other device on the board; however I want to use either 6.14.4 or linux-next.

On that version I can see a device tree arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
that, from my understanding, is supposed to at least arrive at the point of printing something from the debug serial, where I can actually pick up and start figuring out what's missing/wrong.

My problem is that u-boot (the same u-boot version that can boot v6.6 just fine) works flawlessly, the fdt is
loaded into memory as well as the kernel, but then I have no output on the debug serial, no backlight is turned on (I tried adding my screen to the device tree) and the ethernet controller on my board does not reset as
it usually does when a working kernel is booted: this lead me into thinking there is a problem somewhere in
the early boot sequence.

Therefore I attempted to use the previously working device tree, the one from 5.15, but to no avail.

At this time I think my problem can only be either one of these:
- u-boot I am using is not suitable to boot kernels past 6.6

- I have a problem in my config

I also tried using the following patch as it appears to be relevant for this hardware:

https://lore.kernel.org/all/20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org

but again to no avail.

Can someone please point me in the right direction? What config am I supposed to be using to boot that board?
What version of u-boot (and configuration) should I be using?

Thanks in advice,
Denis


