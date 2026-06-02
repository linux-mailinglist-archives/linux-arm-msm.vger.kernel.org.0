Return-Path: <linux-arm-msm+bounces-110721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNKeCyF+HmrnjgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:54:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665C62939F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 007113086350
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28DC3A9851;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3CKRjJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43173A7193;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383047; cv=none; b=m/Gv2ysnFLeOe6ZB9unYkn2oekoPOyOCfrDF/B4p718ofZdV7c+v9xbQpmk3fwIUQHanEK1SclMRIXsE5767va0lkQKlItGiToXJHIX3ynDopLx3Bsfv27h78yN5mofSZx8MueDJTyIJ3++PyTLwsdq5VygMgF1EZi0cwhfrgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383047; c=relaxed/simple;
	bh=QG4Z1lJud/2m0d4pUKcPCuFCd9HmCmJz7ekPrVHzQfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgcC/KyyBSpTepTiMca5YWrNop0nLabwPtD449eIKxJJqslQeAil5IQ6LYEVMhQ1VY1URYXbYUbgHzF045buElSeFl4QrSeDggijcwbiKOcZft3eHLsdYPRywJr89iiop+MKVHR0OmH66grxbQ6wwU++HorZObMsQObuM4lqHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3CKRjJS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96194C2BD01;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780383047;
	bh=QG4Z1lJud/2m0d4pUKcPCuFCd9HmCmJz7ekPrVHzQfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K3CKRjJSHdyaAxXOe8jBBMVkMwMzJ6wFfIA/xtQb+xxxDF5JQfbNAl+IJ/VZ4Ow1U
	 r4nBLISRsoYVekuaYRSN8ybyaZYYMMJ31dT0igxUb6d62hOV1RTkcpvwXdOmNgZcXh
	 GO2Ys1wuJ8ivTrGXCQLo47yLUVdWJpGbrxWWhyqQAfn0eltX6nbeAynVO8QDqu3OCK
	 kPgiBua9e9QApHVN4kKzupgxVrWAoR73GEcnI+gKu1hOcmplC2egpDwHsozP0ruFdg
	 IdxH2og12bZm4bqCnOvl6yMHR0ePDf2reaopW2/UkBd1Y6ApIhoQyKXZb2fCHVtjR1
	 lb3kc8L3zskVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD2CD6E57;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 02 Jun 2026 10:50:40 +0400
Subject: [PATCH v2 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383045; l=2335;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=k3J1uSCRHsxM9xs2etq4AynajTAyY7ew0xbYTGGX5vo=;
 b=XC5MLpTjeARQV5btxnH3uknIg5JztVn3Er5vSILfOriN654qinR4wnWCSN1B5UZvEJ7YlWLqc
 0iQjrlnoEJwC2KaGibXI3KCX9TFRvlgCfTjHcqt1nqkAfBJbc8wP2hi
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110721-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 8665C62939F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

Acquire and enable the RX and TX clocks for the IPQ5018 PHY. These
clocks are required for the PHY's datapath to function correctly.
In addition, gate the clocks upon link state changes for improved power
management.

Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/phy/qcom/at803x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 63726cf98cd4..b7361a14220d 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
 #include <linux/phylink.h>
+#include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/phy_port.h>
 #include <dt-bindings/net/qca-ar803x.h>
@@ -176,6 +177,8 @@ struct at803x_context {
 };
 
 struct ipq5018_priv {
+	struct clk *rx_clk;
+	struct clk *tx_clk;
 	struct reset_control *rst;
 	bool set_short_cable_dac;
 };
@@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *phydev)
 
 static void ipq5018_link_change_notify(struct phy_device *phydev)
 {
+	struct ipq5018_priv *priv = phydev->priv;
+
+	if (phydev->link) {
+		clk_enable(priv->rx_clk);
+		clk_enable(priv->tx_clk);
+	} else {
+		clk_disable(priv->rx_clk);
+		clk_disable(priv->tx_clk);
+	}
+
 	/*
 	 * Reset the FIFO buffer upon link disconnects to clear any residual data
 	 * which may cause issues with the FIFO which it cannot recover from.
@@ -1084,6 +1097,16 @@ static int ipq5018_probe(struct phy_device *phydev)
 	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
 							  "qcom,dac-preset-short-cable");
 
+	priv->rx_clk = devm_clk_get_enabled(dev, "rx");
+	if (IS_ERR(priv->rx_clk))
+		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
+				     "failed to get and enable RX clock\n");
+
+	priv->tx_clk = devm_clk_get_enabled(dev, "tx");
+	if (IS_ERR(priv->tx_clk))
+		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
+				     "failed to get and enable TX clock\n");
+
 	priv->rst = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->rst))
 		return dev_err_probe(dev, PTR_ERR(priv->rst),

-- 
2.53.0



