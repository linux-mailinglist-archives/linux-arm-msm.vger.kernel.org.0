Return-Path: <linux-arm-msm+bounces-89046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951AD209A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0B4E300CEF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CD231A80E;
	Wed, 14 Jan 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WpYSQQzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063AD322533;
	Wed, 14 Jan 2026 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412738; cv=none; b=C0TU6l3PUyLZdsIAzzbe9OHjYvbfAaGj4XrehVA+LvrUoo5pH825SBYK+nYAYOQhyOa6cJAuAWemQMuf9+sEO1eFd/Zsvt3ps/KIygHWQjzn9Om/vWcKJMu3/H9M7ECVu1wlsChlix2uFxy4pp+oxj5EmWOKVdSNQvl1Bz0XTEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412738; c=relaxed/simple;
	bh=J8eb+cqb6qpCB15sXMnbgGbnECRMUGjwlNbj8OjcVTk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=pY5MLBXYZiXnLpi2wJJQMnoMl+G8DnU/gF7+IC5wgHeJF0lBhOHMNuGs1CBzL1itJYRIkUKHrB8NHJig6XWAZ4aRiN/o0XVNwftBSEQZOYWc61P+0Wcammptd8W11Z/7T9aoy+8RNhF6g9lw0G/v8OMqxLzpbr7fFtbIM1gaZjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WpYSQQzT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8CUz4AHwqDPbIDA+w7+AknBiwVXgo2AUD/nlKu7d1+U=; b=WpYSQQzTHKqtHm8UgM85FQ0SBA
	hOZMxnRDCFtTYRHKF0LBH4DNFERFXIDWkVe9y9UcS6nYmuAraIG+E5Ul9vSm7Rhc3Kl7zJbFu8U9z
	b66eXkyBPNAGgXLujGgHpaJ0HEYeH9/Nf4y+nVO+6A2GS2iyKdArFMnwaQC9+D3uBZ4B0vuAvPfNw
	hoM4Ut0TfJ+K80Dh/HYESoExE8hMuVFZXbGw0tAnaIi4WRBkG/FIE5rcqUdXCl/fyU5iljDogEERF
	DKuYJWAikBth9WFJ+p3dytS/EmrB4lmGzN3/FF9JNQH58TF+tLxDZJMmwaXyhwY1Re5FC837FYiYH
	MNAEMjKQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42028 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vg4vt-000000000TS-39V8;
	Wed, 14 Jan 2026 17:45:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vg4vs-00000003SFt-1Fje;
	Wed, 14 Jan 2026 17:45:24 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:24 +0000

qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
using SGMII, 1000BASE-X and 2500BASE-X.

Add an implementation of the .set_mode() method, which can be used
instead of or as well as the .set_speed() method. The Ethernet
interface modes mentioned above all have a fixed data rate, so
setting the mode is sufficient to fully specify the operating
parameters.

Add an implementation of the .validate() method, which will be
necessary to allow discovery of the SerDes capabilities for platform
independent SerDes support in the stmmac netowrk driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..b0445b869438 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -286,6 +286,37 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	if (submode == PHY_INTERFACE_MODE_SGMII ||
+	    submode == PHY_INTERFACE_MODE_1000BASEX)
+		return SPEED_1000;
+
+	if (submode == PHY_INTERFACE_MODE_2500BASEX)
+		return SPEED_2500;
+
+	return -EINVAL;
+}
+
+static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
+					 int submode)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+	int speed;
+
+	speed = qcom_dwmac_sgmii_phy_speed(mode, submode);
+	if (speed < 0)
+		return speed;
+
+	if (speed != data->speed)
+		data->speed = speed;
+
+	return qcom_dwmac_sgmii_phy_calibrate(phy);
+}
+
 static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
@@ -296,10 +327,21 @@ static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
+static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
+					 int submode,
+					 union phy_configure_opts *opts)
+{
+	int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
+
+	return ret < 0 ? ret : 0;
+}
+
 static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_set_mode,
 	.set_speed	= qcom_dwmac_sgmii_phy_set_speed,
+	.validate	= qcom_dwmac_sgmii_phy_validate,
 	.calibrate	= qcom_dwmac_sgmii_phy_calibrate,
 	.owner		= THIS_MODULE,
 };
-- 
2.47.3


