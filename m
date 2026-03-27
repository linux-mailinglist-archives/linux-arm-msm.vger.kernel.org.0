Return-Path: <linux-arm-msm+bounces-100221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFDIIfVDxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:46:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154C341424
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8C7B301C6D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03263D903C;
	Fri, 27 Mar 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="u6GQkVaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF113D8127;
	Fri, 27 Mar 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601079; cv=none; b=pNmnuiu5P9nB+P9ntXuVG82i04x36aNsiR6Vlri7Dk5uCcIyWQgrm4IFe1ISE6ifrHZ8XcewdyArjQjINboIEBDi/o02SPei0XmRhy+JJibroWPdYIRv3r0V5eHNs8SL1kcj6ZQtM9f+2NazUxACTAx1HDM5SkG2BIzXIqaX2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601079; c=relaxed/simple;
	bh=FMMthNOrz7V85dYUV9SHCFMtsmb6VbO8IS2sO5SY8vQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=fI7Lbid5SKnpyZ4gti5wQ2USQA1LY+KZ1CSVV+WMK+0ilbHBAeWFe8zbuQLCGGVQM15ZLG5TKL3k4em+7e9D1ib2tqJ0TgNwu76ZIMsaAcA8jDWeFEoVbwzXmRtBUCCpFngWPZ/D1+B2WudqGHshbGQ44AdstoCwn6iXK73LEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=u6GQkVaa; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7LNWaMcIs4JGbtFmo7TG6CV62xRuHUPhsuBNMqPht2M=; b=u6GQkVaaGpeJLFrK/LsXhFNrKb
	UyXf2KeIKozmFd3gLA/yPLk9Z9B3b+Lra3c7cuZmzErF5i5BL/OTMyjtXS1afDU9Gn54USnYF5/hQ
	OS5Ejpm+IYlRrADWIV3Ia3Jk4u/mqymzpx/pOYSjvn1nlsN82ke2yiWAIcx7FkjP+V2E8s8TvAMru
	v3j+v4qX1UjOIv9xqFM7fB2knM/UcvXP49Vo9c5gjTpCLNCjk2CID0J/07wuPQKsy/lnpEOI6Z4vr
	dVmM1aBFGqE+q3Fb6A+hr/ObQeEwXsq9yLrKESIkcrSoAJSGUG4+cY6CtdqHtk9He3PUAh8rOFhJ2
	JSWf3NAg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56514 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nr-000000005rd-09Pp;
	Fri, 27 Mar 2026 08:44:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62no-0000000E3Cw-2EmH;
	Fri, 27 Mar 2026 08:44:24 +0000
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
Subject: [PATCH net-next v2 12/15] net: stmmac: qcom-ethqos: simplify
 prg_rclk_dly programming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62no-0000000E3Cw-2EmH@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:24 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100221-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0154C341424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rather than coding the entire register update twice with different
values, use a local variable to specify the value and have one
register update statement that uses this local variable. This results
in neater code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7690ae0bb008..580deec1dc30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -374,6 +374,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
+	unsigned int prg_rclk_dly;
 	int phase_shift;
 	int loopback;
 
@@ -461,16 +462,16 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 */
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
-			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-						 115), SDCC_HC_REG_DDR_CONFIG);
+			prg_rclk_dly = 115;
 		} else {
 			/* 1.8 ns */
-			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-						 57), SDCC_HC_REG_DDR_CONFIG);
+			prg_rclk_dly = 57;
 		}
 
+		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+			      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+					 prg_rclk_dly), SDCC_HC_REG_DDR_CONFIG);
+
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
-- 
2.47.3


