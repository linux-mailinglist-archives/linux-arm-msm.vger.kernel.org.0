Return-Path: <linux-arm-msm+bounces-94061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHU8Dbe6nmnwWwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:02:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954D194922
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 962AF3003738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517C6330676;
	Wed, 25 Feb 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vDOGVCSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CC3016E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010156; cv=none; b=ujEnibwXNNXUME2wTUjDN5wVdifSkqG0BMZ/Asp33Taar8MilfqdxS9n7z1qG+spF5WB/F9idZO6OCzGiqrUBTkE5bQdXk9Ouy0ayQDIhK+xcUFmFeWYEGXVL0ESBxPKE+LZtt0+sqdZXPQwWfsOBSe8Oejb/6HbWlMbILzy76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010156; c=relaxed/simple;
	bh=0LSYd2UoXVX4DLNkFVhpzekJQuGSo5nxMn5DlTUIlU8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=uLMb+ZcF576rdYlfEXWXdPRgxvgyU0c/qr6frnGwe/nSw8wJBqNm/Zw2HK7IWntxa8JBZryysPSlBdbQri+55qWnWj/ZXzXZE0srDFz9c61zF9T2wRoUp5tCfxHIo9VhQrwiC2YoCkgQ3DaC3FKbaxbvSsopOJ/jILX8dQUWV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vDOGVCSM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GxfcZEUseWSWgXEfUJ/x192G0PkidFc23RUS1GJAT+I=; b=vDOGVCSMGr69yIy/suPL1pISws
	RmW19k1yD6J+GTBuDf/PxC77XsQ7azhEIXw2l7yxs3HBOHTd0VYOfnMtWJCSm2u5ONhhG1s6kBnpF
	Ipci1PIhcSIP9U6jhCM/3TFZlLXQc64mKCItbb9qqkTF6h8N31eNkBbJXqEjcbKUFdXiVrYh2Uimn
	+9ewVZFm8q4bCCQDSOqbSa5BPAV7AqmEzHmV3qFI3rug3CBJVty+UHmSkzVZ5BsIKlGFmE4H4LuFC
	2dSdS/JBM/SArfhfAW168tpi0Fs90D4a3FO+UcS2zqtQPGIrQBrJbrPA++6qgI6KH7JGJ8CZgwkip
	W8o/ywSw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41382 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvAmu-000000006Gl-1y4w;
	Wed, 25 Feb 2026 09:02:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvAmt-0000000Aqp3-2uwS;
	Wed, 25 Feb 2026 09:02:31 +0000
In-Reply-To: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 7/8] phy: qcom-sgmii-eth: relax order of .power_on()
 vs .set_mode*()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvAmt-0000000Aqp3-2uwS@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 09:02:31 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94061-lists,linux-arm-msm=lfdr.de,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1954D194922
X-Rspamd-Action: no action

Allow any order of the .power_on() and .set_mode*() methods as per the
recent discussion. This means phy_power_on() with this SerDes will now
restore the previous setup without requiring a subsequent
phy_set_mode*() call.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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


