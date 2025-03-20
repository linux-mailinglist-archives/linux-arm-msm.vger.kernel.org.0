Return-Path: <linux-arm-msm+bounces-52127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A226CA6B0A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 23:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC2D67B0FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 22:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8D922A4E5;
	Thu, 20 Mar 2025 22:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hR0yA7Jw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D3229B2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509249; cv=none; b=kAEioyzs60Gjt2axVAeQvd1da73I0+ENuFDiule7i85pNT10xegPqevKiGl2ucee/yjWmyyvmtYrER48V/HmZdwfpZEpb8F0MwdHB7WH+A60OPCIoUK1nZ3NYOg56xtncdvErgAQcLVQlR5GWSs+PXTDUfcColmWrApx8HCx43A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509249; c=relaxed/simple;
	bh=+2qG8+3DECwZv3aAOMzlkgKolqnp6+4JTj8Ia17yVMM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzXVo7FVHNNF5dq4LFNc6kzo8AhkdH3MM1iWKl60QzxOsJj0cyLGawFODPdfB/HAsxsRpHzzVNzBirPfrFGXG7z1eEJJ/VqYHX6GzDNbKgIrGlu5L+X3WrHQ+zDd2KQ3lePmELjUHqxvvrHGv7z+JWoRpq/cyJOVFB3vKqPMvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hR0yA7Jw; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f05acc13so14484976d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742509246; x=1743114046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Az0r/TWDgp850iHhb9eHID4HVESO6vqcKLNQrrl8rcc=;
        b=hR0yA7Jwn/LFN4q7yoiORDOCOGF+mPWooJK7cg0ZelMSOyH1O+wuwsdLXIWObGCKlt
         C3ij26aNaHGliMSpx39I6MCa3e5AgOMzQX0lAXtMiSkQqJLqJRPmIfrraEL4ftaAHzgF
         wCEw0VgmkAZMCi223WJKImVTNv4FmLBY0gNYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509246; x=1743114046;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az0r/TWDgp850iHhb9eHID4HVESO6vqcKLNQrrl8rcc=;
        b=as0IgNMZ3U9FvkvC2dehYaw4OQ4g9ugFeetb8htw4SPHqJRLPDQxEuf9aEoArOrP2Z
         uQ2uwmzvpS8EOVItBa9EDsvQtUNdWWDVemkyBpDtFV6YzmQEqYd6pzEpJrbsxrjMGrdp
         1imU3OWv3gD9/zmSDi7UwhieOEwDP0uSasbOE5EznB54STxEhRoumt77x1dzL6XPV5fM
         ZKeV3sY4Gjd6RH1MK4jNfrlsQO5bonhRdK4ZGb4KoStqOVsMWye6we0cNMcVuJZTA7Xy
         ZUz1ObngNNoDbvAyVwSpO/xTN3fKJ1EXyF5JMAf2o0gZ2bOxNStGXXmzIxGbubPf1Iwf
         p6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXnaVuxiurgpaamOR8FjUy03+rDTap1856a22BchURlCf20eJfSDVqTteUN4xd2GLMLa1Ol5ZCzbJkpDy/8@vger.kernel.org
X-Gm-Message-State: AOJu0YyIAioQ2AyXU89baF+758wNNv5Mjr4xGVG43R+ukWmN31HW0xwq
	+AFi4gj4lE+dCB4lxh35Avuz5szqfA6t9ZNaPWtQazy2d9xy9czLe1u6i/OnJ5dal4cp42FQvjL
	v+8Hb4MR6VLeksii2MB990Uu9r4sYgYKs/phjNg4M010NrJ8=
X-Gm-Gg: ASbGncstt7+CtJ7p31tUmW04CLKAS9GUsrTuA0ePrkYQ3jWmOI+02kfkLIQBbQ4JNnL
	nYxx3PChrus28/JXr2sruH8gp/EaeuuEi4sU+oZIam7mA3Zho7YZIn8YAYZrT0WK8u+6AnH8Uil
	ukmLPt1H0aMiNU1iWnEyNrutM3v3+vWVCpwsMqv8EbqxPnwu+rvAcGsg==
X-Google-Smtp-Source: AGHT+IFPqQhanvZUvGP0TzFL/eR5WoiUrUoN+q34bzdllgTplWUh5VMehzNTX2VYoMxRc5JUWn6sBTz6PVMB3FxU2po=
X-Received: by 2002:a05:6214:2a87:b0:6eb:28e4:8519 with SMTP id
 6a1803df08f44-6eb3f2e9925mr16199696d6.21.1742509246356; Thu, 20 Mar 2025
 15:20:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Mar 2025 17:20:45 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Mar 2025 17:20:45 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <eu4zyuikust6o6ybmk4f6mxbygxa3rxijylfmskxe3q7kv7d3v@bf56p3esuvqc>
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
 <CAE-0n50siGEgY+NQvqBdjqg-7FaqzOUR7L9u24UiUhux1uMZcw@mail.gmail.com> <eu4zyuikust6o6ybmk4f6mxbygxa3rxijylfmskxe3q7kv7d3v@bf56p3esuvqc>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Thu, 20 Mar 2025 17:20:45 -0500
X-Gm-Features: AQ5f1JrIyWLHcKzBqnY8aufiDIsXgNc5mt__zW6a8a9K4H11a4VtcQKPhPTSVDA
Message-ID: <CAE-0n51R3B4HfD9dFqu4k5z6iD5dp_RGHMC5GBwqrEmx_E2fBg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, Maulik Shah <quic_mkshah@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Bjorn Andersson (2025-03-16 19:49:01)
> On Sat, Mar 15, 2025 at 12:07:14AM -0700, Stephen Boyd wrote:
> > Quoting Stephan Gerhold (2025-03-12 06:19:27)
> > >
> > > Whether to report interrupts that came in while the IRQ was unclaimed
> > > doesn't seem to be well-defined in the Linux IRQ API. However, looking
> > > closer at these specific cases, we're actually reporting events that do not
> > > match the interrupt type requested by the driver:
> > >
> > >  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
> > >     configured for IRQF_TRIGGER_RISING.
> > >
> > >  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
> > >         to high state. The rising interrupt gets latched.
> >
> > Is the interrupt unmasked here while the test is driving the GPIO line
> > high and the interrupt trigger is IRQF_TRIGGER_RISING? If so, this is
> > correct behavior.
> >
> > Why wouldn't the trigger be set to IRQF_TRIGGER_FALLING, then the GPIO
> > driven high, and then the GPIO driven low for the test to confirm
> > falling edges work?
> >
>
> So you're saying that the interrupt consumer needs to take into
> consideration any previous interrupt handler being setup for this GPIO?

No.

>
> Test #1 request the interrupt as rising then releases the interrupt,
> then before initiating test #2 the GPIO line is driven high, the
> interrupt is requested FALLING and the test is that we don't get any
> interrupts.

Ok. In this case maybe we should mask the irq in struct
irq_chip::irq_shutdown() and clear out any interrupt that comes in
because we touched the TLMM hardware. I don't see why we want to
continue to monitor the GPIO when the interrupt handler is removed.

>
> > Have you seen the big comment in msm_gpio_irq_mask() and how it says we
> > want to latch edge interrupts even when the interrupt is masked?
> >
>
> So if the bootloader (or hardware default?) configures an interrupt for
> e.g. RISING, and sometime during boot there's a rising edge, then a
> client driver should expect to get a spurious interrupt?

No? If there isn't an interrupt handler registered we shouldn't be
latching the interrupt.

>
> > >     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
> > >         interrupt isn't cleared.
> > >     (c) The IRQ handler is called for the latched interrupt, but there
> > >         wasn't any falling edge.
> > >
> > >  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
> > >     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
> > >         result in a phantom interrupt that gets latched.
> > >     (c) The IRQ handler is called for the latched interrupt, but the GPIO
> > >         isn't in low state.
> >
> > Is the test causing phantom behavior by writing to the interrupt
> > hardware?
> >
> > >
> > >  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
> > >     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
> > >         was cleared when masking the level-triggered interrupt.
> > >
> > > Fix this by clearing the interrupt state whenever making any changes to the
> > > interrupt configuration. This includes previously disabled interrupts, but
> > > also any changes to interrupt polarity or detection type.
> >
> > How do we avoid the case where an interrupt happens to come in while the
> > polarity is being changed? Won't we ignore such an interrupt now? If
> > these are edge interrupts that's quite bad because we may never see the
> > interrupt again.
> >
>
> Are you referring to the "both edge"-detection dance we're doing in the
> driver?

No I'm thinking of gpio-keys driver where it changes the irq type during
suspend to get the wakeup event. I worry that the gpio-keys driver is
going to miss the edge now that there's a possibility the interrupt is
going to be ignored and we'll never wakeup. But maybe that isn't a
problem because PDC behavior works per your tests?

>
> > I think we erred on the side of caution here and let extra edge
> > interrupts through because a rising or falling edge usually means the
> > interrupt handler just wants to run when there's some event and it will
> > do the work to find out if it was spurious or not. It's been years
> > though so I may have forgotten how this hardware works. It just makes me
> > very nervous that we're going to miss edges now that we always clear the
> > interrupt.
>
> I'm not saying that you're wrong, or that your concerns are unwarranted.
> I wrote some simple tests to validate the behavior I expected to see. I
> didn't expect to see different results between wakeup (PDC) GPIOs and
> non-wakeup GPIOs, and now both passes the test case as written.
>

I suspect PDC based GPIOs are working better because PDC sits in between
the GIC and the TLMM hardware and we actually mask the interrupts in PDC
properly instead of letting the summary line toggle all the time. Thanks
for writing hardware tests in KUnit, it's nice.

