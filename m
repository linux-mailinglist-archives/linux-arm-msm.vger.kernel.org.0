Return-Path: <linux-arm-msm+bounces-62853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29CAEBDE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DBA11898A39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E132EA724;
	Fri, 27 Jun 2025 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HlFqDnEq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF3E185E7F;
	Fri, 27 Jun 2025 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043260; cv=none; b=E68rfpx6W+PqKl7gF2nfjrXzSZTUPJKwUf0giwY1Ub6CRS+J0B97nLmLpt9qPIxf80D15kL3tR1GYuOpQHhv16Se+mm3Ty4pgoknZixl3BH/A5+ndHy9kByhlFLdXsPKaEcIUrOuxZrJvygJ7KCNbunZmrgblxASXf08Ad3yZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043260; c=relaxed/simple;
	bh=C1M2eCmTRJEnCSOMZJgg+cRJIDXef0XSu5rYNrrk1fA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k308vUJwVLhrvlArpG4R3lH3NwasuBmFp1Qina0189txHnz29pEuwXzeDgVlakLE4NGoJ3Nyrf6I9LkMuzQBpK/0T34Q8z9zQmb7EKAEkFKeJFxdj7kX10XrML+PJR2skFBUMLnvu8y0TJc/nfzentohRaOybTNXG9Ngs5LEngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HlFqDnEq; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 155E0443CE;
	Fri, 27 Jun 2025 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeSFO9YmP+VkNGWgZDjeNmNRPcvML0v01nWUb6jOpZU=;
	b=HlFqDnEqkvlG3RejH7/pchC3wYToHai2TPtoWVJHInnRmRTY382TJUp4B9i2cWXv6mCbrD
	UtMdobSU1Rhc1WtcIs1sf1ef4b8g6h/yb/qYq0z9MDs6QuCIHV7ESwMns/z4/2ttDO0ATO
	TQdVtivdHisypeWtFdc8LOcHjI2w+pICCCSeyuSDddanF7ufvYRAaName34eCJze+2ouRE
	prgET+ehViEi0VXPeSE4+Wihe6n2n4jZJWEbjkVgEexCAikjZuje4WDJAr3qA5zKzxZxCJ
	3zHK32zHwsWuJ7ZDyFWMZ60t02OHT9h+BX0aXLQdGAZpVu/fwA1GXC2g8xCB+w==
Date: Fri, 27 Jun 2025 18:54:04 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250627185404.7496fbc4@fedora>
In-Reply-To: <3878435.kQq0lBPeGt@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
	<3878435.kQq0lBPeGt@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Romain,

On Mon, 12 May 2025 09:53:09 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,

I'm about to send a V7, but I realise now I didn't address these
reviews... sorry about that

> On Wednesday, 7 May 2025 15:53:19 CEST Maxime Chevallier wrote:
> > Ethernet provides a wide variety of layer 1 protocols and standards for
> > data transmission. The front-facing ports of an interface have their own
> > complexity and configurability.
> >   
> ...
> > +
> > +static int phy_default_setup_single_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port = phy_port_alloc();
> > +
> > +	if (!port)
> > +		return -ENOMEM;
> > +
> > +	port->parent_type = PHY_PORT_PHY;
> > +	port->phy = phydev;
> > +	linkmode_copy(port->supported, phydev->supported);
> > +
> > +	phy_add_port(phydev, port);
> > +
> > +	/* default medium is copper */
> > +	if (!port->mediums)
> > +		port->mediums |= BIT(ETHTOOL_LINK_MEDIUM_BASET);  
> 
> Could this be moved to phy_port_alloc() instead? That way, you'd avoid the 
> extra conditional and the "default medium == baseT" rule would be enforced as 
> early as possible.

I'll actually remove that altogether. For a single-port PHY, we can
actually derive the mediums from the PHY's supported field.

[...]

> > +	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
> > +		linkmode_zero(supported);  
> 
> ethtool_medium_get_supported() can only set bits in "supported", so you could 
> just do:
> 
> ```
> for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
> 	ethtool_medium_get_supported(port->supported, i, port->lanes);
> ```
> 
> unless you're wary of someone modifying ethtool_medium_get_supported() in a 
> way that breaks this in the future?

Hmm yes, but at least here it makes it obvious we're accumulating the
linkmodes :/

> 
> > +		ethtool_medium_get_supported(supported, i, port->lanes);
> > +		linkmode_or(port->supported, port->supported, supported);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(phy_port_update_supported);
> > +
> > +/**
> > + * phy_port_get_type() - get the PORT_* attribut for that port.
> > + * @port: The port we want the information from
> > + *
> > + * Returns: A PORT_XXX value.
> > + */
> > +int phy_port_get_type(struct phy_port *port)
> > +{
> > +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
> > +		return PORT_TP;
> > +
> > +	if (phy_port_is_fiber(port))
> > +		return PORT_FIBRE;
> > +
> > +	return PORT_OTHER;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_port_get_type);
> > diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> > index c1d805d3e02f..0d3063af5905 100644
> > --- a/include/linux/ethtool.h
> > +++ b/include/linux/ethtool.h
> > @@ -226,6 +226,10 @@ extern const struct link_mode_info link_mode_params[];
> > 
> >  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
> > 
> > +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> > +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> > +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> > +
> >  static inline const char *phy_mediums(enum ethtool_link_medium medium)
> >  {
> >  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> > @@ -234,6 +238,17 @@ static inline const char *phy_mediums(enum
> > ethtool_link_medium medium) return ethtool_link_medium_names[medium];
> >  }
> > 
> > +static inline int phy_medium_default_lanes(enum ethtool_link_medium medium)
> > +{
> > +	/* Let's consider that the default BaseT ethernet is BaseT4, i.e.
> > +	 * Gigabit Ethernet.
> > +	 */
> > +	if (medium == ETHTOOL_LINK_MEDIUM_BASET)
> > +		return 4;
> > +
> > +	return 1;
> > +}
> > +
> >  /* declare a link mode bitmap */
> >  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
> >  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index d62d292024bc..0180f4d4fd7d 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -299,6 +299,7 @@ static inline long rgmii_clock(int speed)
> >  struct device;
> >  struct kernel_hwtstamp_config;
> >  struct phylink;
> > +struct phy_port;
> >  struct sfp_bus;
> >  struct sfp_upstream_ops;
> >  struct sk_buff;
> > @@ -590,6 +591,9 @@ struct macsec_ops;
> >   * @master_slave_state: Current master/slave configuration
> >   * @mii_ts: Pointer to time stamper callbacks
> >   * @psec: Pointer to Power Sourcing Equipment control struct
> > + * @ports: List of PHY ports structures
> > + * @n_ports: Number of ports currently attached to the PHY
> > + * @max_n_ports: Max number of ports this PHY can expose
> >   * @lock:  Mutex for serialization access to PHY
> >   * @state_queue: Work queue for state machine
> >   * @link_down_events: Number of times link was lost
> > @@ -724,6 +728,10 @@ struct phy_device {
> >  	struct mii_timestamper *mii_ts;
> >  	struct pse_control *psec;
> > 
> > +	struct list_head ports;
> > +	int n_ports;
> > +	int max_n_ports;
> > +
> >  	u8 mdix;
> >  	u8 mdix_ctrl;
> > 
> > @@ -1242,6 +1250,27 @@ struct phy_driver {
> >  	 * Returns the time in jiffies until the next update event.
> >  	 */
> >  	unsigned int (*get_next_update_time)(struct phy_device *dev);
> > +
> > +	/**
> > +	 * @attach_port: Indicates to the PHY driver that a port is detected
> > +	 * @dev: PHY device to notify
> > +	 * @port: The port being added
> > +	 *
> > +	 * Called when a port that needs to be driven by the PHY is found. The
> > +	 * number of time this will be called depends on phydev->max_n_ports,
> > +	 * which the driver can change in .probe().
> > +	 *
> > +	 * The port that is being passed may or may not be initialized. If it   
> is
> > +	 * already initialized, it is by the generic port representation from
> > +	 * devicetree, which superseeds any strapping or vendor-specific
> > +	 * properties.
> > +	 *
> > +	 * If the port isn't initialized, the port->mediums and port->lanes
> > +	 * fields must be set, possibly according to stapping information.
> > +	 *
> > +	 * Returns 0, or an error code.
> > +	 */
> > +	int (*attach_port)(struct phy_device *dev, struct phy_port *port);
> >  };
> >  #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		  
> \
> >  				      struct phy_driver, mdiodrv)
> > @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
> >  void phy_mac_interrupt(struct phy_device *phydev);
> >  void phy_start_machine(struct phy_device *phydev);
> >  void phy_stop_machine(struct phy_device *phydev);
> > +
> >  void phy_ethtool_ksettings_get(struct phy_device *phydev,
> >  			       struct ethtool_link_ksettings *cmd);
> >  int phy_ethtool_ksettings_set(struct phy_device *phydev,
> > diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> > new file mode 100644
> > index 000000000000..70aa75f93096
> > --- /dev/null
> > +++ b/include/linux/phy_port.h
> > @@ -0,0 +1,93 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +#ifndef __PHY_PORT_H
> > +#define __PHY_PORT_H
> > +
> > +#include <linux/ethtool.h>
> > +#include <linux/types.h>
> > +#include <linux/phy.h>
> > +
> > +struct phy_port;
> > +
> > +/**
> > + * enum phy_port_parent - The device this port is attached to
> > + *
> > + * @PHY_PORT_PHY: Indicates that the port is driven by a PHY device
> > + */
> > +enum phy_port_parent {
> > +	PHY_PORT_PHY,
> > +};
> > +
> > +struct phy_port_ops {
> > +	/* Sometimes, the link state can be retrieved from physical,
> > +	 * out-of-band channels such as the LOS signal on SFP. These
> > +	 * callbacks allows notifying the port about state changes
> > +	 */
> > +	void (*link_up)(struct phy_port *port);
> > +	void (*link_down)(struct phy_port *port);
> > +
> > +	/* If the port acts as a Media Independent Interface (Serdes port),
> > +	 * configures the port with the relevant state and mode. When enable is
> > +	 * not set, interface should be ignored
> > +	 */
> > +	int (*configure_mii)(struct phy_port *port, bool enable,   
> phy_interface_t
> > interface); +};
> > +
> > +/**
> > + * struct phy_port - A representation of a network device physical
> > interface + *
> > + * @head: Used by the port's parent to list ports
> > + * @parent_type: The type of device this port is directly connected to
> > + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> > + * @ops: Callback ops implemented by the port controller
> > + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> > applicable + * @mediums: Bitmask of the physical mediums this port provides
> > access to + * @supported: The link modes this port can expose, if this port
> > is MDI (not MII) + * @interfaces: The MII interfaces this port supports, if
> > this port is MII + * @active: Indicates if the port is currently part of
> > the active link. + * @is_serdes: Indicates if this port is Serialised MII
> > (Media Independent + *	       Interface), or an MDI (Media Dependent
> > Interface).
> > + */
> > +struct phy_port {
> > +	struct list_head head;
> > +	enum phy_port_parent parent_type;
> > +	union {
> > +		struct phy_device *phy;
> > +	};
> > +
> > +	const struct phy_port_ops *ops;
> > +
> > +	int lanes;
> > +	unsigned long mediums;
> > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > +
> > +	unsigned int active:1;
> > +	unsigned int is_serdes:1;
> > +};
> > +
> > +struct phy_port *phy_port_alloc(void);
> > +void phy_port_destroy(struct phy_port *port);
> > +
> > +static inline struct phy_device *port_phydev(struct phy_port *port)
> > +{
> > +	return port->phy;
> > +}
> > +
> > +struct phy_port *phy_of_parse_port(struct device_node *dn);
> > +
> > +static inline bool phy_port_is_copper(struct phy_port *port)
> > +{
> > +	return port->mediums == BIT(ETHTOOL_LINK_MEDIUM_BASET);  
> 
> BaseC is also "copper" right? Maybe this should be renamed to 
> "phy_port_is_tp"?

Yeah indeed...

Maxime

> 


