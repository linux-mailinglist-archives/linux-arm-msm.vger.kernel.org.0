Return-Path: <linux-arm-msm+bounces-94079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD1FHUnWnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:00:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5119627D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D6F53043D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9C13939CE;
	Wed, 25 Feb 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bZQfow/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44972392831;
	Wed, 25 Feb 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017168; cv=none; b=BsE4GRoMUy9APHXjj0IHDwL8M1XF9El8MG9oo+GuDHG2YUBVxSgtawCM3jcLUm00y9kO+v97F1oQomypzkfQa2vr+oOZf0Av3+lZppmenYz7Y+zDpkoNn4DKBTGol42ntYuBAU0ihFoeP9D7n3w3Hz+O37Fs2kWFmxVH0Fnoju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017168; c=relaxed/simple;
	bh=/fV4awh80lsBWfTC8nzGkofg3hP7NYlEQKqMqJBC6NA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=m+HxRkHmgcatVCxqthcsK8TVccPN5LtB3JdFbO8J2pn1eLA5aZeobsp9u0+dYXerLmsZ4+Hs3653rNI0BP9dI5lYFQVAQdNpUhXlBFSSfOcmoWeDAxDl5nwC1Ej7Yz4t7XV0vF5Tt2Hk25TrqPUOUQ47K9ul/I/NIaJ7ivPi69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bZQfow/v; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ga10eSgFE90ZtSvOsQUcopfNpkOfowVKw1XZ4wXDdCM=; b=bZQfow/vi7pdFWOl/ITz9NlKxT
	aPIQ4Nc+zafMdUFWqbqwe7vzDE/yfiDweu0EQjca7ABawF104R0HybfM2KBqI05evdZYCRb98uDJm
	UEk+d33k3k2znQRRIOpgyXXUWEVgbacqv4YBeJb4/kzo5TUdimo0TeIWXu3ikIQyBDg21zQ64Iiiz
	K8ymEyol/Th1oW1AIpDgAaG89RKOeEXGtngt1pl4BLRbvZaaXmQELfq4we3jY8VaUWoVcUAur+S1N
	Rok8C9bRzDmA92JbnokqNDD4BX85Ywfnp5dY39JFJdv7S7p2dQsIySYk+4mkaHp5B/NMN7HczYjpm
	ElOUlZEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44156 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvCbu-000000006Uw-39e5;
	Wed, 25 Feb 2026 10:59:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvCbt-0000000ArKy-3Wog;
	Wed, 25 Feb 2026 10:59:17 +0000
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
Subject: [PATCH net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and
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
Message-Id: <E1vvCbt-0000000ArKy-3Wog@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 10:59:17 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94079-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,nxp.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: E7D5119627D
X-Rspamd-Action: no action

qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
using SGMII, 1000BASE-X and 2500BASE-X.

Add an implementation of the .set_mode() method, which can be used
instead of or as well as the .set_speed() method. The Ethernet
interface modes mentioned above all have a fixed data rate, so
setting the mode is sufficient to fully specify the operating
parameters.

Add an implementation of the .validate() method, which will be
necessary to allow discovery of the SerDes capabilities for platform
independent SerDes support in the stmmac network driver.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Resending as netdev (and others) were missing.

 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 43 +++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4ea3dce7719f 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,6 +7,7 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -286,6 +287,37 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
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
@@ -296,10 +328,21 @@ static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
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


