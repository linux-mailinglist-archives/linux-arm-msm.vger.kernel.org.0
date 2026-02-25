Return-Path: <linux-arm-msm+bounces-94055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP0OCMC7nmnwWwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:07:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483D194A37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BC23015A40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D41324707;
	Wed, 25 Feb 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bEBpDHzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84983016E1;
	Wed, 25 Feb 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010129; cv=none; b=Ks6xgynjr6U4d5w6FcQoRn0KvSrfj7BRP5VeJ0IU4jmIbhDaTJEQ7cDFAXbgi8/7NoNH1umlknbfGK1JrmTOXl9yoZ9vmkcxf6efb1LB7aF4cDdLs3DdG9UJpy4iqn1jkZyDzwmo8H0mKeF08Hm0W1GUwm5zRxHxY/SxwJZA4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010129; c=relaxed/simple;
	bh=vKdt4rq40Y5Khbvd8zfRF313SjSO/zYEU1eQdhH3zRs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=GC4oyP0EVr3mw5iVinzloojXT7I67+olFHQPCLh+nq7hbCJGV3kT0kFIIMIPn+E3+SQxTMu/9Kyu5+WJ2KmBEJboMiWxRUT9e+1/QxEvOdaoHRKUwoBrLXaFczNZ/75lEWbTqwe1TTf8gyjBhFptAYaX+8w8Z7k36pPwmv0CoZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bEBpDHzt; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mowyMJmjCIhMn0C2DG7n77SSsLvmJxlX5WvGffL0C9Q=; b=bEBpDHzts68BJ0zXCDw24NM/XI
	QWAzg4kuuaCd3Zx20ov3yRWzSDTXQr2UI4+mpAzJvPiijuLpgoyhHdnERuYKxWtg5JtoRAxL7ivmy
	f/hwNfgP2ZolFKsjfajy8d+0mfTPLqbEI2S1w0Zsk9uBT5UYof+8+Oyap2K/nzDjAcu/2jJuKbGPP
	w2AEwLk5KsLLYoFS4rDxIJI/4OePXoLJRwEqwde1zNTTDXgxa5OoysPyuxxhB0Rexhy6P8F7csU5b
	BMsVHZdG/zjXkn6J/JZEFJqb7kstCR9oS54153Is3i0q28OTXvLE/e9UwLSIW1LxgV2S4hjIKV36q
	NcUV7tjg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45458 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvAmP-000000006FK-3QeP;
	Wed, 25 Feb 2026 09:02:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvAmP-0000000AqoT-05Di;
	Wed, 25 Feb 2026 09:02:01 +0000
In-Reply-To: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 1/8] net: stmmac: qcom-ethqos: move
 ethqos_set_serdes_speed()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvAmP-0000000AqoT-05Di@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 09:02:01 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94055-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 8483D194A37
X-Rspamd-Action: no action

Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
simplify the code.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ad5b5d950fff..57cbe800f652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -591,14 +591,6 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
 	ethqos_rgmii_macro_init(ethqos, speed);
 }
 
-static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
-{
-	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
-		ethqos->serdes_speed = speed;
-	}
-}
-
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
@@ -683,15 +675,23 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
+	int speed, ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	speed = SPEED_UNKNOWN;
 	if (interface == PHY_INTERFACE_MODE_SGMII)
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+		speed = SPEED_1000;
 	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+		speed = SPEED_2500;
 
-	return 0;
+	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
+		ret = phy_set_speed(ethqos->serdes_phy, speed);
+		if (ret == 0)
+			ethqos->serdes_speed = speed;
+	}
+
+	return ret;
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
-- 
2.47.3


