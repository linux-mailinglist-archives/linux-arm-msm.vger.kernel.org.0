Return-Path: <linux-arm-msm+bounces-38308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5B9D265D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0907B1F20FFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 13:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245A41CC8A9;
	Tue, 19 Nov 2024 13:06:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCE1CC170;
	Tue, 19 Nov 2024 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021562; cv=none; b=CRFwnlJV4Qxoj50kDbwmG2i+ibla8Idq7xyL4dOyK0AzFnAWKg2kNOIwE3BAd5IXg1o5ixqe80XiVYqrO6Mml1dL7BtSZuaEEALNvMyHh1dJYQtAZlC58nIq+UV5o9jtsaC2QfArWQ2zlwJ4g7MTmVdMVyw7RTIvO1oDfAB5ORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021562; c=relaxed/simple;
	bh=uSwSTdd7HCm/YcK1V1kqqpFIOnCFAFfr1gYiTS1xaBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAXIzXnrYNS5it5EY1DgqEAfI0fdSC1AokMjn+XOn831fKbwxwYXiVYR/5gsrHSZcS+GnsQgmcYGYsrXee0thNxr9IvwSuBNbYrCIm2kawmSoVLmKsCkPb8K8hkq7N3yDFyApxugYDGDFVZYNnOINjjNu+t7F8Lk8kV07FgGKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso26588971fa.0;
        Tue, 19 Nov 2024 05:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021556; x=1732626356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5SnbOSPJM2xbQk5uUW2SdrCV3aSiK5t/lke9tIy5ZM=;
        b=ANltHQ9SyyyoPO9Shp9Q1EokDBNyURE+V4UZtsFw2eiU9HVxxme8K49bkLpkzp8XQC
         uEEEyv1QbBWVuvX+lvuzDMbbam44l7QYyroSOgCX4i5yJ5QLAoDMl1ZaTKL0pZqOpsyI
         wuCjW8v8jXwRDXLknXcvNUqmGI6hRmW6DjKhaHnDJkQzc15udZHil5mNiyWq3jHHid5z
         boPAjHt/FD4pjF2m+fKKMSq2bLGPJ1T1DBraK/Sihi8JiiYA09Ljqz6Wn5pmr3RoeCrK
         bokErh05RVUR3GZMsFXLL9BgjwkBYpirmkpE3Oi3pG8SmrqkrnYWVrJI40sXGPF21o57
         e3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXHToErbBPLCWjVZ/L60h3BVeWXltRf07hQ88I8IerA3CT5i8geaCNeUxB9ZFAONop1EYaZUy2UUkCgLc=@vger.kernel.org, AJvYcCVbC8/qy1v/2NU5UX0i6QuMNyvf+lrvuCwxJTYkB+H4M2b1vAzYdpUQKT6JsOHEBCY2nX3HRmqXk57muiVa@vger.kernel.org, AJvYcCWhMAfS9rKR+6+luNEmmLLcXy/1idQPNX1zxnJirHRcP69E6MiL8XssYULcde101C5JO72ngTVRFuKw+5Z/@vger.kernel.org
X-Gm-Message-State: AOJu0YxMh88PMuUX5mfcLzig8k7PKnVUkJ9uxtBsQxBUI/Zm+vFeWJvg
	0M7RMJhHsqJpJ1pP3l9igEjzALqO7sHM6mUv/LFfq1NylTcuxgWdumT9wDUA
X-Google-Smtp-Source: AGHT+IH0XQk6P8B3PQQ4Ty/GuFjhNpI/I+DvC2i0waLOUq6CTQp+JV16DN7VZh7i0a4m1vo52JvVFA==
X-Received: by 2002:a2e:a903:0:b0:2fb:3bef:6233 with SMTP id 38308e7fff4ca-2ff6070e042mr83271141fa.33.1732021555447;
        Tue, 19 Nov 2024 05:05:55 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff698515d0sm12383251fa.19.2024.11.19.05.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 05:05:54 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3110b964so25253001fa.1;
        Tue, 19 Nov 2024 05:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvoVgTx5CQ4BCnVJMrMqV3tV8v7XTKjibdUeUrFh1fgW+hh95N50sWTPSEwFG29BUBidcjAR9GD6agye0=@vger.kernel.org, AJvYcCVWt24J8tmukF0ivTt1aB19yv/9xezcKdva1uLm67pbaMB+NgeAA5tNzzmPaoctvWn1GcQB/lnqHTHtHVVD@vger.kernel.org, AJvYcCWxUDJz3oD7aEO0tucnp5nPx9dBGH2nlM+MrSepAHCnIeGsGGxYLvP4N35XIuZ9F49ySpwAdeiBq/InEvjO@vger.kernel.org
X-Received: by 2002:a05:651c:1582:b0:2f7:4cf1:d6b1 with SMTP id
 38308e7fff4ca-2ff606226a5mr76184521fa.1.1732021553921; Tue, 19 Nov 2024
 05:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 19 Nov 2024 22:05:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/mailbox to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> Make a few indentions consistent while touching these struct
> initializers.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> I did a single patch for all of drivers/mailbox. While I usually prefer
> to do one logical change per patch, this seems to be overengineering
> here as the individual changes are really trivial and shouldn't be much
> in the way for stable backports. But I'll happily split the patch if you
> prefer it split.
>
> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.
>
> Best regards
> Uwe
>
>  drivers/mailbox/bcm-flexrm-mailbox.c    | 2 +-
>  drivers/mailbox/bcm-pdc-mailbox.c       | 2 +-
>  drivers/mailbox/imx-mailbox.c           | 2 +-
>  drivers/mailbox/mailbox-test.c          | 4 ++--
>  drivers/mailbox/mtk-cmdq-mailbox.c      | 2 +-
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  drivers/mailbox/qcom-ipcc.c             | 2 +-
>  drivers/mailbox/stm32-ipcc.c            | 2 +-


>  drivers/mailbox/sun6i-msgbox.c          | 4 ++--

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  drivers/mailbox/tegra-hsp.c             | 2 +-
>  drivers/mailbox/zynqmp-ipi-mailbox.c    | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
>

