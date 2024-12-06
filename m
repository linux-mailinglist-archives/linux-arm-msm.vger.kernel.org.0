Return-Path: <linux-arm-msm+bounces-40753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ABF9E6AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952681675AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513291DF96F;
	Fri,  6 Dec 2024 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G7v3a7Mz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11F1B86F6;
	Fri,  6 Dec 2024 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478433; cv=none; b=VZmopP9Gquw2T6aika9QAuyy/kqSoTOLjaWiOIUhzZEzEe53MlRPfvo1XFAGdxgIMSYQb5qfk0M6WUMJ43j4swqmWDONV3dJ99QV0A0OWCdApZM891EBNkBtL8fi8fJPyiRaxAawdsRayoDq+X+Yf8gHU7ho7JRDBixSe2dFUTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478433; c=relaxed/simple;
	bh=NyqUxD4+oNCtW8qXiH/xVm64iV6vut41ehuQt6eTnzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tPtW/Qmq9iCcVvv1OcGhYeBNjeLGFKJ6NXjkuFEnIEP++2MgNS+D3S2GmAYDKvfe89j8PBcJP/LNqoM4OCPSRqlNT5ruKAlgQ/q/Pj6srE/StLs8vObR4erY/V//fZ6jCASQBjuj1UFw9tteOUyh7tyGtaMZj1XHuZDq7BKKEJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=G7v3a7Mz; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733478431; x=1765014431;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NyqUxD4+oNCtW8qXiH/xVm64iV6vut41ehuQt6eTnzQ=;
  b=G7v3a7MzIcuS1ejWpLwvqgcdcJKqLetwKkC0LI2ceREbaFx1KV5z/oWI
   TBpqP+k+BOKlG9+27Nbr+Hizg9ZpkwvaiiJBH/EWjDGJGyOJq5x75uBsw
   2JM9oKUWhDOzx6Ly3jKyJtIU1B5r2JRHLow01JDhNJxZwwKNG/0bM5Il+
   FZ2TAkW0Fb0AKPKdzd3fS2eKjS6/syRWIEWSqDuOjC59L+IDDSh15/8st
   EYjK5mL7/KsHgJJITrEw58NkXU0rNWNvqGBrZEJDTldLKZ/WSyFGg/z1c
   TkVdsh2xkIev+dF0iGd2r0hXMSihrCgeQOEK8tmUqi7sjRodTLJ4m1vja
   w==;
X-CSE-ConnectionGUID: pTa19jmpRCeKQo/pb8i0zg==
X-CSE-MsgGUID: twfRaRnqSvecierGvL/pdQ==
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="202666736"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 02:47:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 02:47:04 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 6 Dec 2024 02:46:57 -0700
Message-ID: <43ec4b5e-9ccb-412f-a2c7-cac5f8bc2bbd@microchip.com>
Date: Fri, 6 Dec 2024 10:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 10/15] net: macb: Use helper rgmii_clock
Content-Language: en-US, fr-FR
To: <jan.petrous@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Iyappan Subramanian
	<iyappan@os.amperecomputing.com>, Keyur Chudgar
	<keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<imx@lists.linux.dev>, <devicetree@vger.kernel.org>, NXP S32 Linux Team
	<s32@nxp.com>, <0x1207@gmail.com>, <fancer.lancer@gmail.com>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 at 17:43, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

If needed:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index daa416fb1724..640f500f989d 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
>          if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
>                  return;
> 
> -       switch (speed) {
> -       case SPEED_10:
> -               rate = 2500000;
> -               break;
> -       case SPEED_100:
> -               rate = 25000000;
> -               break;
> -       case SPEED_1000:
> -               rate = 125000000;
> -               break;
> -       default:
> +       rate = rgmii_clock(speed);
> +       if (rate < 0)
>                  return;
> -       }
> 
>          rate_rounded = clk_round_rate(bp->tx_clk, rate);
>          if (rate_rounded < 0)
> 
> --
> 2.47.0
> 
> 


