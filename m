Return-Path: <linux-arm-msm+bounces-39341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C2C9DAA2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9992B22B6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2FD1FF7C8;
	Wed, 27 Nov 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="G+8UTO49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1E1DFD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732719091; cv=none; b=ohoU4agvr8zyLyADVgRPYaczo5HGm+xRTw7ewNd+p0AHH1mAmfkHdmIh0MqaxRdwdLrT+ZgAn3rYV5N/+1RGM9MLA00KKinYDE+h7k99sb7+IyMHb0l+c1jqFAz46I6JCe4n+nCI7Gjc4lIkFlcMxij5XX6Y+aYcT7bBLx6PRtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732719091; c=relaxed/simple;
	bh=8IPmXPA9vlrfIWt+Un6Qmb35TWs/KQ1dfAq90W49uMg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSwmEwhMGTbDFrv/+4hv++JGar2exBmx3xBD3jMFthT5dKq+fEFX41Dyi6i2cvWZJPgJcw9sP8uLHZRyUAadUlJ709pS14plYc89YmetyldAOE26Sxfcdp7m//Louoqc8Goi+8PuCHWeM0GZLpsqA12F0nMKF5eaGoSiF15H010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=G+8UTO49; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4A7840D9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1732719085;
	bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=G+8UTO49g4yuS4neanb/PkFBoaQVZ8+F+gPq3zIPC1N77qUltfwyAAlITMkwkh6NL
	 OfbPZKng4PA/2oIavAByOTR0Urb/Zz2eHy4NxG6hEZ6JHWgkdRJb7rbFh1CjcNbxiq
	 fpTAssL5qoPk0DwS8yWo3M1gXM7TWFDaiRbuDi5Fy5spwcrx5UVJKBXWJzIQL0v8X8
	 DBj5NPViVoJZlRHuyccppfHBZD+hbSMO8TIgb2VQSNguYczqkMvE8Ss15axxGBHYi+
	 +MbKPKh56qrYFG2g3MlksN4ZVM8Vc50vyOqXufXgF6A0/zZpcl0UwZ2XSMyOT1FG0T
	 K7DAWMJwkpzGA==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f1d5f7afd4so650129eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 06:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732719081; x=1733323881;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
        b=aTFCGg8NBnZTNG+WFs5kX1PEdSyulvcz9+l7JHXMBaRfKz/+rxp5DmSFQftUKW41sN
         J5/TdhEKrW/E3pM+aB+myipKn/1dIwtfNgw+wLZtEJKPcIN6yaMl1q5ELFJvFu44ZSAW
         g4w2S8z3weTUe3dtmeK8zsnRqhY3HBkeIhJhJekSThA8g1tA3iWMwFo8dK079/ljvdk3
         YyGOzDEmx+KkSmj935yBXwy2/UavLkOH9q74N4OsWRI9Km89ZQXQf8VekNiCYyoRrQHf
         2dKETDN//xh6sQe09ryo4GSGGkD4D+i2vM6PGV+qLwasGML5YhA7QGwZAZH0Bn7U9DDh
         icng==
X-Forwarded-Encrypted: i=1; AJvYcCViSFPB/OuwwvZPIcFh/5wo68qG+BXzf+rZOZUF18vnr04bMuZp18IXYgK40lbK4p0PrFka1einJp1enbuv@vger.kernel.org
X-Gm-Message-State: AOJu0YxIs0t2+Gyj01IuvPpEDT85IG+Gz4Evmmss8J6iOOf6eUzo34ET
	tclR6zdcUkP40+xuCAQ6j/VUlnJ4Zfk3fsLEfTec9FBrMkLRawcmxaq6XQJkwWYB9024xvolOD4
	K1Xe86LnepbvtLWbfBiqU2cGdqJVix/WFvdS25RAgIHHQ+DyYiX6e3+Y+si6LhQh0/dETrtV7nA
	2yb7dDeiDFTdKG4xtQe1Vzur26gJuZ/9J7J256u6M4AjD+MWkxftWhKA==
X-Gm-Gg: ASbGncvr3JnkyDmkcSWURtZ1wb9Sy/dpbXIgwAQRyF3+nawaWkA4Kvhwsh8FcKT/SDI
	fj1naaNrI/R6WZEGFa8sxFzuML3jrbMYtuuMtgMhGZTLGA97yLI6M5RaZvhgl
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id 006d021491bc7-5f1fc43a130mr3684993eaf.0.1732719081296;
        Wed, 27 Nov 2024 06:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfFJGOrjEK1lKzXEW/QXPfJgWZfDO/+kYkPBQ8RDpwNJVjReUG8X0KbLCz17ehyjwvJu+WybHbfVyct/J5soQ=
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id
 006d021491bc7-5f1fc43a130mr3684952eaf.0.1732719080947; Wed, 27 Nov 2024
 06:51:20 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 06:51:20 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com> <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 06:51:20 -0800
Message-ID: <CAJM55Z9PZH3797=gvRWquHFSE7YOsO0-bcOBFjBETCiQW-YURw@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v6 09/15] net: dwmac-starfive: Use helper rgmii_clock
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Minda Chen <minda.chen@starfivetech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
>
> Utilize a new helper function rgmii_clock().
>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 421666279dd3..0a0a363d3730 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -34,24 +34,13 @@ struct starfive_dwmac {
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct starfive_dwmac *dwmac = priv;
> -	unsigned long rate;
> +	long rate;
>  	int err;
>
> -	rate = clk_get_rate(dwmac->clk_tx);
> -
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -	default:
> +	rate = rgmii_clock(speed);
> +	if (rate < 0) {
>  		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -		break;
> +		return;
>  	}
>
>  	err = clk_set_rate(dwmac->clk_tx, rate);
>
> --
> 2.47.0
>
>

