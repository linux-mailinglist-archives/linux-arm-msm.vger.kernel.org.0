Return-Path: <linux-arm-msm+bounces-73584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9BCB57D47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CA01882E20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983D130DEAE;
	Mon, 15 Sep 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="LCmOIig9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32E2FA0F1;
	Mon, 15 Sep 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943111; cv=none; b=mkTXKkfaFbyq0N8SLLJwD+SONBSLEdSiCCWN49QcoUzY0o6Ew5ZpuVVpVwsmeusm+WOBNNezs1yFMWG/wJ5RpTcEfiRBbObxIh32I3qmPP0vYUHVYQVoJKallGfN6nSpU2hv4dqzmGDAEbKdqR08E1YzIL24oWgQyst5szt/eTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943111; c=relaxed/simple;
	bh=pxJrT8DwN5uTqipHwwjZ6KXPA4br/h9b81IRRvMg+Rw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=u+tDEnKbCrUOLGU8eKtzHzPmyBdtymcZP2tHFwY5AsFyoyEd+XNNdYj10xWddM8UqhvtP+3eaoYeUltB5p+t67/DNWlaUdIprvc/rTbQT1ZuYLV1K/OB72ulQzgA9IadjQUollEMtvDuN/FQ7bKPHCNRWajMz9n7Ucc1ADSIMn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=LCmOIig9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xIPvDbMNQtjGZwUqP0miyypekm4s2FOD6Fy6u4TdgdM=; b=LCmOIig9W/FlTxerNByreLADur
	xk428satjG9F3/DvGzVkP7zgFmQhYLn/naaWzqs+7/rWp0jBcXF0w0Z+DZXruJNh28d/q4HoOrHcb
	Izy3492R91bTOIspW1D0fssvAVzzN0xbanBjreGcDkmUszOaNSFQceGqRNQ3UC+B+Yig6cOfkOYVM
	71Xux/85UvonObsaM0Hbc5osipTBXhBaHscJ0Ux1lEXFkRPQo9mqdvfu/DsKMuDsVAtyoiE48Wfhc
	yNf3owvbUfX1myBNoXmyDjYoVi1d5y7Nu2LdX1DyqfZB8o7FS7mnOC6yx0NxkVthXCiQ9iJUquAj0
	ZzMZDwRw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56864 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uy9J4-000000000M4-0BoE;
	Mon, 15 Sep 2025 14:31:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uy9J3-00000005jID-1Gce;
	Mon, 15 Sep 2025 14:31:45 +0100
In-Reply-To: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
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
Message-Id: <E1uy9J3-00000005jID-1Gce@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 15 Sep 2025 14:31:45 +0100

Add a helper for copying PHY interface bitmasks. This will be used by
the SFP bus code, which will then be moved to phylink in the subsequent
patches.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 04553419adc3..407dae517b2e 100644
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


