Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF08725B1D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgIBQgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:36:06 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35899 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIBQgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:36:05 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C04D9C0003;
        Wed,  2 Sep 2020 16:35:58 +0000 (UTC)
Date:   Wed, 2 Sep 2020 18:35:58 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
Message-ID: <20200902163558.GA4137028@piout.net>
References: <20200902150348.14465-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> 
>   drivers/clk/at91/at91sam9g45.c:49:36: warning:
>     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/clk/at91/at91sam9g45.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
> index c88ee20bee31..cb4a406ed15d 100644
> --- a/drivers/clk/at91/at91sam9g45.c
> +++ b/drivers/clk/at91/at91sam9g45.c
> @@ -46,13 +46,6 @@ static const struct {
>  	{ .n = "pck1",  .p = "prog1",    .id = 9 },
>  };
>  
> -static const struct clk_pcr_layout at91sam9g45_pcr_layout = {
> -	.offset = 0x10c,
> -	.cmd = BIT(12),
> -	.pid_mask = GENMASK(5, 0),
> -	.div_mask = GENMASK(17, 16),
> -};
> -
>  struct pck {
>  	char *n;
>  	u8 id;
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
