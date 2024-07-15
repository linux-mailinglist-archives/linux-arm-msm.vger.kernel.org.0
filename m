Return-Path: <linux-arm-msm+bounces-26152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CE931399
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00884282345
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6168118A93B;
	Mon, 15 Jul 2024 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="CZDMmaSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4010518C16E;
	Mon, 15 Jul 2024 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045304; cv=none; b=kzUeWub8z5vr4j1Dke2ev7u4ajBxdhxjTuCY1YL20SDnM7EGgGpHtx1z8JndROECtHYHyvgRmivxRxs9UTuOOvZB0WB1C7jEQKgqAnTA98S9fuv2qRk3XB3HEQV4RTIAmNUDfmLymk9Ci/G0jnfiugDbQGSqNUN0Dt3N9bqHh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045304; c=relaxed/simple;
	bh=eOzKsJZ68Zti0agSsF1k6ZKZakTJy8YwzojJ5tl+3zU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8KOTaszVeCjLb/ONCCNUxspYGNTynhY7wdjBpoT8C5dymqnV4Pitmy6brqq3gT8sVv05ApALRtUFux4cyyb2d9WFX+KZwGTzB7gxw8+KQpHZZJRqg22DaKQbYyxe0nlXMHSzGirWW9kQFwhMrec7qdeQe2F2ztAQX8ErevS9z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=CZDMmaSm; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4E3C1100006;
	Mon, 15 Jul 2024 15:08:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4E3C1100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721045294;
	bh=5vyLVI9BUcQiXbKOPPF+ePjGPjESIUWqofEKwJ2vX2o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=CZDMmaSmlR1cR5+XJuk0LCuwSj3cp/3MVs4Oq5Fvave73qp84CMlqkJbhrtoqhI/y
	 ooCjE+gijiqfKUmTZEF3sRDEiveEl/9bNs5njX4qHU9KAszdw4J5s35csVZaxKCZ0N
	 Ap8HyT/RfYzx3T0i0Ll91yR67I4JbTYv4Vdpm1mItML1MYRAqJxH6MwaXLLnOowd4Y
	 H6hGUz4fxXyPzaZ7vthzcUp1qZKvKRu+hQo04m8V9lL1oou3034th9IMoC+bOfIips
	 rX9dRBKGOoq3Q3jTfG3FhMQtHLaR8DySrz0LSELN/PIk3t112QB7Ruj/TUDXzZTXkP
	 lq3RnABnT9CSA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 15 Jul 2024 15:08:14 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jul
 2024 15:08:13 +0300
Date: Mon, 15 Jul 2024 15:08:13 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy
	<vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Michal Simek <michal.simek@amd.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [DMARC error][DKIM error] [PATCH 01/10] clk: meson: a1:
 peripherals: Constify struct regmap_config
Message-ID: <20240715120813.m74t5y2br6yfhurk@CAB-WSD-L081021>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186522 [Jul 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lists.infradead.org:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/15 09:24:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/15 09:25:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/15 05:41:00 #25996221
X-KSMG-AntiVirus-Status: Clean, skipped

On Wed, Jul 03, 2024 at 11:50:14AM +0200, Javier Carrasco wrote:
> `a1_periphs_regmap_cfg` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/a1-peripherals.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 99b5bc450446..728ad13924ad 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
>  	&dmc_sel2,
>  };
>  
> -static struct regmap_config a1_periphs_regmap_cfg = {
> +static const struct regmap_config a1_periphs_regmap_cfg = {
>  	.reg_bits   = 32,
>  	.val_bits   = 32,
>  	.reg_stride = 4,
> 
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

