Return-Path: <linux-arm-msm+bounces-57588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C21AB30CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F313B233B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BDD2571C1;
	Mon, 12 May 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bRFOCzcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C5256C89;
	Mon, 12 May 2025 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036408; cv=none; b=p4HFIlXGT/6K2gEKlBrRI6G8Bpj/+Sm/ERTHLNfdtEbUyoPd8l2n82IXpAkG+GkYFuMUnFU+jKA07ilf1oelfVqNPTNnVrDXoNR2PcHU0fsYNaoBwGzX+oxzOz0uXwQhNWHeDbPl5RyQA5681HDqiqJx4U0I2GJ9WvGKZkFYJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036408; c=relaxed/simple;
	bh=1lzGNgdiOiHRdHshusc2BAhpbDQalgP3ikQNwUBzgDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyKJdoMNq4YlmqlJSN/1dehB7VDb5lnQDUoAX/OQPltLdf7Cx1nOa14EcQzGQjuf4hsa+AJaOMGAei9GDCcO8Q5Ohep0Bmt/Y/sueeiur15XLS+D3I7RSb2i+MQ+9i2r25qQO3KPkM8QPsIEAwQxz5gb0PRWpYA8hors0aZp0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bRFOCzcL; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECBE343A22;
	Mon, 12 May 2025 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747036397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3JdVmFAPsR+3WBG7Vk3r7Za7/cXwc/fNQ3fTQWewBDY=;
	b=bRFOCzcLVeA7kSsmluzXLv7xk0WdvNErm8O2DAc+qJ+jmWI7K5bwa1n5XMgnHJuSeoUZ4f
	gBn2hmIWk9TJ6EZtW8NJhNgnjJTjoqEyy+Sk83cLy6YdrI/P3rs2VDXEj8fHFiPEoSGaQg
	XK1TcdFPBD2mpZYzm7p74ZWllX0oN2k956wh1wXAV+it1+TF/u4kiruXXZL7PD3gGYwSpJ
	LwtzBMPcOP1wCSDImlRqHAlAjvVEe/Bb0DXMeudDn3Lc/WSrh1xvSECi/LLQCor+zr/4po
	WeVACAq3VE3W/rIW+xDoHjVEs/czub1SivH/MaNGgZdkdOz+e/ur3bc3f6fOhw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: davem@davemloft.net, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?Tmljb2zDsg==?= Veronese <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject:
 Re: [PATCH net-next v6 03/14] net: phy: Introduce PHY ports representation
Date: Mon, 12 May 2025 09:53:09 +0200
Message-ID: <3878435.kQq0lBPeGt@fw-rgant>
In-Reply-To: <20250507135331.76021-4-maxime.chevallier@bootlin.com>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3629297.iIbC2pHGDl";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3629297.iIbC2pHGDl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 May 2025 09:53:09 +0200
Message-ID: <3878435.kQq0lBPeGt@fw-rgant>
In-Reply-To: <20250507135331.76021-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

Hi Maxime,

On Wednesday, 7 May 2025 15:53:19 CEST Maxime Chevallier wrote:
> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
> 
...
> +
> +static int phy_default_setup_single_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port = phy_port_alloc();
> +
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->parent_type = PHY_PORT_PHY;
> +	port->phy = phydev;
> +	linkmode_copy(port->supported, phydev->supported);
> +
> +	phy_add_port(phydev, port);
> +
> +	/* default medium is copper */
> +	if (!port->mediums)
> +		port->mediums |= BIT(ETHTOOL_LINK_MEDIUM_BASET);

Could this be moved to phy_port_alloc() instead? That way, you'd avoid the 
extra conditional and the "default medium == baseT" rule would be enforced as 
early as possible.

> +
> +	return 0;
> +}
> +
> +static int of_phy_ports(struct phy_device *phydev)
> +{
> +	struct device_node *node = phydev->mdio.dev.of_node;
> +	struct device_node *mdi;
> +	struct phy_port *port;
> +	int err;
> +
> +	if (!IS_ENABLED(CONFIG_OF_MDIO))
> +		return 0;
> +
> +	if (!node)
> +		return 0;
> +
> +	mdi = of_get_child_by_name(node, "mdi");
> +	if (!mdi)
> +		return 0;

There are a lot of different possible failure paths here, so some specific error 
messages would be relevant IMO.

> +
> +	for_each_available_child_of_node_scoped(mdi, port_node) {
> +		port = phy_of_parse_port(port_node);
> +		if (IS_ERR(port)) {
> +			err = PTR_ERR(port);
> +			goto out_err;
> +		}
> +
> +		port->parent_type = PHY_PORT_PHY;
> +		port->phy = phydev;
> +		err = phy_add_port(phydev, port);
> +		if (err)
> +			goto out_err;
> +	}
> +	of_node_put(mdi);
> +
> +	return 0;
> +
> +out_err:
> +	phy_cleanup_ports(phydev);
> +	of_node_put(mdi);
> +	return err;
> +}
> +
> +static int phy_setup_ports(struct phy_device *phydev)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(ports_supported);
> +	struct phy_port *port;
> +	int ret;
> +
> +	ret = of_phy_ports(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->n_ports < phydev->max_n_ports) {
> +		ret = phy_default_setup_single_port(phydev);
> +		if (ret)
> +			goto out;
> +	}

Couldn't the function return at this point if phydev->n_ports is 0? That 
would eliminate the need for the linkmode_empty() check later.

> +
> +	linkmode_zero(ports_supported);
> +
> +	/* Aggregate the supported modes, which are made-up of :
> +	 *  - What the PHY itself supports
> +	 *  - What the sum of all ports support
> +	 */
> +	list_for_each_entry(port, &phydev->ports, head)
> +		if (port->active)
> +			linkmode_or(ports_supported, ports_supported,
> +				    port->supported);
> +
> +	if (!linkmode_empty(ports_supported))
> +		linkmode_and(phydev->supported, phydev->supported,
> +			     ports_supported);
> +
> +	/* For now, the phy->port field is set as the first active port's type 
*/
> +	list_for_each_entry(port, &phydev->ports, head)
> +		if (port->active)
> +			phydev->port = phy_port_get_type(port);
> +
> +	return 0;
> +
> +out:
> +	phy_cleanup_ports(phydev);
> +	return ret;
> +}
> +
>  /**
>   * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
>   * @fwnode: pointer to the mdio_device's fwnode
> @@ -3339,6 +3500,11 @@ static int phy_probe(struct device *dev)
>  		phydev->is_gigabit_capable = 1;
> 
>  	of_set_phy_supported(phydev);
> +
> +	err = phy_setup_ports(phydev);
> +	if (err)
> +		goto out;
> +
>  	phy_advertise_supported(phydev);
> 
>  	/* Get PHY default EEE advertising modes and handle them as 
potentially
> @@ -3414,6 +3580,8 @@ static int phy_remove(struct device *dev)
> 
>  	phydev->state = PHY_DOWN;
> 
> +	phy_cleanup_ports(phydev);
> +
>  	sfp_bus_del_upstream(phydev->sfp_bus);
>  	phydev->sfp_bus = NULL;
> 
> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
> new file mode 100644
> index 000000000000..c69ba0d9afba
> --- /dev/null
> +++ b/drivers/net/phy/phy_port.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Framework to drive Ethernet ports
> + *
> + * Copyright (c) 2024 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + */
> +
> +#include <linux/linkmode.h>
> +#include <linux/of.h>
> +#include <linux/phy_port.h>
> +
> +/**
> + * phy_port_alloc() - Allocate a new phy_port
> + *
> + * Returns: a newly allocated struct phy_port, or NULL.
> + */
> +struct phy_port *phy_port_alloc(void)
> +{
> +	struct phy_port *port;
> +
> +	port = kzalloc(sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return NULL;
> +
> +	linkmode_zero(port->supported);
> +	INIT_LIST_HEAD(&port->head);
> +
> +	return port;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_alloc);
> +
> +/**
> + * phy_port_destroy() - Free a struct phy_port
> + * @port: The port to destroy
> + */
> +void phy_port_destroy(struct phy_port *port)
> +{
> +	kfree(port);
> +}
> +EXPORT_SYMBOL_GPL(phy_port_destroy);
> +
> +static void ethtool_medium_get_supported(unsigned long *supported,
> +					 enum ethtool_link_medium medium,
> +					 int lanes)
> +{
> +	int i;
> +
> +	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
> +		/* Special bits such as Autoneg, Pause, Asym_pause, etc. are
> +		 * set and will be masked away by the port parent.
> +		 */
> +		if (link_mode_params[i].mediums == 
BIT(ETHTOOL_LINK_MEDIUM_NONE)) {
> +			linkmode_set_bit(i, supported);
> +			continue;

If you change the subsequent "if" into an "else if", you'll avoid having to 
use "continue" here, which IMO would make things a bit clearer.

> +		}
> +
> +		/* For most cases, min_lanes == lanes, except for 10/100BaseT 
that work
> +		 * on 2 lanes but are compatible with 4 lanes mediums
> +		 */
> +		if (link_mode_params[i].mediums & BIT(medium) &&
> +		    link_mode_params[i].lanes >= lanes &&
> +		    link_mode_params[i].min_lanes <= lanes) {
> +			linkmode_set_bit(i, supported);
> +		}
> +	}
> +}
> +
> +static enum ethtool_link_medium ethtool_str_to_medium(const char *str)
> +{
> +	int i;
> +
> +	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
> +		if (!strcmp(phy_mediums(i), str))
> +			return i;
> +
> +	return ETHTOOL_LINK_MEDIUM_NONE;
> +}
> +
> +/**
> + * phy_of_parse_port() - Create a phy_port from a firmware representation
> + * @dn: device_node representation of the port, following the
> + *	ethernet-connector.yaml binding
> + *
> + * Returns: a newly allocated and initialized phy_port pointer, or an
> ERR_PTR. + */
> +struct phy_port *phy_of_parse_port(struct device_node *dn)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> +	enum ethtool_link_medium medium;
> +	struct phy_port *port;
> +	struct property *prop;
> +	const char *med_str;
> +	u32 lanes, mediums = 0;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
> +	if (ret)
> +		lanes = 0;

Checking if this property exists before calling fwnode_property_read_u32() 
would avoid masking potential error conditions where the property exists, but 
something goes wrong while reading it.

> +
> +	ret = fwnode_property_read_string(fwnode, "media", &med_str);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	of_property_for_each_string(to_of_node(fwnode), "media", prop, 
med_str) {
> +		medium = ethtool_str_to_medium(med_str);
> +		if (medium == ETHTOOL_LINK_MEDIUM_NONE)
> +			return ERR_PTR(-EINVAL);
> +
> +		mediums |= BIT(medium);
> +	}
> +
> +	if (!mediums)
> +		return ERR_PTR(-EINVAL);
> +
> +	port = phy_port_alloc();
> +	if (!port)
> +		return ERR_PTR(-ENOMEM);
> +
> +	port->lanes = lanes;
> +	port->mediums = mediums;
> +
> +	return port;
> +}
> +EXPORT_SYMBOL_GPL(phy_of_parse_port);
> +
> +/**
> + * phy_port_update_supported() - Setup the port->supported field
> + * @port: the port to update
> + *
> + * Once the port's medium list and number of lanes has been configured
> based + * on firmware, straps and vendor-specific properties, this function
> may be + * called to update the port's supported linkmodes list.
> + *
> + * Any mode that was manually set in the port's supported list remains set.
> + */
> +void phy_port_update_supported(struct phy_port *port)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> +	int i, lanes = 1;
> +
> +	/* If there's no lanes specified, we grab the default number of
> +	 * lanes as the max of the default lanes for each medium
> +	 */
> +	if (!port->lanes)
> +		for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
> +			lanes = max_t(int, lanes, phy_medium_default_lanes(i));
> +
> +	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
> +		linkmode_zero(supported);

ethtool_medium_get_supported() can only set bits in "supported", so you could 
just do:

```
for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
	ethtool_medium_get_supported(port->supported, i, port->lanes);
```

unless you're wary of someone modifying ethtool_medium_get_supported() in a 
way that breaks this in the future?

> +		ethtool_medium_get_supported(supported, i, port->lanes);
> +		linkmode_or(port->supported, port->supported, supported);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(phy_port_update_supported);
> +
> +/**
> + * phy_port_get_type() - get the PORT_* attribut for that port.
> + * @port: The port we want the information from
> + *
> + * Returns: A PORT_XXX value.
> + */
> +int phy_port_get_type(struct phy_port *port)
> +{
> +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
> +		return PORT_TP;
> +
> +	if (phy_port_is_fiber(port))
> +		return PORT_FIBRE;
> +
> +	return PORT_OTHER;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_get_type);
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index c1d805d3e02f..0d3063af5905 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -226,6 +226,10 @@ extern const struct link_mode_info link_mode_params[];
> 
>  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
> 
> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> +
>  static inline const char *phy_mediums(enum ethtool_link_medium medium)
>  {
>  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> @@ -234,6 +238,17 @@ static inline const char *phy_mediums(enum
> ethtool_link_medium medium) return ethtool_link_medium_names[medium];
>  }
> 
> +static inline int phy_medium_default_lanes(enum ethtool_link_medium medium)
> +{
> +	/* Let's consider that the default BaseT ethernet is BaseT4, i.e.
> +	 * Gigabit Ethernet.
> +	 */
> +	if (medium == ETHTOOL_LINK_MEDIUM_BASET)
> +		return 4;
> +
> +	return 1;
> +}
> +
>  /* declare a link mode bitmap */
>  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
>  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index d62d292024bc..0180f4d4fd7d 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -299,6 +299,7 @@ static inline long rgmii_clock(int speed)
>  struct device;
>  struct kernel_hwtstamp_config;
>  struct phylink;
> +struct phy_port;
>  struct sfp_bus;
>  struct sfp_upstream_ops;
>  struct sk_buff;
> @@ -590,6 +591,9 @@ struct macsec_ops;
>   * @master_slave_state: Current master/slave configuration
>   * @mii_ts: Pointer to time stamper callbacks
>   * @psec: Pointer to Power Sourcing Equipment control struct
> + * @ports: List of PHY ports structures
> + * @n_ports: Number of ports currently attached to the PHY
> + * @max_n_ports: Max number of ports this PHY can expose
>   * @lock:  Mutex for serialization access to PHY
>   * @state_queue: Work queue for state machine
>   * @link_down_events: Number of times link was lost
> @@ -724,6 +728,10 @@ struct phy_device {
>  	struct mii_timestamper *mii_ts;
>  	struct pse_control *psec;
> 
> +	struct list_head ports;
> +	int n_ports;
> +	int max_n_ports;
> +
>  	u8 mdix;
>  	u8 mdix_ctrl;
> 
> @@ -1242,6 +1250,27 @@ struct phy_driver {
>  	 * Returns the time in jiffies until the next update event.
>  	 */
>  	unsigned int (*get_next_update_time)(struct phy_device *dev);
> +
> +	/**
> +	 * @attach_port: Indicates to the PHY driver that a port is detected
> +	 * @dev: PHY device to notify
> +	 * @port: The port being added
> +	 *
> +	 * Called when a port that needs to be driven by the PHY is found. The
> +	 * number of time this will be called depends on phydev->max_n_ports,
> +	 * which the driver can change in .probe().
> +	 *
> +	 * The port that is being passed may or may not be initialized. If it 
is
> +	 * already initialized, it is by the generic port representation from
> +	 * devicetree, which superseeds any strapping or vendor-specific
> +	 * properties.
> +	 *
> +	 * If the port isn't initialized, the port->mediums and port->lanes
> +	 * fields must be set, possibly according to stapping information.
> +	 *
> +	 * Returns 0, or an error code.
> +	 */
> +	int (*attach_port)(struct phy_device *dev, struct phy_port *port);
>  };
>  #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		
\
>  				      struct phy_driver, mdiodrv)
> @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
>  void phy_mac_interrupt(struct phy_device *phydev);
>  void phy_start_machine(struct phy_device *phydev);
>  void phy_stop_machine(struct phy_device *phydev);
> +
>  void phy_ethtool_ksettings_get(struct phy_device *phydev,
>  			       struct ethtool_link_ksettings *cmd);
>  int phy_ethtool_ksettings_set(struct phy_device *phydev,
> diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> new file mode 100644
> index 000000000000..70aa75f93096
> --- /dev/null
> +++ b/include/linux/phy_port.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef __PHY_PORT_H
> +#define __PHY_PORT_H
> +
> +#include <linux/ethtool.h>
> +#include <linux/types.h>
> +#include <linux/phy.h>
> +
> +struct phy_port;
> +
> +/**
> + * enum phy_port_parent - The device this port is attached to
> + *
> + * @PHY_PORT_PHY: Indicates that the port is driven by a PHY device
> + */
> +enum phy_port_parent {
> +	PHY_PORT_PHY,
> +};
> +
> +struct phy_port_ops {
> +	/* Sometimes, the link state can be retrieved from physical,
> +	 * out-of-band channels such as the LOS signal on SFP. These
> +	 * callbacks allows notifying the port about state changes
> +	 */
> +	void (*link_up)(struct phy_port *port);
> +	void (*link_down)(struct phy_port *port);
> +
> +	/* If the port acts as a Media Independent Interface (Serdes port),
> +	 * configures the port with the relevant state and mode. When enable is
> +	 * not set, interface should be ignored
> +	 */
> +	int (*configure_mii)(struct phy_port *port, bool enable, 
phy_interface_t
> interface); +};
> +
> +/**
> + * struct phy_port - A representation of a network device physical
> interface + *
> + * @head: Used by the port's parent to list ports
> + * @parent_type: The type of device this port is directly connected to
> + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> + * @ops: Callback ops implemented by the port controller
> + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> applicable + * @mediums: Bitmask of the physical mediums this port provides
> access to + * @supported: The link modes this port can expose, if this port
> is MDI (not MII) + * @interfaces: The MII interfaces this port supports, if
> this port is MII + * @active: Indicates if the port is currently part of
> the active link. + * @is_serdes: Indicates if this port is Serialised MII
> (Media Independent + *	       Interface), or an MDI (Media Dependent
> Interface).
> + */
> +struct phy_port {
> +	struct list_head head;
> +	enum phy_port_parent parent_type;
> +	union {
> +		struct phy_device *phy;
> +	};
> +
> +	const struct phy_port_ops *ops;
> +
> +	int lanes;
> +	unsigned long mediums;
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> +
> +	unsigned int active:1;
> +	unsigned int is_serdes:1;
> +};
> +
> +struct phy_port *phy_port_alloc(void);
> +void phy_port_destroy(struct phy_port *port);
> +
> +static inline struct phy_device *port_phydev(struct phy_port *port)
> +{
> +	return port->phy;
> +}
> +
> +struct phy_port *phy_of_parse_port(struct device_node *dn);
> +
> +static inline bool phy_port_is_copper(struct phy_port *port)
> +{
> +	return port->mediums == BIT(ETHTOOL_LINK_MEDIUM_BASET);

BaseC is also "copper" right? Maybe this should be renamed to 
"phy_port_is_tp"?

> +}
> +
> +static inline bool phy_port_is_fiber(struct phy_port *port)
> +{
> +	return !!(port->mediums & ETHTOOL_MEDIUM_FIBER_BITS);
> +}
> +
> +void phy_port_update_supported(struct phy_port *port);
> +
> +int phy_port_get_type(struct phy_port *port);
> +
> +#endif

Thanks!

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart3629297.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmghqOUACgkQ3R9U/FLj
284NzA//aRirexrSNYDxqPN1AU2dLltouAjTNhLz4In1RqjLR1MEzy6Iu5gDZrRl
PYZLzYIi7LzbGS846G/VCyFdJMu3eXeBBRFq0NYg9iBN/uUxgyUhru+v6QzpOVcv
1vhIb3vazATaZqD0+vbhvcV/nKpGkQrzURlAxu7G9++Xha+zQtf2S9jmCCGdOuWX
uLbZ2ENGE+dF3/q86evGT+CXHg+trilLEEwzM0Tdvfqs3sXsO6aaJCVd+fHof71M
wJdq7aXzPt1liZaY8pDcbIZVDxplHc5ZJYY96jG0qRLleIWREUNNbr+IShk5D6Wd
GsIVQjg+0uN/ju9SiL7vPF1L+dKYEOoXvMqcZLdI1ynKhP6fPff/ZW1K/5NLgSF9
jVi004GAOb1+la83eAe2T189TceMaDeSJy0GM3Gw2AliFi3Nmy1ZsZjDEdCZbNUw
x3sK2pyj8x1Pftb5aI2mgeZ5c7iJ/PmAIgD29AxU8IX/IDXteBk02tWzjm14VF+O
AIH/AozrAA9A+bpKL4XdAD1Ui2bs1rYJteJoYTOMol9fj/br80UvmTOb6QlgPAI8
OhEc8IgEYScJtkbQ1yFveOvdxdwbphiTd9hEo21sWekR7hVwOaWmkPaL7jz+IqZj
dzWNT1p6gNeEA1iDMhEOVqU+0nA9DVfQHE0O1Ls1owRpNb6fT08=
=tsnT
-----END PGP SIGNATURE-----

--nextPart3629297.iIbC2pHGDl--




