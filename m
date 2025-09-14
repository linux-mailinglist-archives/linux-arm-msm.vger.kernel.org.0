Return-Path: <linux-arm-msm+bounces-73442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D55B2B56B52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 20:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F023A3CBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 18:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EF02D12EE;
	Sun, 14 Sep 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xoBBG0BI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8151C5486;
	Sun, 14 Sep 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757875045; cv=none; b=g38CEWE8I7ho/BLNWii4mItknlUBsZuMMDd3utBIJRiY/JsMkaVUMuojgLelBn+hi4F7cmP5GZlNsY17FqAIkkdhUxvsu+rJyhWsRLiVB1EEKJoQypqC53wNVcuNQ0eYZd9FSOHpok2Ppeip2/AZj5GIUskv5qgktoAdib1g39w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757875045; c=relaxed/simple;
	bh=TymjcyE+B0pUrKS96jgP+V0xrVRKHsWFLUAPEo+0Svc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGMBkITxUiq7/5TB0Lqetn5ueS9D9yQZhp0RSIDLLj3O4IXZPI/VEypGw8VFgSw3m8j3zP5kalnS5W3FIgHbrXokG6/hMyHyAxgCJ4UVl5Hah0b/wMFnWw6IJ3AMvr7a7hptw5ayCyR53KS/CeFPyeb0+DThPzRdNsOvFyAsVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xoBBG0BI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0gOze54H4cQJFLKODkJQHJhLdjBQtWBsq6A59nmn/Ng=; b=xoBBG0BIK8GqAyPNyfLs7dThg2
	ZQy3Kp7SHwTCOr6MUvGRR4ktfD+WsT3AMMbDh1Q/uyNASWvfPU2qfCZ7lubTTzngk6jGKImVpPNNU
	3hBHYxg+HMb1yScmkULqsRT9xyaQdE0mW3CesuVJEOarbJ6zxIbhlY1+4UFaq0YZl/gA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxrb2-008MT5-1x; Sun, 14 Sep 2025 20:37:08 +0200
Date: Sun, 14 Sep 2025 20:37:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <2f182073-5548-401c-a61c-45163c9a2948@lunn.ch>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>

> So, the bug is likely elsewhere, or your ethernet MAC doesn't support
> SGMII and you need to add complete support for  rate-matching to the
> driver.

Russell beat me too it. Just adding:

static int qca808x_get_features(struct phy_device *phydev)
{
        int ret;

        ret = genphy_c45_pma_read_abilities(phydev);
        if (ret)
                return ret;

        /* The autoneg ability is not existed in bit3 of MMD7.1,
         * but it is supported by qca808x PHY, so we add it here
         * manually.
         */
        linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);

        /* As for the qca8081 1G version chip, the 2500baseT ability is also
         * existed in the bit0 of MMD1.21, we need to remove it manually if
         * it is the qca8081 1G chip according to the bit0 of MMD7.0x901d.
         */
        if (qca808x_is_1g_only(phydev))
                linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->supported);

        return 0;
}

So it appears this PHY breaks the standard in a number of ways. Maybe
it is broken in other ways which need additional workarounds.

	Andrew

