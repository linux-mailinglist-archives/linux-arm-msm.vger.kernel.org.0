Return-Path: <linux-arm-msm+bounces-94015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLWhGCBMnmkSUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 02:10:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC418E8E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 02:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 409D230151DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 01:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF86D23E330;
	Wed, 25 Feb 2026 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9E+hMv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F01EFFB7;
	Wed, 25 Feb 2026 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981854; cv=none; b=ozwy6n6B3kxnzLta6NR3kaayt5OZFewP+YI1RLWbp3OdtBH9agfecE1/EDoYotyjsYfWE+TZ73rBruaNmQK2DashjlybP4/qiNb+7t/7vr6hszSn7BCyslNmGGLAX5i08rsP14dBRir/rvZGHWlQww1CcYi1j1eGMLP3n3DzkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981854; c=relaxed/simple;
	bh=sb7j1FL99ZUX0T3ABzAAqtzGtBkmFP7NpZyq2s72B98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPjK8nccxAJdVg9K6r2BNUX2NqKDisZtwKRq2qw9oJHUlx9SgfF3jE99Tz5Xoyw+bnkgJrvYN3hysFnYHEjEVMWK6dvfRIAAKaJ1S24mdmwsSL7pdKrOcdJo19aUWm7UiIXQ8CzaT3uXQYqn5rYiYuoIN8N604C/xVzGPDmeF/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9E+hMv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC9C116D0;
	Wed, 25 Feb 2026 01:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771981854;
	bh=sb7j1FL99ZUX0T3ABzAAqtzGtBkmFP7NpZyq2s72B98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J9E+hMv4EGdU3/NuAZQTjdWRKpEKG6PRrzMaedXu8Lx74VL8BSCUAtB/DDU6jwaFf
	 B+O527/W3ACnovLfqx/LpN7nIZoKIcOgqSaDWyX7tTomyta4oeEme75rzMDoDCr5Bq
	 3T99R7rEDOlr3zqD4jO0ufHCE0xLPjdh/78SiSOoGkQuWEo25PTESlDQIyIRlyaOXI
	 qdR98BSi8EQzxU/rUureK3Qthuyudm37g3ZbydhUoZGkMbjE71HQmr+V96KtR4YqsP
	 rmXXej1yZvAPWrbkQieDoWQHQBqi+1CXi6NvmA7UYshYh97NZIivQ7P4BLY7GLWKL/
	 ETsVknfyOsCNQ==
Date: Tue, 24 Feb 2026 17:10:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank
 Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <20260224171052.27bebff0@kernel.org>
In-Reply-To: <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
	<E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08AC418E8E4
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 09:34:51 +0000 Russell King (Oracle) wrote:
>  	switch (speed) {
>  	case SPEED_2500:
> -		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -			      RGMII_IO_MACRO_CONFIG2);
> -		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> -		ethqos_pcs_set_inband(priv, false);
> -		break;
>  	case SPEED_1000:
>  		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
> -		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> -		ethqos_pcs_set_inband(priv, true);

Not clear to me why rgmii_setmask() goes away in the 2.5G case?
Just checking it's intentional..

