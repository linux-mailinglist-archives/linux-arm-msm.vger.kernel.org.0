Return-Path: <linux-arm-msm+bounces-89744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6764D3B729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A51CF301A631
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257662773C6;
	Mon, 19 Jan 2026 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7N09X08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240F21FF3B;
	Mon, 19 Jan 2026 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850574; cv=none; b=BLqWJk/S7zEXD+WTFJO3Asx7W1zGb2Nt52/BHrW3n3B/e1bdLu1Qm9s+WX+6rWLIWWVpyDv+pTOzoRJDl0fg1PrtFdDavimoZt7gKPUGGSrlHw+qx/qEUHS2zSB9jA12gVrEbFfdU6ZfVeVP+3aBHaMGM2/OjG8gLGjI44cFU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850574; c=relaxed/simple;
	bh=2LdEtzd4yY/cOLWnRNwnA2H0y8xNK5Tws6k5kwhhDHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/RcsC1GtbNLOvO1sqYOhKtwuh0707TZm+wiqY9VdxNcDxnkblHmS1XbdRSuVFjr6xK0LEdrN9IwxrDBz556rAuIZGLlFQJFv6QTvWuJWbUPFst6eAKQRQ0Mk/vugGxZTVFZ+tkb+deU3+rNULyWBXTFzZXk48SNCU63UsYJYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7N09X08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5C3C116C6;
	Mon, 19 Jan 2026 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768850573;
	bh=2LdEtzd4yY/cOLWnRNwnA2H0y8xNK5Tws6k5kwhhDHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I7N09X08cA5BT8y2j+GVNAp0K6LCAHFqyyYBiJdDWO/rzKGZlm1JfL6QYjE+TK9m0
	 y60IDssQIheI3yyf+58W8t8wtwGr8N1xJmWq9HjoijJpJmm6uk2Fo+nAjYfgsJTeyI
	 G1C7UTub7M3prpafX8BysuxFLyfE4tOpWGbyQiWRP47OWEsBKmnFCPPfIYPRmcuOUK
	 XcL5zXHSAPMCVdW+WSmTP1kQAzCe1dyjqJlnp+Z0EH1bOxmCRj+H4nJn6Pk9MK4DPS
	 S7ZaOxegEty1GYlo6RSKlcrJtOaOdMxE9u6tBPDI55j8JkUuldjCyaMmbSK6K/RqEq
	 NEJb1Ik5WTe5Q==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com,
	mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org,
	andrew@lunn.ch,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,12/14] net: stmmac: add support for reading inband SGMII status
Date: Mon, 19 Jan 2026 11:21:35 -0800
Message-ID: <20260119192135.1245138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
References: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add support for reading inband SGMII status

This patch adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register. New fields are added to
stmmac_pcs_info and stmmac_pcs structures for the register offset and mask.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..9dd7e78cfbc4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -111,7 +121,37 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
                                   ^^^^

When dwmac1000_pcs_init() or dwmac4_pcs_init() is used, the pcs_info
structures do not initialize the new rgsmii_offset and rgsmii_status_mask
fields. For example, dwmac4_pcs_info in dwmac4_core.c only sets:

    static const struct stmmac_pcs_info dwmac4_pcs_info = {
        .pcs_offset = GMAC_PCS_BASE,
        .int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
    };

This leaves rgsmii_status_mask implicitly zero. Calling field_get() with a
mask of zero violates its API contract (mask must be non-zero) and results
in undefined behavior from __ffs(0).

Should the existing dwmac1000_pcs_info and dwmac4_pcs_info structures be
updated to provide proper values for the new fields? Or should there be a
guard check before calling field_get() when rgsmii_status_mask is zero?

> +
> +		state->link = status & BMSR_LSTATUS &&
> +			      rgsmii & GMAC_RGSMIII_LNKSTS;

[ ... ]

> @@ -205,6 +245,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
>
>  	spcs->priv = priv;
>  	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
> +	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
> +	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;

The values are copied from pcs_info here, but dwmac1000_pcs_info and
dwmac4_pcs_info do not initialize these fields.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index a7c71f40f952..f9e7a7ed840b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -29,12 +29,16 @@ struct stmmac_priv;
>
>  struct stmmac_pcs_info {
>  	unsigned int pcs_offset;
> +	unsigned int rgsmii_offset;
> +	u32 rgsmii_status_mask;
>  	u32 int_mask;
>  };

These new fields need to be initialized by all users of stmmac_pcs_info.

