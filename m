Return-Path: <linux-arm-msm+bounces-38307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDA9D2608
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 13:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E90C91F24322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 12:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A561CBE80;
	Tue, 19 Nov 2024 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mdH2S+g9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581A1C9EC2;
	Tue, 19 Nov 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732020082; cv=none; b=pizBzkFlQsrMsYMuydfaap+G1khmOTDyKWGPLNKngB8Mvsj50Z7rYlwUL9Y0tHUQfG3sX02E8PpV7YED/NnFoWVPL2TKyoqH/MXCUHjMF8oYBjdj8fv6wF6rYKyRpHTY4o5o0BlMzw4HtS0Dv/jkXO1wgMeFzXjkj5JhVnhMuOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732020082; c=relaxed/simple;
	bh=cPzqU9OqmO7u8YLVierk+4DHkUIpDJShKogyzpU9sr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9A1krqxG87yUnvCPtpsizo0EyS6ENjMTf8bX6taAeRdd3ykI0cCLlvUbqA83dpQxYTch9KxOn2wetHGsp24QdFiqVXqtRkVgG40UtgM2kDnRFo+iqB0EVmpIJMA6FNBPk1AfRL7W2ypTzTZEVdHgkHxGRPp3OtJUJAz2gAyd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mdH2S+g9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732020078;
	bh=cPzqU9OqmO7u8YLVierk+4DHkUIpDJShKogyzpU9sr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mdH2S+g9iIIUkwu6OK9t+P634eEtcTQhCLBRCd7DJ99o+FskSqjtk4SX+Zs6Ut0OT
	 67iPCFaxYUm+RX1DVCFGNhd1V3IAszwkm2jr68z06mTU7vYh5pVneieDjI5UpV9mZS
	 SfHIOVpCGCjLkuzOA35zzLcqisX2oOdyg0KNXavPyuh+DCf96343SovzFzxEZRq336
	 z8wZHzFYlMNi2L0tq99t0XAK8v0Nqo044pOxyvBzG+uDkh2OxalxW1bAkwJgGpFgbh
	 jvgE7HOTRye0az+pgV3rCOtmvGQpRdZdoCT9vlA3VwQSGuUHr9Gk7zpBKpBfA4YbV2
	 HEHme4PqsCZMg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E90117E365E;
	Tue, 19 Nov 2024 13:41:17 +0100 (CET)
Message-ID: <0dc25339-8806-4a59-8350-75eea5e826ab@collabora.com>
Date: Tue, 19 Nov 2024 13:41:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 19/11/24 09:16, Uwe Kleine-König ha scritto:
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
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



