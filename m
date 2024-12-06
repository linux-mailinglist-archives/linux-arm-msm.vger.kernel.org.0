Return-Path: <linux-arm-msm+bounces-40826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 993769E75EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 545D22850BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5BD1C5F29;
	Fri,  6 Dec 2024 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="H2bInm5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60F1C5F27;
	Fri,  6 Dec 2024 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502560; cv=none; b=ZCvM1DfKDAqgHy+cd8mlCbYJEFyAJVBoFxIufJmZdqiKYcNt/1UAIDFt8KPfFVvRgctFrzKdcZE+ciKgl3WXdhdDpHK/TjRO8YJ3DBW/W3cv5GJ/Jz5D9/4rsZhTOc8dGDKMaqyRS4xljV4aIz1cjcWBll1lxIQTiQM/XYm6m9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502560; c=relaxed/simple;
	bh=EkTm7bmDjlBwh/RTPwXc0WKCZZJg9m5YDNN+aooKZWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfPU09/Dkwd/9FDV5YCOZpBDrQwdcHL2VWdqurnaX3cod0ht8fPnTq1E3I8FwKp3MKQ9hjcFcFKmYpw5d8aVGzG9quvtPY63OB9V9aaRVAYIP1RM+cvieuU4IQSg4zmmjQ1B0CZr3u4b4nFKQV4ll3Jj6IM/B+x1br5O7k+L6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=H2bInm5d; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3AtfhIVy9wQV9jp1UBMpNqpHC5W2eSo/wbj99+hsOls=; b=H2bInm5dB99b+/UBrVQrAauAh5
	YS3Wx/p6enJUOlKaQk1qO6eJRyrx8XdQQpAcBgq5THEMd2an78qViFEm60f+67ktddxqHdzwbGW+p
	RjjYSLHXsO3PeXLn8VCt0kXsvMc3ScKmsdJlZFGe71qOZnlhLlEIyLsNAVomD1F0A3ZtcQNWnnSaG
	2e7QWEMBKntofET6IzDFJpPRSBlY0yoYbQif3FiuSpVk4M7C6jLl2itcK7D8ZfXiIoQ9NYlVzNzNA
	pFpo2PxI+XHJZkLpGZxZOjL0LHaL9hRZzixwQcGjMWYNaec8q+rCSI9LAzyZLIHUSVST5HpTDI3bj
	GWXe29Hg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36176)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJbCL-0006UA-1q;
	Fri, 06 Dec 2024 16:28:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJbCH-0007fp-11;
	Fri, 06 Dec 2024 16:28:53 +0000
Date: Fri, 6 Dec 2024 16:28:53 +0000
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
Message-ID: <Z1MmRb3RaUA68pb9@shell.armlinux.org.uk>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-3-26155f5364a1@quicinc.com>
 <Z1B1HuvxsjuMxtt0@shell.armlinux.org.uk>
 <f54ad0e2-10d7-40ff-872f-d7c92ae8519b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54ad0e2-10d7-40ff-872f-d7c92ae8519b@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Dec 07, 2024 at 12:20:25AM +0800, Lei Wei wrote:
> On 12/4/2024 11:28 PM, Russell King (Oracle) wrote:
> > On Wed, Dec 04, 2024 at 10:43:55PM +0800, Lei Wei wrote:
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
> > > +		clk_disable_unprepare(qpcs_mii->rx_clk);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void ipq_pcs_disable(struct phylink_pcs *pcs)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +
> > > +	if (__clk_is_enabled(qpcs_mii->rx_clk))
> > > +		clk_disable_unprepare(qpcs_mii->rx_clk);
> > > +
> > > +	if (__clk_is_enabled(qpcs_mii->tx_clk))
> > > +		clk_disable_unprepare(qpcs_mii->tx_clk);
> > 
> > Why do you need the __clk_is_enabled() calls here? Phylink should be
> > calling pcs_enable() once when the PCS when starting to use the PCS,
> > and then pcs_disable() when it stops using it - it won't call
> > pcs_disable() without a preceeding call to pcs_enable().
> > 
> > Are you seeing something different?
> 
> Yes, understand that phylink won't call pcs_disable() without a preceeding
> call to pcs_enable(). However, the "clk_prepare_enable" may fail in the
> pcs_enable() method, so I added the __clk_is_enabled() check in
> pcs_disable() method. This is because the phylink_major_config() function
> today does not interpret the return value of phylink_pcs_enable().

Right, because failure is essentially fatal in that path - we have no
context to return an error. I suppose we could stop processing at
that point, but then it brings up the question of how to unwind anything
we've already done, which is basically impossible at that point.

> > > +static void ipq_pcs_get_state(struct phylink_pcs *pcs,
> > > +			      struct phylink_link_state *state)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> > > +	int index = qpcs_mii->index;
> > > +
> > > +	switch (state->interface) {
> > > +	case PHY_INTERFACE_MODE_SGMII:
> > > +	case PHY_INTERFACE_MODE_QSGMII:
> > > +		ipq_pcs_get_state_sgmii(qpcs, index, state);
> > > +		break;
> > > +	default:
> > > +		break;
> > ...
> > > +static int ipq_pcs_config(struct phylink_pcs *pcs,
> > > +			  unsigned int neg_mode,
> > > +			  phy_interface_t interface,
> > > +			  const unsigned long *advertising,
> > > +			  bool permit)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> > > +	int index = qpcs_mii->index;
> > > +
> > > +	switch (interface) {
> > > +	case PHY_INTERFACE_MODE_SGMII:
> > > +	case PHY_INTERFACE_MODE_QSGMII:
> > > +		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
> > > +	default:
> > > +		dev_err(qpcs->dev,
> > > +			"Unsupported interface %s\n", phy_modes(interface));
> > > +		return -EOPNOTSUPP;
> > > +	};
> > > +}
> > > +
> > > +static void ipq_pcs_link_up(struct phylink_pcs *pcs,
> > > +			    unsigned int neg_mode,
> > > +			    phy_interface_t interface,
> > > +			    int speed, int duplex)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> > > +	int index = qpcs_mii->index;
> > > +	int ret;
> > > +
> > > +	switch (interface) {
> > > +	case PHY_INTERFACE_MODE_SGMII:
> > > +	case PHY_INTERFACE_MODE_QSGMII:
> > > +		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
> > > +						   neg_mode, speed);
> > > +		break;
> > > +	default:
> > > +		dev_err(qpcs->dev,
> > > +			"Unsupported interface %s\n", phy_modes(interface));
> > > +		return;
> > > +	}
> > 
> > So you only support SGMII and QSGMII. Rather than checking this in every
> > method implementation, instead provide a .pcs_validate method that
> > returns an error for unsupported interfaces please.
> > 
> 
> Yes, I can add the pcs_validate() method to validate the link
> configurations. This will catch invalid interface mode during the PCS
> initialization time, earlier than the pcs_config and pcs_link_up contexts.
> 
> But after of the PCS init, if at a later point the PHY interface mode
> changes, it seems phylink today is not calling the pcs_validate() op to
> validate the changed new interface mode at the time of "phylink_resolve".

... because by that time it's way too late. Phylink will have already
looked at what the PHY can do when the PHY is attached, and eliminated
any link modes that would cause an invalid configuration (provided
phylink knows what the PHY is capable of.)

However, that assumes phylink knows what the details are of the PCS,
which is dependent on the .pcs_validate method being implemented.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

