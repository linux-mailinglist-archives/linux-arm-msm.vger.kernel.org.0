Return-Path: <linux-arm-msm+bounces-82668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3671C73B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id B55572C13E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F3C31691B;
	Thu, 20 Nov 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vp0FG/ZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1EF303A19;
	Thu, 20 Nov 2025 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637918; cv=none; b=pUbmqYGSopQDsGRixdYaKBeyg6380Aq7Slu2530m1ZcvPSZHHI+/XkJ0gYidxlu9ob3RgciYh2ddxxq5k7bl4KK1OT8UivdZWtbiRVN8rfX0GSqeHCM+zMboWqwciyOU+Coc8lj42XTX+mhRn/6ypF8ZemXQhfnFwUNJ4XNsyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637918; c=relaxed/simple;
	bh=FKWyCNRJqEsyQiK5EfCIYkFo8JyjMZYb9poiSCKwfgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=feAmr8vXKbOnyWXAp2yKp1hc1XUxfuGbZ2ujAfB1xXKjk52354UHZkIU2viwlzKu/tP5O+TXp80/llH/lc9HbjfeDQLsRs7PoWns/LADqFAc/6/Jwm1SmNSJaWlEX7oXHgTTnCPZQEmpykrZ7LEEhOsiwl3Dl1d4AfQsRohR6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vp0FG/ZS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UkLGBPuD+ixBnCg1mbudIHuw5SJRJWUumiTRns1X5cM=; b=vp0FG/ZSDnOUiIL9iiqoV5ayuk
	SJQEPugj2vrczSLx79vtXHFfQH1aGPfaIPWQ1wgAHiwqKRAw+wuYHEXtmOx4hbpRZrkGIb4ue43uq
	AcSbL9nNO79PNgBD6VL6ZjmTg1vDdbZ56TixNQehTPGDew1eDz1zDTTbS4UdTjKj8druki9UBzMTk
	UbO+nznjzrCIv+Ac2tO1V+oDPfU11k1iZvdGRG8rAWaaf0RbFA+15B/fv/eAeF+/zw+s9jbQLEzi3
	mdkB4sefXGAj7CAnb7qu6vUOTJRTW3SylPRQ7OUE1rRxr218Et5c+JbCqolBbAA8B5hWBdIjx6l6L
	4H5rnRLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM2md-0000000067m-2B0R;
	Thu, 20 Nov 2025 11:25:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM2ma-000000004L9-0XuL;
	Thu, 20 Nov 2025 11:25:00 +0000
Date: Thu, 20 Nov 2025 11:24:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos: "rgmii" accessor
 cleanups
Message-ID: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

Note that patch 1 has a checkpatch warning concerning "volatile" - I'm
changing the type here, and the "volatile" is removed in patch 3. I do
not feel it is appropriate to remove it in patch 1.

v2:
 - remove double-spaces in patch 2.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

