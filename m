Return-Path: <linux-arm-msm+bounces-100141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPWVHfx3xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:16:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D5339E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F3A33055602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6A438E5C8;
	Thu, 26 Mar 2026 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYRvSGgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C78836E48D;
	Thu, 26 Mar 2026 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548299; cv=none; b=tXus0HfhlbnQ73tYQybfWl5NAs46AF+OyFXkRaApoItL+q+jN3lBhVk4aQXvVTRyWwVgsGr30ewuT5tjT5F9Am8iGzD4hLNIXRVxunS7lspUKFT83oY0QbzdgAEObvhEpjDvYOIlAQoKBQytX5kGDelQYUas04wZjwenYnh458E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548299; c=relaxed/simple;
	bh=qpAtIegWs0nrmgQYz8seyUU8RILvB8VXDiR3yGSyW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzfCMlWcnIOl1KIzik86lEY5Ixq0AUhF8f9iBNQ0yLuLcgOabXS09ZrmDWAHsNMsbZVEB87f4gg8TSVrKKXh9r8mY89Zu7gqlbYIPKcKToJZ73swTiYdW3hy/xxiytEX0v1/+ACQkmmqbqdNypv/oTse2j1jdm+wv5FfNf1qmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYRvSGgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FD9C2BCB1;
	Thu, 26 Mar 2026 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548298;
	bh=qpAtIegWs0nrmgQYz8seyUU8RILvB8VXDiR3yGSyW2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYRvSGgspK+mulzMUQ36UxRvcUstR5rZzn14ac570iMtTy/LIGM/WQmEhR+gRXN8A
	 OyF2HSQocuufy7SRk9CWmxP9fphI0+iEJL9AEV2S91N39YljfkYPAh80tEdxd+kdK1
	 pSKPPdPmWRXAd/zvgMddZWG4hFtEs4meYtL17T+6LL3p6TsdIRK1ci96GS7/zqrpH1
	 lBU/4gQHH6CIEQ1FpFAt19qNfM1qE//Co9Av44XginlsW4ygFksy0DMfnXqbjO7siB
	 d70mCpW42qPFJIXAmGeREuclg8pj3VFN9Afkzd9piMbjQbNuuiIvgdCnL45CAVfF/l
	 +cPqdmU3sNN4Q==
Date: Thu, 26 Mar 2026 18:04:53 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <20260326180453.GU111839@horms.kernel.org>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-100141-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C64D5339E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> Since ethqos_fix_mac_speed() is called via a function pointer, and only
> indirects via the configure_func function pointer, eliminate this
> unnecessary indirection.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
>  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
>  }
>  
> -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> -				 int speed, unsigned int mode)
> -{
> -	struct qcom_ethqos *ethqos = priv;
> -
> -	ethqos->configure_func(ethqos, interface, speed);
> -}
> -
>  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>  {
>  	struct qcom_ethqos *ethqos = priv;

Hi Russell,

FYI, AI generated review reports that the comment in ethqos_clks_config()
that references ethqos_fix_mac_speed() should also be updated.

...

