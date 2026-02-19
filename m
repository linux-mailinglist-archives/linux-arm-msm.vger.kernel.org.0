Return-Path: <linux-arm-msm+bounces-93380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEK1IF4Hl2lWtwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:51:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9D15EBF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22240302BE80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB6F33342E;
	Thu, 19 Feb 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rtv5p8KP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22CC329C7B;
	Thu, 19 Feb 2026 12:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505460; cv=none; b=fdU/iGB4qTs3PgQz4LQOWLPXydbOukfT+jFVzxmY0CUNSv+xe0FmTbDfuyVBFNO32fgRcN8LMUHgr6CpW+rovIAMyrv34gEX/1iv9Ymct0PHTpOne47G4EzDkRkQBXigsYcYDna7A6x9u0Cw8FaYUkYu6xDmu63ArRyrT+0lKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505460; c=relaxed/simple;
	bh=EgUXHGeTB062l2lqH+Nh925hIQeIPZzsbjJG2lSZWrE=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=tpNwjO3Tez1gxBaX1Pcqmzb5C3zdNGv8oZ7Uqtg9qO9WagTV6mGhEbuiZiqH3eEw/9MFRRPZ6nryDCZHMW1i2Mp4rrh5k+fvUZcGJZvjOpsALI5LNphW48sfPFhYItdWw1JHm8YED2tAHbgm9w/QBfwyUGFmHGaW7uxtjZJYhrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=rtv5p8KP; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UDOxbltY9vIZx2VprPzwy+EvhUWXeLfTB2AEz5x0u+M=; b=rtv5p8KP8OshhgsHP1UZ/+ekfj
	VSGvjKAS8hpU8++KVTCWysrnEmAmtrOAPQHEiK8dGueMMMzSOVDKTwhowrlXPT6hDzftvnD2AVkY/
	Vq8Blx+Z2K1KM3pV67RlucIf10qa1WhvuYE135nWFFKNq5mYCjWVabksQ2GQ983kpOTo9jKiZOhOt
	HAR9Vs7Ct9wLW2YBbUwf0s/KOH6Q3K5ZmE9/QOLtqqsFTPCcQPmDklg5MaNGKxijXvRGz2cFC99I8
	UInBtQTcmiF17I0mot9TUDY+o3YuvsYfz7gG2EWY6yHzTM3DO19F9eakZFWUnNRaGPI9YybosvMjr
	wX6MT57Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49826 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vt3UY-000000000sN-3o8D;
	Thu, 19 Feb 2026 12:50:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vt3UX-0000000A5eK-22qr;
	Thu, 19 Feb 2026 12:50:49 +0000
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next+ 5/9] phy: qcom-sgmii-eth: remove .set_speed()
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vt3UX-0000000A5eK-22qr@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 19 Feb 2026 12:50:49 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93380-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: DDA9D15EBF3
X-Rspamd-Action: no action

Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
rather than phy_set_speed() to configure the SerDes, the support for
phy_set_speed() is now obsolete. Remove support for this method.

Using the MAC speed for the SerDes is never correct due to the PCS
encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
so:

  MAC rate * PCS output bits / PCS input bits = SerDes rate
   1000M   *       10        /       8        = 1250M
   2500M   *       10        /       8        = 3125M

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 4ea3dce7719f..dcfdb7d0e8ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -318,16 +318,6 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
-static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
-{
-	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-
-	if (speed != data->speed)
-		data->speed = speed;
-
-	return qcom_dwmac_sgmii_phy_calibrate(phy);
-}
-
 static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
 					 int submode,
 					 union phy_configure_opts *opts)
@@ -341,7 +331,6 @@ static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
 	.set_mode	= qcom_dwmac_sgmii_phy_set_mode,
-	.set_speed	= qcom_dwmac_sgmii_phy_set_speed,
 	.validate	= qcom_dwmac_sgmii_phy_validate,
 	.calibrate	= qcom_dwmac_sgmii_phy_calibrate,
 	.owner		= THIS_MODULE,
-- 
2.47.3


