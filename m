Return-Path: <linux-arm-msm+bounces-20625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8D8D0227
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7515B2BD35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8B315F300;
	Mon, 27 May 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCgZ0cWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117015F319
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817079; cv=none; b=dTDvzFfvAE+zsf7reSV1XSEXMc/9XNAMRzcfidKr6/iL9zw8DXmvT6znDXmUFiFECoLpwsNgQTG6RjJeZtOW0a0jT7cez01LrB4ncRojkHSXCg69CRGiu637Eq8Wd6pyMCnjb+81yyKf8JzgcwKycjxkGQ3fDCI4EddyA6NSN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817079; c=relaxed/simple;
	bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhxGuxAv0U7pgGExHTv2wB4qj7FQwePw+37Z1X3TZvV7BbVv4wrw5oE1BJYga7EttNC5BtfdWedxAo5Y1ut0RvLrc0aaH5Pbra7AvYQ6vgVrK1CbZlPROio12wugJ4B+a0snmjf8EnJ6WCgHGYvmOfeMMK4J+WOgxk/QXlb+8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCgZ0cWU; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df771cae64aso2895250276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817076; x=1717421876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=eCgZ0cWU8XvjJ+3rIdwk38GQ85ioZedXr/yh5C1PXCUy8eujLIBsVkzmEo+lI6I5Cy
         9aVz0PgLjw27AN8C7BzX2tlR/2aQ/SvKOJIXp/oZdMPBHWAtYDPvGY9PryXGRjqGlilR
         6dR8+zzCiiJECAVS1G6fGl90VA69XEArGBpcHxiCUkGUsUejtZIGnJ9UdTZ8RpYa3lYq
         RLBpEPtzijIS89HWplQnqZs9P1HnOUeXr//TGnLnrikEfqO4gdrbNYJoLP/RwS36U6Dr
         eUQs1y9hPRUIUCoRmoAWpCkce22ZPFdBeklMPj1+0fhp+KdMBNo6TVQOmOAPU5yUTNUh
         RvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817076; x=1717421876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=tUrdP7EqK1CGuKNRDt38e4MBAYHKtbU56+s3q0SgNiwRJdSccpAG88jR3hpbTErFOc
         avIl+ah2EnRRHlcttz2E4Y0uvRnGEoqjIY2/RVApny01yYVi9ZffTfTbknrZtZQYVh2p
         h62EyQHHO2TcvXbRtBtriCEgx+Su0Z4k9WHucuavXNCD1IIM3dU60YiIXKcF7/ut0z9P
         KZHl7eGRvONZYt1Y6L42EI7MGYGciXYWR1T6KjM4ZU9GEX9P2grmvC0bk3zjCONITKmJ
         Zacglrrd2/UqG0dbmIjzkzzggUMT7/Fmr2kPaAUd7v0Ahy9NKVs78Y6Says2Jmb6Co6a
         mnfg==
X-Forwarded-Encrypted: i=1; AJvYcCW0AdZZ01UDlvq/ZhNUmUptP4ZHq/B+xVZQhiFQnkY0CkTF+Sf4ra3N7hrPYDTqZcQ6e+bySOKKsA0aPsstnKVvoa12y59kK+cPSRGyaw==
X-Gm-Message-State: AOJu0Ywyzws3LBIuN4NBbXz1CBbywAG388qCDe2wSLtONr74nONUibbv
	UTGfF4edBlr0YTvtfH3lojsuv3H9D98VMv7ujpAvGUVAkEexTRv+cy66+5d/xUK8/6o7iQXX3v5
	aYA6lLmvxzMU1qxWkIIP7bvpBO6DAZD3QH7QYTw==
X-Google-Smtp-Source: AGHT+IG3ODce9dNV390Ozs9wlqpcGCT+NP7kvAR3YSrx49G8pypddGGuh8zJs0qLVCnoqGn9N6DYCNxnN4AlbhGb3Ao=
X-Received: by 2002:a25:d610:0:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-df7721c660emr8663079276.32.1716817076072; Mon, 27 May 2024
 06:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com> <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:37:45 +0200
Message-ID: <CACRpkdZFfjCitNiGVe=F4Jd_M36fqdG0ixD7396xEVbvqZUdyA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Would maybe mention in the commit that the quirk to gpiolib
is already in place (people are already confused by it) but no big
deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

