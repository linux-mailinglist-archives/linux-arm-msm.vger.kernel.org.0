Return-Path: <linux-arm-msm+bounces-26502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A27934230
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 20:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1229B28494A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 18:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34771822D7;
	Wed, 17 Jul 2024 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lRJ1uDXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1AA12E75;
	Wed, 17 Jul 2024 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721240399; cv=none; b=er1oHqyTzq3zVjVKB9o/JX+aUX95h0VK8MELLQs2g7CoVPdXDdC5TMTbj03PtL61+rHJIdtHUf5pFBV4wQ7xUUZ580CLL1jBvWIuN5GtPmgEBrlkSjK3j/yWBXssr6QBXZLIzDladEGU+o4PDZVC8BYxMVamuIfwb27OGVl+t68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721240399; c=relaxed/simple;
	bh=8icS3I5fyutbM346XBkOUW3AxYb3LWPuaYdcM7QeK5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmOTj9ZPDWNUD+B3FqKggMUdUjdICq64hetUJxnGthx25KbMqTWAimSIR/lBRoXOgZwp7T6D0D24uaJ2sx6VJ1GDaJ9Oc90OpPAWpKmGVQvtJ2sEHdScfpCi5hiBSqHBdUdFX5hJzoxJ5mRWWPEpp2XVqthJxIEyp8teFZ7GK60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lRJ1uDXn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=wZm6SNFUjdixQ8MFhwCOTFsWlwrJ2qo19PWx5tk7Qzs=; b=lR
	J1uDXnY/gXzVm5H6rPK31AMEifEF9kNgBrRazajQJrliANeNtDEVlS6Zht2oMO9gfi6pYTk3X85ke
	xv8lh0ocHxvPiAS66fIvxlGJgB85mL53FYPAAXqn9wt+7y+j1gD2EV8XhPONhBKG7lN4L7L2Sx6YF
	HDkfRDuOZsLxqxs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sU9Fk-002jAB-Ec; Wed, 17 Jul 2024 20:19:48 +0200
Date: Wed, 17 Jul 2024 20:19:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Timur Tabi <timur@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: qcom,emac: convert to dtschema
Message-ID: <a6a0c244-f8da-4736-bb63-429a508d6993@lunn.ch>
References: <20240717090931.13563-1-rayyan.ansari@linaro.org>
 <cecaa6c3-adeb-489f-a9d2-0f43d089dd1d@lunn.ch>
 <D2RXISKUMBWA.ZQDKI0F03EI0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2RXISKUMBWA.ZQDKI0F03EI0@linaro.org>

On Wed, Jul 17, 2024 at 04:45:55PM +0100, Rayyan Ansari wrote:
> On Wed Jul 17, 2024 at 4:20 PM BST, Andrew Lunn wrote:
> > On Wed, Jul 17, 2024 at 10:09:27AM +0100, Rayyan Ansari wrote:
> > > Convert the bindings for the Qualcomm EMAC Ethernet Controller from the
> > > old text format to yaml.
> > > 
> > > Also move the phy node of the controller to be within an mdio block so
> > > we can use mdio.yaml.
> >
> > Does the MAC driver already support this?
> >
> > When i look at the emacs-phy.c there is
> >
> > 	struct device_node *np = pdev->dev.of_node;
> >
> >                 ret = of_mdiobus_register(mii_bus, np);
> >
> > I don't see anything looking for the mdio node in the tree.
> >
> > 	Andrew
> 
> Hi Andrew,
> 
> Yes, from my understanding an mdio node is not explicitly needed as it
> just uses "phy-handle".
> 
> However, I think it makes more sense to place the phy within an mdio
> node instead of directly under the controller node. This is based off
> of 5ecd39d1bc4b ("dt-bindings: net: convert emac_rockchip.txt to YAML"),
> in which the same decision was made ("Add mdio sub node"), also during a
> text -> yaml conversion.
 
Using an MDIO node is preferred, and is the modern way of doing
it. Placing the PHY directly in the MAC node is valid, but it is the
old way of doing it.

It is up to the driver to decide where it looks for the PHY nodes when
it registers the MDIO bus. The np in of_mdiobus_register(mii_bus, np);
points to the MAC node. So when you move the PHYs into the new MDIO
node, they will not be found when the MDIO bus is probed.

Take a look at:

commit 2c60c4c008d4b05b9b65bf88f784556208029333
Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Date:   Mon Mar 25 16:34:51 2024 +0100

    ravb: Add support for an optional MDIO mode

as an example where support for such an MDIO node was added to a
driver.

    Andrew

---
pw-bot: cr

