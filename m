Return-Path: <linux-arm-msm+bounces-22063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F259003B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00E1A28345A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E049A191469;
	Fri,  7 Jun 2024 12:35:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8414AEC3;
	Fri,  7 Jun 2024 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763716; cv=none; b=UYnp4r2hJAZs27ySkmhcc5KmLXl7M5LZlsdZOFAuned7pmbwcs0XFly3g0nDPAKO6U3feXtqzdRj2qXoXO19wf/1WVHq35RHXW2v41NfosMubNn2hGR13TvWcA6s1g6ys7AlPem9MHq4ldPNX+W5Cqb7pK1kn311IIk+SmAtcTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763716; c=relaxed/simple;
	bh=/teq6pyQPk19FfBdsV/Et3PBF7/gto5X/WFNmpijboY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1xnCGPholBwqTcOI5niHt84FsdyfnW32uhE3Zj9cP/TS5obs3lpV1BDpdO8heKOFT4xd8cK0E/2O9UCWvbDGG/MD7Nx8ER81ceE7T/WHdt2c78vAG11HrC3Nk+g1A01xvi8J/A8JbTIDoCOBFOzlJc3RarN3eL5Y9EBqbORmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFYo5-0002tz-Hd; Fri, 07 Jun 2024 14:34:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Rob Herring <robh@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 3/6] ASoC: rockchip: Remove unused of_gpio.h
Date: Fri, 07 Jun 2024 14:34:54 +0200
Message-ID: <4347516.tdWV9SEqCh@phil>
In-Reply-To: <20240605221446.2624964-4-andriy.shevchenko@linux.intel.com>
References:
 <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
 <20240605221446.2624964-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 5. Juni 2024, 23:27:26 CEST schrieb Andy Shevchenko:
> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



