Return-Path: <linux-arm-msm+bounces-61416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D5ADADF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8AB9170119
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C46D2C08A7;
	Mon, 16 Jun 2025 11:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1592BD5B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071722; cv=none; b=SZ1YkmFAxA4KpLnz8Mjf/NDQv1dnFla3ZizQFuQi1Cp+ci7JL0YeGlJHt4OqKRjTQ3fq0BzLlswREFP1+IMJZ5DGx95DMDEnUaBqKuhm2zwrfbCixPUE/9NA/AECVKdo6diNTVVUxFSFedqSLM2IWeLLs5SnarckLTCMJhp5slE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071722; c=relaxed/simple;
	bh=Blj7OdweNvMj6IcZFUrLUJTJlraPWT18QouClWkAzsU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bsieyGvb7WhUydQ/M++DLk3+2mw6YXGTGTtOXfwLAKULhqwaZQdMt0NPYX83F9dAtofKjm+A917KFP9x1LJ2khzbcgR4lNpCrOs4+iVYX+hLsu1hnua9X8Ld3A7EMRv4N94o7knre/gs3+90gcPrDKZjN6Fux0sBp8Tjy4u1YkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR7ap-0007WP-Qv; Mon, 16 Jun 2025 13:01:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR7ao-003nBX-1X;
	Mon, 16 Jun 2025 13:01:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR7ao-000LXs-1C;
	Mon, 16 Jun 2025 13:01:34 +0200
Message-ID: <0444ceee9743a349bb7155dac6ca7ea25f5adb18.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Date: Mon, 16 Jun 2025 13:01:34 +0200
In-Reply-To: <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
	 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Mo, 2025-06-02 at 13:53 +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>=20
> The IPQ5018 SoC contains a single internal Gigabit Ethernet PHY which
> provides an MDI interface directly to an RJ45 connector or an external
> switch over a PHY to PHY link.
>=20
> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
> 802.3az EEE.
>=20
> Let's add support for this PHY in the at803x driver as it falls within
> the Qualcomm Atheros OUI.
>=20
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/net/phy/qcom/Kconfig  |   2 +-
>  drivers/net/phy/qcom/at803x.c | 185 ++++++++++++++++++++++++++++++++++++=
++++--
>  2 files changed, 178 insertions(+), 9 deletions(-)
>=20
[...]
> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.=
c
> index 26350b962890b0321153d74758b13d817407d094..c148e245b5391c5da374ace86=
09dcdfd8284732d 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
> @@ -7,19 +7,24 @@
[...]
> +static int ipq5018_probe(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct ipq5018_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->set_short_cable_dac =3D of_property_read_bool(dev->of_node,
> +							  "qcom,dac-preset-short-cable");
> +
> +	priv->rst =3D devm_reset_control_array_get_exclusive(dev);

Both dt-bindings and dts patch only show a single reset. Is there a
reason this is a reset_control_array?

regards
Philipp

