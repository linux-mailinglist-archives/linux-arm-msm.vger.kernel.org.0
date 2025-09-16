Return-Path: <linux-arm-msm+bounces-73807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64257B5A425
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C8A179FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F80E284682;
	Tue, 16 Sep 2025 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qiOK9+Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64D276022;
	Tue, 16 Sep 2025 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059202; cv=none; b=k76UhafpyECepww5I2m+ijitoa6SJLWskFXbwBCj4hftQ/l4It+Liu5740e9EgYWu91VGJf/rjftF0gLwiP1zAiMixx7DANinB7x9/b2mhryuF1T27pbnrflIfSVZ5fkMzBt/Nh3+zZ35IR9cFy8UC/0kgPrIVUxJxqyIpvHsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059202; c=relaxed/simple;
	bh=QWICg5RVnXhSbRYG4iXfUwfFl+tpCRmQRLXZSQ4AG0I=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ggKJpFKJf9ks8v8sQloyxUSu3nQCddPUmT5aEQpE2oWedGL8OJZb3dTFvAdCNSTea3Itw+EGY+k352LgrdfTVlkQVQBiEiLss1etBbCmD8fzNJVyPoUitvARkkZJR4F/GVWjsPAiKGkGzocX5HAcLhBV5Fgh56DTHptx559Ph1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=qiOK9+Pq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Psqhte2+r+HDH1rvUSq0d37pn295WyFHEQCg+KtNUV8=; b=qiOK9+Pq6xAZK1BoKOdUoQYNSJ
	2c/UwjQtcZU8P3+0OrJWmsMzxKRR2vOZCsTX4WgBRdthQGfW9P8+10TYd4oDGRd9JPEI/V5+Tw5Qc
	gj6bYdXTfcWD1Z6i78PuV0+z7KlaDAJswNje0xsmLRPnuS1YlkB69PPl5x4S2V2pwjEHyVlGhlzdD
	0+rN7792TIpOyLBYKvRRAFn4g3HFKtgOPuYGyJHT94YSuaDga+JPGR4rBWzHX+qKcfA1ojdESP2pE
	Cis9ALVqfBdVf/XPVicqfZ2J8FQMLUDXFacOSvIGzpGu70g6x1pJ3sx2gQ7hvZN/ostCNoufWG4qd
	stsR3OvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37470 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uydVV-000000006P0-133I;
	Tue, 16 Sep 2025 22:46:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uydVU-000000061W8-2IDT;
	Tue, 16 Sep 2025 22:46:36 +0100
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	"Marek Beh__n" <kabel@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/7] net: phy: add phy_interface_copy()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uydVU-000000061W8-2IDT@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Sep 2025 22:46:36 +0100

Add a helper for copying PHY interface bitmasks. This will be used by
the SFP bus code, which will then be moved to phylink in the subsequent
patches.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 6f3b25cb7f4e..ea7454763516 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -169,6 +169,11 @@ static inline bool phy_interface_empty(const unsigned long *intf)
 	return bitmap_empty(intf, PHY_INTERFACE_MODE_MAX);
 }
 
+static inline void phy_interface_copy(unsigned long *d, const unsigned long *s)
+{
+	bitmap_copy(d, s, PHY_INTERFACE_MODE_MAX);
+}
+
 static inline unsigned int phy_interface_weight(const unsigned long *intf)
 {
 	return bitmap_weight(intf, PHY_INTERFACE_MODE_MAX);
-- 
2.47.3


