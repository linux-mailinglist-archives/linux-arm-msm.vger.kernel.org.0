Return-Path: <linux-arm-msm+bounces-60649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B824AD2090
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7DC3A3AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27FD25A2B4;
	Mon,  9 Jun 2025 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="q1n9aZFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276513C918;
	Mon,  9 Jun 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477978; cv=none; b=rmiL75+pBOMdj27MS6hqYdatqQOyojnhA+aFo+i+nZGyZ9Kzzi8GOpG1ggcGN3Ks9JiJlAca7r+JhpKfyAxfdfFWY2Y0iO+7rVQYrucT+PEsVSJrrQ3nJ0ynHidEWKHabMl8SMDlnjtKU+EpRXRCg5CHwwu6EXcTJS7IaR1OpdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477978; c=relaxed/simple;
	bh=Lqz2IXP0f71+stZWZq3nQhJN56DepDBP0MfIkkLnz0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1kjUrqxLHctnrGxN6WMzn9X8NUaVigHqt73AhQUpXiJX9+qEG4tKghrymhEiyNfgPL1bdZtpZWO9s8nBl0MQzB8DYoRDz58CW31nFq6NI6DpwyE3X/nKFek4eLJF7UR6nXUvaY0IJRWCdp/bzGcMdKb2Ipkrprd23L2pYO8RpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=q1n9aZFJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PIMYK36uvIqcecnw+wsNtJNA1jDZ1QoKID40Lzud8WI=; b=q1n9aZFJiH/t5KyVNuHn1TrEwy
	oCdSvsEB67ZQ+fBQYTl7YItoe4V1LjF2GFhMIcpHV1Gr9pqNaQpxbeej2rDqF3+aqf34zBDgbJ1j2
	xb6ZkIKNsbW5RWoQA9rZCvLvK6n4Z3emYvGqDFCvPgCc+DhE3KeHLDshhRE8nmpKmtJPbu8HH/J+j
	RcaCU63UOyGiPTqCqPkftCEO+/IQNqFhlJGOhMUFqjG2fMB+u0cfXkdO/W41ak2IaANdaLhODp4gZ
	A6QaH3W885a42EplVCctRTJsxWHX2JKjq1MwBPI3najMRLQ/iXZ2p5Cnj1tghQmCs1d7gZPhF8CEM
	J46tkLtw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49642)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uOd8P-0003M3-14;
	Mon, 09 Jun 2025 15:05:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uOd8M-0006HU-09;
	Mon, 09 Jun 2025 15:05:54 +0100
Date: Mon, 9 Jun 2025 15:05:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: george.moussalem@outlook.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <aEbqQYDi8_LN7lDj@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jun 09, 2025 at 03:44:36PM +0400, George Moussalem via B4 Relay wrote:
> +static int ipq5018_config_init(struct phy_device *phydev)
> +{
> +	struct ipq5018_priv *priv = phydev->priv;
> +	u16 val = 0;

Useless initialisation. See the first statement below which immediately
assigns a value to val. I've no idea why people think local variables
need initialising in cases like this, but it seems to have become a
common pattern. I can only guess that someone is teaching this IMHO bad
practice.

> +
> +	/*
> +	 * set LDO efuse: first temporarily store ANA_DAC_FILTER value from
> +	 * debug register as it will be reset once the ANA_LDO_EFUSE register
> +	 * is written to
> +	 */
> +	val = at803x_debug_reg_read(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER);
> +	at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
> +			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
> +			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
> +	at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER, val);
> +
> +	/* set 8023AZ CTRL values */
> +	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL1,
> +		      IPQ5018_PHY_PCS_AZ_CTRL1_VAL);
> +	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL2,
> +		      IPQ5018_PHY_PCS_AZ_CTRL2_VAL);

The comment doesn't help understand what's going on here, neither do the
register definition names.

Also, what interface modes on the host side does this PHY actually
support?

> +	priv->rst = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR_OR_NULL(priv->rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->rst),
> +				     "failed to acquire reset\n");

Why IS_ERR_OR_NULL() ? What error do you think will be returned by this
if priv->rst is NULL? (Hint: PTR_ERR(NULL) is 0.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

