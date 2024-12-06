Return-Path: <linux-arm-msm+bounces-40827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764E9E7625
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6630416EB0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCDA21B187;
	Fri,  6 Dec 2024 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="APkY/E2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBB1FFC76;
	Fri,  6 Dec 2024 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502720; cv=none; b=BrVN3wr2gvJhO3r1R3R78lQy60RujVNnYiodc4hjbRlXuz5gZskp+K1r1OLRA2aI2T1dFq5YXQzlF+VLQvarozIbmlUOQ0SDEdR/4otGG0ivIj9tk3mR20H81xWJsMeDNJzOCiO24BMDGfBbRZ91I8JqHnhI2tc3UjK35dBU37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502720; c=relaxed/simple;
	bh=tGxxB+XljXcuE0hRcX2Nqt/vxo0R6CzixL3bi2d2wEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISANPAp/fE2VINM9im2PHOlgBHGyhCy8XrfgOmVKHmALM0mlwyym+zWwNiI5UwDoG1rvvAIGkk5X9WG50KuZeY0rbbaH4T4FCV0U4pzn5FHImyQrZwJUI8RZ7qySrjqqDtc7gB+RUbS+VP1+NgONlzjQd6ngbYCjCLHZ4mB4/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=APkY/E2T; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o1vL76URTK41WeEd0opGeSEdVV53xsw2rWEY8OQ/ulA=; b=APkY/E2TP7kW+DlfgfAUkVH/tJ
	pDde5UjrykoRcsopffzWphPbr7BGeBcyrTEolWm1OPh+UB58yGKlpPpgdEcjZ41b1aE01UK8tc9Ee
	jgVNP3Zyi+wkChgoKb4a2kXrj3S/JKuvVwxsw3xOc6elrAflggMJQYRbIasxkIY+bQFLWyNigXJ4H
	j4bmxWn9DCnm3heXF60lcdi3QG6WsyMne2ie/Uw92po4PeVO9nhFQLRDWerbYGsvxOZ/s4hWnoi95
	AGPCJtMiiD8bUAGou6kVvtlwaxVFdQnP9Tq21vC9HHgrfCRluPlpGMMhUMhbTijGOPFwwl/BMupTj
	1bwuSKcw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37298)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJbF6-0006Uj-1E;
	Fri, 06 Dec 2024 16:31:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJbF4-0007g4-3D;
	Fri, 06 Dec 2024 16:31:47 +0000
Date: Fri, 6 Dec 2024 16:31:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com, quic_linchen@quicinc.com,
	quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
	bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com,
	john@phrozen.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Message-ID: <Z1Mm8nBR_sYyzBUh@shell.armlinux.org.uk>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
 <Z1B3W94-8qjn17Sj@shell.armlinux.org.uk>
 <dc40d847-9a98-4f46-94cb-208257334aed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc40d847-9a98-4f46-94cb-208257334aed@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Dec 07, 2024 at 12:20:57AM +0800, Lei Wei wrote:
> On 12/4/2024 11:38 PM, Russell King (Oracle) wrote:
> > On Wed, Dec 04, 2024 at 10:43:56PM +0800, Lei Wei wrote:
> > > +static int ipq_pcs_link_up_config_usxgmii(struct ipq_pcs *qpcs, int speed)
> > > +{
> > ...
> > > +	/* USXGMII only support full duplex mode */
> > > +	val |= XPCS_DUPLEX_FULL;
> > 
> > Again... this restriction needs to be implemented in .pcs_validate() by
> > knocking out the half-duplex link modes when using USXGMII mode.
> > 
> > .pcs_validate() needs to be implemented whenever the PCS has
> > restrictions beyond what is standard for the PHY interface mode.
> > 
> 
> Currently, it seems there is no phylink_validate() call in
> phylink_resolve(), to validate the resolved duplex/speed which is notified
> by phydev when the PHY is linked up. So I am thinking to add this duplex
> check in this link_up op, and return an appropriate error in case of
> half-duplex. (Kindly correct me if I am wrong).

Doing validation at that point is way too late.

We don't want the PHY e.g. even advertising a half-duplex link mode if
the system as a whole can not support half-duplex modes. If the system
can't support half-duplex, then trying to trap it out at resolve time
would be way too late - the media has already negotiated a half-duplex
link, and that's that.

Instead, phylink takes the approach of restricting the media
advertisement according to the properties of the system, thereby
preventing invalid configurations _way_ before we get to autoneg
completion and calling phylink_resolve().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

