Return-Path: <linux-arm-msm+bounces-93383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eET9BI4Hl2lmtwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:52:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163E15EC11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B773037EE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A84E33342E;
	Thu, 19 Feb 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jlvSrfEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650C309DA5;
	Thu, 19 Feb 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505477; cv=none; b=r+/e45hCYuZpJTTvRDiTZIj/Jhg11RsWtzlFzN2LhljbyyAsu6iiS67TDyHCoe0mEWvMgaFdd4bDMqW9dAASFd4QdKiAgcGZGVT2BERv/8BjvQl+0IfQ9Vap9dxyJ3JF7FTi5i5u0v7J370DAP2+XhD+rss/THvAdd8UvM9V++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505477; c=relaxed/simple;
	bh=daWTiguX6shIzthgmXhmO8e8uvMFQGDxXBW1a4GkXfI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=gDS2QbRFWkGSkwGOUK90S0FjszVX8+LRtpVwW80uNcuQZ+KLRvofHtEtexhTjm90tizE57fJON97pfSyTAG4ITtvir5j4LKEGDPouI3gvfJ8pCAbtluzMbxWuwJ3GeYHTKSA0lyyWxeFtoK/hgio2+NbNjIMmzU5ntGjtJ5KmKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jlvSrfEi; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WigBpR2LUG+IwR0uFA6Lmf6TgmmsDesfHsCPHW4cIWU=; b=jlvSrfEi6DwoArdUejrqsgE5X7
	rAWXyEL64r3eED/+vfawNnuTLY7pEsFsXTYNiypjyOB7RdmY8oKl+2BXM1xjZi/l05jXG/UcV02tX
	FAa7YQim6/K/WfnKI8c1124lRf8FTuvuFr6JwsmX1BcbTfyY3iJJo9QFTSnzqD4Kw8JXOlhmvJVWf
	O/jG5cwOAGwqKTb0A6jodWMvgJVTX7KZYLTXexWFM010+npYzjA2IAIkxwld3eujXPE30bKrA0AJl
	tSPIhN/U8AlmDLNIXbYyLaN3F4fYt1/Wgo5QMqjQyCDXluAVKyGpWQsJ4Y1AL3ZvqeALL+I0Mz5jo
	KlHfw8EQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46446 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vt3Up-000000000tL-1LTQ;
	Thu, 19 Feb 2026 12:51:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vt3Um-0000000A5ec-3moZ;
	Thu, 19 Feb 2026 12:51:04 +0000
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
Subject: [PATCH RFC net-next+ 8/9] phy: qcom-sgmii-eth: relax order of
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
Message-Id: <E1vt3Um-0000000A5ec-3moZ@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 19 Feb 2026 12:51:04 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93383-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 7163E15EC11
X-Rspamd-Action: no action

Allow any order of the .power_on() and .set_mode*() methods as per the
recent discussion. This means phy_power_on() with this SerDes will now
restore the previous setup without requiring a subsequent
phy_set_mode*() call.

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


