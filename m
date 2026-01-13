Return-Path: <linux-arm-msm+bounces-88737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55455D17E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB6B830012E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6EF389DEE;
	Tue, 13 Jan 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z29ospbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A13374183
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299215; cv=none; b=l7UgNQfdK+WcIjjzBZZdLRtIw63LFQtT4pLEsMbAW7ti8CwNxB3e1xVh/s3No+4Rzp2+34TKdyrhaDUmFz23gbe+b5Dsea73endRRMYhsr5RAyaFEb87NL54LeWqAVFQj3ZVJHwvDAweppNmhEbBu6xRiN6vZqYzmMAZ5yZDj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299215; c=relaxed/simple;
	bh=RpOnPNW4xfI0Kz9zhPqicYu/rLC2pTmpoM33Trm+SMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4UZKpFFOfljP4eEWf7gjs/qLXnBi4pg0WwcshaZHyOHsEzFuzwaslw5eWhELWiB4M87ksdvh6A2xVgcyPJT8R8PTyUG+nJORmwbazUpIwYJkT8Se/jO5LO/ifUacR54Yix+91PntNTtigdx8Dg/AcWqokca1YlyfJVJUlhFR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z29ospbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC8FC19423
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299215;
	bh=RpOnPNW4xfI0Kz9zhPqicYu/rLC2pTmpoM33Trm+SMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z29ospbjUQlyrL6uOQA3DzNZmUzIT8K3W46WQr1IeGzjseRsc2jmAtG2m548XWoU8
	 LqJwtzqX49nWBDvAc0nmL+1tt4Nhkr/kRsQbLMc5ZY7KRByvFVv4rssz0xP8MP+lSS
	 0kD69OdoaS38pvPRIDc3w5aP00L8RL0oFVjpOwI7KfSQrxOK5Te9QUa6CKiImmfmG4
	 trKTazffjdOgXuz2Qci/JC9PYc1u2D3Ct8pcwAogFv8iyUJt5o8O6yTsnFyyRP+W+m
	 pmen+3WbUsVttm+P0OcTboc9eWQyWw/QNt9HG1STdOz+o90mxokhfSpmXr7MYBYIEd
	 rfOL9BJgqfcOQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc3572431so82402507b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtD3qlqjt/ujon1Cdwjm7wMnMsLPVKqSplCeDu8F7i1YUnDnOkO8FBUG7e8EbrQYo16TYWV94kshlG+ki+@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+4GPesb4sXfOiCcE+mahB0AncbY5+AOL0j5m14CgGoF6GqCY
	sVR2BZeuAmP+JRqWRNiuYMFLoQI+a4AOTEebFujtaei63gUke8hiD6TwcOpzn+blmP8lVJJGZGd
	JLwQIDddBoZcBcktpbdKRYWgvXdLsFCU=
X-Google-Smtp-Source: AGHT+IEjXK4zNU3B8MFfoIndGOeB/FKQBt1cyG91VMuMhesDC6zUrt9ZhhHY6gJ4lWXzCFjcVvXXmBBHZkq1dqdQ1TU=
X-Received: by 2002:a05:690e:1442:b0:644:51a4:4f1a with SMTP id
 956f58d0204a3-64716c67be2mr17455597d50.46.1768299214202; Tue, 13 Jan 2026
 02:13:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:13:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
X-Gm-Features: AZwV_Qgxd8O6AeWZ_24rr74gIMc3R8RlMUxlB-x9t8krXDZ9OpAu7ZlluLqPS50
Message-ID: <CAD++jLkBKcK9eKOCfry2H1DzG=5Z93w2U-SRwHf2dkRBhyxQRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Haotian Zhang <vulab@iscas.ac.cn>, 
	Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@kernel.org>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, William Zhang <william.zhang@broadcom.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, 
	Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Darshan R <rathod.darshan.0896@gmail.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, 
	Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, 
	Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 9:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems all of the SPI drivers want to propagate fwnode (or of_node)
> of the physical device to the SPI device. Make sure we don't duplicate
> it over and over in each new driver (+2 in this cycle) by making core
> to take care of that. Note, similar is done already by IIO and
> I=C2=B2C subsystems.
>
> There is one noticeable and quite specific case that is taken care in
> the first patch and now we have a confirmation from Cirrus that everythin=
g
> is okay.  The rest is just a mechanical conversion after checking that
> the parent device is assigned to the same that provides the respective
> fwnode.

This is clearly making the kernel a better place.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

