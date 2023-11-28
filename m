Return-Path: <linux-arm-msm+bounces-2173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4A7FAF28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 01:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F9F1C20C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D632464B;
	Tue, 28 Nov 2023 00:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="akfI6FWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C491B1;
	Mon, 27 Nov 2023 16:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WRzjWx+nGda9tXQJI4n8PlYck74YgGRZXJW9RtNBhRI=; b=akfI6FWSi5E0aCNFACrPmxsP0Q
	Bsk9JtYCr4IBgCup0BKxbeIHxJRoX2cMVNajwTx71CPwK8Ow8zb0IDWO7IJyHHun1FqJFzuQyn+aZ
	6KbHCQOH0nl1uZRWCEP9TYNNHVU34/gS/fwYGzSq8Ex4B/s29NACL/CCvoSqIpBETQSE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7m7y-001OwQ-Nx; Tue, 28 Nov 2023 01:39:02 +0100
Date: Tue, 28 Nov 2023 01:39:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 2/8] net: phy: add initial support for
 PHY package in DT
Message-ID: <b28b5d10-08cd-4e30-9909-f37834d80c81@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-3-ansuelsmth@gmail.com>

> +static int of_phy_package(struct phy_device *phydev)
> +{
> +	struct device_node *node = phydev->mdio.dev.of_node;
> +	struct device_node *package_node;
> +	u32 base_addr;
> +	int ret;
> +
> +	if (!node)
> +		return 0;
> +
> +	package_node = of_get_parent(node);
> +	if (!package_node)
> +		return 0;
> +
> +	if (!of_device_is_compatible(package_node, "ethernet-phy-package"))
> +		return 0;
> +
> +	if (of_property_read_u32(package_node, "reg", &base_addr))
> +		return -EINVAL;
> +
> +	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
> +				    base_addr, 0);

No don't do this. It is just going to lead to errors. The PHY driver
knows how many PHYs are in the package. So it can figure out what the
base address is and create the package. It can add each PHY as they
probe. That cannot go wrong.

If you create the package based on DT you have to validate that the DT
is correct. You need the same information, the base address, how many
packages are in the PHY, etc. So DT gains your nothing except more
potential to get it wrong.

Please use DT just for properties for the package, nothing else.

       Andrew

