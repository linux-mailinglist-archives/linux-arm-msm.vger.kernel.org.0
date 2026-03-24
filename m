Return-Path: <linux-arm-msm+bounces-99683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LyfAiqSwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:31:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C602309737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E18DF317361A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D9C36DA09;
	Tue, 24 Mar 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OM+YlRhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541F3845C1;
	Tue, 24 Mar 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358409; cv=none; b=e/N86JnS7XwWv4efXvAazpSTbGDv0CuZkkX83UG5lWjn8SjmFXoTPpIKe5u+twhdx5EWUR7STVAQMbXRh9U7yf/hxk+EorO6KP3aNLy9eiPmVtsSLaAHbWV1hz3WKR4S3atvJ81DnyioLJjP7ycfnVw5RrL8flXZYrIRjd9rrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358409; c=relaxed/simple;
	bh=qUVAbqHbRVQBQKNw3UXWmjGiK4RDaKme5PKt7HpqiSk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=K2O6gaiMxLaA2Fqh0m/LXECxW8HOZoqfZjJsTMqqdNQuSfV4S+1LAJWRWzG0HWLQsGObVwlQHYESFsvdTQSHE6O0KvvoYtvodMiW9Oz2lHVArBzNcu03iCYrVKfs+A8xfYeBoKe69gq+ez4sOgGAh71Vd3ozuddCTbkqxgalP5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OM+YlRhw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I1QZg5J1wBw76UYVfAUUPPw5lf/Tu4jryU0wvfBdZZ0=; b=OM+YlRhwgM/rwbeTnYrY4ZL44V
	lUn4S9oTaZaq+kFO+G4NTj+BZyi9UrFrgCXhtd7hJAet6LQNmnD7OQ2zX0P8B8RxsLL9LEoz6O0P2
	JT6OxIWIl6mwb7os+PCDDiS8FEhI+8lkbbd5FrrCB94C6q6cJuxxJoIojbSE7aYWr5Xw+7ay7C+Bg
	zEsOju5yaUl+3+55rKZJDftK1+PmcxU4/L1MU+R/s8vchp1NI8FYGeCYm4s/6prWZnz7vuP+MrJHp
	PPkIpP80fFMnVyavGODmG577GD/LfKRaYRrAzjMwGgPruWC5ovQjFjR9dmJrkeAJuw1UcpR9OMK3D
	oyASmLwA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50596 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Yn-0000000025J-2OOn;
	Tue, 24 Mar 2026 13:12:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Yc-0000000DwWM-3REd;
	Tue, 24 Mar 2026 13:12:30 +0000
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
Subject: [PATCH net-next 12/15] net: stmmac: qcom-ethqos: simplify
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
Message-Id: <E1w51Yc-0000000DwWM-3REd@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:30 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99683-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 9C602309737
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
index c88c693137d6..f9d6e97f197a 100644
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


