Return-Path: <linux-arm-msm+bounces-83474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EBEC8A7CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D8573A45C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776823074A9;
	Wed, 26 Nov 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jbR3R6jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADA306D36
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168867; cv=none; b=cLeulOOrkG9AXIpOkNgiB5gtAMku6+b/7VJxWGbeV4VSzk8JxL+KWjHUBWj5zfeuCmLnmfbLAzhy8aonu17uBfReg0osoYqw2bSVzpx6peYcckx1A6lp9b/AijGjOCoOePkKe5Yil45a1K6p+bhk5a568MWnEbqJp1zbPN22XCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168867; c=relaxed/simple;
	bh=DdV9Yu8NQHIrfD8RDTh6OfEIRJdbNP8zoppqOX1o3Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3ZfqhQoclK8eJeLiquLmYwNcub27J1evdtpFT3FZPrWFEbHoSfmHod3PwjiFXTbPTpVn3unqFf+tCHqwl9woah7WPLVWLvmFWPE1Zqs/Q5vRZMc0KRUomHNQMYt7DmNk645NmZFFLK9jFS1xckkU41c2cpdA1Qy9a2jr+ug6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jbR3R6jp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959187c5a9so5507848e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764168864; x=1764773664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5e6BAzVHQo/JQ0cSQqz1ZzKrk4PTlqrgNjLAIGVOFo=;
        b=jbR3R6jp3xKMSEDDuVExpDcRlEKSFpYWEYoxlleN0imMFIWHwN1iNO5Bp7IvGir7uY
         GCfGJSUibDN6BzDseqbDW2Qh4pop5O8RitmW3BC9w4TKmhPLeJ+sh5CflUuJ1SlZCJNK
         7mwLE2r3Gaz2FRNYtfqz0WhidyayROO2EagtCY+rfnHLO37Dk2WRvnydsBCO29i+3H0X
         bT5PSziNgvqQEuX2lEqeVswT0/TffjMJjmAz0WTvqfxKdSpb233ogSNxV4fF9WHtwRGr
         XuZvS9Bsm594DXtk+dGIXyg+2ft4sELAVO6ML6sMyokBigOKyLVu3s+L9erWl4KYUJmG
         COVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168864; x=1764773664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j5e6BAzVHQo/JQ0cSQqz1ZzKrk4PTlqrgNjLAIGVOFo=;
        b=M7SVTcvZt2AZnSFUsLwJcANvPfpG98GMrwGXyYIH5u8Vo3tt7aKbuHg+ezQtc1YPj8
         RkgX8UaCVJtSd3c2Q+fNsvbT0IrOQ0478ZzSqLBsjxAMDxXFdd7+8+1yVXtcad7FrJcA
         Wy4dWDpJVio3OqaJPxXE3WoIgt+iYqPz7C94grTMeo5675I4UWVNnJTupBh4LxZM1PE7
         aw+m1S3MiidR6sKrCOEhQ8YiYa/JyhUS7ymIyXjhprEG2QX5g7XL9Qe9pB0SItpllvff
         DcL+tHMhgw/UgvWbR9GCf09fmB6aG4CskDhS/YtpKbURs32f5u1GYyd3Gyel5n1diKr1
         x2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXfhZw8SIj5zliQxmq+EkCAiq/V/adxfUw23u4vtaXG3GOrsLaqc9HzMIHW/dfcVvfKCcN1vZjvfD8B/ckv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WQRRt9OqEUhnett4mM1egyk2UwnJ8y98UEPJFjOEe8No8mBx
	v1MDX/Jd9RWMs/2XvSTiTomya5jH2lMFv4PQjBz0Ot2HAQQxUuNJUrvRbOaCG7of/39PuJdXYzq
	23MvabVhszCinfQpuAnCxQqabncVtO1S29QBZnk1Uvg==
X-Gm-Gg: ASbGncuNcVx+ZD4Zw7VLrVe34xPwgIoOqunJvRxSOi7KV/9Lpkb5W0PFfoksr8p2ADj
	jvPYp24Ze3NMk6o14p3DQ7eJyML5ds2hRK3cG52KApWGVXpAdK5rQZ8UJ7ZDARh6FCcFDiJgS7Z
	KRwId/otcxEbCTbLLws4WOLLDEjynx4Tt0inQtPoBbNiP2V9QDPY/jX0kMXe54HrLXcCdt2SbtC
	o66TQwrtnbkmvQUb5WftTV5jf99fNgyeuBogTYoRSBId3uzY7gHo6VTzteMKjZWhOCP4LAVBLMj
	n1vjA87A7o8+wF0ngcaKe6zAwWm+vL+8wnGkTw==
X-Google-Smtp-Source: AGHT+IEuBoP7FLJ7RKfybPU4wnzQPfOfSBPELfecZJf498k1Kqq4aLbclQ82Xa0VbYulJKemI9mt9GiaCUGy6s0Qdlc=
X-Received: by 2002:a05:6512:3188:b0:595:9d90:5dc6 with SMTP id
 2adb3069b0e04-596a3ecd4d0mr7181931e87.19.1764168863690; Wed, 26 Nov 2025
 06:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com> <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
In-Reply-To: <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:54:12 +0100
X-Gm-Features: AWmQ_bntaAt919-HW3rKjIZ6zdRdh3lB3VLls8nYAX3XHQRBb1qUUSQSnMgYz4w
Message-ID: <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
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
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 3:51=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 26/11/2025 14:28, Bartosz Golaszewski wrote:
> > On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >> Hi Bartosz,
> >>
> >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Some qualcomm platforms use shared GPIOs. Enable support for them by
> >>> selecting the Kconfig switch provided by GPIOLIB.
> >>>
> >>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    arch/arm64/Kconfig.platforms | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
> >>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
> >>> --- a/arch/arm64/Kconfig.platforms
> >>> +++ b/arch/arm64/Kconfig.platforms
> >>> @@ -316,6 +316,7 @@ config ARCH_QCOM
> >>>        select GPIOLIB
> >>>        select PINCTRL
> >>>        select HAVE_PWRCTRL if PCI
> >>> +     select HAVE_SHARED_GPIOS
> >>>        help
> >>>          This enables support for the ARMv8 based Qualcomm chipsets.
> >>>
> >>
> >> I have noticed the following kernel warning on our Tegra platforms ...
> >>
> >>    ERR KERN OF: /__symbols__: could not find phandle 794981747
> >>
> >> Bisect is pointing to this commit and reverting this does prevent it. =
I
> >> am not sure if anyone else has seen this?
> >>
> >
> > I assume it comes from drivers/of/base.c:1295 - could you please post
> > a stack trace of how you're getting there?
>
> Yes looks like it does and I see ...
>
> [    0.123356] OF: /__symbols__: could not find phandle 794981747
> [    0.123401] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc=
7-next-20251126-00002-g1cd98992c487-dirty #19 PREEMPT
> [    0.123418] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [    0.123447] Call trace:
> [    0.123453]  show_stack+0x18/0x24 (C)
> [    0.123472]  dump_stack_lvl+0x74/0x8c
> [    0.123487]  dump_stack+0x18/0x24
> [    0.123518]  of_phandle_iterator_next+0x18c/0x1c4
> [    0.123536]  of_count_phandle_with_args+0xa0/0xc8
> [    0.123551]  gpio_shared_of_traverse+0xb8/0x47c
> [    0.123566]  gpio_shared_of_traverse+0x158/0x47c
> [    0.123578]  gpio_shared_init+0x110/0x1f0
> [    0.123595]  do_one_initcall+0x7c/0x1c0
> [    0.123607]  kernel_init_freeable+0x204/0x2e0
> [    0.123622]  kernel_init+0x20/0x1d8
> [    0.123637]  ret_from_fork+0x10/0x20
>

Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
Kconfig and post the entire kernel log on pastebin?

Bartosz

