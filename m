Return-Path: <linux-arm-msm+bounces-100218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKpfFdVExmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:50:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E983414CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9878E30FE2B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30043D9053;
	Fri, 27 Mar 2026 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0pTJoRAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8383D8127;
	Fri, 27 Mar 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601062; cv=none; b=q4Ni5gCrcvvcEKUa8+sZHu3AwAg2zlIrq8ggeykSbh+LZ9M+uXj+oJKNiDRCjpxQRwOaYmhlmwHfqdTWshSsIT30lMDx5drpOJwxZUHCpBFH3TQAzVuvf2p4XqVfvGE84cGViZKahRWpiDVBjZTlWoKls3GcZX/NkooafvVsXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601062; c=relaxed/simple;
	bh=5GFSP/VAPgduD3tmbB4ClGoLT9wJPOSBs7nnGU0YTaA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=aMSpcpNbNEka/UmMDrlV0gByht32hfN+ELG0iUfSmHHnjCGRvKqT6cnCjoUlYrce74wX35w2zrOQtl3jwr/Ho24N/aO9M4XyBPaiN8M2p21DlqTwzIOUw6szSoRFMDbFqLTvZ9wLKD/ymDn5WsNDUgLi3LI23TaJgwL5Gxnyc34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0pTJoRAj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tibx8vMHnptfbpbnZSF056sU8aLPqP44jmZNN4Qx7ek=; b=0pTJoRAjwemnv5nkxuXicwRVqa
	+zYlOE/UPTBpsxAPRefqK9Qf5PQ2kYqrNMRSHxpM6W86z0udBdSjBQ3NPPP8++/Fpq5kzzl8VbVKJ
	Sat+froEoBrPdSJKiOfEvgmmq3DVXCLkarIIYHHgULiucgyLqimrEz48ipRJD/i61bMuNn7+gVxjH
	G/JybZcBuzgwzZLzGnCMYLEK7JbZbVHlKvfFeGSLcGj3yNIqYxZTp8O/t6rntBwTMyWXTsy+eO7IB
	/oHwCDKh8R8sv+p51RDswyeLse3dJn79DV8XQDhsxVxxENHem96nnR98Cc1M67mk9TFUBGTLc6B2C
	2oYVqZBg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60928 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nb-000000005qg-3v4L;
	Fri, 27 Mar 2026 08:44:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nZ-0000000E3Ce-0lyP;
	Fri, 27 Mar 2026 08:44:09 +0000
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
Subject: [PATCH net-next v2 09/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG2_RSVD_CONFIG15 out
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nZ-0000000E3Ce-0lyP@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:09 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100218-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: F0E983414CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All paths through the switch clear the RGMII_CONFIG2_RSVD_CONFIG15
field. move it out of the switch statement.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2751def922df..13f4df0a90d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -434,10 +434,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
 			      RGMII_IO_MACRO_CONFIG);
 
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
+		      RGMII_IO_MACRO_CONFIG2);
+
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -462,9 +463,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
-
 		if (ethqos->has_emac_ge_3)
 			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
@@ -485,8 +483,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
 			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
-- 
2.47.3


