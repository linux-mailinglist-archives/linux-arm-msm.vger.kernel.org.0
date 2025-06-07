Return-Path: <linux-arm-msm+bounces-60505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F8AD0B9C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 09:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACE437A627A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 07:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E3D1D6193;
	Sat,  7 Jun 2025 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="nmQnTRQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B32746A;
	Sat,  7 Jun 2025 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281586; cv=none; b=pm/bDOlaqzM0iFJNiy5zYLyiO3u5lHqojSwSAG1gi0AGzZTs/MQjGov7GlhNIr5xnaNj6Hsxfa3VeFr9AC4JhfpJVn3nfqnZAWcoYkKl73bf0CWnU+u3A8Ougm65jXr1ufRZaa+HREHNBYwVCx/cameOPrjX/S74DihGGVG1zhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281586; c=relaxed/simple;
	bh=4ojtFF5ydY7GePXSuRDH+3gG5quKRHpnhQew3pMwLiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s07dTSsw6t5JOVdJ6cut8sSVu0noJTF23qtwNymQGOTfDXyBsldbSvuIJrclFUyhgBjKIlBnccjvSi1d2DxHa3wpYxd0DDma31Qvy5kLg3+quooyy/Ysgti/nAGf7O8XwDPScPlkY4OB4HPzOsa5FlCMOgDGVgFkWmyRLKgM6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=nmQnTRQz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lLaVWBfYr4bHWWchHu2peBzXsqMla/2LK31cTUrka3I=; b=nmQnTRQzji183HY/+GPjhjlzFn
	9fiVPBsdleUBYnSr8Yc98Ep2NfLx3XKwriLPpfGlh2InipZPc70aLx93IF+h7pJyynSPh5s9EGlCy
	96beVdPqHkUyXesh9e/l+KpM+6uAPU36C9FgwPbo1ZJMBhv14kyGira47OId50E9CbqFgs+W/h6yr
	UhSv29CFKzyTx9ra5IGfKp5HwqBaJ8UhweT05yNKq3Ms99/69mXlHXDYC0qaUHLUh+RjQXRcUMrWE
	zQfyj0KJL6G/neGgNhag/39KZfZ6Ijz4jF5G6o+Ez1kJTnnJDh77zQ2P0cqRluZK16oLeTmcrcybc
	/A8gLIzg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43464)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uNo2p-0001YP-2I;
	Sat, 07 Jun 2025 08:32:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uNo2m-00045f-14;
	Sat, 07 Jun 2025 08:32:44 +0100
Date: Sat, 7 Jun 2025 08:32:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: George Moussalem <george.moussalem@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <aEPrHCf55eMwJXiL@shell.armlinux.org.uk>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>
 <20250605181453.GA2946252-robh@kernel.org>
 <DS7PR19MB8883E074E64AC6FCAB1B1DE69D6EA@DS7PR19MB8883.namprd19.prod.outlook.com>
 <23b92ed3-7788-4675-8f80-590e4337025c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23b92ed3-7788-4675-8f80-590e4337025c@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jun 06, 2025 at 03:01:26PM +0200, Andrew Lunn wrote:
> > Under 'properties' node:
> >   compatible:
> >     enum:
> >       - ethernet-phy-id004d.d0c0
> > 
> > Q: do I need to add the PHY IDs of all PHYs that the qca803x driver covers
> > or will this one suffice?
> 
> The history is complicated, because PHYs can be enumerated

... provided one doesn't wire up the reset pin to a GPIO and then
declare that in DT as a reset pin for the PHY, thus holding the PHY
in reset while we try to probe what's on the bus, making the ID
unreadable.

The down-side to providing the ID in the compatible is we lose the
revision, so if a new revision of the PHY ends up being fitted
part way through production, the kernel has no way to know.

Sadly, we can't just read the PHY ID when we've released reset
because the ID may be provided in DT because the one in the device
is not reliable / wrong.

What's done on SolidRun platforms is that the PHY reset is connected
to a GPIO, but that is controlled by the boot loader and not by the
kernel. All PHY resets are deasserted before the kernel is entered,
and the reset GPIOs are in DT as "hogged" GPIOs. This allows phylib
to operate normally without any of this faff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

