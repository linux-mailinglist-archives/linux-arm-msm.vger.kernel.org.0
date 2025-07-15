Return-Path: <linux-arm-msm+bounces-65067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B7B063F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 18:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1A5580FEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCD1244675;
	Tue, 15 Jul 2025 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ODfRGHmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E855A1E531;
	Tue, 15 Jul 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595878; cv=none; b=eu2ivj+WK5vXbYIaR/AwsAEE+p0IOs+njpKy3ah6Plhke7aQ3t1XAwVJAESo0CeRTUWVzhYgKqqG7uHLbFq0owkhEWT0F3Y7+/VvxpNN0Tndhsa9ZVkR/PuiAv8gv6eSbX0OPcm3P8N4S6stAfpsWYc59tVal2bW4ysi4tDKTfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595878; c=relaxed/simple;
	bh=W1FxY2LQyxW9luHSm4uqpnhlsWmPi0NucBNEMNKiBF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH8nzsHSJ+p3gormBnlbWKgvQYfYjBMMHQrvG2jEMeo3alrC4msq7hXu93L3pGpV1M0RGtKwQwIZ9K1muz2X9Mg2klh2fYFMsZztvlJU81POyFhppFN28Xqb/n7aMuffHvnEgH1nomHEMuL8H1NpUk+ijKCMw83m0mewhwQ7k2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ODfRGHmV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GvQGktnNuBb1IGeKgMGp3Rcb/7Zn8h0jHyNUODU0m00=; b=ODfRGHmV9MJX4YJYUCCVnudbA5
	YERP7upcSGyk05MSctJqnDfrOTPzN3Ycnfcd8ZLjeuC/JtTz9QWa8JgSf1/TmwVC0eHJTfhNLMMwr
	hBYllKmpG4Cw9IV2Bu+64iu/kIet/Qg5anpC/Lly/qdOnap2yZHBlga9YzyE6AyvMHBs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubiFB-001bby-FC; Tue, 15 Jul 2025 18:11:01 +0200
Date: Tue, 15 Jul 2025 18:11:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
Message-ID: <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>

> +int qcom_phy_update_stats(struct phy_device *phydev,
> +			  struct qcom_phy_hw_stats *hw_stats)
> +{
> +	int ret;
> +	u32 cnt;
> +
> +	/* PHY 32-bit counter for RX packets. */
> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
> +	if (ret < 0)
> +		return ret;
> +
> +	cnt = ret;
> +
> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
> +	if (ret < 0)
> +		return ret;

Does reading QCA808X_MMD7_CNT_RX_PKT_15_0 cause
QCA808X_MMD7_CNT_RX_PKT_31_16 to latch?

Sometimes you need to read the high part, the low part, and then
reread the high part to ensure it has not incremented. But this is
only needed if the hardware does not latch.

	Andrew

