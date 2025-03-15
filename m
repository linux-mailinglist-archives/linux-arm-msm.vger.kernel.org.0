Return-Path: <linux-arm-msm+bounces-51524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18DA627D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 08:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930597AC216
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 07:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1221DC19D;
	Sat, 15 Mar 2025 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BKQgro62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185171C861F
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742022439; cv=none; b=I3zrniWPae8Y/S8G63WDKu2/QG2vJHYRYCi8q2WwOikfgJde0uNemyHJyVJIw0gJJL6DX1i0DJtP4F+VmJl/qTE9EMynntFt3z/JFMu9PK+Cszc/q3PS2NJ5E9rXE4FwIeAbll33uiaxDRtwifnP01H3XH2Eq8Zx7BmOdvQwvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742022439; c=relaxed/simple;
	bh=l44nqQH8YBJzGUStut/yFw78rWnhW3ZRfip+/2J7eVE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ka+zcOSMOeJXfCbJs9rDFkD9ldmXcOeoegrBeaFUuVk0P4YD5nGtoBL0VpmeT8JYkjqayaWAb2HGDQzH/t08OUZIqhDNaaSlgxhLGjOwr8YLYA/wn//D3XrSFartdx5Ibm9lHjXGdp5/0JcTmawyHJfSQnT4voFe+a0rgjBvuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BKQgro62; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so21490056d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742022435; x=1742627235; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjVzOUnttHUcBAW3CLxbvzOw9L6lvEcZu1MM1KPevq8=;
        b=BKQgro62y1rXOf6gM9cqTGvPnQtoy8y1CmVSDu+BYwapQTsLAdj6oKyg7ZyfQsgp4u
         pwGcMtnaw4t3Tq25D7Ylypt4ZnOzFni9w/lszVC0jWXnGigN0YR5QgHr/JS8EEm3z1Cc
         2ki0r1/FSMxMeJzQLGBy6RbeCs2TOZl9huqD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742022435; x=1742627235;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjVzOUnttHUcBAW3CLxbvzOw9L6lvEcZu1MM1KPevq8=;
        b=YUGYvRSsEH2T8eQeDbLhdon9o+gBjBssiixsD9dVjCAgcoktGr3hIxAmpnl3UlHvli
         ZrqhnujxLRs7ThB5xj9xpvHWBp4F4/39lMtF1l5zIIon4Bwik26yGX5jLCi69kB71reD
         uTc4Y/Nhf4ruEmoj0FuyriVAIk73DWGRHN6eerHYHitIeLYWdYTZW77vyaiNxDTYTVvN
         BSfBEuf+IIp7GkcQ2c20LHMjCc+7PTpe9BUsvFY9DnVQXDUsKqPKP8q5BGz781RsT455
         1SQejCLwzR0/ppzikeu1ExJPOM45JVfeT88fMr8ZZZKlUlNXA3gHdjq394ZNUlBBvTih
         UrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFhP9+inGDdf+rQaweJSbttxXj+GARR+APmUFSL020x3+xK9rPS4vFMkKxbWV5cKhm34ndZS7hFCNqCX5m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqad2UaZu+5YlX5p9I3F6OYLg60u8KFWE1PN7CredY5/HbUjUX
	4VFzEd0gcVxNd6gPeQf6usYf9fWtyaRlcF2fpURdCHFqJr78fGESGe+fHAzJg5nvh3dyFe6AH/+
	XBLmIQKq0oKe3NXmnje0OfgfRovRpAJj5KmbU
X-Gm-Gg: ASbGncuIM0R5N6debNPVmf8Y/Ip3iyjX+a/uj4ETH3Ili4XHdqBWRgYsR5Ho2JZNjEX
	bkNZlVWVnrmdJCGXUSjzdbNZaAe37n/2jKaCQ7WOLyKofEaNazdDAvbXJMQSiyj0+GSxOcUNPex
	yetzuz5qM48bXhF8uA3VUlvWv3W4b7FJQCj/6lTuktY2je274uUFVDpQ==
X-Google-Smtp-Source: AGHT+IFazD/VhnOW7WkEdkQSLdsRPgxP9gTso6PzXQXfv060q0Fz/c9DNts5WDCHx2SEB6flNxzx/kWuR5dL2XtIhIs=
X-Received: by 2002:a05:6214:5192:b0:6d8:af66:6344 with SMTP id
 6a1803df08f44-6eaea9f485emr88982206d6.2.1742022434934; Sat, 15 Mar 2025
 00:07:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Mar 2025 00:07:14 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Mar 2025 00:07:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Sat, 15 Mar 2025 00:07:14 -0700
X-Gm-Features: AQ5f1JpCKT0sF_JUksZ7UaMO469RCUq8lI0lzOKZ3AiDfi8fFBP8n4rTUCTg8A8
Message-ID: <CAE-0n50siGEgY+NQvqBdjqg-7FaqzOUR7L9u24UiUhux1uMZcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
To: Linus Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephan Gerhold (2025-03-12 06:19:27)
> When submitting the TLMM test driver, Bjorn reported that some of the test
> cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
> GPIOs that are handled directly in pinctrl-msm). Basically, lingering
> latched interrupt state is still being delivered at IRQ request time, e.g.:
>
>   ok 1 tlmm_test_silent_rising
>   tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178

I wish it was called pinctrl-msm-test.c but oh well!

>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 2 tlmm_test_silent_falling
>   tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 3 tlmm_test_silent_low
>   ok 4 tlmm_test_silent_high
>
> Whether to report interrupts that came in while the IRQ was unclaimed
> doesn't seem to be well-defined in the Linux IRQ API. However, looking
> closer at these specific cases, we're actually reporting events that do not
> match the interrupt type requested by the driver:
>
>  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
>     configured for IRQF_TRIGGER_RISING.
>
>  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
>         to high state. The rising interrupt gets latched.

Is the interrupt unmasked here while the test is driving the GPIO line
high and the interrupt trigger is IRQF_TRIGGER_RISING? If so, this is
correct behavior.

Why wouldn't the trigger be set to IRQF_TRIGGER_FALLING, then the GPIO
driven high, and then the GPIO driven low for the test to confirm
falling edges work?

Have you seen the big comment in msm_gpio_irq_mask() and how it says we
want to latch edge interrupts even when the interrupt is masked?

>     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
>         interrupt isn't cleared.
>     (c) The IRQ handler is called for the latched interrupt, but there
>         wasn't any falling edge.
>
>  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
>         result in a phantom interrupt that gets latched.
>     (c) The IRQ handler is called for the latched interrupt, but the GPIO
>         isn't in low state.

Is the test causing phantom behavior by writing to the interrupt
hardware?

>
>  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
>     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
>         was cleared when masking the level-triggered interrupt.
>
> Fix this by clearing the interrupt state whenever making any changes to the
> interrupt configuration. This includes previously disabled interrupts, but
> also any changes to interrupt polarity or detection type.

How do we avoid the case where an interrupt happens to come in while the
polarity is being changed? Won't we ignore such an interrupt now? If
these are edge interrupts that's quite bad because we may never see the
interrupt again.

I think we erred on the side of caution here and let extra edge
interrupts through because a rising or falling edge usually means the
interrupt handler just wants to run when there's some event and it will
do the work to find out if it was spurious or not. It's been years
though so I may have forgotten how this hardware works. It just makes me
very nervous that we're going to miss edges now that we always clear the
interrupt.

