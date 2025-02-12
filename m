Return-Path: <linux-arm-msm+bounces-47733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54053A32360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA933A418A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1C6207A2C;
	Wed, 12 Feb 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="w3RGNjl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2241E500C;
	Wed, 12 Feb 2025 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355616; cv=none; b=ZdOE9XBGl6Q5zQudmU+hCUELQrYanCI2KmejaXbssWnWcdlsX+Z9zZ3b5CalPLOu3F7Tzrhr6Q/GdYZRdkE0Py3gQzvtDKOCIjwWFMIK8qcmEULP/9xuuUvMD8ndUOBjcxZWiwpB5cvcbrzrWKy/VPWTMGpaIWWwk8Ba/hXv2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355616; c=relaxed/simple;
	bh=RCfAMMxOOEEkjSQj2Z4giICANWiUwwtkqv87A6WeoKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqP+/CocraQIZYWes9rgnDkMuh4Co/3yLEO4bSJBwYx4M3jw7OlBd2JamKMfkILP2H92+Krr7UouIwbkfbDlPoY5JNvPNkbjPXnZ+h4590E/GYYrXExStYvr0ofxpknW2ceUZUqcm8xo0yiFOlLeQIvFKpjcRdslFAeljRzf/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=w3RGNjl7; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y8IN83D0tylBbKwg7C8Aw8PwV2/BnkhsqgeFy96LOxI=; b=w3RGNjl7vBZRtVLEfS8UB+J+Ea
	RCafq7gKeGXNuTpE24NzRQPhZjFSNKP/Mf8ho4hrnWSOdre7vkZ2ZK2HxLCdxtWjtHgKLmfZX67W0
	b7UWLcLKXrldSPS5rKde59jxxemk/JWyZBlrU96lLCrx77kG5hzBAoZtJeHmr3PZi+Ue5MfTLswJI
	wdkVYWme3pMqbFxEz7TVAEj2Z+8iya9vbf/nEZp3OmPPzYwPiGfYJXHQ7s2sqHobbf+PHShb7OyFc
	IIRZUvDSiAwk55zScuDwgECc9pfeZO+LrKqg7jaoGYS69iypBWKbD7V1tOveHr7NmJm7t+lYyw6h9
	dvLlGyWg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47876)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ti9qU-0005Tj-1n;
	Wed, 12 Feb 2025 10:19:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ti9qO-00012C-32;
	Wed, 12 Feb 2025 10:19:48 +0000
Date: Wed, 12 Feb 2025 10:19:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
Message-ID: <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211195934.47943371@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 11, 2025 at 07:59:34PM -0800, Jakub Kicinski wrote:
> On Fri, 7 Feb 2025 23:53:11 +0800 Lei Wei wrote:
> > The 'UNIPHY' PCS block in the Qualcomm IPQ9574 SoC provides Ethernet
> > PCS and SerDes functions. It supports 1Gbps mode PCS and 10-Gigabit
> > mode PCS (XPCS) functions, and supports various interface modes for
> > the connectivity between the Ethernet MAC and the external PHYs/Switch.
> > There are three UNIPHY (PCS) instances in IPQ9574, supporting the six
> > Ethernet ports.
> > 
> > This patch series adds base driver support for initializing the PCS,
> > and PCS phylink ops for managing the PCS modes/states. Support for
> > SGMII/QSGMII (PCS) and USXGMII (XPCS) modes is being added initially.
> > 
> > The Ethernet driver which handles the MAC operations will create the
> > PCS instances and phylink for the MAC, by utilizing the API exported
> > by this driver.
> > 
> > While support is being added initially for IPQ9574, the driver is
> > expected to be easily extendable later for other SoCs in the IPQ
> > family such as IPQ5332.
> 
> Could someone with PHY, or even, dare I say, phylink expertise
> take a look here?

I've not had the time, sorry. Looking at it now, I have lots of
questions over this.

1) clocks.

- Patch 2 provides clocks from this driver which are exported to the
  NSCCC block that are then used to provide the MII clocks.
- Patch 3 consumes clocks from the NSCCC block for use with each PCS.

Surely this leads to a circular dependency, where the MSCCC driver
can't get the clocks it needs until this driver has initialised, but
this driver can't get the clocks it needs for each PCS from the NSCCC
because the MSCCC driver needs this driver to initialise.

2) there's yet another open coded "_get" function for getting the
PCS given a DT node which is different from every other "_get"
function - this one checks the parent DT node has an appropriate
compatible whereas others don't. The whole poliferation of "_get"
methods that are specific to each PCS still needs solving, and I
still have the big question around what happens when the PCS driver
gets unbound - and whether that causes the kernel to oops. I'm also
not a fan of "look up the struct device and then get its driver data".
There is *no* locking over accessing the driver data.

3) doesn't populate supported_interfaces for the PCS - which would
make ipq_pcs_validate() unnecessary until patch 4 (but see 6 below.)

4)
"+       /* Nothing to do here as in-band autoneg mode is enabled
+        * by default for each PCS MII port."

"by default" doesn't matter - what if in-band is disabled and then
subsequently enabled.

5) there seems to be an open-coded decision about the clock rate but
there's also ipq_pcs_clk_rate_get() which seems to make the same
decision.

6) it seems this block has N PCS, but all PCS must operate in the same
mode (e.g. one PCS can't operate in SGMII mode, another in USXGMII
mode.) Currently, the last "config" wins over previous configs across
all interfaces. Is this the best solution? Should we be detecting
conflicting configurations? Unfortunately, pcs->supported_interfaces
can't really be changed after the PCS is being used, so I guess
any such restrictions would need to go in ipq_pcs_validate() which
should work fine - although it would mean that a MAC populating
its phylink_config->supported_interfaces using pcs->supported_interfaces
may end up with too many interface bits set.

(1), (2) and (6) are probably the major issues at the moment, and (2)
has been around for a while.

Given (1), I'm just left wondering whether this has been runtime
tested, and how the driver model's driver dependencies cope with it
if the NSCCC driver is both a clock consumer of/provider to this
driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

