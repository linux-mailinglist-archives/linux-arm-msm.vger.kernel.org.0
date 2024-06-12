Return-Path: <linux-arm-msm+bounces-22388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D679F904E34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF39283288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2D716C875;
	Wed, 12 Jun 2024 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="RXtpudb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F03A16C871
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181261; cv=none; b=QFPVhL97jildiPPwZWYkdv1hGRJoI/09y4FcLLKSG8tynVqKRkpLZGHlEsM3Vd/0A+zrcW4+b1buciriYXbvcBDnCiDTeICJM9pIkwy4E8VlK7rSop71Y6kwG5PnN27F0QTVVlTUn4aTFkYgvWwQK8+C3rNM81K9NlHHeraOUh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181261; c=relaxed/simple;
	bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxdeKUl4RJsECKNTwqpZwYAFfC+mgVYfqB9cl4ND5kziDcLjkVa0hjntNaTlMxQbMUJecg/9psSuJHtlXc8wtT6TAny3rKAnaBew45MjmFEC0kBviIB18Gz/6xMfJgYgsa+XRqADmoZMM4u6V8DG7OXHf6VWXNGkwmrIZ5/n6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=RXtpudb5; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d2280a3d1fso1884529b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1718181258; x=1718786058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=RXtpudb5gcux6vLZNizkC1Gi0nVRGEOvoDc844hMyv3Q++DWuwEnhSH8BbSE52Sz75
         Toz9zvItgfCkXXy30UuJGo/+t0lTs856wbTi+0d0YuoQtnO6+JL9zPF8hTUIGHulpuG7
         j9XO1cFnaFTCkSzETrlEGvRuEtBHJi8s+tTjAmvwpqP/oqOvYrXN2/gTauCcuq6Jd2QA
         Y5y3fUFikO9ii/vR/8cZwvoWf3God26upWWTcsmfya2moEWHmneKBp35Jxp18QazRueE
         or8KRbvnKoLdTtQ9KLxMb+C0wvRsXz2HjBtlTnLNvT5I7vQl20DOsy5kACXuv84mE5vE
         cZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181258; x=1718786058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=UkvDLdd/yJl/Xfj6NZYKQsA0LaE1vtpqdN2uh+qMnDpsNFViLsb1J/zFyIbHuaTwU4
         xbXIX+BrUupRqhgeXeLuKHAlDUIpLThtwhVSDTkxRqLOAjreq7Vh5IOQDQVRZ7D4z8gW
         0TayRI/1cUp/6G01+lIX3y7V7qyGCvPUApQmF+FHi6ZuOvWY5pUp3iOpV4f4ODGsx6/L
         qDUUmcsyHb11IwOiaEem4IBAGZEmYo1YoTM7GX/+tOtdnYKKzUKOMArNfmJfZLCQoQtr
         WBxrAIHa96F2bVHhDYziWiefkmbUJaF8Itiq9YWoXqtJZCBuMzqeH5srMOUrV5US6rd2
         uRWg==
X-Forwarded-Encrypted: i=1; AJvYcCXAA3nu5zVGvKkpJ1VNAI3IWLDzJv2qfbxtEX+62vtlDokcy6nZjXh7tdSS7IompCd+mn5lzHGkMnICyQwhwybxa7EUAfohYhc/ib8H7w==
X-Gm-Message-State: AOJu0YzNb1leD+nQQdTjEI3A0w/GqfMQHuLCTmHNzemKYMKzt5kpLuXB
	P/HAj5NQjr0rq6TvAHd929kVaXxMRESkRpL77+T/Pb66MAa4/6Ha20+wJYaElUkivGpm+NxNGVK
	BPzY3JwdXRKJDkGqqLWNz3xV6AC1ld62kcZzC
X-Google-Smtp-Source: AGHT+IF2c1FL0fqOMuwGFXItue1Pz8K0VY5CQ9QXgEnYWVlMd7GYFa+wcDzIz9YylVcb2zSif5XgvNLrC8xGpqwxyEQ=
X-Received: by 2002:a05:6870:b625:b0:250:7973:8092 with SMTP id
 586e51a60fabf-25514ef5f86mr1113389fac.56.1718181257361; Wed, 12 Jun 2024
 01:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
From: Crt Mori <cmo@melexis.com>
Date: Wed, 12 Jun 2024 10:33:40 +0200
Message-ID: <CAKv63usQDFuz9s06GNTq=3fzYm-OVPAxgxwxTNEw6zw2rYxyig@mail.gmail.com>
Subject: Re: [RESEND][PATCH] iio: simplify with regmap_set_bits(), regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For mlx90632 part
Acked-by: Crt Mori <cmo@melexis.com>

Thanks for the update.

On Tue, 11 Jun 2024 at 18:52, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> Simplify the way regmap is accessed in iio drivers.
>
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> CC list got suppressed on first submission, so resending. Sorry about
> that.
>

