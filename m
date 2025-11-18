Return-Path: <linux-arm-msm+bounces-82265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581FC690C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CD074EF96D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746421EB9FA;
	Tue, 18 Nov 2025 11:22:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D834F259
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464921; cv=none; b=faFC2OzVm8UpFf9JWvirsQFads0Z5VKhEToY/c8xbg4Nph6T7eXxu3Ci26JHtJ36g8lKitYjfXzcAgZ9tBVFBP3IPdxmz59Icc7BTnYie7KJ4eAGgXE7PP/u2bL2/3+nR6ucoIyusatCOFevM0ZBH8Km7CT1Zi03Hjv9noK95/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464921; c=relaxed/simple;
	bh=B1FsBCLZ1091fdu3CKfazhUK9tOtY4FVr3EaczDF5Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYOIg5GXjZ1+M2ywBsOmM1aRUIYJCLt8wkV6mgia8X0E5rFAMkBOtYuuP+sWcY3kpFfDzdAzx+XA2SbutHPp2e/b8VK3j9pR8VtQYjvYIq+y8Vx3hZWv5nR1YUVCXeLWWXFyKRhjoql6mZwYrRAc1f4EM8GXNsuZwCcXryl5Xeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-932e6d498b2so3267594241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464918; x=1764069718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=;
        b=kahdk8eQTbQUhYjcj7cmrI4AXE0jyX20gN4C/DV1oQJmky4KKoq3VOVZ0nC3/Foad+
         4GelFGYrPduA8FktiFyE4iWMLfdIFTON25ZGwOtMMJhXtgVhxvFzLygLpBrMZvAAO4YD
         Pgm/1awIN/VC89R3ehOizD/ppAh0YYLurpiFkqE+uFoUaI36wV2lXJPF7VafczimmTxP
         i1tYUqDO08vVMnsX9ugCR5Rc/ldmeCQBT7woSIKbR1OUWepw8+88yfOJ6dYKWT+eFKGX
         /ErIAB0qpG+JplQ96Cx7/4JjHWfVSMdcxx6X/nWEeoDmSqUyqp5zkQ7qVY0sdybzZDg7
         eiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4ruAxI/Hc9nLpgu3p+D7zzXJiEFOOo0TV97Rc7JZE9zt1x+j7PTlfpAti2B+s7+fHGSl4ypq8h3Cevri@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8iE7TG1o/nUD4h3Oq19sTnz8M27VxdPpNsPhLFCbEE3Ie36xi
	RSim4SqAwVSISmnowcpJMshRfQbO0OYddh9cYmMSfpMCvNw+oYfwr9Jfp5f73uBlFLE=
X-Gm-Gg: ASbGnct2vmJiPVECeBGTYijvq/tmgwB08nWSvhVrU6VyaLI6MJrL2+qoGTxjuI1/YqD
	c4yOZZdnIdSO4g4P0y4pf83x0ok6tbFuvWqqdJHagpeA4c2bRUZbuns+eMZQcD/nNOrCqK3a0uS
	mpc1FMfxVR2fmelEyceOOzwCA+a2KhF5qLEqCVzHrp8M7vJ2wa3IaPZvlJNOJDUrvtSZK21/nQ3
	2zY/dJUH702uhoNlNnTmjtMj+jGEcVwtRXn7G7Tyr/ycknJsSPy9UwCAI8h1PiaLl0vwYzfdbfx
	JbqGrx0T9Vdxodxz+UdhlyGIkh2Tcbmu+rFBdDkACLDDniwPzJTOW6oIPioHv8MQuYjZWLJuHZ8
	C73YsglQmD3JAOcmbB/WZJ4Ql+N7VUGZ9l1oIRV+M5yB8suFGVQm1TckeVzZPRVoBw6zbYllYub
	kg5PL1PtQoveSCmS47CgHZJawUwrupcUhXaLJgB3ZGSzT2vD4Q
X-Google-Smtp-Source: AGHT+IHP3i3m1CVvv7Ys2HdAQvr/4MoOdDLYAl/VZJBqrsgByRV9IQnDQ4okpQHCSBEf0biVzZ1Biw==
X-Received: by 2002:a05:6102:8019:b0:5dd:8991:d761 with SMTP id ada2fe7eead31-5dfc5504291mr5538610137.8.1763464918088;
        Tue, 18 Nov 2025 03:21:58 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b03sm5431173137.11.2025.11.18.03.21.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:21:57 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-932e6d498b2so3267587241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:21:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtcYD3Wg573OnSnhHQAVI0YfQvAltv0WjpJx8qw3XJq4cvwiwyBpTwLyoLWTn21XN1wopWOXW+wI7Ppla7@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:5dc:7fe3:1d0 with SMTP id
 ada2fe7eead31-5dfc5586babmr5642681137.19.1763464547898; Tue, 18 Nov 2025
 03:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 12:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnG1e_JZjF_t0LAgzvKf5wM6L4cWt2t2bx5VV8t6YS3prQ_Mx2gaFVEov0
Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

Thanks for your series, part of which is now present linux-next.
IIUIC, this requires the direction of the GPIO to be fixed?

We have a long-standing use-case on various Renesas R-Car Gen3 boards
(e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
key switches.  Basically, the GPIO is connected to:
  1. A key switch connecting to GND when closed, with pull-up.
  2. The gate of an N-channel MOSFET, turning on an LED when driven
     high.

Hence:
  - In output mode, the LED can be controlled freely,
  - In input mode, the LED is on, unless the key is pressed,
  - Hence the switch state can only be read when the LED is turned on.
If you have any idea how to handle this, feel free to reply ;-)

Thanks!

[1] https://www.renesas.com/en/document/sch/r-car-starterkit-schematic
    (needs a (free) account) Page 15 aka schematic 12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

