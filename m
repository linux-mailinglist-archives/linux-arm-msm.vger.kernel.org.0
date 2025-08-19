Return-Path: <linux-arm-msm+bounces-69705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FACB2BDE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B36F1965042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A6031B137;
	Tue, 19 Aug 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhkLWNTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545EE31AF21
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596887; cv=none; b=Ol8PyUxMIN9pdV0zJAvPYG86ThRA+sPdyOWC42d2kCjrvAglO7V3pgqpcCkzZAbx82g7nK+cyjrFw/EWfF7MT6Muud6Squh1A8rwq1a2g8xRXGrfEvT40h8gwhzpny6UoxCrfOHi8ib+AyRiEGCel1++d8fMsWSn0Kxay8o4mzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596887; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KawX1kQCUq5C6JunFvYs4oyDltSx6vHp3S3Ltz/IpdTUiYp4Uq+IKLcahgcORip0vkgzhbzBfOFldzuWFfWacrwXQxV1sxlRuo6eKfW4UlhndiG77x9k1l4kVxA2laJdHOCstd+mzAemLwtA3v56/Q4abUB2j5EJ9EdSZiqKAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhkLWNTF; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so39481131fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596882; x=1756201682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=hhkLWNTFdjEbwwjL7FisLg0gDUyRvtp1bby7rXiuQN0gvj0aaLdVZMtTr/HCqvMmNu
         dZi+AZ7MTnqjD1WLb2L6JDfpWWGXvFySZY0ijl9rz9QoZ6YKnwXctP99sx4jaSNN7oPB
         /z8kv9fHoRaD2YOJL9ZtRpf0EcbAlVrVjALcgolPMd36S4sJIMjeA6lrh5sPpmT6ouAm
         VW3QM+8pFZJFnDDCFjO8MFS6LYOOfL1Vz5NFwiveiFoYNMjRyxTJsiU9SOz4OnZUG+lp
         2uUgQvw9xUEHz7lQjrxS44fHV0beDHUvIgV7HScOJgTfLehm42PHpxStRXEv3lHs7Ecv
         ucTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596882; x=1756201682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=g7zCTSnnAZclW1OUFC/Py9PZzUXvBB5HC+Oi7CDA2M8MDx/eTEzrLM+57DI/DJvjrv
         vOMgUXUpHNs4Y9sOB89Ns2OSOHm+IsPimn5Oe5jZn5nOhegfslHWffcQbzSdoaSLJFWo
         J3T0IP3yFNYjPsXYfhiKxCTNzhlLBxASUAO0BugJcbHr2Pno2CorWW/qMsp2Tij/Q34l
         4CqG1G0yfQVS7iTEgc1lfNl/rbu5b4dXQjzqFVM7yyppiJ7mIV0pDTRRaR78qgGzDtT0
         TaWFLtecuZRS7Ujjsw1hi6FvSGcPX1TNlCDNrboBDqb9KcQNA7a0hnabexiDdaXP7NCW
         +3rw==
X-Forwarded-Encrypted: i=1; AJvYcCU9gwufn0vwMQSBPKs2ca/mieMwRzeCo7ViBYi+WGZHXvHrEQfoQLcHvHxB3CdEu1XUFnkbtC2DnK4phg5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+VN4TGe3sWOybNMmxKVkVL8Ru2L0dlXZiF8TGrAP9m2h3ByB
	Z3cO8UMgu54hakMntKmnX+RqfFy61syDPcLgofytxuJltMxewuzUXrUvnQGp8aAyY9vwAM/Ap0T
	woXdo6S7ltK7F0JdtlBvkauEDr55YiIdQQX9nzR+KfA==
X-Gm-Gg: ASbGncvROzkSZv7OvyXxs1XvyrCP15KYDhJ246/gATuWwcJxoaity28wa+Y/w+MNFHR
	FvRHl8Q/iFUMy/GNltUuMgzJvHBbUPj+SkneSA+L33P+4zMveImFciG4xCTLjFPIIY8Ambe6Cav
	FN5zIhO4I5t0RH4cIUGrzwhRao7bZ6y5mB+51sDFLgDpLsZ6dutxHGNsa0Ts0u/KcHXXlsTlxnP
	TVAIQg=
X-Google-Smtp-Source: AGHT+IEolFO6aeJABYr1hNPxQasixpAjIgJqFl/o9dwJCRxvFjpbc3xagoFqiJPlswYsIWJYgR30Ss513xxDR9NTkTU=
X-Received: by 2002:a2e:b8c1:0:b0:332:45b5:d68a with SMTP id
 38308e7fff4ca-335305347e8mr6104861fa.5.1755596882380; Tue, 19 Aug 2025
 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:51 +0200
X-Gm-Features: Ac12FXyAMutAnmM6yYaTGFkQgGmOcrXudlcTGzS_av87nGHcGPs7Xb4FZygWAbE
Message-ID: <CACRpkdZonmP8rSQS-rwzthNPv_MyddMReZQaD13b1qkRexxWyA@mail.gmail.com>
Subject: Re: [PATCH 108/114] clk: versatile: icst: convert from round_rate()
 to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

