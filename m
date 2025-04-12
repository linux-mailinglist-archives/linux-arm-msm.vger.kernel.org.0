Return-Path: <linux-arm-msm+bounces-54102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7136A86D74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 16:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03B9344661F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2041EB1B0;
	Sat, 12 Apr 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1y1+5saT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700591DFED;
	Sat, 12 Apr 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467009; cv=none; b=u9R6iiO54hAs52469vCbEMxHO6eZnz7jiSxxfhJpCQowBlvjr5wwBWSd9rimGrIVhNFTfsXvaXWJPMl3ZZeyRpQCRB/Audx42HI36DSN074PJeDfiqjinKLpII/SjAROq/QhSImUxN6fdzO5oWh6S3H3V+42Vm2cG41ZoFLzVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467009; c=relaxed/simple;
	bh=gvyML1ETjGpPwCUzkIgmnZ/o/Gq9x/Gq1b2eLhXeIVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UODoKE3geY2+Iol3U3wHFzdsNeV7VhK77HaF6phOaQSPRh+MNMQjFfNtN7WpD9xKNZ0vPvNPKrKqmVk+/5rwn3jni4kS26B+MviMjQOsCIPiMZqkooEKENzEf6AtILBA1I3HCAJcZz1TpEAL/+ZTljpEob2TywYji/ZMUmqvuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1y1+5saT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CYbTQ2OjNT5HQZlq54gRg5Ekmk2v67BRStp4jn6gpZU=; b=1y1+5saT66vFlxhIPYmjDaHQuZ
	dI5B8IDr5xlLlM/VX7I9KL5h+x3Qnk85E6Bne6SRKCSDFbLg6wXr/qAXMdgUsail8kqEmwukZY0Lb
	zao3rtGUJOkMPhfe3o0DfuGcb9jRbO5dD1onIZkzrtuKiPzlCfjD6yeeLjah/eWCcQjrnJ3GbcbTQ
	Zq5keSSLE1cHrJqsEBfhI6SgUUTuQSmBWfrmDJvCOd58lY2+0bxoDseUPH12JotQleYghX246k2dz
	Z0vyoKPem3QPsSsiaYlxP88NEyjfOuwgk0hCs9g0EAr+Xl05dKvUyi4mbJo3R0/GGrnFbcArST+Mx
	9tAmNiQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46152)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u3bYT-0004Zy-13;
	Sat, 12 Apr 2025 15:09:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u3bYN-0005iw-23;
	Sat, 12 Apr 2025 15:09:51 +0100
Date: Sat, 12 Apr 2025 15:09:51 +0100
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
Subject: [PATCH net-next 0/4] net: stmmac: qcom-ethqos: simplifications
Message-ID: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Remove unnecessary code from the qcom-ethqos glue driver.

Start by consistently using -> serdes_speed to set the speed of the
serdes PHY rather than sometimes using ->serdes_speed and sometimes
using ->speed.

This then allows the removal of ->speed in the second patch.

There is no need to set the maximum speed just because we're using
2500BASE-X - phylink already knows that 2500BASE-X can't support
faster speeds.

This then makes qcom_ethqos_speed_mode_2500() redundant as it's
setting the interface mode to the value that was determined in the
switch statement that already determined that the interface mode
had this value.

Not tested on hardware.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 43 ++++++++--------------
 1 file changed, 15 insertions(+), 28 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

