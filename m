Return-Path: <linux-arm-msm+bounces-26153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0E9313B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FEB71C212B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E4618C17F;
	Mon, 15 Jul 2024 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="EcJXTAI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BC18C179;
	Mon, 15 Jul 2024 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045450; cv=none; b=ZW8yr5S8f5WdCy3xZVttGTMMnX+fFjh6d3ZHvCi1tnLYO9uR5/mRv8y0jTTGXWxk0EL90b39hwLTu0jvzdQ3NFtBlI92mXrP5JTAq2xDw8wGkN9ulAWr126IGajnyO6Gwlc3ve5iqsWSeUFTMYEKZwttxiAoCS0BROixM+zRp5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045450; c=relaxed/simple;
	bh=5VS9knY6mSAsq6EZrauM5Q+IHj4rwJ2jkjgzDucTy1M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa7QMdaqbf12MErlns9guCqG25+56+GMkZ89YNLIlleEv2/g1CeNVqz4pePVfluCOJJ6Zr4ZGnHfYzctptU3ZhFJA79RiAnhXBWjIL1Xcr/ekBdlsit+qIworFI7AWNFxU9y5R5F17QJUASwFXVNYuSslNSVp4HcgmQEBYBBtN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=EcJXTAI4; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E51D8120006;
	Mon, 15 Jul 2024 15:10:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E51D8120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721045438;
	bh=fi1IQpHZDvlWQpXfAPzXTTqWvujhfPCIqbFuSJVBLoc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=EcJXTAI4Q5I7lfVV3gaO0aomYs3DIQxEnUyhiLFsGhcf7LZR4D5oVp998E9jCBhqw
	 7QEXB039VBTJYnbTJ1AZXFuD9lKpajCZ0/aLuDTZ9+KQM4mYumH3NVSiUUHWZysk6u
	 55P7MnE3/DBu6VjS/B8CH4RAby3vj+DBjNfwkDQF/Hy5SvPOQQji5Hq3yL2FglUJdV
	 INWixKkCpg/9SYb/IewX+ttgFtvP8CbjaqtV7ZRJEte4TL5fK5uTR26oBVYmmK6cBz
	 I69UorV4O4Jlbvly9Yb2VdYJPhowHJKH2Uz3NfCIvhrBSWv+RIVzDvms83hp74JpI9
	 plPr0jJ/QYM2g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 15 Jul 2024 15:10:38 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jul
 2024 15:10:38 +0300
Date: Mon, 15 Jul 2024 15:10:37 +0300
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
Subject: Re: [DMARC error][DKIM error] [PATCH 02/10] clk: meson: a1: pll:
 Constify struct regmap_config
Message-ID: <20240715121037.hekmgg4sxdomi3b7@CAB-WSD-L081021>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;lists.infradead.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/15 09:24:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/15 09:25:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/15 05:41:00 #25996221
X-KSMG-AntiVirus-Status: Clean, skipped

On Wed, Jul 03, 2024 at 11:50:15AM +0200, Javier Carrasco wrote:
> `a1_pll_regmap_cfg` is not modified and can be declared as const to
>  move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/a1-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index a16e537d139a..4d0a6305b07f 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>  	&hifi_pll,
>  };
>  
> -static struct regmap_config a1_pll_regmap_cfg = {
> +static const struct regmap_config a1_pll_regmap_cfg = {
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

