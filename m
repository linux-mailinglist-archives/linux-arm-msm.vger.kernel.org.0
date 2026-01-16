Return-Path: <linux-arm-msm+bounces-89300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FCD2A72A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6CE30281BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 02:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC593242D8;
	Fri, 16 Jan 2026 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdOT9TPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F401F7916;
	Fri, 16 Jan 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532335; cv=none; b=jhYguVe3TB8fDTlmWbWHJS4WME3ywsZYUH61sMtffs7BAAE6TIYl/H24Br3Kg185j/uGUw9xNQkzZsQDNRyIbARpbrCAakSd770gDVfXMVrdLZz79YlCF+7SpV2pwH+WF8ZsIkwUofRDL5ZJKSaah3/eIWRH1CKCp8m4BREcK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532335; c=relaxed/simple;
	bh=J/VRZLz5Y13tzcUGlFZbC7tPCdmM0aLjt2QZN4qLbrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQC5hvIFEEWovGwz1P3OfhzUlQk3h1NQT3FtK7M128++7DMwjPjL/aNDKBFFi5UjyJTg5Gtp63JkPN2zNL8+tIUlA5Z69pXF3naU7NIaG+uoTZs0Lut9p+tDhet7OF4t2Tul25xmpdLr0s+CtX4N4RMm/HWeC4pMQDdmJG3uilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdOT9TPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4182C116D0;
	Fri, 16 Jan 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768532334;
	bh=J/VRZLz5Y13tzcUGlFZbC7tPCdmM0aLjt2QZN4qLbrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdOT9TPHU+LhbSrLGTtlmmXFRb1e6bgdCDXom0+7F83Nhzdx6GFQHbHoylT0WRGhY
	 3vMt2nNaJi45xR+kJ2+XJtImNvh78p9oakYeN86wlMKpA7MvPvL4uo+5mrEJhJ6Lul
	 /OUfOOLRHeEZZgXKS1wojHxAezR6vin9l7vDm6r693cNm9+oUpKs2qUO5/8pjyJkyK
	 rTHvDrxtGqo9p/M3HlKefCnRkiqpfb8QFjA08pSNQ+aDQKMTmKqjdYN731LjtAe09N
	 f8rpw+Bqo1v9arayO+ZjUyuMTbvS3iKqICfyMJXr6Jz6m4NZmOrUnfR8ffVqWuQ6oY
	 zkDxxmGBLUocQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	vkoul@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	andrew@lunn.ch,
	edumazet@google.com,
	netdev@vger.kernel.org,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	linux-arm-msm@vger.kernel.org,
	neil.armstrong@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,12/14] net: stmmac: add support for reading inband SGMII status
Date: Thu, 15 Jan 2026 18:58:52 -0800
Message-ID: <20260116025852.354716-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
References: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
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

This commit adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..12fc5038d913 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -97,7 +107,7 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>  					   struct phylink_link_state *state)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> -	u32 status, lpa;
> +	u32 status, lpa, rgsmii;
>
>  	status = readl(spcs->base + GMAC_AN_STATUS);
>
> @@ -111,7 +121,35 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
> +		state->link = !!(status & GMAC_RGSMIII_LNKSTS);
                            ^^^^^^

Should this be checking rgsmii instead of status here? The status
variable contains the GMAC_AN_STATUS register which is equivalent to
MII_BMSR according to the comment at line 7. In BMSR, the link status
bit is BMSR_LSTATUS (bit 2), not bit 3.

GMAC_RGSMIII_LNKSTS is defined as BIT(3), which is the correct bit
position for the RGSMII status register (matching GMAC_RGSMIIIS_LNKSTS
in dwmac1000.h), but it appears to be applied to the wrong register
variable.

The code later uses rgsmii correctly for speed and duplex extraction.
Was the intent to use rgsmii for the link status check as well?

> +
> +		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {

[ ... ]

