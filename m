Return-Path: <linux-arm-msm+bounces-22999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8F90CA22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9EC1C222E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F88F19F47B;
	Tue, 18 Jun 2024 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUnd+W1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC66E19F469
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709160; cv=none; b=gGTTQh945yQpTtnm0xbBYHDcACMXMwBHPlVedPWyvgPimlU6o9surP3FwI++ZchRMh2uT7C+5nzIa/Ykamo9I3yVRwbOvNyaYktTWf2O1WbNmgXix+IGkbxYbfLC/jRe44c000y8AgyTJH7NICXdG3hE+ze+ukxO66CrrXpnBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709160; c=relaxed/simple;
	bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B18YgHvIsWh0XZ5VWByC6tELQWElJQ1gnUBiXKuVSGYrl+CYl6DLcUPJNGiuJ7lRBAk/WsaLkHwFl5yJ9FyLSPfVztoKuu8QAQqsj+xs9eHYBH2ww5Wp7QTEOYvm6DQplqNctmoNKid/WWkJ3zA92xrY8bdZm7NXaYs9HFnonrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VUnd+W1U; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so5608975e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709157; x=1719313957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=VUnd+W1UO8dwI++rRJjC9xkLMye0Q0APYfv8wJocutnV98ASXKsE+os+RYgZnr3hWA
         aU83XdiVm1aVzbH4ycE7zZBcBDGxa4LAutLPtLVqrfDod+A+pnLWCCEazb5IxWGd309L
         ubTrPyWwdUL9XrveurDSq81DaVSwhwQufQnZTb1xzpnHVSxrLujgHeyByxs6RQuFKiN8
         Y+caXzBQIoO0Z0w9fXXy3e/mzi5sz0DjgwBtnZlBuDV152DN6KvG1ilNYLwrO6QFDnlH
         us/SORoz2NoEXKmvrWXa/CBygHmCH3UmkNSa2R3Rn6erqUkAXotZOdtqaepnTBXTtPqK
         +i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709157; x=1719313957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=ohCD1d3L6CJpTHqbDzDA8SxEKRcyYmhXU2w3FJsLxMhfwWZQtlG2TPrWUabzKqDvIO
         WjsLRwu06F6rXxqivDgUT2MKneg6DX+KSjullb7rAxPEmapDJj51DAaCO7p0JBXHb+ZB
         Hpdbeh2mQt/j1ssW9WPONXfQTqzmDkqzW/FjoD3lZqZAc3DB5nx3uZ5G52X2FQIItVBA
         ox04qnxuEdtGL0ZUZuVHqnVL7kQebzOjcFe9YaMbgFDXjIpjwMHIhKHDVfLxm8IIRD/J
         lT1hqzHCc74A0GFds7UPeVgl8huRynBgsBkyCxhz9PIi+/lYsX0tG3ZNw/MxzCOXjfO8
         jQtg==
X-Forwarded-Encrypted: i=1; AJvYcCWPup91saUa/f3/MosZyffnkRuljFVVto66kMf6AHD34ZPU4uIrjKQBkm6Ajags6pMmUqmm55e3iN1bv9ZZJEFaXV3RMZNr8Y8O1QZSkA==
X-Gm-Message-State: AOJu0Yz0nGXH/EFjNFjPFxOvaNxM9y3oGAqzeXd2YZhzEiJ0cDm99fzl
	5A5bWvuKSf6UmxW7wFFc/mkbUKdMDH/YPa8klW29kRK3ROfBB8N/aZD60IOBqJhQR0gGeWc8Imf
	lOSqPpQmzFeZpws1D4mMiIYEWSOtPENqyE1U9SA==
X-Google-Smtp-Source: AGHT+IFCeIOoRy25rTwUHZ/n6vBdkCPzCkJ8a//pB4Qa6c+3jDe2XeC/62v2ldwWc8Yh5JI+ho23V5WmsKqsRfZrbxc=
X-Received: by 2002:ac2:5307:0:b0:52c:998a:77ba with SMTP id
 2adb3069b0e04-52ca6e6e5f2mr6662065e87.36.1718709157060; Tue, 18 Jun 2024
 04:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-35-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:12:26 +0200
Message-ID: <CACRpkdYchu+muvbinPpUFvppMMQCFe9zTcApj46ip4PYUGUhVg@mail.gmail.com>
Subject: Re: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of regmap_clear_bits()
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

On Mon, Jun 17, 2024 at 3:51=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

