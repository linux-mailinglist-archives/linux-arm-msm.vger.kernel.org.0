Return-Path: <linux-arm-msm+bounces-60370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09DACF65D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D0F37A3E7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B8D276051;
	Thu,  5 Jun 2025 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2JO3O5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BFF1DED5D;
	Thu,  5 Jun 2025 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147493; cv=none; b=nBWL9nsk3REsYc0AtPVCo9edxQxY6mJyYXj2ncJfUePfhTVuIzcAqe+RLPstLUN/fPHKDapEW+P9cC1TET/loLg7RPoYryuohd/U+OtGU/8G1kX7qJEdKhyt4bsESvPgWv2iIcveg10RwQlvxN8VowKje6y6wvJFhv73nxPTOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147493; c=relaxed/simple;
	bh=DiaUWvin590sd4LNLULghDtdpNa3AH8Zw4fNwjtlgUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk1Dq5zGDtcbA5xXgMfBGX+LMZ/PYry0YKxUGy9YyqFqZwwU0mp3bwJucyp4PYjxQ7SqYsOLEkw2TuT/lGBLRLsGGQRFICwFP7Hpx04oGyuOCIve8SJrMObzb4bynNXOy35bIfWevPH6bPGmFeK/HhR7J8+a7syEqltn7zWo9n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2JO3O5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61ABC4CEE7;
	Thu,  5 Jun 2025 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749147492;
	bh=DiaUWvin590sd4LNLULghDtdpNa3AH8Zw4fNwjtlgUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2JO3O5Q3qZdbKHnJ07kqkpN7InrviFSkMUjoqjG4KyNB8gfiMzJB+B5+FX6zyLxI
	 qni74gqIv8mMeatD0ydhrgCIZVm/huASAxi9SoKyEioo7kAjc2pH7unq7qd31LvVhN
	 bAXs/JsOAmBrShNmYmx7DgAwBvbJm5fRL2nBDdOyepzpiRWyZcAlVeD+egxUwIieDs
	 YTIvFe162twob2HiMPwUInLphJg0MpxuHUtAHRX646w2Mr3G8gkwZzOunhcS/Ym9A6
	 yiePUGCAsSW4qcFKrhrj9Ij6Jgvosu7gNHF9+9F1gwENNL9yEbRpttMOpjiYbz0f7R
	 0xV6G2Nc5NY1A==
Date: Thu, 5 Jun 2025 13:18:10 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: george.moussalem@outlook.com, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
Message-ID: <20250605181810.GB2946252-robh@kernel.org>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
 <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>

On Mon, Jun 02, 2025 at 02:41:56PM +0200, Andrew Lunn wrote:
> > +	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
> > +	if (priv->set_short_cable_dac) {
> > +		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
> > +		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
> > +			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
> > +
> > +		/* setting EDAC (Error-detection and Correction) in debug register */
> > +		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
> > +				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
> > +	}
> 
> In the binding you say:
> 
> 
> +            If not set, it is assumed the MDI output pins of this PHY are directly
> +            connected to an RJ45 connector and default DAC values will be used.
> 
> So shouldn't there be an else clause here setting these two values to
> their default, undoing what the bootloader might of done etc.
> 
> Or you can change the binding, and say something like:
> 
> +            If not set, DAC values are not modified.
> 
> We often need a tristate in DT, set something, unset something, leave
> it as it is. But that does not exist in DT in an easy form :-(

I'm happy to define that and have thought about it. That does up the 
minimum version of dtschema required, but we pretty much expect people 
to use the latest anyways.

Rob

