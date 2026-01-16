Return-Path: <linux-arm-msm+bounces-89299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C5D2A712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 03:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D69301B480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 02:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4892FE560;
	Fri, 16 Jan 2026 02:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnytLdQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0E1F7916;
	Fri, 16 Jan 2026 02:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532332; cv=none; b=aWQdZCPwl/HRy7WtyEC856EK1FjGA9aFF1quwZJYieSTLLR6hgjegK5d+UvN1sTjln5t04slHEXQym4Ao/hjBJ36d3Y0j9Y9e2zMamNrH25ujBi0PYfBy5phKvTHPfNAAx2zFh/6bBOWQfvJ12kPaw1SDy7nQhGD3rKpaf2BDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532332; c=relaxed/simple;
	bh=Z8pz7s7wIhRbbyi0eFN+WPj/og6acecvdgN9FzzA8w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kirc3xDuaY/RMpnaxAEtkjn0PLlk3V9HyzFeCROwS4H/NFnRQY0o1AH+vtMt70sGTzKdc+/JXaqFHg2Sg3tQvWiPWR0YZ28j97V3MF4fnk1dOBO08MjG+JpgcQQaqNmsLb4LOiJz9EfcXMslFQo03DaLJOzmg4K/Klai1XNEdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnytLdQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5783DC116D0;
	Fri, 16 Jan 2026 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768532332;
	bh=Z8pz7s7wIhRbbyi0eFN+WPj/og6acecvdgN9FzzA8w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnytLdQmwn45B3ZBFM/hT5sAyAKdFL8cS0MtmDxP7MsiosPTNfXT0MpvAg4XUmPR1
	 9ilmf53jlm8YkeMW8Jc00GdC18E/n5VkbyRY35TuR4ZFW3xHmu5MqZhldWLAs9WUSK
	 /f4lxWwLUTm3EtNqbHTGJ6xq8H/Hbkzv9EYuOXM3dRA+y+BjroCeUguepRPNbHs5bW
	 HWXDCT8AAsaXSVsydq/roIP7T+Q4pURm9S1g6LaAWJgEtkvJTHu51+NaeveREFBpMY
	 X9nW+jIvyV1Fwhk/5S6JbWK4h0Vdq7ghGQqgKK9I+Xsmal+MWtXHfobV8mowfGNh2C
	 Fbshsj4QJPOxg==
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
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Date: Thu, 15 Jan 2026 18:57:24 -0800
Message-ID: <20260116025723.354031-2-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
References: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I haven't investigated too closely if this is legit or too defensive
TBH but since I'm sending the second one I'll include this as well..

This is an AI-generated review of your patch.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The serdes field in
platform data is optional and NULL when not provided by platforms.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24a2555ca329..6c515f9efbe7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>
>  static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
>  {
> +	dwmac_serdes_power_on(priv);
> +	/* Only sets the SerDes mode if it wasn't already configured. */
> +	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);

When priv->plat->serdes is NULL, dwmac_serdes_init_mode() will call
phy_get_mode(NULL). Unlike other phy_* functions (phy_power_on,
phy_power_off, phy_set_mode_ext, phy_init, phy_exit) which handle NULL
by returning early, phy_get_mode() is an inline that directly
dereferences the pointer:

    static inline enum phy_mode phy_get_mode(struct phy *phy)
    {
        return phy->attrs.mode;
    }

Can this NULL pointer dereference occur when a platform does not
populate plat->serdes? The call path stmmac_open() -> dwmac_serdes_init()
returns 0 (success) when serdes is NULL, allowing __stmmac_open() ->
stmmac_hw_setup() -> stmmac_clk_rx_i_require() to proceed.

> +	phylink_rx_clk_stop_block(priv->phylink);
>  }

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
> new file mode 100644
> index 000000000000..3003e1ae38d2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c

[ ... ]

> +int dwmac_serdes_init(struct stmmac_priv *priv)
> +{
> +	size_t i;
> +	int ret;
> +
> +	if (!priv->plat->serdes)
> +		return 0;

This returns success when serdes is NULL...

[ ... ]

> +int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phy *serdes = priv->plat->serdes;
> +
> +	if (phy_get_mode(serdes) == PHY_MODE_ETHERNET)
                         ^^^^^^

...but dwmac_serdes_init_mode() has no NULL check before calling
phy_get_mode(), which will crash when serdes is NULL. Should this
function also check for NULL serdes before calling phy_get_mode()?

> +		return 0;
> +
> +	return dwmac_serdes_set_mode(priv, interface);
> +}

