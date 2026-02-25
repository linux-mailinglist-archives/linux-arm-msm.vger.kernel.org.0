Return-Path: <linux-arm-msm+bounces-94082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ef7Ki/WnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:59:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA819626C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76D9130351FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6501D393DF4;
	Wed, 25 Feb 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KWLT9rNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641C393DFC;
	Wed, 25 Feb 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017187; cv=none; b=dTp/5ZY9X3THR9dpwJEz6ynxjfJGQ52r+aIyGFIXbV0I9sojnU6P29+IMcQ63cVadAQoCtq8QM0jwP84c0P0iousGYdP4c0qg6x0ie5nK1xC4q4ffcRkVPJP1hTlTKW0dol3p0wBSBXQVaM1nAW7DtY0r5/JJYs6J96sf+inpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017187; c=relaxed/simple;
	bh=N2/nyi390A6kd2kI3JLsZpboqij8ThwVv2LfZFmj1Gc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Y5zY0PoTRgAT1WovckTXG7x3YO5d3p0XPQplyQnSIg1q2cwxXiQDgw4BUrzhqZddec6ICBjO1+hsCshm14PplF9NtW7pUI8F4RZipUPUICXhNoRnQ6KOjzx6ta3fecPNbuy6zICxFRtaVdFtGSpL8S5Pr4HeSrbLjQtobQddFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KWLT9rNM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V2RTQw+ogEpkEF+1D1BA00eXUxPsS4wmBFO+lcx+xOk=; b=KWLT9rNMJhbHBTc09qQNbejXm6
	t7TJoKmDzK8aRmMRDcgj/+xMiQOUtReCpBFDxiG2lmwLhajE1eKvyNWKtGnOFCeISd7jYympgBFjC
	2aDVT4x13sINVkBiYH5KroJOZKjQiO1MT++uO3Gb1GrhFDwn1DOEICRFPKd6enRreJltwtAeinGUZ
	aQT9UZSoTYixfcoS5evu+UmNKZxE+D6wmmw5/Z7WoX4XwydCZJNufPhfeFmQwrSoTXkgdZgY5fML4
	gKnfdvAkCue+o+wpxbR8QREgnlwJOIJRxNvRG+0+V022K9Ipbwi75zOvdFYfMTnTmMhn+ksdgmdKk
	8jyeg2Vw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59910 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvCcA-000000006Vh-0T0B;
	Wed, 25 Feb 2026 10:59:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvCc9-0000000ArLG-0if1;
	Wed, 25 Feb 2026 10:59:33 +0000
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
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 6/8] phy: qcom-sgmii-eth: remove
 qcom_dwmac_sgmii_phy_interface()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvCc9-0000000ArLG-0if1@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 10:59:33 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94082-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4DEA819626C
X-Rspamd-Action: no action

Now that qcom_dwmac_sgmii_phy_interface() only serves to validate the
passed interface mode, combine it with qcom_dwmac_sgmii_phy_validate(),
and use qcom_dwmac_sgmii_phy_validate() to validate the mode in
qcom_dwmac_sgmii_phy_set_mode().

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Resending as netdev (and others) were missing.

 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 27 +++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 58ff15601206..6332ff291fdf 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -290,7 +290,9 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
+static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
+					 int submode,
+					 union phy_configure_opts *opts)
 {
 	if (mode != PHY_MODE_ETHERNET)
 		return -EINVAL;
@@ -298,7 +300,7 @@ static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
 	if (submode == PHY_INTERFACE_MODE_SGMII ||
 	    submode == PHY_INTERFACE_MODE_1000BASEX ||
 	    submode == PHY_INTERFACE_MODE_2500BASEX)
-		return submode;
+		return 0;
 
 	return -EINVAL;
 }
@@ -307,27 +309,18 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 					 int submode)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-	int interface;
+	int ret;
 
-	interface = qcom_dwmac_sgmii_phy_interface(mode, submode);
-	if (interface < 0)
-		return interface;
+	ret = qcom_dwmac_sgmii_phy_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
 
-	if (interface != data->interface)
-		data->interface = interface;
+	if (submode != data->interface)
+		data->interface = submode;
 
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
-static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
-					 int submode,
-					 union phy_configure_opts *opts)
-{
-	int ret = qcom_dwmac_sgmii_phy_interface(mode, submode);
-
-	return ret < 0 ? ret : 0;
-}
-
 static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
-- 
2.47.3


