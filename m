Return-Path: <linux-arm-msm+bounces-22994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688290CA05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148B61C237E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0C7158DB5;
	Tue, 18 Jun 2024 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSAzLXR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74D19B58C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708973; cv=none; b=W51Ax3DJDrCdhb7KnBjz5r8d9oy8Dzad1tLP78qkQcH+VdHYDUEPIFC7hsDHjTWkLKyRD7kubdSwENSAA+mtfdiLDJvAXzB6ztvNSr5AMQHEPssjMquI9gBtrMn3BJ3nr5hwCZEjv3zrhKg9141iQ7ktlIe87HZ/bhcq22luz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708973; c=relaxed/simple;
	bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFKnTg7pTGqzS6Eu822C2f03vmHxxRhd1W7JCGU1qIihfBwlvY2Es+yrjk7kYpgmq4o0Vqn60F2wKdiCKa6APlhamJOg2zQWgrXkE5qV3L0q98LVVAXn3BCcbT0PCFjKYzDCqWrxN3ajs6OLMD+iOJ4WT7hjRotMJcVVXE9c5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSAzLXR+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c7fbad011so6218054e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708970; x=1719313770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=oSAzLXR+RVdFM4wEvTMIfkg7m2Nb974FQ1Vos1n5GiD8xHQ9rW+YWIlE7Zk1EryfLo
         6uvjO3+XrvZC7BtkO2gz7JIauoisJDnfQf14c+F5eDxDI/fQgTMurSoarF3Yw0dzZGMe
         zb/l8Vz7NO884V8pDtfULomBK7+WeVCufCDX02G2FtsePLYJm4hD2YM/N5Irrd14vOx0
         cSsib4wI5yjLXPQ5bC6apLY85modfwBw7oNe9NIFqzH7CyYNg2ggIsw1D8k7YiJpn33f
         PxCMLXn5hkbEGg6eHkcVOf2ys7eUK0dQZorTANcahBuF2n2Ekmwa6Jgx+sAeoJd86S4l
         Pcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708970; x=1719313770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=EUmEeJ7pYvTVgwHT5lkLmh9dimzHzIer+y0LttR9XqwnvBCW4n9sRDwEQ/ILrG/rOB
         szsGgRZV5QsplkZO5243q5LbrI4auCroF8Bt+HR1b455IF4X5obQ32QNzO5tfq8Lz7kG
         gFnN9WDNyJi9u/EzoG+lmoA0wK6Mo6m9Cz5yedHaUrvQxcdcara/N7A88NLJl6a+s7Tm
         GzuJetKz0PQ1BqRAkAaEEuv2fwPON7p9ZtJWs9FX8RgihzCqQ5IPGY7slHxQRRIDGaHl
         AfoCIpvOG5g+wHohN/2iuT2p7LaGlastKi1DPAATVwke6V/epRV4jjpXyT1tJ2c7/uVE
         fdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3RNdtmPg0bgRQYsQDp9rZvt1jBg1jHrYmLsNt118pl5je5MSwfAlrSl9z17+c93CHVHXukflKkAouB1YeRajEHjDYzVcOdLT1eORE8w==
X-Gm-Message-State: AOJu0YzgZoCynKVpZg0p6ECbv8Va7hznRnCYij3p/yQzTYh0MbWsjw+f
	/uO8GEd7Q2Q3XjBVeOOoL/hC7or1E6ZSQiZJnWW7JdoJ4dSBVeqNvyLGGXtqYJIml61r08wPivy
	WsjYSMfuI30yflr0jjSdEiSrtj6Zz5zw0GnaLfw==
X-Google-Smtp-Source: AGHT+IGoKxTkRYLabjHUEETT/B3IbExJAmXPzq9+RXs6bzZ+GQ8xGK2jG8c67xHQQUvRR1JIcG5ZA4yr3WPNV/0LYAU=
X-Received: by 2002:a05:6512:2348:b0:52b:bf9c:7e28 with SMTP id
 2adb3069b0e04-52ca6e56012mr10869317e87.14.1718708970136; Tue, 18 Jun 2024
 04:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-2-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:09:19 +0200
Message-ID: <CACRpkdbos8og5=d4MXt4q11tQkhX=dOZdv382f1z2YJV44zidA@mail.gmail.com>
Subject: Re: [PATCH v3 02/41] iio: accel: kxsd9: Make use of regmap_clear_bits()
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

On Mon, Jun 17, 2024 at 3:49=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

