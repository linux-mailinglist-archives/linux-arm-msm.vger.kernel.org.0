Return-Path: <linux-arm-msm+bounces-95370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGXZFh1fqGmZtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:34:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD32045BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807FD31314E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 16:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9D9363C68;
	Wed,  4 Mar 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yGk6nEO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626A3644C0;
	Wed,  4 Mar 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641423; cv=none; b=d3Wd4Q+5SzIRcwcyE2Mu0IliF2TFeWJMHg2YQNtXq0W1/nmSHlAvANOjw0mt51gUj3cAfRVhXyFm79ZaDgWW1grvJxtB9q3Sx8TvTiASR/ruDxDgkQY/2KqgsTaJ4u1Kp7UU1z75bS9LhkKhf4fjOgKLGGWKsPPLAi9Z1uF4csU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641423; c=relaxed/simple;
	bh=0SfjjU2ysBvL+okw8ZrfMdsL665OjplTltiRXPA3WPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7np6gjzZ/VflsdNLqXiJc1Dj8TXrHT2SO/jdi+I9eND8OErcI8ZlgKiMIdMCwqZ3PDL1/flLYerwZIi6UwMMYWetdq8wrEA5GH8Ijwwr4dvnzetgFjJFupq6dYiWPqxlZUKhG3qzdjr/7tQbzAiHEt4wiSympcvkr50OJn4Dig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yGk6nEO0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9AE3E4E42542;
	Wed,  4 Mar 2026 16:23:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EF075FF5C;
	Wed,  4 Mar 2026 16:23:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 283D410369745;
	Wed,  4 Mar 2026 17:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772641418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xYK5YnD6PK/wRtLBidA/fCTqYSAI3vOMVTapurd9A8Y=;
	b=yGk6nEO0rstImCcR4sXznwq84+ePnnVkTr6gEwdBElr3pI/cDPbrjQaxQP0UfyIHkCs774
	Z2adwc+dB4YfTmgMM9/qs2jAj8vXpsc5osuo5k2ZUqSwpx1Co9+Mf7G2mQOILt0QcBP8Rh
	U5IV7CVWBOEwI6ST4iQxnaWK8fDguHvQ/henEU0zb5D9wBEV0CyNYfRtbsiyi7G1AT2gTQ
	LSkDw29j+3ZS8vNFagkVhAsjvpQ0afMCcnoaeeq6m1Hi2lKH3JyPrgWsztIzsGDPYxdZKE
	EdDztObWY5q1egJhJcLS1hkbRnCn/2UDLFwdIeHiMX4gO4gKVaDfPWP7p5qvtQ==
Message-ID: <2069cdfb-7c67-4047-a35f-f1e976a03122@bootlin.com>
Date: Wed, 4 Mar 2026 17:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 3/7] net: stmmac: use integrated PCS for
 BASE-X modes
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
 <E1vxhuo-0000000BqGW-0YDF@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vxhuo-0000000BqGW-0YDF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: CBAD32045BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95370-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Russell,

On 04/03/2026 09:49, Russell King (Oracle) wrote:
> dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
> PCS, so we need to expand the PCS support to include support for
> BASE-X modes.
> 
> Add support to the prereset configuration to detect 2500BASE-X, and
> arrange for stmmac_mac_select_pcs() to return the integrated PCS if
> its supported_interfaces bitmap reports support for the interface mode.
> 
> This results in priv->hw->pcs now being write-only, so remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h      | 4 ----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 42a48f655849..91116acf3273 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -277,9 +277,6 @@ struct stmmac_safety_stats {
>  #define FLOW_TX		2
>  #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
>  
> -/* PCS defines */
> -#define STMMAC_PCS_SGMII	(1 << 1)
> -
>  #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
>  
>  /* DMA HW feature register fields */
> @@ -634,7 +631,6 @@ struct mac_device_info {
>  	unsigned int unicast_filter_entries;
>  	unsigned int mcast_bits_log2;
>  	unsigned int rx_csum;
> -	unsigned int pcs;
>  	unsigned int num_vlan;
>  	u32 vlan_filter[32];
>  	bool vlan_fail_q_en;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 029e9b518160..2e7edc3e82f2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -945,11 +945,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  			return pcs;
>  	}
>  
> -	/* The PCS control register is only relevant for SGMII, TBI and RTBI
> -	 * modes. We no longer support TBI or RTBI, so only configure this
> -	 * register when operating in SGMII mode with the integrated PCS.
> -	 */
> -	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
> +	if (priv->integrated_pcs &&
> +	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
>  		return &priv->integrated_pcs->pcs;
>  
>  	return NULL;
> @@ -1208,7 +1205,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
>  
>  	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
>  		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
> -		priv->hw->pcs = STMMAC_PCS_SGMII;
>  
>  		switch (speed) {
>  		case SPEED_10:


