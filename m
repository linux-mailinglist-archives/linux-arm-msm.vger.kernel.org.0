Return-Path: <linux-arm-msm+bounces-94241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NOVIHUHoGl/fQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA51E1A2BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0C21302C162
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE9B2DEA74;
	Thu, 26 Feb 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="obKdMJXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DB39524B;
	Thu, 26 Feb 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095294; cv=none; b=Td4ZI+d0tDD2beVSL5BXrHQspIN+I658vIZ60OaBwWiI4Dpbv+FQQGk1fHF0M21IIZkvxOrbzZdHIHa0DWoSLdEeiIR14GIvqKfTwTU6bNXw/ZdhPTcJAgzifvaxhEN9XjgCQfN/HaMcNLycdPSbSy3hYXVQJk0nmX4P/S8byVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095294; c=relaxed/simple;
	bh=vKdt4rq40Y5Khbvd8zfRF313SjSO/zYEU1eQdhH3zRs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=bPVEjDZrWrpdrlLCDfVif5xUX1L84p2K5YtyiwNtnF1X3Ws9V/aQ8Tko1C8ToZjMCXZt60ajHDpWcuULegmKembjT0TmhYEzaHebVkkePDVgiivAsys2KtSgV7vsmEYQcZ0n4s/zYbkezm//YfzYDCHJkKrZN3OJKMp1yImeEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=obKdMJXe; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mowyMJmjCIhMn0C2DG7n77SSsLvmJxlX5WvGffL0C9Q=; b=obKdMJXe/8mnt2hbHr3LvYnvXR
	pqsEItrQ+KugairnHpaLkTBtqa1T00DYAocIKx/e/s5Me6R3ojqf9lyQYxNV80Ovkr0K5EMCKC8zk
	zVLGDe+vuDLqNxJyX6WH0qmYlcZdxy7wNjyrbhedcCPSc53yllZKCn3V8b05I3wPn/UbxPOnzwkxr
	tWtlsGozmFQst0l1hgcqF2APjDH9HV/8tNPGpOOj2mx5bWD6Pz2yjt7SYjrCfLUeBAfJJaXTE5doW
	OupP4mMfPhXHqghFKZeC+R/Icy+TL3rdMbHjiIz1DlQ2ptHq1yNsZ+qyF6A1l6iEN21ct8VJbvYWg
	qrB2KT6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59150 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvWw2-000000007c9-0fSS;
	Thu, 26 Feb 2026 08:41:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvWw1-0000000AtJx-1VwF;
	Thu, 26 Feb 2026 08:41:25 +0000
In-Reply-To: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
References: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RESEND net-next 1/8] net: stmmac: qcom-ethqos: move
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
Message-Id: <E1vvWw1-0000000AtJx-1VwF@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 26 Feb 2026 08:41:25 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94241-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,qualcomm.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: EA51E1A2BD1
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


