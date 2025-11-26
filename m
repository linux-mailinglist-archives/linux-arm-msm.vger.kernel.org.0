Return-Path: <linux-arm-msm+bounces-83466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F9C8A547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2043A8971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522653019B5;
	Wed, 26 Nov 2025 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u4XnVqsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF11301015
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167309; cv=none; b=kkaKnlSeXbj/+b4+vabwWAY8BV5BMemw4PdhtJn7/Y2u9TeiruBQCulU/cUuWBQC36W4EeOFSGIMayDeV1HCvqvr/pQxByu7jQEvWLoOhvFF0adgFgLjJoSNEL/usebKN5czqx5Rsur4507o+TFcOUaYEm6RgzNVcxHtodwbC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167309; c=relaxed/simple;
	bh=RN30k8HzM73JgGT4+Hmg4UWVBm1+ESD5dIcHIzaZOQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK5xC4gzA3tfslkKfhZHKjC2eLLjvrG1lTgwS68JNqL4nS2PLmA9+qQqPUbTlP49tMHGirF4bGCkZ3kAmy9QiARUs+yRxP1xRxYet+HRo/rukVMu9uVWJ72unF8Egw2xaz+xmRTfI7k1n4kefsVji2sBrwNwU2D8ALQ4ITlVv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u4XnVqsX; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5958187fa55so5296952e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167304; x=1764772104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=u4XnVqsXhUgUuNrM6sCQ/+wFu2/nLoEhJvb5gjhzLyztc53eSubWAHkn7kLXRzXSek
         +h7bhQGh0Ntfbh9nlKeOHQgoIINugaAugdrMT/wbPqZ7j9+ceAIJiMC2DW7zaneqVqlQ
         VetOL0H209f6ODEJuIRs5kMhbDHwPstVHb8t1NnDl0T9K5wGVMP2JbvdtEQD6Ngahk0a
         zDZs0+i2P96RPzguhIDn9Vn0zfz8R0Oqk2I+PC2sEX8Qz09FY8Zff0ZYj4cVUCFphKl+
         1VyaWSkTh+kuhtykMvWQJtCrBaZDiY61Fr/GB2VfCRa4vLAHDxJPtz64p9m25dgVuIIN
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167304; x=1764772104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=gys9wY1DWLceJ1HuaCsBT78MTG4EHWuWVKYy8XybBAUEFxtoYukSbBaL3xToZ2jlY6
         YYYvBcDgD02+Tj3VkXjGjrWar7jImkqR8XGzRehYiP4wr6vwH721VyuT52cSvudvm515
         +5uu2knMC/zm/BUu1uvVlMXpvwmhRvVICowhHS2JARCfJ7gEo7kAK5DMLHwhTH6hxXvp
         rffYx2rkGXu1U9JmkvkIcHRvJzzymKfgObzwYjE7R3eCsCiypgiQ7LhVnDq1ip/OGfQA
         o/qrJpwhA6UAFCv6vbmy9ndBT8hugIHh8wQLY7c4nUyy26kGvjzSY6q5ICHzDeTjjk6u
         vDfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmxu98ykolaPvjIYm4FNpmmTrZP8mdGSVgsA871g0NMri55WB3un8AbxgFew7FPTaktidlUIIsDt89AANm@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDWxqCHnacIO5zFgYvDxxRLFca6DC5e7CVFHwzOlsjdrYbf98
	Lu44MZbO1ZW4uK7/OXvZ7ea7tQWiyav1YUBvWnbtJY60RxO+bOvtqepQ6OS/kHIzUVaAUo3YAy1
	hBQJ79WFOBChrp3SFSVzmpDZxrIjY4Lvig30eyrPYkw==
X-Gm-Gg: ASbGnctLAfPKpIA4SahokRW9lGOHlANvonXf4QlfLxkMoOiGOFYxASQr1uV0y3I5WT5
	+Ek62M95eQ6BCJqyIKsvyWvh/+Xv/+ku+We58cA18kzvA4nv62QEgu7hEvLlB7DQacDmTjo4R9N
	K4h7ZUw5NHYK0dHiD5DYlc4g8fxE+xKmhr3H/6vxsnteerS3R8M5SAWd6JEkGNy+T0rPv16iRQt
	UDDpadacaZ5WxScSgyy17vBikBAJTelmMqwuf+9DhN5RzrwOd+RN5C2+ZGQs2kVOW3tAHxJWpul
	bMKCALaXzNyvbEaCMhbDZpbBGMc=
X-Google-Smtp-Source: AGHT+IHk3ZX4aUUBolMwiCMXAcXiwyT2Dyate9UnnaEtVgZgfmV77bNvl6bV8cACmOgABB87QFqEt5N/Ut+6mcoRVj0=
X-Received: by 2002:a05:6512:12c4:b0:595:7d95:eacd with SMTP id
 2adb3069b0e04-596b4e4b76dmr2588737e87.8.1764167304291; Wed, 26 Nov 2025
 06:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
In-Reply-To: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:28:12 +0100
X-Gm-Features: AWmQ_bk2gQa2v3AxwtOwsX10QuQjgn1DPsSzq3G8PlY09kgQ-V2J9JlUGzmza-k
Message-ID: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Bartosz,
>
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
>
> I have noticed the following kernel warning on our Tegra platforms ...
>
>   ERR KERN OF: /__symbols__: could not find phandle 794981747
>
> Bisect is pointing to this commit and reverting this does prevent it. I
> am not sure if anyone else has seen this?
>

I assume it comes from drivers/of/base.c:1295 - could you please post
a stack trace of how you're getting there?

Bart

