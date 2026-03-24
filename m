Return-Path: <linux-arm-msm+bounces-99674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOVWGPyQwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C93095D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E9D31B58AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156BC3DD508;
	Tue, 24 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="nyMt7hxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B03F8815;
	Tue, 24 Mar 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357979; cv=none; b=W19NuT5rmMU1XXnb7uiYW0L1DE1yTNt14kz0z4mn3NklmQWH2+l9EwCIO7TobH0PZXzMcJrZlEhQBeapY6xmDfa0hWMLjx4ssvZs3ma6Ge1T19pLcGBAqdrPzWTt1J9WNUOqyKPe0gkUO9JP1sk1VKufZIERbozD45tGlUly1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357979; c=relaxed/simple;
	bh=7FzGcgvCpri6jsthzJIHRWu9MZjxhI1cVNgJBTR+KeQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=FgUwStKXxpsWpa5rJTmHKqKeCnOj9vlaIk+4XEE7nEe5+oYEGuHsRy/8HNek9AVYAEqLXx4u+vKnKG905aGOnlFYM0tTz4vxYiNX+tR4OcicxLcIFHXmz8y3Wi/Yl5Ltw6My/ataBfJVGvfcWA6Pr3i5dCoN4iUsEA/w95HsgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=nyMt7hxR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2eOYH6WpLrDJA82pSI/O7LsvwxkgmULv2tHcZTUcnBA=; b=nyMt7hxRFjAfgwNsl2cuiDux54
	l+ipcaegQSV9g3ZzHpotW+H6ul4wa19FodLp8Fu77BpeaYFtaj6gHPWTe3SaVAOgpGeyBQelQmJUS
	EUx629++EBIoA8NtDtCFzA74juIzn6St0XMmJFKrbBtNIF9yg6asg7+7p1/syOpqm2riu3SAg9zBn
	k+5sBjjc5s2oPrmge4K9cyBelU5eDwJglLKgAO6IB7+c1crWcQFUTia1mbExKUw4hSG5B1qiVKPF6
	9qJow5yEwqtyZqT8CVuJyTF0GZUAGAXWG33hzwP8EfYgslfUlWud6Y1IVJ3r0WlA1jPmWtUiKTZAd
	HPesQ04g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38288 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Yb-0000000024z-2syJ;
	Tue, 24 Mar 2026 13:12:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51YX-0000000DwWG-2y4S;
	Tue, 24 Mar 2026 13:12:25 +0000
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
Subject: [PATCH net-next 11/15] net: stmmac: qcom-ethqos: finally eliminate
 the switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51YX-0000000DwWG-2y4S@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:25 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99674-lists,linux-arm-msm=lfdr.de,kernel];
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
X-Rspamd-Queue-Id: C47C93095D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the RCLK delay configuration out of the switch, which just leaves
the RGMII_CONFIG_LOOPBACK_EN setting in all three paths. This makes it
trivial to eliminate the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 47 +++++++------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a24f0b24f778..c88c693137d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -444,8 +444,18 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed != SPEED_1000) {
+		/* Write 0x5 to PRG_RCLK_DLY_CODE */
+		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
+
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
+			      SDCC_HC_REG_DDR_CONFIG);
+
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+			      SDCC_HC_REG_DDR_CONFIG);
+	} else {
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
 		 */
@@ -460,39 +470,14 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
 						 57), SDCC_HC_REG_DDR_CONFIG);
 		}
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
-
-	case SPEED_100:
-		/* Write 0x5 to PRG_RCLK_DLY_CODE */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-					 5), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
 
-	case SPEED_10:
-		/* Write 0x5 to PRG_RCLK_DLY_CODE */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-					 5), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
 	}
 
+	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
+		      RGMII_IO_MACRO_CONFIG);
+
 	return 0;
 }
 
-- 
2.47.3


