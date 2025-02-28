Return-Path: <linux-arm-msm+bounces-49860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CFA49BCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEA871897909
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F9726E94F;
	Fri, 28 Feb 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="c9nJMMt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BFD1AA1FA;
	Fri, 28 Feb 2025 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752565; cv=none; b=pj6ipJudrXZJ97zc08g6vU+A2fTYpswnZWlAC0VfaRjKoQvHqrNiwmIx2S1v4DgtIwXQ/azi4s0XDUy2glMxanRwDOE48lvuai/+SWOE58vOEs3KRD77gDMHXQMj67Q6wHyvR3Wt1Ul4OHXsCQsyj/hHzQ3XwATu6/1hhsJK3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752565; c=relaxed/simple;
	bh=6UXEncONaPYz2j1TSNLuTfEKvtKMh5PTmmSy/EJTvtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTPyQbScT3JFDMq/06Vy3B2ixKMMXaG4dCHfo3LRchIkAIMZ01PEkNJwf/XXMNvS0CkfAgrt+w9LYR93KF13ALYPwhpcpT93zM/PTN2CMSl3IDmBSQxcPLNy4cNx/nsTYxTytRv+jxNijMwMFtDOouqieNYdxBhuN0rKHeXBCu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=c9nJMMt4; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z/PkK21dX5bu6dg00h631OfOQu8sWV88qftNm6kJCdU=; b=c9nJMMt4G24TfQe5jMCZ4HldH+
	cLQEXKYwwawK1xwt+CqoEXIH0CrV0i7Ur//g6P/nPDgjdeTaIyxyAWh+OPntPSvtYYPKJzSgGklA/
	BghsEOMs3BOSzyuNrblnZq9HL0dkLeEtUlHe/QgzAQDG0nUd/9FcBC99L3r3zeS6TnePd+z4Me5od
	gdgUcMrcIxNZ7m/+O+hNVU29AbBycEjFVEuuGM3GETLG9SanJKpqfazlRFd+hc1DKrmvJIMRl/PCN
	dBuQBws5BM8eKurVQ3+Lvp7u1J0Nhn+Qrx7qsK9Wf9sIx0dYtIAG6tQc1jobdz5qtYII8qguCvMpW
	rkiud2yg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38986)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1to1Fz-00025B-27;
	Fri, 28 Feb 2025 14:22:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1to1Fv-0000o8-03;
	Fri, 28 Feb 2025 14:22:23 +0000
Date: Fri, 28 Feb 2025 14:22:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <Z8HGnop3ONe5mDGk@shell.armlinux.org.uk>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
 <20250211195934.47943371@kernel.org>
 <Z6x1xD0krK0_eycB@shell.armlinux.org.uk>
 <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a69eb6-9e24-48ab-8301-93ec3ff43cc7@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Feb 19, 2025 at 06:46:57PM +0800, Lei Wei wrote:
> > 2) there's yet another open coded "_get" function for getting the
> > PCS given a DT node which is different from every other "_get"
> > function - this one checks the parent DT node has an appropriate
> > compatible whereas others don't. The whole poliferation of "_get"
> > methods that are specific to each PCS still needs solving, and I
> > still have the big question around what happens when the PCS driver
> > gets unbound - and whether that causes the kernel to oops. I'm also
> > not a fan of "look up the struct device and then get its driver data".
> > There is *no* locking over accessing the driver data.
> 
> The PCS device in IPQ9574 chipset is built into the SoC chip and is not
> pluggable. Also, the PCS driver module is not unloadable until the MAC
> driver that depends on it is unloaded. Therefore, marking the driver
> '.suppress_bind_attrs = true' to disable user unbind action may be good
> enough to cover all possible scenarios of device going away for IPQ9574 PCS
> driver.

What I am concerned about is the proliferation of these various PCS
specific "_get" methods. Where the PCS is looked up by firmware
reference, we should have a common way to do that, rather than all
these PCS specific ways.

I did start work on that, but I just haven't had the time to take it
forward. This is about as far as I'd got:

diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90..0b670fee0757 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+obj-$(CONFIG_PHYLINK)		+= pcs-core.o
+
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
 				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 976e569feb70..1c5492dab00e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2483,6 +2483,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
+/**
+ * phylink_pcs_remove() - notify phylink that a PCS is going away
+ * @pcs: PCS that is going away
+ */
+void phylink_pcs_remove(struct phylink_pcs *pcs)
+{
+	
+}
+
 static irqreturn_t phylink_link_handler(int irq, void *data)
 {
 	struct phylink *pl = data;
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 071ed4683c8c..1e6b7ce0fa7a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -1,6 +1,7 @@
 #ifndef NETDEV_PCS_H
 #define NETDEV_PCS_H
 
+#include <linux/list.h>
 #include <linux/phy.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -435,9 +436,11 @@ int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 #endif
 
 struct phylink_pcs_ops;
+struct pcs_lookup;
 
 /**
  * struct phylink_pcs - PHYLINK PCS instance
+ * @lookup: private member for PCS core management
  * @supported_interfaces: describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by this PCS.
  * @ops: a pointer to the &struct phylink_pcs_ops structure
@@ -455,6 +458,7 @@ struct phylink_pcs_ops;
  * the PCS driver.
  */
 struct phylink_pcs {
+	struct pcs_lookup *lookup;
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
 	struct phylink *phylink;
@@ -692,6 +696,7 @@ int phylink_set_fixed_link(struct phylink *,
 
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
+void phylink_pcs_remove(struct phylink_pcs *);
 
 int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
 
@@ -790,4 +795,11 @@ void phylink_mii_c45_pcs_get_state(struct mdio_device *pcs,
 
 void phylink_decode_usxgmii_word(struct phylink_link_state *state,
 				 uint16_t lpa);
+
+/* PCS lookup */
+struct phylink_pcs *pcs_find(void *id);
+void pcs_remove(struct phylink_pcs *pcs);
+int pcs_add(struct phylink_pcs *pcs, void *id);
+int devm_pcs_add(struct device *dev, struct phylink_pcs *pcs, void *id);
+
 #endif

The idea is that you add the device using whatever identifier you decide
(the pointer value is what's matched). For example, a fwnode. You can
then find it using pcs_find().

If it returns NULL, then it's not (yet) registered - if you know that it
should exist (e.g. because the fwnode is marked as available) then you
can return -EPROBE_DEFER or fail.

There is a hook present so phylink can do something on PCS removal -
that's still to be implemented with this. I envision keeping a list
of phylink instances, and walking that list to discover if any phylink
instances are currently using the PCS. If they are, then we can take
the link down.

> I would like to clarify on the hardware supported configurations for the
> UNIPHY PCS hardware instances. [Note: There are three instances of 'UNIPHY
> PCS' in IPQ9574. However we take the example here for PCS0]
> 
> UNIPHY PCS0 --> pcs0_mii0..pcs0_mii4 (5 PCS MII channels maximum).
> Possible combinations: QSGMII (4x 1 SGMII)
> 			PSGMII (5 x 1 SGMII),
> 			SGMII (1 x 1 SGMII)
> 			USXGMII (1 x 1 USXGMII)
> 	
> As we can see above, different PCS channels in a 'UNIPHY' PCS block working
> in different PHY interface modes is not supported by the hardware. So, it
> might not be necessary to detect that conflict. If the interface mode
> changes from one to another, the same interface mode is applicable to all
> the PCS channels that are associated with the UNIPHY PCS block.
> 
> Below is an example of a DTS configuration which depicts one board
> configuration where one 'UNIPHY' (PCS0) is connected with a QCA8075 Quad
> PHY, it has 4 MII channels enabled and connected with 4 PPE MAC ports, and
> all the PCS MII channels are in QSGMII mode. For the 'UNIPHY' connected with
> single SGMII or USXGMII PHY (PCS1), only one MII channel is enabled and
> connected with one PPE MAC port.
> 
> PHY:
> &mdio {
> 	ethernet-phy-package@0 {
>                 compatible = "qcom,qca8075-package";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x10>;
>                 qcom,package-mode = "qsgmii";
> 
>                 phy0: ethernet-phy@10 {
>                         reg = <0x10>;
>                 };
> 
>                 phy1: ethernet-phy@11 {
>                         reg = <0x11>;
>                 };
> 
>                 phy2: ethernet-phy@12 {
>                         reg = <0x12>;
>                 };
> 
>                 phy3: ethernet-phy@13 {
>                         reg = <0x13>;
>                 };
> 	};
> 	phy4: ethernet-phy@8 {
>                 compatible ="ethernet-phy-ieee802.3-c45";
>                 reg = <8>;
>         };
> }
> 
> PCS:
> pcs0: ethernet-pcs@7a00000 {
> 	......
> 	pcs0_mii0: pcs-mii@0 {
> 		reg = <0>;
> 		status = "enabled";
> 	};
> 
> 	......
> 
> 	pcs0_mii3: pcs-mii@3 {
> 		reg = <3>;
> 		status = "enabled";
> 	};
> };

Given that this is a package of several PCS which have a global mode, I
think it would be a good idea to have a property like
"qcom,package-mode" which defines which of the four modes should be used
for all PCS.

Then the PCS driver initialises supported_interfaces for each of these
PCS to only contain that mode, thereby ensuring that unsupported
dissimilar modes can't be selected or the mode unexpectedly changed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

