Return-Path: <linux-arm-msm+bounces-81215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87DC4D2F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA583AC33F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED1334FF6A;
	Tue, 11 Nov 2025 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZfXwY8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A6303A1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857873; cv=none; b=rpAMl95XXOvTvbla81YfyD8KXhLLxedOlKNPo4ZdjqTiVcqteoEMdcGUJm4opbDXbf2I77Nnl9TWYwstkdNzk2d4oEw6/HwH9EVCNl3MajjaVyWJ7Qui3RCL06C5Ur0LWbf2TvXHv/3H9ZVOpawWKBoN9ckkuzAwB8WVHKBZob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857873; c=relaxed/simple;
	bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGvshZXoR6ytN30jb4z+Cc36F1gE/CPuPDReOJxDTcOGwS03CdMsVyqFeBc1CdNt4/G1yaoxuKf+2ZbCzdympJCxEwVpxXlX1a4lh/2UKrbmighf91VSsvMbFTeeF2EDqUFZ9iPmUh0lTMRpSKSLqyVXUHitiaIOZwp8AXR6fWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZfXwY8j; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63e1e1bf882so3244935d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857870; x=1763462670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=kZfXwY8jA2RfIv/beanYlCuNRNHEDnYc6FC7/viUrwd3DhBhSMKXVNQ+LBx54BwxQb
         6bRRD7eO7duzXc/3Vk/cdQsVQ3Je9WCIBmTCXNLDXuCe58WxeNkjWVmYseOlz4Iyvcpy
         2CxO2Tdzj6VYV3p3Zo7KPqusjhQWgDJ7TK4NN8KORD4ZzyMagDHoqPnUWP12U7HEliik
         95BYqbIytmiLh93FTrSVi2AYEMFG76DXmIHRS15zq0lq1ySaJQoNNf7ti93YIdZMKyIZ
         jttvw8xqbhoNduIsu2RPnUnh5Z3ZGTRyXcb+M7uxQZZOpTvbE0H35OiLvsfmz46LUpl8
         yfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857870; x=1763462670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=sIfGiiycWCc0DmkhCLbM2TX5k8snIqAwWfKIz/CVlvZsDfsi7gWvVvFLrujLoNJLr+
         iMLqHRGrTi0Hr25QzBtMdMZ1aJJ2nIVKXpB04TxCp2ps33r5669MhKlpLpy+uBXVjXmT
         QF51Z0sRe272gHI7J12ZnsS0tLxPpyrLQZ0byL64kQ5lmWXkokh7mOOJFtaJ91vcj6f4
         EORhMXzkuot14Hwgd+4bbfcI1uU8e60a/T+wjVRszD0DKxO3h0kuMgYD1WvLxGwjlJl8
         U+e5l/1HkUAHeXhBjkpmn9y6N2g31VqyjKIuLulDftD0sT/z8ykRP7dG4RNG4IWN4E37
         8VIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0TgrRKDdQRTMJju02/rtFrzbPJFswqi4od6Tmu+6wXyMQ4VkZfJIK/YoA19chkFni9mvZmG5gAjLl66/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1FdXVOAgRA54XpIHxqoN127QZyHRUuEZj9Pq2w3VkR9dqYXmh
	tREsqOeAfBfg1dFYF6oTVNpjuaGupEexxlDSDJO/ir3mDa1tuxqSnLKS2ZjdRGM4c0pJmqS5LvA
	grLW/iF/YgNxLjI3x1g2sWc4ZxYa/J/4F3AZKSNdp9g==
X-Gm-Gg: ASbGncsZR0Zxg0LY2OwHZUjZe67pFNwhz7LNJdUioZQnEHbAWK5R9E8x/imRXiDrRFh
	42NkqSyNb2/W2BJ0kYmrBAagt03Rtc9TStgOCAK8f2XKv8pSIpNu0HSzSBHqN5xOJX5Mh6Cuow0
	kNKMGOFnEoKKkve+H6lATzoh403Apc78OMrrOZl3cOtLcegjmki31BapRKrevaJTBHpQtdvPpiA
	OQsNR6tVX4joaK3MeNmDI1qBv3pjaf5Qo1V6iP14ogqTft447sdUtXRMxsX
X-Google-Smtp-Source: AGHT+IGM3E/e9Scx4gWocd3epZsySeg+GiSnUa6Lqk3ZWYP/cx+DuGwZohc+rkcKQ1+QYm8c7Jg9lh/z3+tSIbO/Q/8=
X-Received: by 2002:a05:690c:a719:b0:781:32c:b359 with SMTP id
 00721157ae682-787d541c211mr161593377b3.36.1762857869718; Tue, 11 Nov 2025
 02:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:44:06 +0100
X-Gm-Features: AWmQ_bkCgjjs_tm6yJMft7dkXQVENEnuhOT2qvpn5ldswgUFUo9RrRQtDQDlZKU
Message-ID: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide an interface allowing consumers to check if a GPIO descriptor
> represents a GPIO that can potentially be shared by multiple consumers
> at the same time. This is exposed to allow subsystems that already
> work around the limitations of the current non-exclusive GPIO handling
> in some ways, to gradually convert to relying on the new shared GPIO
> feature of GPIOLIB.
>
> Extend the gpiolib-shared module to mark the GPIO shared proxy
> descriptors with a flag checked by the new interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

