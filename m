Return-Path: <linux-arm-msm+bounces-73437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D22B56B31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 20:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C752D179DDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 18:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9CC2749C9;
	Sun, 14 Sep 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OllDA8b/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D652DC79E;
	Sun, 14 Sep 2025 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757874513; cv=none; b=pNM9QjHFnl8sAvC2I/r6f2O0e077sV/5Zh5FOJP+vY6CSPomQOWM6NQW/aqVkrNy1ONM2k4lqyCLc/1oF9O0bRcJG1IM1tshfEZjLplbn+3GU5Y7TjUBo/ScN1uaeq50kBJZN8TnSuetf7kmvICbApiu9wObZET2j9rOECGV2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757874513; c=relaxed/simple;
	bh=FMEEigXnNLUuHyTRG4E2ahf0sM3UM6NSR/dYMYzQdWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R07qsCz6Hr65+RiMRZYcZX2Q5O9+O36ax9R9wo9rUooPkGe5XTp/AlUiUxLlF9sXB3oAbRJwMiAwXSqslzefwjnszU+AVg05aFDRmV5ASEZ3dkjZ5hHyPP9fZ5cCp8GkUloVcFAx+Z3hXqlenD+iHCerUJkCc+W4y0Elp8dUJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OllDA8b/; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e2z8oAXSxFAsYNQcZYcHsWLi1Z1vuoC4TahJrtKqHzs=; b=OllDA8b/kpmjCwSVVD3gTh9Rfi
	mdxpSdsf5focEps3MZ6+uYQUQUePTie/7zIujok6jHNB5Wsr+tud6cOZptGUz8DbxQMELFJw+cwy7
	/tCTYWxXydm2R4iGHU1BNtwU3V8Fg0cxGQveqmB1rdJiaZycYHBRv1AZ2AG5cRKOp/IIxguyk7oJ0
	cTenWGCEg0GN1n53uq7uuSYdp4uKWkb21MLoA9MbxtZvFhHVGoG4Nr1iOmpVXvXqEnJ02kOe4M99k
	lHgCn3RDCBkuGeVSxHssCZ4kZNe1urr4HrWX6zKXjc/WbjAzZJse7VU6G1ulaxYDCW1UxeSv1hhrp
	wdi3uz0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51050)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uxrBQ-000000007H4-3KTb;
	Sun, 14 Sep 2025 19:10:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uxrBM-000000005pL-3oHg;
	Sun, 14 Sep 2025 19:10:36 +0100
Date: Sun, 14 Sep 2025 19:10:36 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Sep 14, 2025 at 08:36:48PM +0530, Mohd Ayaan Anwar wrote:
> Add support for rate matching to the QCA8081 PHY driver to correctly
> report its capabilities. Some boards[0][1] with this PHY currently
> report support only for 2.5G.
> 
> Implement the .get_rate_matching callback to allow phylink to determine
> the actual PHY capabilities and report them accurately.

Sorry, but this is incorrect.

The PHY does not support rate matching, but switches between SGMII
and 2500BASE-X depending on the negotiated speed according to the code:

static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
{
        unsigned long *possible = phydev->possible_interfaces;

        __set_bit(PHY_INTERFACE_MODE_SGMII, possible);

        if (!qca808x_is_1g_only(phydev))
                __set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
}

static int qca808x_read_status(struct phy_device *phydev)
{
...
        if (phydev->link) {
                if (phydev->speed == SPEED_2500)
                        phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
                else
                        phydev->interface = PHY_INTERFACE_MODE_SGMII;
        } else {

The driver certainly does not support rate-matching, even if the PHY
can support it, and even with your patch. All you are doing is making
ethtool suggest that other speeds are supported, but I think you'll
find that if the PHY negotiates those speeds, it won't work.

So, the bug is likely elsewhere, or your ethernet MAC doesn't support
SGMII and you need to add complete support for  rate-matching to the
driver.

Please enable phylink debugging and send the kernel messages so I can
see what's going on.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

