Return-Path: <linux-arm-msm+bounces-89743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A234D3B725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A0B230136F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A707A23B604;
	Mon, 19 Jan 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhYHaSve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832611DF987;
	Mon, 19 Jan 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850495; cv=none; b=pyuO2A8wrTjy50uJK6Za6CQMpX5BJlSn/KFHgH4eUq8sEzVGdDuW9o8VUgpL59z7bBoAbJpWCdJR2IvSgnf4FxbBwbTgYpe+qNHTPPF4YwoXLd19dOfU7QDPnjJBcMYw/FKEPUf8Ju202UjrLNKmYJDF3DdaTmWzmG4Mx/rPZak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850495; c=relaxed/simple;
	bh=bTvnpQwyMWeQprejsCLPF19PUoNVMU+Bj/o+xuFRyPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAGvAdwh8I2Ri7W2A93hBf7tArXdibWsFiJ569BUY2PT9MpBm6sKXcRsIMR2kZGKUyEu3GzXttwcIAPAM1nAFrV/OYfahX18Z6N8rzsSgJdVzCHOKX3oSFbLS4jLV+pn5OkF+GVVUO+R56OLQ1Hjxz24HJJxnnQ1Kg2wJ+syvJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhYHaSve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6584DC116C6;
	Mon, 19 Jan 2026 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768850495;
	bh=bTvnpQwyMWeQprejsCLPF19PUoNVMU+Bj/o+xuFRyPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhYHaSve1QmWIrv5TyLGaTbwpfcsUaMF8FmzVrt0/wMD7H60mLj0P0CBONBIlAk6s
	 2MgpJYvIMV7hr9yTFTfVZPsAthBZKM5rvBncUfeuowcaSgkSHprRyQjAIxq2cHizxO
	 iOClmclqVBvGQ4Ccloghkcpp1igKQnhoCD14gXvLRsI9ktg+aa8Ae+uagcSBh5lXCj
	 ga5CJxyB8jFbJrpTJ44TqoMj/+MFMo2cCAr94PZY4Aap4TArOrQOgR/5C4KKNVvwJ6
	 8aiS8FbuE4ysLrue1Ekh2MSuivawyRRIG4ad5DRekXMoDopYCtF5Z+Ocg2SkgN8cr2
	 mjoSI+jRrDnNw==
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
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Date: Mon, 19 Jan 2026 11:21:25 -0800
Message-ID: <20260119192125.1245102-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
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
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The SerDes is managed
through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
for the power state.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 2f826fe7229b..4d1902f3a58f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> {
> 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	struct stmmac_priv *priv = spcs->priv;
> +	int ret;
>
> -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> +	ret = dwmac_serdes_power_on(priv);
> +	if (ret)
> +		return ret;
> +
> +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> +		if (ret)
> +			return ret;
                        ^^^^^^^^^^

If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
a powered-on state? dwmac_serdes_power_on() succeeded at this point but
there's no corresponding dwmac_serdes_power_off() call before returning
the error.

Looking at phylink_major_config(), it appears to discard the return
value from phylink_pcs_enable(), so the caller won't know to call
pcs_disable() to clean up the power state.

Should this be something like:

    if (spcs->interface != PHY_INTERFACE_MODE_NA) {
        ret = dwmac_serdes_set_mode(priv, spcs->interface);
        if (ret) {
            dwmac_serdes_power_off(priv);
            return ret;
        }
    }

> +	}
> +
> +	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
>
> 	return 0;
> }

[ ... ]

