Return-Path: <linux-arm-msm+bounces-73578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0CB57C98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C614E1709DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A4430C62D;
	Mon, 15 Sep 2025 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yXAIAYkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C71DBB2E;
	Mon, 15 Sep 2025 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942217; cv=none; b=ZD74fzvOQUsrgOB/pIO6qM6VUUkenEEOgg6m81otTIRQXJN1ATWODQEdGjw3ksf1Kg2DSv/KEI1JXETOfRvdELT0+PlkTnJGSn+GSqwWZpkEz5qcEAtOcSA2l9AGUC/KyM9eQ2a913EWNq4aRQcjue6fT4ZOYeTh9/y7CxCFcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942217; c=relaxed/simple;
	bh=T14i9mxUwFgEy71eMcE372yTKBQ8Y70udPbDU+npERw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nwd79rvmy/7ySqwo350Y5/d3RFceuMDGk2gZn2WryJLb2qKVZwYiJ8B2n18vocBaXvEAd3zodTzvkeSWclmzWLhyNV9Ogdrol42bmtIilZVBOMq4ur0zqnuA1OWFJg+ET/2VGxSCy5g+kw0vONLwEgIYgY0GWKEmCHVEItMLcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=yXAIAYkJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e/SklIfhoeKfZPpi4je9CBFzBi/qWMXYatg2p+Y+cFM=; b=yXAIAYkJmPcCuwh/k37pxpwnpr
	swxmmlNjW3pPdAooLLRSbsBAQ4GOTTLouRnbuqnQYc4izDbXlEZ5HMq1p+sEyerhBQt6jAIp1C50B
	6qWjfeD279F33mJ1FRw835iRM+0aR9ocQzeKSoP34ladD3oCiDKJOQ9K2C5MHbw+LrdGZMDfIHctL
	zjpw6bilsMTJgd5QVW/wmNC2SQhlbkFYtjKabZ9ig28OmOBdMKuYtfGc6yPgW/k2VmF/gJrQZZmP3
	yOybOUyFYiAqG9gIIy0FWQGMsIMRhirwKCl/t+R9pmWly1iZRboO5QKB8QT3RLtrrZeHCljvN+xTv
	ZXbhs3wA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53662)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uy94c-000000000HZ-3Dqw;
	Mon, 15 Sep 2025 14:16:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uy94b-000000006h4-1LlD;
	Mon, 15 Sep 2025 14:16:49 +0100
Date: Mon, 15 Sep 2025 14:16:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/7] net: rework SFP capability parsing and quirks
Message-ID: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

The original SPF module parsing was implemented prior to gaining any
quirks, and was designed such that the upstream calls the parsing
functions to get the translated capabilities of the module.

SFP quirks were then added to cope with modules that didn't correctly
fill out their ID EEPROM. The quirk function was called from
sfp_parse_support() to allow quirks to modify the ethtool link mode
masks.

Using just ethtool link mode masks eventually lead to difficulties
determining the correct phy_interface_t mode, so a bitmap of these
modes were added - needing both the upstream API and quirks to be
updated.

We have had significantly more SFP module quirks added since, some
which are modifying the ID EEPROM as a way of influencing the data
we provide to the upstream - for example, sfp_fixup_10gbaset_30m()
changes id.base.connector so we report PORT_TP. This could be done
more cleanly if the quirks had access to the parsed SFP port.

In order to improve flexibility, and to simplify some of the upstream
code, we group all module capabilities into a single structure that
the upstream can access via sfp_module_get_caps(). This will allow
the module capabilities to be expanded if required without reworking
all the infrastructure and upstreams again.

In this series, we rework the SFP code to use the capability structure
and then rework all the upstream implementations, finally removing the
old kernel internal APIs.

 drivers/net/phy/marvell-88x2222.c |  13 +++--
 drivers/net/phy/marvell.c         |   8 ++-
 drivers/net/phy/marvell10g.c      |   7 ++-
 drivers/net/phy/phylink.c         |  11 ++--
 drivers/net/phy/qcom/at803x.c     |   9 ++--
 drivers/net/phy/qcom/qca807x.c    |   7 ++-
 drivers/net/phy/sfp-bus.c         | 107 ++++++++++++++++----------------------
 drivers/net/phy/sfp.c             |  49 +++++++++--------
 drivers/net/phy/sfp.h             |   4 +-
 include/linux/phy.h               |   5 ++
 include/linux/sfp.h               |  48 +++++++++--------
 11 files changed, 126 insertions(+), 142 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

