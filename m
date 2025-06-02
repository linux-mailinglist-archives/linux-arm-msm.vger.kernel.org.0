Return-Path: <linux-arm-msm+bounces-60059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078FACAE2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 14:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A0BC176BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C9920A5E1;
	Mon,  2 Jun 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fJ1oVQYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD6198845;
	Mon,  2 Jun 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868129; cv=none; b=PmB0DV0zVMXE71eRyA7077RYKL2yaPB+APns5KgYZJ/2af1TeCH38ldHMl565s1XXVJdDhjNnZovcPQXH7JH0DXB38R+9+MNaJSgcEl7ieCEJxJ5LxeQvfPVLfxX8TT3+mq7hwTq/g72H2Wpdp4w1/xgdg21BkAI/1vdm9+ctTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868129; c=relaxed/simple;
	bh=b4VrgvaUpGuhMsuGeP6n68tIjyYmDYkgwn8mjZPNNc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uwsu6O50dbCWvrwX87WoFT4Rd1TFZ5VNkSFSqyeD/gQz92O3H9qbS1AKjdNAi86ni2mfnXU6fxuSbXRo5tE1pGCMFbDiN+3wIW44LEI4hplRtkI56zuuaIaZnD9dYBS518XxtVBjXKMaT4/rxZaNNwvVW53+m8hlCMYk8MF4YVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fJ1oVQYD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HaTxOJSJ+INGXp69p1JUu+wzoMAuVQlQZ7IX9srKxLQ=; b=fJ1oVQYDwMZv3olSL5nJLM0oNC
	X17T68yAaX0P9SG9niKk1JT8E8g3nwS76MGzHE0Gq1MMfoYnYDPu9MepwvU6NGkfoOQiEq5hSPHvI
	lCS6hB8GOyv1g/RESmaw9JGAi1GEYd3oE+BKwhO145mp3WXFlebZjiB+4KiU1JxukbpI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uM4UG-00EVBX-Ko; Mon, 02 Jun 2025 14:41:56 +0200
Date: Mon, 2 Jun 2025 14:41:56 +0200
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
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
Message-ID: <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>

> +	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
> +	if (priv->set_short_cable_dac) {
> +		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
> +		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
> +			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
> +
> +		/* setting EDAC (Error-detection and Correction) in debug register */
> +		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
> +				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
> +	}

In the binding you say:


+            If not set, it is assumed the MDI output pins of this PHY are directly
+            connected to an RJ45 connector and default DAC values will be used.

So shouldn't there be an else clause here setting these two values to
their default, undoing what the bootloader might of done etc.

Or you can change the binding, and say something like:

+            If not set, DAC values are not modified.

We often need a tristate in DT, set something, unset something, leave
it as it is. But that does not exist in DT in an easy form :-(

	Andrew

