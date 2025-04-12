Return-Path: <linux-arm-msm+bounces-54105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCEA86D86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 16:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 695BD8C7837
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA0F1EB18E;
	Sat, 12 Apr 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="LGz7/Vo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446C1DFED;
	Sat, 12 Apr 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467043; cv=none; b=sBKKWurCvAvwFZtKS9MHvySWQcNzk7CL7ecdofpYqtF4yBt6/83QjcrWdzJvTwaJX+K/JHl1JVBh5T+5uJTbGmfwOSTKAAin50FoksVYVYtj+EJitmxbAiDxXaSteZ1pEr6PiEIJcXKFjjr90ZNFIIBHM2TpF1+O69uJ7pyEcaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467043; c=relaxed/simple;
	bh=DKnJNpC8nD7Bt05YQqUOXgFDyga9Tzeq3Y2fbcZoGjM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=QgrXzuTwIiGNEsOQj0rPjif/uOf7NPsMaKlgyh1xhkWBpCajxhBGbAYTkVe3jHkfpSNg++SvHErsV1S+QQRJtALE+YG5TeUU9i/cejvfFdSFidyPTTwzVW/gzAGvq/1CC/zX9V0q6VZf1Te+ySRHLMGiMEF59bwJvraVjf0H2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=LGz7/Vo3; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8AUA1jYu18/VV528nC+Fd5/366KmfMQGrmQqxLT2Djc=; b=LGz7/Vo3Gdx3pT1LrIOtdN5T9D
	c4rHZlimCX0OXI3TtTUfn45Amt+kwNobKXxOjGN5cAPRuypB6LqxQBp8Mtgrzyc1qy6YCUs1FDGta
	JI2qC0woGEnUA0Ztt4w6qOVvmDp9RV2RShdPiZwkcdzZX36jqs0ocYb3Zk94Xe8mhdkxGh/vQemKZ
	6WGzkVCGQ7zgCmsnvZGExU7y0QsRdUdYX8dE1fHNqOXUJPv8KGyQLvpR+9n5sQw8IDHHoAeoLjWFc
	d9hvxFYuM22+4f+2q2KS6+8Sgk6gJrDUSRPRt15H84BpDzbcK9mNp0OcBb6OSGLXGyJ2qFUUcVucB
	LBn6uWEw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51242 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bZ6-0004ah-2K;
	Sat, 12 Apr 2025 15:10:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bYV-000EcQ-Cv; Sat, 12 Apr 2025 15:09:59 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/4] net: stmmac: qcom-ethqos: remove unnecessary
 setting max_speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bYV-000EcQ-Cv@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:09:59 +0100

Phylink will already limit the MAC speed according to the interface,
so if 2500BASE-X is selected, the maximum speed will be 2.5G. It is,
therefore, not necessary to set a speed limit. Remove setting
plat_dat->max_speed from this glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cd25aea3e48f..e8d4925be21c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -676,7 +676,6 @@ static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	priv->plat->max_speed = 2500;
 	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
 }
 
-- 
2.30.2


