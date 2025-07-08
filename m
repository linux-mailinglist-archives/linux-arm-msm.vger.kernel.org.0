Return-Path: <linux-arm-msm+bounces-64072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA462AFD126
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4B73BD6E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086A52E5414;
	Tue,  8 Jul 2025 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jY5uWivI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540722E427E;
	Tue,  8 Jul 2025 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992288; cv=none; b=ITG3S0ZkXKfZbKqOh7A1oUDXgDFV8fzchS39ile3hTZ8mRCpjui5BoiAj6HHT4HizKqMu4HZfkri31NakmI8b461J+I1Q1U54TGr79Nzs2rBgMLhUp66z8EEFM1Cs95Qr+4VfjjqOCyJWrfdGDvKco8QJ2RPce78zH+s/T2jrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992288; c=relaxed/simple;
	bh=tM8UU61oLb5NiOTVd1J7j8w068VJ63i5mhYSLUE3NLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLaEZl2GeaSwr3Hh/TNMIAl8JRiaZppC5HH/FwFOOI0tVuQ0H8vofeVX+IegxmEeSns3J0tngb9idJm4RE0go6g+TiWmj2V8sdrwj42I2aUUsA1SqyBp+6w6MN0+geutq9w9qZbCgdk+JRWlholaq3aYopxGBSdNNvdrity9Yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jY5uWivI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G4Te8l81esj5WHrgUTJCOoPkkVEuLKBrAeWZP67mcxg=; b=jY5uWivIuyJn3mv2A5EwpXUAtQ
	tNkPhMJYAOxe0Hsjf7JA2dqJ2yjgjJRc3OfPtXOGM9jd68zyCtSV+sAT07TbLYlKF7lkYV0BsSYi8
	Qc0PKxj0kkQ8rTbi3iRosL2UArkrbAZNSjvKc7HCRebvoCuiaPdzn5aCdFVQzezwtPjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZBDr-000qNa-QF; Tue, 08 Jul 2025 18:31:11 +0200
Date: Tue, 8 Jul 2025 18:31:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: phy: qcom: Add PHY counter support
Message-ID: <d64c9e64-879a-431a-b53f-06cb7166b940@lunn.ch>
References: <20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com>
 <20250709-qcom_phy_counter-v1-1-93a54a029c46@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-qcom_phy_counter-v1-1-93a54a029c46@quicinc.com>

> +static const struct qcom_phy_hw_stat qcom_phy_hw_stats[] = {
> +	{
> +		.string		= "phy_rx_good_frame",
> +		.devad		= MDIO_MMD_AN,
> +		.cnt_31_16_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_31_16,
> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_15_0,
> +	},
> +	{
> +		.string		= "phy_rx_bad_frame",
> +		.devad		= MDIO_MMD_AN,
> +		.cnt_31_16_reg	= 0xffff,
> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_BAD_CRC,
> +	},
> +	{
> +		.string		= "phy_tx_good_frame",
> +		.devad		= MDIO_MMD_AN,
> +		.cnt_31_16_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_31_16,
> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_15_0,
> +	},
> +	{
> +		.string		= "phy_tx_bad_frame",
> +		.devad		= MDIO_MMD_AN,

Are there any counters which might be added later which are not in
MDIO_MMD_AN? It seems pointless having this if it is fixed.

> +		.cnt_31_16_reg	= 0xffff,
> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_BAD_CRC,
> +	},
> +};

There has been an attempt to try to standardise PHY statistics. Please
look at:

**
 * struct ethtool_phy_stats - PHY-level statistics counters
 * @rx_packets: Total successfully received frames
 * @rx_bytes: Total successfully received bytes
 * @rx_errors: Total received frames with errors (e.g., CRC errors)
 * @tx_packets: Total successfully transmitted frames
 * @tx_bytes: Total successfully transmitted bytes
 * @tx_errors: Total transmitted frames with errors
 *
 * This structure provides a standardized interface for reporting
 * PHY-level statistics counters. It is designed to expose statistics
 * commonly provided by PHYs but not explicitly defined in the IEEE
 * 802.3 standard.
 */
struct ethtool_phy_stats {
        u64 rx_packets;
        u64 rx_bytes;
        u64 rx_errors;
        u64 tx_packets;
        u64 tx_bytes;
        u64 tx_errors;
};

Please use this if possible.

    Andrew

---
pw-bot: cr

