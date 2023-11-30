Return-Path: <linux-arm-msm+bounces-2733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE177FF394
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 16:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6A61C20EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3879524B3;
	Thu, 30 Nov 2023 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yA+IAQa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C6A1B3;
	Thu, 30 Nov 2023 07:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LTcsoVSlVI6L5YY64Xnv4PC7wnWqf8HFbk8TxQgTwwc=; b=yA+IAQa3Q1yz4WWgwbUigU8sKA
	xadiHtvwN1twCeGo4wegaWCMA5KCSrTGQnvM9IymZtcTnoV08vEA9eUB2L7BxhiTyxSqbIsCN4NMd
	iZxkrfFVK4rrW06K5pRDj0a5Z2MBDLfWiAmB5dEBUHpsNGfWx93ykb6sgz+mZ3tX7+SI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8iyc-001g1R-OK; Thu, 30 Nov 2023 16:29:18 +0100
Date: Thu, 30 Nov 2023 16:29:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 07/14] net: phy: at803x: move at8035 specific DT
 parse to dedicated probe
Message-ID: <c5dc1e13-4ab8-4447-8ad3-2fdc2f506dbb@lunn.ch>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-8-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-8-ansuelsmth@gmail.com>

> +static int at8035_parse_dt(struct phy_device *phydev)
> +{
> +	struct device_node *node = phydev->mdio.dev.of_node;
> +	struct at803x_priv *priv = phydev->priv;
> +	u32 freq;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_OF_MDIO))
> +		return 0;
> +
> +	ret = of_property_read_u32(node, "qca,clk-out-frequency", &freq);
> +	if (!ret) {

I don't think you need this. priv->clk_25m_reg and priv->clk_25m_mask
will default to 0. If qca,clk-out-frequency does not exist, they will
still be zero....

> +		/* Fixup for the AR8030/AR8035. This chip has another mask and
> +		 * doesn't support the DSP reference. Eg. the lowest bit of the
> +		 * mask. The upper two bits select the same frequencies. Mask
> +		 * the lowest bit here.
> +		 *
> +		 * Warning:
> +		 *   There was no datasheet for the AR8030 available so this is
> +		 *   just a guess. But the AR8035 is listed as pin compatible
> +		 *   to the AR8030 so there might be a good chance it works on
> +		 *   the AR8030 too.
> +		 */
> +		priv->clk_25m_reg &= AT8035_CLK_OUT_MASK;
> +		priv->clk_25m_mask &= AT8035_CLK_OUT_MASK;

... so applying a mask to 0 does nothing.

It does change the code a little, but you can add a justification in
the commit message.

    Andrew

