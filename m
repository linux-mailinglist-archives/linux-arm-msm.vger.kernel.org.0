Return-Path: <linux-arm-msm+bounces-94081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MDSBSHWnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:59:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B261A196237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A9603030FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391CE393DDB;
	Wed, 25 Feb 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1E0QKOIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEF393DEF;
	Wed, 25 Feb 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017178; cv=none; b=E5G+TcI6zDjn1V2g3htJOt6yIG9OQk5gRH/O3cyrfDFLwnqwCCrVeiNUwU1jbeHLO8ilC5qBAdKN+bAk3CnMsKvd82ktqW59UuFecu1gTnKnbaJZCQwM0Yl99o4bDgLNptQhy/EscJblS+107idxzOWlGV4aaKaNE7n43Ci6cxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017178; c=relaxed/simple;
	bh=ewq6wza2IRAHqn7VmdR8c76xRfMyOIHr34i6Yy+pNwM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=QUSW0xuDFZl7VnAlfwLTDkU81F0OuLatANgP+BOx8BE3Ge5vxwBRDyMk0fuBJL2dNVMK3tnSFuZjiGH7ratyGcTjDlZX5c3JNt1Kzl+Vmd+gwR3KQjfAJgpCnyZhFeaEwHzwC53B+27tcNtKN/9Zm7wSfrd7UM48Og2ORTak/Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1E0QKOIs; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TR+ip4GY7/Xn+GP2pMAGAJCLuTyWCMTl4esdO2t/EdY=; b=1E0QKOIsxLX/AGDvNdVlEqij21
	HYUgkYHdcPH6f996QJmnVJBwcl5X8LZ77Pbs26Jvio6o7u5krAgxGUq2I3kfHP5Mlf06f5bVpO7OA
	4jmEUQeiNtqGSZPe0tHlX1jLZrg7pWoQRVlpzfpj4gfqqV9rZKWkP1iz6hZeHwOhs+UzLZPzADHcp
	Pz7Y2zbYREpI8FQ0twcIxh1AHzSyIgzfhQ9OGkXB/T27buJ8cilzZ25HRnIQvWckPexDZSm7xtKER
	q3YcV01naGR6jVyN6annDNh2a4g5qln438XfOzm6BXps7icREsNG3jxJBrKvuP+TgCzT6wso6EaDe
	PrfvJvOA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53494 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvCc5-000000006VO-13zY;
	Wed, 25 Feb 2026 10:59:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvCc4-0000000ArLA-0Eix;
	Wed, 25 Feb 2026 10:59:28 +0000
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
Subject: [PATCH net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode for
 SerDes settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvCc4-0000000ArLA-0Eix@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 10:59:28 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94081-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: B261A196237
X-Rspamd-Action: no action

As established in the previous commit, using SPEED_1000 and SPEED_2500
does not make sense for a SerDes due to the PCS encoding that is used
over the SerDes link, which inflates the data rate at the SerDes. Thus,
the use of these constants in a SerDes driver is incorrect.

Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
uses the PHY interface mode passed via the .set_mode() method, convert
the driver to use the PHY interface mode internally to decide whether
to configure the SerDes for 1.25Gbps or 3.125Gbps mode.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Resending as netdev (and others) were missing.

 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 41 ++++++++++++-----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index dcfdb7d0e8ea..58ff15601206 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -29,7 +29,7 @@
 struct qcom_dwmac_sgmii_phy_data {
 	struct regmap *regmap;
 	struct clk *refclk;
-	int speed;
+	phy_interface_t interface;
 };
 
 static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
@@ -223,15 +223,18 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
 	struct device *dev = phy->dev.parent;
 
-	switch (data->speed) {
-	case SPEED_10:
-	case SPEED_100:
-	case SPEED_1000:
+	switch (data->interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+		/* 1.25Gbps mode */
 		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
 		break;
-	case SPEED_2500:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		/* 3.125Gbps mode */
 		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
@@ -287,17 +290,15 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
+static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
 {
 	if (mode != PHY_MODE_ETHERNET)
 		return -EINVAL;
 
 	if (submode == PHY_INTERFACE_MODE_SGMII ||
-	    submode == PHY_INTERFACE_MODE_1000BASEX)
-		return SPEED_1000;
-
-	if (submode == PHY_INTERFACE_MODE_2500BASEX)
-		return SPEED_2500;
+	    submode == PHY_INTERFACE_MODE_1000BASEX ||
+	    submode == PHY_INTERFACE_MODE_2500BASEX)
+		return submode;
 
 	return -EINVAL;
 }
@@ -306,14 +307,14 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 					 int submode)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-	int speed;
+	int interface;
 
-	speed = qcom_dwmac_sgmii_phy_speed(mode, submode);
-	if (speed < 0)
-		return speed;
+	interface = qcom_dwmac_sgmii_phy_interface(mode, submode);
+	if (interface < 0)
+		return interface;
 
-	if (speed != data->speed)
-		data->speed = speed;
+	if (interface != data->interface)
+		data->interface = interface;
 
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
@@ -322,7 +323,7 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
 					 int submode,
 					 union phy_configure_opts *opts)
 {
-	int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
+	int ret = qcom_dwmac_sgmii_phy_interface(mode, submode);
 
 	return ret < 0 ? ret : 0;
 }
@@ -356,7 +357,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->speed = SPEED_10;
+	data->interface = PHY_INTERFACE_MODE_SGMII;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-- 
2.47.3


