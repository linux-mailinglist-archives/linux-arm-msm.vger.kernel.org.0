Return-Path: <linux-arm-msm+bounces-44643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 982CDA07D14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB077A2454
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC182206B7;
	Thu,  9 Jan 2025 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="meDIIVTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2721E08B;
	Thu,  9 Jan 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439220; cv=none; b=r0L5/mJuE4xivAc9too/lVHRy9LLVKDFpmLTZnoSEz7R4xG6dzNli5r7+WPRALtTjKyJt+rwRMZliYkTkTa5Q8oP8FltXDBmpS33BwE/TPOq7PRkDUFWvq9iKnfB3cme/jnkFqPQltMV7YxRV5NIj7y3sc7E7m1ao59lFiUcdrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439220; c=relaxed/simple;
	bh=Hauyispm0ekzmLBL7S196DKfmz8odokzDnpR1FtdwjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmT0wpSKfDTq3JALJwG3mIzrgNx8ufxrVGBXVSk9WzkgBIZLAmMtLTtthw5AgjG2zy8ZYkRPWFU1tHmeLsqIwwYDeQ7WHTwCMtX3L/65DSBP5TR4nHn6O7jbiyrLp7ncTzGGJzHakZAALw4TqMp6kuUufvMOeSC7QBHolVTY/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=meDIIVTG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K9TXd/MaiyLOy1udYeUAh3f162Hdvsw2jJGZBHKT2Lw=; b=meDIIVTGSv2LavpMl34VU8indt
	Jw95K+5tyiiZO4lBkoH5O/uv7cOY7yoj5ACOBkbBaQJwrGwhiz0MyQVZ6ibRx/ezoIHHC9agvy/0a
	1KPzyyfrZdIJXHeGU+sE/rLxTO43g63eoHX7ZiPEjkyCUdGprxe4Mnm5B3oTL5z1/F6+ZY1eX6Gt0
	0gRFuCuJ7OOqi27EV9iTbc7vxjDEyeDOrVf/U0p/3qBsHGZDPnUauKTJxALcuWqj3VRpLVsVtTf9M
	/j0phsc8aVqEbrYCzpoHSoKnBJR9BhA7K2EgaslENe6dCCdIrZx2iX7TInsFrsZi7ZJTy2UGVkIRC
	ieDOR5XQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34434)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVv9w-0002M7-2B;
	Thu, 09 Jan 2025 16:13:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVv9t-0007Ri-1F;
	Thu, 09 Jan 2025 16:13:21 +0000
Date: Thu, 9 Jan 2025 16:13:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <Z3_1odA89W-kPNhO@shell.armlinux.org.uk>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
 <20250108100358.GG2772@kernel.org>
 <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jan 09, 2025 at 09:11:05PM +0800, Lei Wei wrote:
> 
> 
> On 1/8/2025 6:03 PM, Simon Horman wrote:
> > On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
> > > This patch adds the following PCS functionality for the PCS driver
> > > for IPQ9574 SoC:
> > > 
> > > a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
> > > b.) Exports PCS instance get and put APIs. The network driver calls
> > > the PCS get API to get and associate the PCS instance with the port
> > > MAC.
> > > c.) PCS phylink operations for SGMII/QSGMII interface modes.
> > > 
> > > Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> > 
> > ...
> > 
> > > +static int ipq_pcs_enable(struct phylink_pcs *pcs)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> > > +	int index = qpcs_mii->index;
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
> > > +	if (ret) {
> > > +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
> > > +	if (ret) {
> > > +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
> > > +		return ret;
> > 
> > Hi Lei Wei,
> > 
> > I think you need something like the following to avoid leaking qpcs_mii->rx_clk.
> > 
> > 		goto err_disable_unprepare_rx_clk;
> > 	}
> > 
> > 	return 0;
> > 
> > err_disable_unprepare_rx_clk:
> > 	clk_disable_unprepare(qpcs_mii->rx_clk);
> > 	return ret;
> > }
> > 
> > Flagged by Smatch.
> > 
> 
> We had a conversation with Russell King in v2 that even if the phylink pcs
> enable sequence encounters an error, it does not unwind the steps it has
> already done. So we removed the call to unprepare in case of error here,
> since an error here is essentially fatal in this path with no unwind
> possibility.
> 
> https://lore.kernel.org/all/38d7191f-e4bf-4457-9898-bb2b186ec3c7@quicinc.com/
> 
> However to satisfy this smatch warning/error, we may need to revert back to
> the adding the unprepare call in case of error. Request Russel to comment as
> well if this is fine.
> 
> Is it possible to share the log/command-options of the smatch failure so
> that we can reproduce this? Thanks.

As I previously stated, the problem is that an error in this path is
basically unrecoverable. Therefore, I don't see any point in trying to
clean up.

We could probably do a bit better in phylink, and report the error, so
something like this:

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0ae96d1376b4..62385c46118f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1401,11 +1401,21 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_mac_config(pl, state);
 
-	if (pl->pcs)
-		phylink_pcs_post_config(pl->pcs, state->interface);
+	if (pl->pcs) {
+		err = phylink_pcs_post_config(pl->pcs, state->interface);
+		if (err < 0)
+			phylink_err(pl, "%s (%ps) failed: %pe\n",
+				    "pcs_post_config",
+				    pl->pcs->pcs_post_config, ERR_PTR(err));
+	}
 
-	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed)
-		phylink_pcs_enable(pl->pcs);
+	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed) {
+		err = phylink_pcs_enable(pl->pcs);
+		if (err < 0)
+			phylink_err(pl, "%s (%ps) failed: %pe\n",
+				    "pcs_enable",
+				    pl->pcs->pcs_enable, ERR_PTR(err));
+	}
 
 	neg_mode = pl->act_link_an_mode;
 	if (pl->pcs && pl->pcs->neg_mode)

but trying to unwind the state back to what it was previously on an
error doesn't make any sense.

For example, by this time, the PHY could have switched interface modes
on us because the media changed speed. If we fail to switch to the new
interface mode, then even if we _could_ restore the previous
confinguration, that would result in the PHY using a different
interface mode to the host, and there would still be no link.

If a major_config() operation ever fails, then the affected network
interface is basically dead.

So, is there any point in adding code to clean up after an error in
things like .pcs_enable() methods? Nice to have, but it doesn't solve
the problem that the network interface is still dead as a result of
the error.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

