Return-Path: <linux-arm-msm+bounces-84751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98ACAF39E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 638E63010CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C7B2C234E;
	Tue,  9 Dec 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwev6PBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837352C15B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267042; cv=none; b=KgalYoMGcV0qLyYb+FW6B/AW8IjDcZfak9WupCxtvTVC49d/Mr55erCO3Iq4aLvxAE52MIiWdFT9fEVm2MYkAwIa2pVMkcs5oIF1DVfPEXlonhxl64djAJLzSJn+r/OOnS/RxV+XWyHNUtYLoAcQD1nsizuKevDr7GPl9WwDFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267042; c=relaxed/simple;
	bh=aX5KvupFFPj63cXr5oJ4++D0ZVlbMvAXUw+170MA1Z4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0tDk6ORtDDrv0ZSInI5h7kbGDWE3//Spyg4TNZLTqYTJL0YFMNU+0xPVD8P0r/ZNGelrEL/70aWp9RyjieWYTWjrX7PdBKSXMcRkjBpcdKmkTNml/wv6nykHBykzj/w+vwFIgZm5/UAKzDbnG20ijl8Pv3bqDSt2lFZvsrLyiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwev6PBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D117C19422
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765267042;
	bh=aX5KvupFFPj63cXr5oJ4++D0ZVlbMvAXUw+170MA1Z4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pwev6PBRQbPDWXqrjjTdq4lWj6aulIiq51ZoFcZeRE87A1d2CwbiVydv9Nsojye9W
	 Mwm89v8g9h63wNqqRFXKaLZZvrHg+VCStX/+VGhlmV6efpoAFUaEX94mn1eufxSGbE
	 g+N1JHtAGLqiIoB0CDPaK/DOBP8aIrU2RyUE14rL40tVcVAcWXcVI9xuzQQj/QriKl
	 /6OITVD9UX9g8Fk3spKpytgdHMiauLkgoyPDz3kvZ4YC9fOaIq73aaZhZ0IXR70IWt
	 E83evf2X3qA11o6usP5ODQORRxYn7rCWYqRBzEJbpgpOsxMz9/TkK8psLpQAWrLvJv
	 3mNNHVynsFhNA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso5760678e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:57:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhwC9EaAG27M8/tNuuo3nskfVkvPcKgQML1kprh7JDxOluu/xLtBbzEVJQaHyD7B6rX6oOs4NT4f4TAOzb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpEEUl2VHqPpJpLG92BH0XcEr9NJcTT0pOxb1o/QvcVk8CvZL
	X6LQtK2Hr9Uurn66X4yApLG0d56aJKcc+jzhTQgWFxmrbStORpbVWCkxT3RV/cnu6aDVz7nrnbv
	BQGwL3jLFSJQk7HCiitaSHT2LoPu5l/8raPkLQBihoA==
X-Google-Smtp-Source: AGHT+IHtR5KR71gFRZYgPo+zeDOVstDOFzbc/mDmIlW0nMY0FcVoL9GtzqhIIGDVlkPd49S5AG4nDUYHQa328OAgTcA=
X-Received: by 2002:a05:6512:12c8:b0:595:90f9:b9c2 with SMTP id
 2adb3069b0e04-5987437987cmr3787062e87.4.1765267040819; Mon, 08 Dec 2025
 23:57:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Dec 2025 23:57:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Dec 2025 23:57:19 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cc1c6f0020b60e3a8e90ec1d55973e15c88ee884.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121135739.66528-1-brgl@bgdev.pl> <cc1c6f0020b60e3a8e90ec1d55973e15c88ee884.camel@pengutronix.de>
Date: Mon, 8 Dec 2025 23:57:19 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mcp8b81XX0AcBEpPNZQxDcPtHXQrKatw7k+fN7u5tYuGw@mail.gmail.com>
X-Gm-Features: AQt7F2pP1_fTG8pIJVQAtAunhFkh0lT_ZFF72ZRvlUcmJ1G9eclMm12xtb5tQBY
Message-ID: <CAMRc=Mcp8b81XX0AcBEpPNZQxDcPtHXQrKatw7k+fN7u5tYuGw@mail.gmail.com>
Subject: Re: [PATCH] reset: gpio: add the "compatible" property
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 11:43:01 +0100, Philipp Zabel <p.zabel@pengutronix.de> said:
> On Fr, 2025-11-21 at 14:57 +0100, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> In order to correctly handle the interaction between the reset-gpio
>> devices and shared GPIOs managed by GPIOLIB, we need to be able to
>> identify the former. Add the "compatible" property to allow us to use
>> the device_is_compatible() helper.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Philipp: this can go directly into your branch, I will fix the GPIO part
>> in the next cycle. For now it just parses the device name.
>
> Applied to reset/next, thanks!
>
> [1/1] reset: gpio: add the "compatible" property
>       https://git.pengutronix.de/cgit/pza/linux/commit/?id=a0d57f7504b6
>
> regards
> Philipp
>

Hi Phillipp!

I realized this didn't make your v6.19-rc1 PR. Any chance you could make it
into an immutable branch or maybe you could back it out from your branch and
allow me to take it with your Ack? I have a WiP patch that fixes one remaining
issue in the interaction between reset-gpios and shared GPIOs. I want to send
it for rc1 or rc2 but I would prefer to use device_is_compatible() in it.

Bart

