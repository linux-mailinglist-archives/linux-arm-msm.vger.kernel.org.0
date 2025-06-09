Return-Path: <linux-arm-msm+bounces-60621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5CAD1DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5FB16BDF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A666726157B;
	Mon,  9 Jun 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xHU59ae8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD92609D9;
	Mon,  9 Jun 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471884; cv=none; b=QivLP1CJQsBvov//aJuHJ41KTXtRysPZndtV3uqZD7jhG9eKgGcP1tH9oMw585vSPdsQ5H0wWzMZM9vXw2scMFPVa9oE0p84fxLmvvNjeok3JkxGQkqN+p84yCr5023hNCzKhex3p1IdvuahdfIFa8tuEMxCgLzT3y1h3bSWrKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471884; c=relaxed/simple;
	bh=db1kcVXWOZbRlDxz/lm8rPoMqpJcGhcAUOeAlkyT+rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqkNEiShjEC567cOcJQg2xcrn+KplEOayc4AHkzMAqWXd/p6xzHn9TVcGFp+ZBmF4yij4UoIw8OymQbtjk+ymT24tsGkW4sv+vbXXB6a5SJLejjdi/1xCtN/FvrQF7DidFElpFsfqpUl62UF1YufxAueua6MPyqNf8i0MJNjcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xHU59ae8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0y5ehwuYDRVD+AGNnlRc6SpcIwpJ3evJ1mNeYzHZF9E=; b=xHU59ae8pY4kdW3m0/Jl9VBxCT
	NS3Es3ZU5dCmEK+VWF6ySSbFgyf1CTVKr2p5TyISG7eYokl9joRVWhhgDqudS43K/UrQ+5L8FMYmR
	7Ue4Bg/m4/OcKd+gqaV4l51jM+CR6keP0B5h2WWBOuOZqq/bwp9GOpwUftXbd6EZxNjc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uObYI-00F9Gj-21; Mon, 09 Jun 2025 14:24:34 +0200
Date: Mon, 9 Jun 2025 14:24:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: george.moussalem@outlook.com
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
Message-ID: <a46bf855-e9fc-44c4-9219-7d91651b30d3@lunn.ch>
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
 <20250609-ipq5018-ge-phy-v4-3-1d3a125282c3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-ipq5018-ge-phy-v4-3-1d3a125282c3@outlook.com>

> -#include <linux/phy.h>
> -#include <linux/module.h>
> -#include <linux/string.h>
> -#include <linux/netdevice.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/etherdevice.h>
>  #include <linux/ethtool_netlink.h>
> -#include <linux/bitfield.h>
> -#include <linux/regulator/of_regulator.h>
> -#include <linux/regulator/driver.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
>  #include <linux/of.h>
> +#include <linux/phy.h>
>  #include <linux/phylink.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/reset.h>
>  #include <linux/sfp.h>
> +#include <linux/string.h>
>  #include <dt-bindings/net/qca-ar803x.h>

Please sort the headers in a separate patch. Cleanup and new features
are logically different things, so should not be mixed.

> +static void ipq5018_link_change_notify(struct phy_device *phydev)
> +{
> +	mdiobus_modify_changed(phydev->mdio.bus, phydev->mdio.addr,
> +			       IPQ5018_PHY_FIFO_CONTROL, IPQ5018_PHY_FIFO_RESET,
> +			       phydev->link ? IPQ5018_PHY_FIFO_RESET : 0);
> +}


link_change_notify is pretty much only used when the PHY is broken. So
it would be good to add a comment what is happening here. Why does the
FIFO need to be reset?

	Andrew

