Return-Path: <linux-arm-msm+bounces-95284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OBgF5wIqGnSnQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:25:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D311FE4EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68D7F302512B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4833A1CE7;
	Wed,  4 Mar 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vB2/vDCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9436D9FB;
	Wed,  4 Mar 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619929; cv=none; b=a9HJW8zFkM6kgxWsYHCIcPSXgOrrv+DFUFHRtTjpEN8XuIBTE/vHnd8H2d3p4MlShKqPjsJSskfaCNLYiRhPQfxYWCiDqh/868dHbJm8zhE8hIUT2XNmeh+mGsxv47FCctQ2BXnpaaajlCh0bsTnxqNXU5g2vARuuBMygZR50EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619929; c=relaxed/simple;
	bh=YGHVgbDk1kdkRnOssUvHvUBVISbxJ4Q4LEi0+ajCMBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnomUf7igGSUHI2Mv7xb6m72p5A08tNV+2QZHN0i/1fhOmvfhkuP6l49k2yuBpCPpEqyq3tztDVwNwe/2MbqZDffoOSZ7sOcQNLBwKuNIfodciDQu70m5hKQRmTWN/EGIwuqJVAdx5yczJtHQVr+aGFJHVOu/M++Lmp8RkydlNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vB2/vDCi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B146FC40FBD;
	Wed,  4 Mar 2026 10:25:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F8045FF5C;
	Wed,  4 Mar 2026 10:25:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 336931036843C;
	Wed,  4 Mar 2026 11:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772619924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4bM3W6A9RFTPFmoR9cUfC7hMGa2UFu2pNm437NiJy6M=;
	b=vB2/vDCiSRj8JWbId/CCxgWJqL4FgXZZXbARpNmRxbkWqrMVrEjxUT741hc7yyqrMZKtSj
	Y7gXwBh1+0O0En7Qpah8iBJ8UzD/RhYIh36kJVa9+H2bYBrSWyDyh3oKSwcTf5EYTUDvyO
	sPspt/HQRldLdUYz4NuHdi7VUu2sAAR1L0EfcjjIbOsWkvpDfj4FyErvGTmuR5+ecmv9qV
	bMAc2rFuWB91dqlFNCm0KA1j7/w+G7ckQZnMVz+QitoqkGGb5x6HiZ+Sf1tU1dpJgjv98I
	ASmxXy4ZgCOIR3HWV+j4sV6DHSiej4UcvsGXcYIoquliQ8HK+nqQlUC264bmfA==
Message-ID: <5053a8db-79f6-48ff-8116-c65710ba24de@bootlin.com>
Date: Wed, 4 Mar 2026 11:25:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 1/7] net: stmmac: add BASE-X support to
 integrated PCS
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <E1vxhud-0000000BqGK-3U3P@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vxhud-0000000BqGK-3U3P@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: F1D311FE4EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95284-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,armlinux.org.uk:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

Hello Russell,

On 04/03/2026 09:48, Russell King (Oracle) wrote:
> The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
> IP is coupled with an appropriate SerDes to provide the electrical
> interface. The PCS presents a TBI interface to the SerDes for this.
> Thus, the BASE-X related registers are only present when TBI mode is
> supported.
> 
> dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
> by calling dwmac_ctrl_ane() directly.
> 
> Add support for the following to the integrated PCS:
> - 1000BASE-X protocol unconditionally.
> - 2500BASE-X if the coupled SerDes supports 2.5G speed.
> - The above without autonegotiation.
> - If the PCS supports TBI, then optional BASE-X autonegotiation for each
>   of the above.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Haven't tested ofc, but this patch looks good to me (well, my knowledge
about 1000BaseX vs SGMII w.r.t aneg mostly comes from you in the first
place).

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 96 ++++++++++++++++++-
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  1 +
>  include/linux/stmmac.h                        |  1 +
>  3 files changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 88fa359ea716..e606dfb85f94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> @@ -16,6 +16,27 @@
>  #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
>  #define GMAC_TBI	0x14	/* TBI extend status */
>  
> +static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
> +						     phy_interface_t interface)
> +{
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	unsigned int ib_caps;
> +
> +	if (phy_interface_mode_is_8023z(interface)) {
> +		ib_caps = LINK_INBAND_DISABLE;
> +
> +		/* If the PCS supports TBI/RTBI, then BASE-X negotiation is
> +		 * supported.
> +		 */
> +		if (spcs->support_tbi_rtbi)
> +			ib_caps |= LINK_INBAND_ENABLE;
> +
> +		return ib_caps;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> @@ -36,7 +57,39 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>  					   unsigned int neg_mode,
>  					   struct phylink_link_state *state)
>  {
> -	state->link = false;
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	u32 status, lpa;
> +
> +	status = readl(spcs->base + GMAC_AN_STATUS);
> +
> +	if (phy_interface_mode_is_8023z(state->interface)) {
> +		/* For BASE-X modes, the PCS block supports the advertisement
> +		 * and link partner advertisement registers using standard
> +		 * 802.3 format. The status register also has the link status
> +		 * and AN complete bits in the same bit location. This will
> +		 * only be used when AN is enabled.
> +		 */
> +		lpa = readl(spcs->base + GMAC_ANE_LPA);
> +
> +		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
> +	} else {
> +		state->link = false;
> +	}
> +}
> +
> +static int dwmac_integrated_pcs_config_aneg(struct stmmac_pcs *spcs,
> +					    phy_interface_t interface,
> +					    const unsigned long *advertising)
> +{
> +	bool changed = false;
> +	u32 adv;
> +
> +	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
> +	if (readl(spcs->base + GMAC_ANE_ADV) != adv)
> +		changed = true;
> +	writel(adv, spcs->base + GMAC_ANE_ADV);
> +
> +	return changed;
>  }
>  
>  static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
> @@ -46,13 +99,28 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
>  				       bool permit_pause_to_mac)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	bool changed = false, ane = true;
> +
> +	/* Only configure the advertisement and allow AN in BASE-X mode if
> +	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
> +	 * and the .pcs_inband_caps() method above.
> +	 */
> +	if (phy_interface_mode_is_8023z(interface) &&
> +	    spcs->support_tbi_rtbi) {
> +		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
> +
> +		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
> +							   advertising);
> +	}
>  
> -	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
> +	dwmac_ctrl_ane(spcs->base, 0, ane,
> +		       spcs->priv->hw->reverse_sgmii_enable);
>  
> -	return 0;
> +	return changed;
>  }
>  
>  static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
> +	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
>  	.pcs_enable = dwmac_integrated_pcs_enable,
>  	.pcs_disable = dwmac_integrated_pcs_disable,
>  	.pcs_get_state = dwmac_integrated_pcs_get_state,
> @@ -84,9 +152,18 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
>  int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
>  					   phy_interface_t interface)
>  {
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +
>  	if (interface == PHY_INTERFACE_MODE_SGMII)
>  		return PHY_INTF_SEL_SGMII;
>  
> +	if (phy_interface_mode_is_8023z(interface)) {
> +		if (spcs->support_tbi_rtbi)
> +			return PHY_INTF_SEL_TBI;
> +		else
> +			return PHY_INTF_SEL_SGMII;
> +	}
> +
>  	return -EINVAL;
>  }
>  
> @@ -104,7 +181,20 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
>  	spcs->int_mask = int_mask;
>  	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
>  
> +	/* If the PCS supports extended status, then it supports BASE-X AN
> +	 * with a TBI interface to the SerDes. Otherwise, we can support
> +	 * BASE-X without AN using SGMII, which is required for qcom-ethqos.
> +	 */
> +	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN)
> +		spcs->support_tbi_rtbi = true;
> +
>  	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, spcs->pcs.supported_interfaces);
> +
> +	/* Only allow 2500BASE-X if the SerDes has support. */
> +	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  spcs->pcs.supported_interfaces);
>  
>  	priv->integrated_pcs = spcs;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index 23bbd4f10bf8..12ea87792fcb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -32,6 +32,7 @@ struct stmmac_pcs {
>  	void __iomem *base;
>  	u32 int_mask;
>  	struct phylink_pcs pcs;
> +	bool support_tbi_rtbi;
>  };
>  
>  static inline struct stmmac_pcs *
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 2fc169c7117e..3a99c4ef420c 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -192,6 +192,7 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
>  #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
>  #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
> +#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
>  
>  struct mac_device_info;
>  


