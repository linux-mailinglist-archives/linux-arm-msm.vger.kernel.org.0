Return-Path: <linux-arm-msm+bounces-99669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLmyE+iQwmlEfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8B3095A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A4A5312E368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BEC3F7E75;
	Tue, 24 Mar 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bUBWfjeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4842253FC;
	Tue, 24 Mar 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357948; cv=none; b=BVtpodqAubeqp3zzPb1IpGOSe1/PvNJhDYG+RLQYbyq2LdAa44UI8XqHl1uoUSn3LYmzPzOTreHMSmqsIkUMBRU5sSFg1JcGm49PlJI0GV6f7dllzV6B6gx1bfilgXCtIldLowtt7cJ7ifNvPoH6jXMIktWd1ee3r24SFl7vMhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357948; c=relaxed/simple;
	bh=F9aH5jNh5xoP7lqq4rJ9V26D14ZBkOESpXvQmlGJKm4=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ftqL5X1/ANYUdbZRrpTFVUbqU6VqQ72u3yGAEY1Ce51HyC+3XtLQVtcwxGitwKG2Yy54FU44/FCmtiTR22S4nlPTdzq1aXpLh/b/llbLYmxWpCJjpDmIyYfB+7iidIzvECEtCskhQ1vtuOrVXcFhczzXMEIoDpXYoUFSgd1mbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bUBWfjeS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z6xJ9yI11IH59FTamt7w666fDdhb1//KWizsOFlXyj8=; b=bUBWfjeSJ6ql2P/Rwk1nvGovuk
	iOfOr6uBY5/gRDDwVencrE9g7yGvlk9Ib9mVB8vx8NK8tNsr2yRL4vz2o+Jz4reOL65rcxdqsxxsM
	q9lQBGXyIo3Ou3db0ahXn+AW4ieHueeh2tlcBlsDQ3AoGzlsPnE8TOiMRKOqRwHeppSQ8IYzTwpSK
	/JfI4sztRrljFmNe40evE8At9v4yYgbXTlv2jyNkWnRoSvt6H7WCgk1qGRxOir08fVRperY0PLeJm
	5Mi07B17Aj6Jm6aFdrh3IsUafyINFvbbwhx0B5HhKl70CyUChoWlWSc8Jb3FWj7kRsiCfHXIecu9Z
	Ev+DOX0A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Y9-0000000023t-21JK;
	Tue, 24 Mar 2026 13:12:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Y7-0000000DwVn-468D;
	Tue, 24 Mar 2026 13:12:00 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 06/15] net: stmmac: qcom-ethqos: move 1G vs 100M/10M
 RGMII settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Y7-0000000DwVn-468D@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:59 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99669-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: E2A8B3095A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_CONFIG_POS_NEG_DATA_SEL and
RGMII_CONFIG_PROG_SWAP. There are two states for these: one group for
1G, and the logical inversion for 100M and 10M. Move this out of the
switch into an if-else clause.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3540471ff272..87af44dcef5a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -404,14 +404,24 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed == SPEED_1000) {
 		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG);
+	} else {
+		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+	}
+
+	switch (speed) {
+	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -443,12 +453,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
@@ -479,12 +483,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-- 
2.47.3


