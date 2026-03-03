Return-Path: <linux-arm-msm+bounces-95168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKjBJzIEp2k7bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:54:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E991F3053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAD6F3026B5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A562492519;
	Tue,  3 Mar 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="lGt6OcXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040E492517;
	Tue,  3 Mar 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553261; cv=none; b=gNyu16Kk4tTDtuPmMiPCIcBnywNCJKqBL/JovHpstFSQwhK+BJwOMSayJbdPwcDIF6wwKl9+9i5gYpFeCzu6M4j5seEHA5X3SBxQ1o9UeVlQrBD4MDjhXCO0Qm55MaIwbQXQCS7Jf2hrqzi2SGeOFnhmDEYeQi2UOvLz1rZLeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553261; c=relaxed/simple;
	bh=9SUN97ZiL34DOUQytHdeTX2kIUaF80J/YGNVZhBoYzA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=c4tIaDsYNTpfdSJ1RyDGBsMhD7eBsWTVQcJOl9k/0u8JmEG59WD/vN9F3XzMjTJuOQYAkLJ5aCFFT09/ICJ3j7BWsJwQLGEY+kyVA8kIEi/eBWWBzQZOyOnOb3+V+e5Mr+6YGcryC2yi7DXkYM/CuXb/IpxxXE5s2zvnp/ttfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=lGt6OcXC; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V8KDgIkpcmCGC9UdHJ9+Z0NC00Ap0an/G+dXrnKdvp0=; b=lGt6OcXCJhYYjeDuaZqgykXJRP
	vADhEyKbi/8VtOLbu0zTxtHqfAIQvvSfSQUWG7BmZwQIcBZNv0qQJmkzMCej4IrV4d+HrRfV/FVu2
	YbUlRNkZpGvyJrzuJbVMju0kqzFA/PvQFXuDyHQK+v9egbP1BTh6RQ+zEWe89Hs53pt1fWPuHc9Bm
	CsL7gUgSH5aTA1zpnFIGlagcYE2oAEPR8hYtuWtJdU24DbYzf69ho2M557R/fM5yEmAW1i/vZYqcl
	eZIptMJC4jo2CruTJmMUAFwQljvxzFKQnhGoZhwanv6FJkhxxz6k93I2uYbpJ6v0hKUE3vX9MYSuU
	1EBOAbZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38696 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxS4R-000000005Kw-1mG6;
	Tue, 03 Mar 2026 15:54:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxS4P-0000000BQXs-0vGB;
	Tue, 03 Mar 2026 15:54:01 +0000
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 6/7] phy: qcom-sgmii-eth: relax order of
 .power_on() vs .set_mode*()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxS4P-0000000BQXs-0vGB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 03 Mar 2026 15:54:01 +0000
X-Rspamd-Queue-Id: 89E991F3053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95168-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.271];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:email,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Allow any order of the .power_on() and .set_mode*() methods as per the
recent discussion. This means phy_power_on() with this SerDes will now
restore the previous setup without requiring a subsequent
phy_set_mode*() call.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 6332ff291fdf..f48faa2929a6 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -271,8 +271,17 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(data->refclk);
+	if (ret < 0)
+		return ret;
 
-	return clk_prepare_enable(data->refclk);
+	ret = qcom_dwmac_sgmii_phy_calibrate(phy);
+	if (ret < 0)
+		clk_disable_unprepare(data->refclk);
+
+	return ret;
 }
 
 static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
@@ -318,6 +327,9 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	if (submode != data->interface)
 		data->interface = submode;
 
+	if (phy->power_count == 0)
+		return 0;
+
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
-- 
2.47.3


