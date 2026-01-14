Return-Path: <linux-arm-msm+bounces-89061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E2D20F14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 19:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 631F8304F893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD8B33A000;
	Wed, 14 Jan 2026 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1LhRzFKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2422337BBA;
	Wed, 14 Jan 2026 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416951; cv=none; b=tBKyeuLVV99t07HdVm+TVk9DNJ8YDGgsPN7NNGL4RAWDEmSyeGcpVZ1EyndTH5243LrOec8sTROoK0FRziYhDp4Llv8DfF7baKR35Vzs+LeMneNjiLiBek0/T1N/VTPXbP42kviILyGjJT7QUipQLpCA32b9a2VpKionYPDoRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416951; c=relaxed/simple;
	bh=OagmRB3adnvdpWPITIkngmbMP4IksUjG1iCmJcH9Dts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRBrcS3XmS1YPlV8UrAOhtTwGUdj6ZKkNgR87E01akAhlC4Czp0yslbKUy5atsec0FP7mQITNVqpocSbqSfyoeP6kV35h7Ji2CjhKYFVibVCqSKjm7aj3tV/UwGGNZXqQIKwH0eo/SuewQc5rrTaVvkzEw4j/UDfWjFijrxSA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1LhRzFKX; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iTNLp10Ro+X5fPkwXrfSV4iRZlIf0RMpE69VDQnSaDU=; b=1LhRzFKXkFPsaaOO+voWBOqmCx
	WlnkLzJfHlydzw2SupdC0FtuHxJFpWUTE3rHxleSIvoNimmsJ74c4uQvhjZ5mKgk1erkai5LToTCu
	KGmiXHFeAVwhRvi7Dr7f08JrQRzAfcc9+n1xowSCaSCfv74kEjtro56lOmizuDoQHXoweuV6H04bA
	ATi3Udti/sDsrn/o9G3B40TwksP84ndpiOAovq7FyzWG+L++U1By4AXv4Q1+iLLOGqE4SWX74XiWb
	zisnyNCoVk3fB4Ad/jxIeqn8mldsG2eB5Re8HQizk8XYDzCQuP/9mG7DR3gHc8DKVBNFTX2s9SJQa
	Viw5474Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40706)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vg61r-000000000b8-1JiZ;
	Wed, 14 Jan 2026 18:55:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vg61n-000000001sW-0Hze;
	Wed, 14 Jan 2026 18:55:35 +0000
Date: Wed, 14 Jan 2026 18:55:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114184705.djvad5phrnfen6wx@skbuf>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > using SGMII, 1000BASE-X and 2500BASE-X.
> > 
> > Add an implementation of the .set_mode() method, which can be used
> > instead of or as well as the .set_speed() method. The Ethernet
> > interface modes mentioned above all have a fixed data rate, so
> > setting the mode is sufficient to fully specify the operating
> > parameters.
> > 
> > Add an implementation of the .validate() method, which will be
> > necessary to allow discovery of the SerDes capabilities for platform
> > independent SerDes support in the stmmac netowrk driver.
> 
> s/netowrk/network/
> 
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

According to patchwork (I forgot the RFC tag on the patches) it needs
linux/phy.h included. Plesae let me know if you'd like me to retain
your r-b. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

