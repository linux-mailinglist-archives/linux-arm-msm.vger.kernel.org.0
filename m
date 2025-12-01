Return-Path: <linux-arm-msm+bounces-84017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223FC99000
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 21:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A76CE345378
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 20:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF8526ED25;
	Mon,  1 Dec 2025 20:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBPlHWxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76652376E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620450; cv=none; b=Ipafi8O7k2euFjCbKTrk3KEr+FQhObivpoP6hkFn2YZ31f1hO6K1BuxogkRV6BZsRKAJfTDNR2twd4CyOXlD6FomLE8kqGsM7rK5piQbwSgwsrNUaCnRvg+kVTdwuaDE8391XsIOGWzTMz/RaBn7NQGOGqRlWkfr9gxbBK2VLYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620450; c=relaxed/simple;
	bh=fE/oWPjBpVdA4YQbxk3ORggkaf7Hnvev3Eh0hZI3+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWI40XDjpeIL6qe/20dDCQxfgen46KfrRnYXqRfyPjlbH1dK92ml4IbqqMjoQ6IP03GTpGEKDSFnQzjGzNv9dJ9NY26LNRNqdyCXGZzSiMv+WunYdfjTZicjs6Tv6ipQpRlaBy/a3hGCUOtlj6KZuf5+K4zAcZmkrAeH3XHX+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBPlHWxM; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso6599038eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764620447; x=1765225247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=fBPlHWxMKoEO5LSf2xYitQnN+BelTyMKVJEdxx6GNaBPi+J9ZPNXRN+ary2WmsI7ZX
         0KYh4tyrcs44NQjZpSEDsuZCkEFuwqCR+pKKJft1SI3t9DfpmIdEk8P/TU88Sq/MQ5Xl
         OoYalG+MLoMdM5DtfySOHyF/CZfIg5l4sCOsL6fxe5wiunQP4UkKNueGa1ixMsLBw3oA
         6qDA6WlwhQ2xehHGG0nrcsnqSvrr/3UY90Ojgz6CX93YsTmcv7qV93IcDR/VWnRF4IFZ
         9+fRmShU/WVG260VLCW07cxMhv2F0ETUN/d3EI31jWZEa7b4K3VDOd0Npv7cW3uXd+74
         NIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764620447; x=1765225247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=TLQNydWBbkZFc4vWHbIc16XALemNSOEKQLbgurzVnH0bSEWkPbJ2Glc9Gsl5+xaIlA
         2qmDnkV+fuovomTFO5aHyreCZbonHA7SuYMfNiloaWixA2/agOE6svDoSwMV6qRe+vBj
         9CZcUfY6eQu8g63Ly/IevVBvtCc9EiLCXdwY1nxaKMNog57ivhugsSA5dUDWsQxb1pt4
         xgCezkmPSqnfoRQo7APEN7lpAvLxQNuOspLarTtotJb5y9fXR4ZwdrOfqsO62u/WEnih
         XvwK58pvzU1cZgTqaQf4rnP8TXCfVWpx/bPo4pfjmBaZWqrvMeMu1AL99fHla7U1BrX+
         Xslw==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ9b/6pnjeavHuZ4buDQ7wg3H3Rh+L5TkFvL3ZalfCkE5mROZnbr0ZEOTfxTy50XbujPmTfNp4I6FiBCM@vger.kernel.org
X-Gm-Message-State: AOJu0YwBQarvjhuHfXZgFJ8QF8pnxSqJcJDLnfLqUW3xbmQsXidYuRQH
	wGtX8q+DWhXIK/CsndeUOa/UvwmKFNU5QjWhZCXuyv2yBHq/4E06ribF
X-Gm-Gg: ASbGncsEEm7+ITPYkh2ijR5xJECbvXz8xBayDIfKDR5amYTE6wMqDmy9JsteicSQM4R
	KTf7uSD8MZIMaiMKfhiEMdlIqv5GFuPVdvMVpNj7tDRXMTZ/IIG1IvM76ARZmjO/n9c2h4aI5y4
	oauiRwGZoM4GQf1q3pfPcWsNrdt7jLeUy+oaS26sFKGtr5C2Gr6MbvGbYM5XLCDxQ3uI+cdkKM3
	eyH0qwTAU+hAyI9fEVgxPZpGLOHWUY1KQ9VqWQztygRwCeZfGSfQP9zRPQL+ODgomh5IkS62pE9
	K7R1Ceb7uD3cKszD+szuYiNx/8y0ZMoHxEAelYO/WTtwXBk1smsSbOxlVnxdz+Q2XYdu8+Qnl2x
	i7w89rlGsI3KVW3YUVdjYTRGlVWoCDcy0TR7qLP+D/4wJoYgBtvAayvAbY4E5XXisOOF5DGf65G
	dRCtYfYuHl954jZlZIxOXa+Kk=
X-Google-Smtp-Source: AGHT+IEKYg7dqAFBQA5yqyy/4gBG0pLJPO1wg8rofbFAF4WSvH7ZOKVnsnUBP8EQlCPhsTPLoRMRqg==
X-Received: by 2002:a05:7300:ce8b:b0:2a4:7dbd:1d7a with SMTP id 5a478bee46e88-2a718664ddemr19837071eec.11.1764620446566;
        Mon, 01 Dec 2025 12:20:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm71991900eec.2.2025.12.01.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:20:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 1 Dec 2025 12:20:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hansg@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Message-ID: <8d7a5210-f88c-4af2-80f8-61a390586fd2@roeck-us.net>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>

On Mon, Dec 01, 2025 at 11:59:43AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
...
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +

for hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

