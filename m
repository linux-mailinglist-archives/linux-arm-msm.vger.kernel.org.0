Return-Path: <linux-arm-msm+bounces-20413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F828CE875
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8AB281DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 16:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9273D12E1D9;
	Fri, 24 May 2024 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dgrOW9yZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF712C485;
	Fri, 24 May 2024 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716566855; cv=none; b=lOb8yFklzQQdtJc1Dwddq3DwaWuRd7IGCLuOdEuZ0rTKv5j3U7/gDpAlcRwgCkNhbGkad84oTxG0hk5Tnl41fy1cZyiTNIVppE6o6/4xsFuxbGsnIZ2d9eTSpOPd4AN+PkmO34fX0DFzY4eTsj3w+S8udZ4DJ4BrUNrSJCUnR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716566855; c=relaxed/simple;
	bh=hsW39VYYa3d/7mjBY2RvXu3zpGRpwKQAxiKXlCqEIpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVgDP9lnsNljiGfx2dD6WSyVGBPCyco33bqFsXpEJCKmQMbzJ404riLS3MxMeo/opmbsFG2z+uWEfji6w7pTh+ZeKwChLBbvoOCF1HgLNL2xzdLUKQx7b6yTzPZad2qVooV7Yajy2wGwD5xFjipbhC/1VopFViZzc+zLIBG3Hj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dgrOW9yZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vB6ljBLofLeiWQTydwB3NoHusR29U8CF0lK7vzGBV4k=; b=dgrOW9yZhUJ6EgseHLKa2qObIE
	sEGtkvAhdwnXM08XCODga/KipPotgi20+vvPCR1cDu6WOBApKMAXlItaJmDtQ2XMOuMsF7P5RPLV0
	KfCHV9QGtjRlOVeA1BRbsymDzHyqaQlHGjrJS+tx6GFAztkhtiZbK583Hrz6CbFZlVGE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sAXRr-00Fxrz-17; Fri, 24 May 2024 18:07:15 +0200
Date: Fri, 24 May 2024 18:07:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Halaney <ahalaney@redhat.com>,
	Russell King <linux@armlinux.org.uk>, kernel@quicinc.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-qcom-ethqos: Enable
 support for 2500BASEX
Message-ID: <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-3-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524130653.30666-3-quic_snehshah@quicinc.com>

On Fri, May 24, 2024 at 06:36:53PM +0530, Sneh Shah wrote:
> With integrated PCS qcom mac supports both SGMII and 2500BASEX mode.
> Implement get_interfaces to add support for 2500BASEX.

I don't know this driver very well..... but

/* PCS defines */
#define STMMAC_PCS_RGMII        (1 << 0)
#define STMMAC_PCS_SGMII        (1 << 1)
#define STMMAC_PCS_TBI          (1 << 2)
#define STMMAC_PCS_RTBI         (1 << 3)


static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
                                             struct ethtool_link_ksettings *cmd)
{
        struct stmmac_priv *priv = netdev_priv(dev);

        if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
            (priv->hw->pcs & STMMAC_PCS_RGMII ||
             priv->hw->pcs & STMMAC_PCS_SGMII)) {
                struct rgmii_adv adv;
                u32 supported, advertising, lp_advertising;

                if (!priv->xstats.pcs_link) {
                        cmd->base.speed = SPEED_UNKNOWN;
                        cmd->base.duplex = DUPLEX_UNKNOWN;
                        return 0;
                }

/**
 * stmmac_check_pcs_mode - verify if RGMII/SGMII is supported
 * @priv: driver private structure
 * Description: this is to verify if the HW supports the PCS.
 * Physical Coding Sublayer (PCS) interface that can be used when the MAC is
 * configured for the TBI, RTBI, or SGMII PHY interface.
 */
static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
{
        int interface = priv->plat->mac_interface;

        if (priv->dma_cap.pcs) {
                if ((interface == PHY_INTERFACE_MODE_RGMII) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
                        netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
                        priv->hw->pcs = STMMAC_PCS_RGMII;
                } else if (interface == PHY_INTERFACE_MODE_SGMII) {
                        netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
                        priv->hw->pcs = STMMAC_PCS_SGMII;
                }
        }
}

I get the feeling this is a minimal hack, rather than a proper
solution.

    Andrew

---
pw-bot: cr

