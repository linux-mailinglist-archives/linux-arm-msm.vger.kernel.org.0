Return-Path: <linux-arm-msm+bounces-89791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC311D3C517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5338D587243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3FD3D7D67;
	Tue, 20 Jan 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VJlC1K2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A134677E;
	Tue, 20 Jan 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904090; cv=none; b=FcjWc0bXhgD4Q8SpHKLAqjjq3pFl7Td3APgHj09cHg8wwlvJLjPsrQswR2Lm1zLbYLR0WP+T/C4EhcdXoGH9/0AKNGcECxaXqCD/simlofUqlOMN+b3KiOVqk/3roiglYnWgowvAYE0WFIvXJ7L1Ene50LpfNPToBPJBVqZUe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904090; c=relaxed/simple;
	bh=buP/szZwt17JVG9BnbMq/pjgBL+/a7djpPYDhAKOW+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1R4uK8uGDWIoCpmJOftMKLmqUEcBTyy5S6vIHi2IhncetC+EsDFO/Q9a3rAPuMYvmgX4FT4EzyPE7X8MNDhPYnR69+vfyaToTXLC403Hb4xq8zTDQLkYUkg/OZMebZbmME6AtqNf0W5U7wDMiawCwX636MegjgcStdvPqW1O6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VJlC1K2g; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Yv+dpRQRMN5qyhSBXjej37h+nZntknJMic+/TUR9+o=; b=VJlC1K2gyJ9/otBfB1zskPXFfG
	W24edyx/d7uS+k2Lr5Px/mwPserfDD0u0ythB0g/la0lT0fiK/XOl6VikBxGutkeQz8Dr1DAdlZm6
	nhCCtkJSBoSPzlzDbLoSnAsEMSvsTR1l3dzC0zT9U3rTjWQCUDGJBixA6hMRwoHi4+9J+97gE0EI8
	q4wrj32W+vmtiKrQ0S3BRAaqfJO+6dQIgjDK+jDV4RVMnrojaFCPLJzwFqNl78mW3Yw5Ah6fyc1ib
	7q7kehaZ0n6exkqc7VXbWW5Z76+ZyUrodOlwZGR25zdXb8d/Mse00/lPaGbZdCJcxg9f6RAnCEE6l
	0eSB3V7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42602)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vi8kz-0000000064a-0tA1;
	Tue, 20 Jan 2026 10:14:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vi8kw-000000007RQ-3W81;
	Tue, 20 Jan 2026 10:14:38 +0000
Date: Tue, 20 Jan 2026 10:14:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <aW9VjieyiZCNbb-G@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120084227.j2wgbmjsrpmycpgn@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 20, 2026 at 10:42:27AM +0200, Vladimir Oltean wrote:
> More to the point, if dwmac_integrated_pcs_enable() fails at
> dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
> own admission of this PCS calling convention, sooner or later
> dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
> called, leading to a negative phy->power_count.
> 
> That is to say, if the model is "irrespective of whether pcs_enable()
> succeeds or fails mid way, pcs_disable is called anyway()", then these
> methods are not prepared to handle that reliably.

That's the way it currently is, and it's been this way in the
major_config path for a very long time. If anything fails in that
path, we can't report the error back up to anyone, and the netdev
is effectively dead.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

