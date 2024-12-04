Return-Path: <linux-arm-msm+bounces-40295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62369E3E4E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90B641671B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9CF20B81B;
	Wed,  4 Dec 2024 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XBN3Dvh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60361F6691;
	Wed,  4 Dec 2024 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326142; cv=none; b=MJ37Bq+K2EoC+y2wocx9J3iaT/HqUy5ztP4awMGGvB8AUrEqXa59LX0KQG0P8n+GM8F+8vsd51trn2Eux9epxzOtGSJfiVZ4mxWYG3KNsAIVEWR7DTLzSEKEuClDJ/HLTVqyaHsnd9NVM4OOCLQx0vWno8gQ7dwoaCoj3sc2Lt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326142; c=relaxed/simple;
	bh=Ss+expM6saY+gSY9Iv5h5d/6VRY6Zdb3acL6fZcd8pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abJa3L/e8olQ89FgKcTOYtkKkU91hAVj+s+ALRDODAV2aDt1ihPtfQkocl3pVMzKffI8QDpLd1aShQwnE8RO3OBUxi/o8J8YBwfLHgVvLphnDPVywjDm3rFlZeYVQEK6xPtcHyV3skp1zCymRiceHtZVWsV2rDNdzSw48aA75HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XBN3Dvh9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ud7LgqC9FIm4olXNgj+eEchylXiRAiy0eCFGI5c+ZPc=; b=XBN3Dvh9hrCC0+B0aT9p52Y5/K
	PmQub6bb3ECukcTxAHFJ24kCL+JL0CSRjjLAD+ShEUaKBdo0K9X3t4cWql5KeUQegDeEhdQj76GvQ
	lYD/s7cyjfRYqOgwCX6eH8ONKf9OO1HVfTy7Ng5XdfZ5pubgJh3UXntzFch1lJQT2dY2nM0SoGWQS
	cyaG2/+yU+wTRMi/JC4Rj0/mh5swdagJlZdJtYNVIbFnqNPpksHP3tpHWIyV/lJC94oBNn14N01/k
	BcY2ZkfS7yv/0TKZNWK7K5Am6EIrtU/W1ApdW1OgC8eaAR+VkaJZh8s77Sy1hxMyED4MlCE1nK/Lu
	Qm6YR1tg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46558)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIrIo-0003VI-21;
	Wed, 04 Dec 2024 15:28:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIrIl-0005dp-0L;
	Wed, 04 Dec 2024 15:28:31 +0000
Date: Wed, 4 Dec 2024 15:28:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com, quic_linchen@quicinc.com,
	quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
	bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com,
	john@phrozen.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <Z1B1HuvxsjuMxtt0@shell.armlinux.org.uk>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-3-26155f5364a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ipq_pcs_rc1-v2-3-26155f5364a1@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Dec 04, 2024 at 10:43:55PM +0800, Lei Wei wrote:
> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +	int ret;
> +
> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
> +		clk_disable_unprepare(qpcs_mii->rx_clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ipq_pcs_disable(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +
> +	if (__clk_is_enabled(qpcs_mii->rx_clk))
> +		clk_disable_unprepare(qpcs_mii->rx_clk);
> +
> +	if (__clk_is_enabled(qpcs_mii->tx_clk))
> +		clk_disable_unprepare(qpcs_mii->tx_clk);

Why do you need the __clk_is_enabled() calls here? Phylink should be
calling pcs_enable() once when the PCS when starting to use the PCS,
and then pcs_disable() when it stops using it - it won't call
pcs_disable() without a preceeding call to pcs_enable().

Are you seeing something different?

> +static void ipq_pcs_get_state(struct phylink_pcs *pcs,
> +			      struct phylink_link_state *state)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +
> +	switch (state->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		ipq_pcs_get_state_sgmii(qpcs, index, state);
> +		break;
> +	default:
> +		break;
...
> +static int ipq_pcs_config(struct phylink_pcs *pcs,
> +			  unsigned int neg_mode,
> +			  phy_interface_t interface,
> +			  const unsigned long *advertising,
> +			  bool permit)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
> +	default:
> +		dev_err(qpcs->dev,
> +			"Unsupported interface %s\n", phy_modes(interface));
> +		return -EOPNOTSUPP;
> +	};
> +}
> +
> +static void ipq_pcs_link_up(struct phylink_pcs *pcs,
> +			    unsigned int neg_mode,
> +			    phy_interface_t interface,
> +			    int speed, int duplex)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +	int ret;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
> +						   neg_mode, speed);
> +		break;
> +	default:
> +		dev_err(qpcs->dev,
> +			"Unsupported interface %s\n", phy_modes(interface));
> +		return;
> +	}

So you only support SGMII and QSGMII. Rather than checking this in every
method implementation, instead provide a .pcs_validate method that
returns an error for unsupported interfaces please.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

