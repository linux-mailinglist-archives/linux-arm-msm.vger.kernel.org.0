Return-Path: <linux-arm-msm+bounces-100217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOaQKWNDxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:44:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9E341367
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B617B302A9ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E070C3D3013;
	Fri, 27 Mar 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fe7efF5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092D3D6CDE;
	Fri, 27 Mar 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601056; cv=none; b=NHqo0cCEQWetZaomdjwr+IIOHJ4CRpuoI2hwWQ3s0zyYo3cpBW0wpf+Tm04PFHvrtoN0HDo6mT63KUUefXbb5xcuNDld5Ce6HEH68xuX93+NS/AxYwNHwV9pRPVsDg8AwLryUgHTVuVuR4CXtNLlwm/dBr6jY29q3MQmwsfk2Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601056; c=relaxed/simple;
	bh=tOmf8oSNMo2WIxPXQiSSad99JtdxbHIX/Y7HwDqXLpA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=FC7BFA2u/V7F63mEG/sTvrJCL1bDJBG+HLnqx0jFdRc2EVZ8L86u7pkwt4CWVKQs4cPxJX0Th4DP5jhsNKlZC4B1Rf8v7+mADivTKkoWopoLStja0ptAY5qZDgwFNBXO0Bd3agdaRDduvVfhcVEKf92nkkCDqzlttmQor8Rey6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fe7efF5o; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hd0sWBM2OM1rdqnBIBJlkOn5N0UauBaG3AbL50eeN1w=; b=fe7efF5oujZztBClZ4gn7HX8wD
	s7PgETBENnYHwOWGk0FW2PWqi3IbseW+4q4Ya2pb9kC6lMEca4E7XZI9x2nOH4+M2FEHtKpgCh9ot
	fOdac6ApK4co/qmh0brgMpgYQHhDAHnl6UB+XjbXW/C0Ga5z9SiDEBYJPNxd37OF5hos5/DVQr5Br
	OhQgfY30oBLAyvZvFJRlyCzOpXG7PcUXJ5pPAN6qYBTLXQopbFxHCi9XdzG1JqD8RiT8ZezrYnUCt
	XKSrSov5fDcHf4KbVPf3AW5fl2mR72hs3Cz3IPPbEPGkoxtpUvZIXqiqOMG0hCyscyVRRA0usHCBf
	e7zH9j2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53562 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nW-000000005qN-1cx1;
	Fri, 27 Mar 2026 08:44:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nU-0000000E3CX-0KF9;
	Fri, 27 Mar 2026 08:44:04 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 08/15] net: stmmac: qcom-ethqos: move 100M/10M
 speed programming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nU-0000000E3CX-0KF9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:04 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100217-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EA9E341367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the speed programming for 100M and 10M out of the switch. There
is no programming done for 1G speed.

It looks like there are two fields, 7:6 which are programemd to '1'
to select a /2 divisor for 100M, and bits 16:8 which are programmed
to '19' to select a /20 divisor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ab6554f58214..2751def922df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -425,6 +425,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN, phase_shift,
 		      RGMII_IO_MACRO_CONFIG2);
 
+	if (speed == SPEED_100)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
+			      RGMII_IO_MACRO_CONFIG);
+	else if (speed == SPEED_10)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
+			      RGMII_IO_MACRO_CONFIG);
+
 	switch (speed) {
 	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -453,9 +462,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -479,9 +485,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
-- 
2.47.3


