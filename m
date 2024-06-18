Return-Path: <linux-arm-msm+bounces-22997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4079290CA1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CCE1C20B91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FCC19E814;
	Tue, 18 Jun 2024 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SH3OrT5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8305419E82D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709127; cv=none; b=psSEpw7XlJJJ663HQZItMHa3WEgDBtHQCHU7N7hLK28fju+TbwIrM6YCmO9Eev5RBe1KL+rk5+3ko+uvgJYpph9ONor/MJiH9sqAQznBChLXl26FM+UF0hp77jKM28/RvdQBKuGXHSw/hhOLv5u4OffcqwSUUFLlbGr+PnxV/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709127; c=relaxed/simple;
	bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm83o4Gidgc5XkpexC1u2oJ+/kD059SjmEdJVvlA2kK4wtJrwL/ZsRydJRjxDvBWL415aGdIwxf7UNCuaBUzJVP9laiNWUBIKhb8iVEvBOIGFOpberROw8FPdi8uUnke+za8LtGXRn6jMpoeFlTnqdQIeiTpRxkWmS6H7PPKAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SH3OrT5A; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so55369351fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709124; x=1719313924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=SH3OrT5AyoX5pmJjs+tEllltF3OiU43RJ6iDNFWx8zni9ArPd9yI19jNAdbfYvKO5C
         ylCjAvn7Z8D/AAu/bNYIBuGWOcAENTAGsELnLYXHyTvBgJJBeNWhUpyTLdGSvj9BY+pH
         oZAcAdFpaC2iL0x/DDC729ezkJPLUSqKq5KyBN1CVOdUfdhHsLKzqFv80nDENRmxMWtT
         2T1wkxV9bxi19Kyu5moH4cAvN9CXBMiczHVax8RoEnDB8o7KxRJs3IURKVIZL6OAgKDj
         I99u6+T1EBOOMgz3OP/XCByRt1v3kW070pXXLemauv06Va6tAPQC18wekfxTYOeW5FVi
         7rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709124; x=1719313924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=jiRQR3imWeAtYRj7QDdozr4XCEZXsiK0JITxLPQfBZNQP3UjOmBVHGKkpD+TTGq7qQ
         HCT9JS+pcmW8Ew2WTIvTK471azx/67w71AXMJtef0/twy7uUrz5uxqLxgz42ZQWIMUvG
         O15lm5KPIidFhqEyCt+bfQcIY3H0NoXkwCTaE2AJaKyfWD2STeUwDdaooaM+TAqn2u6b
         4GVrDQWXHhdUW01DrR0ClbBVRcCZ18iSyoGhibrVwhQ3it60ghaIsAOf7Sx6L1/wD2SE
         me1kaVmzH4zYJcMJHk0KFjDds7+i2DyaLsGS0czTLsmdBYn0Dwrd4B7LBIlV9rSoH9U1
         xgVw==
X-Forwarded-Encrypted: i=1; AJvYcCVcqUkuVk+9Cl6wUjNQ2LD3rcrw+Kj0DY5bGI1kEu5F/oqDtHfBGyEj5mXp4LirkOAQUu6GfU/6zUa8rN4JuCOO3rKQKNoWjsrPiUz5Mw==
X-Gm-Message-State: AOJu0Yw6Pykkzr7yH9Z1AABENYwsIIZG0Mvyot9EVzNV0udH9XROYAFU
	GAF9KLYt5aBX9BT2lVfhyoivJfUJ5fC6eD4cnfL/aGKvg+jVygCgWceYp8exHhgfq8QjolF/zZM
	N+rpP9FbjKxjEQD6orjN+C7zupeQPWhAPTquD9w==
X-Google-Smtp-Source: AGHT+IHXkf3ljqAhrm9EuvRTPL71FiQZJIgLs0Bh9F/FREvRGl6HEr1C7BhvQe/yk1MwI0e0CuEwwH242Rm+FHCeyyY=
X-Received: by 2002:a05:6512:45c:b0:52c:8289:e890 with SMTP id
 2adb3069b0e04-52ca6e55c92mr8109856e87.4.1718709123676; Tue, 18 Jun 2024
 04:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-33-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:11:52 +0200
Message-ID: <CACRpkdZjPrG4kUBxc+r7NzUt9UZSdiF7KWT6AWAd+vpuLSWk1w@mail.gmail.com>
Subject: Re: [PATCH v3 33/41] iio: magnetometer: ak8974: make use of regmap_set_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:50=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

