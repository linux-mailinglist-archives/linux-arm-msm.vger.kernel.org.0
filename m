Return-Path: <linux-arm-msm+bounces-111306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MlG0JpMqImqWTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:46:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B0644839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:46:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=J44XSzBS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111306-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111306-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB81E306D626
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 01:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD6C3C2B9B;
	Fri,  5 Jun 2026 01:33:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4263B7B93;
	Fri,  5 Jun 2026 01:33:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623193; cv=none; b=jNleUH5SYmuBX4d52xtCEfHXUGf1xuFfEnFSkqmKMBowI62LbeaTLVOyXU06VxjrG1si4Sbz29iafVXqYy8Sag++9cSedMg/8j4MTNij90p8DqtjDvpklI+x779Zt09lkZqqbdBbWoQrAiwzNYBny7r+1rMF4Xl7oXw6GtoKX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623193; c=relaxed/simple;
	bh=LWN8fiboKockRcgT6EHTV8jtVOiXIbjNSMKEl9uMPVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOdrf6275uFoSaGf4tTiQT3GHrkLgRMEG6h7NnC3uC10WBM9qSoOqv0i0+gIAcnbQ5vyw51DWmGKFLgwKdjV5DCxI9VgVs6JvYeZICtUyCr5Otl/dIrhr+415NBizZfhEt15POSz35F3MU7Yg/s00ppSyA+5gNPfo14T2RUZD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J44XSzBS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086481F00893;
	Fri,  5 Jun 2026 01:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780623187;
	bh=C2+SL4in8IWp8bHwp1BHBRMxAHSPizaARVU+G4BqjAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J44XSzBSG2WWnJM9HqAh3HKSMU6WfXyhYYRKRhL3TrELSDFg3fEY2US/zwdvvBkDz
	 fGFAkXjlIRU5W+99H5/aSBLEUTNWQRXPt685jRWG7FnpiJEwx+3NR4VjEB9G7oi40N
	 HhXzHzoFA0+TYkCStaT95V3jnqo6aZmDP8TaJEWaiotDDSVGrDlaGub2nP3grHn5zF
	 r0zF9wqOYIbxJxxKWNBAiNVDbsDCP2QzmAlkhW5CRNtBFbQ+G56vAd9WDzjCsWI6Pw
	 bhDGx2ffGvahk0PNn0AyfppA6cyLPDH2UKm2Fp1Czj962BmMC5Pg2SKCwgJtb9maaz
	 0gA4d5LfSUxgQ==
From: Jakub Kicinski <kuba@kernel.org>
To: devnull+george.moussalem.outlook.com@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	george.moussalem@outlook.com
Subject: Re: [PATCH v2 4/4] net: phy: at803x: add RX and TX clock management for IPQ5018 PHY
Date: Thu,  4 Jun 2026 18:33:05 -0700
Message-ID: <20260605013305.3533509-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
References: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111306-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:devnull+george.moussalem.outlook.com@kernel.org,m:kuba@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:george.moussalem@outlook.com,m:devnull@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,vger.kernel.org,oss.qualcomm.com,outlook.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 383B0644839

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

This commit adds RX and TX clock acquisition for the IPQ5018 PHY using
devm_clk_get_enabled(). It also attempts to manage power by manually toggling
these clocks in ipq5018_link_change_notify() based on the link state.

> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd42..b7361a14220d8 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c

[ ... ]

> @@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *phydev)
>  
>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>  {
> +	struct ipq5018_priv *priv = phydev->priv;
> +
> +	if (phydev->link) {
> +		clk_enable(priv->rx_clk);
> +		clk_enable(priv->tx_clk);

[Severity: Medium]
Should the return values of clk_enable() be checked here?

If clk_enable(priv->rx_clk) succeeds but clk_enable(priv->tx_clk) fails,
the hardware might be left in a partially enabled state without any logged
warning. Would it be better to explicitly rollback and disable the
previously enabled clocks if an error occurs to maintain a consistent state?

> +	} else {
> +		clk_disable(priv->rx_clk);
> +		clk_disable(priv->tx_clk);
> +	}
> +
>  	/*
>  	 * Reset the FIFO buffer upon link disconnects to clear any residual data
>  	 * which may cause issues with the FIFO which it cannot recover from.

[ ... ]

> @@ -1084,6 +1097,16 @@ static int ipq5018_probe(struct phy_device *phydev)
>  	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
>  							  "qcom,dac-preset-short-cable");
>  
> +	priv->rx_clk = devm_clk_get_enabled(dev, "rx");

[Severity: High]
Does mixing devm_clk_get_enabled() with manual clk_enable() and clk_disable()
cause enable count imbalances?

Since devm_clk_get_enabled() establishes a base enable count of 1 and
registers an unconditional devres teardown action to call
clk_disable_unprepare(), manually toggling the clocks in
ipq5018_link_change_notify() could lead to a few unintended behaviors:

1. The count initializes to 1. If the link comes up, the count increases
   to 2. When the link goes down, it drops to 1. The hardware clocks are
   never actually gated since the count never reaches 0.

2. If the driver is unbound while the link is down (after a manual
   clk_disable()), devres will call clk_disable() again, dropping the
   enable_count below zero and triggering a kernel WARN.

3. If phy_stop() halts the PHY, it invokes the notify callback before
   phydev->link is cleared. If the link was up, clk_enable() is called
   again, inflating the count to 3. Devres cleanup will then only drop
   the count by 1, permanently leaking the clock reference.

Could this be resolved by using devm_clk_get() instead, and handling the
prepare/enable states directly?

> +	if (IS_ERR(priv->rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
> +				     "failed to get and enable RX clock\n");
> +
> +	priv->tx_clk = devm_clk_get_enabled(dev, "tx");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "failed to get and enable TX clock\n");
> +
>  	priv->rst = devm_reset_control_array_get_exclusive(dev);

[ ... ]
-- 
pw-bot: cr

