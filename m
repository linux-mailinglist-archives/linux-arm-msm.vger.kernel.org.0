Return-Path: <linux-arm-msm+bounces-61287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F6AD9E19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 17:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DD4189899F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6B842A8C;
	Sat, 14 Jun 2025 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBrYjt+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C29BA49;
	Sat, 14 Jun 2025 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749915319; cv=none; b=FcXTIKmctXOAPtOXUSWedj1I8IIvSNJnYZOI1a8eEjrpgXvhXla5d80z9h21INVh5WhsupgZ9W5pxx3/1EG4WtyrDDIf/4gdWcRzxtn3uOFDEDYK1pA7wXN06NGXs4Yn4Fh/y+hv+alfltR2sXYf+hADzH+9IiNbIPW1qksm1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749915319; c=relaxed/simple;
	bh=d/EY3r7M0Oqj/yKEoNpBZWTyk+esJAhtZ5aqvrMM2to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly2Qx8goXyTW4n9Jg5w+MnUYOkG9ZfUsmD7gJV7RCXPKCCL7iWJYz79V25R9Ph2F3Wv+1ae3G05y3DWtFEwQ86Y4zKYJL1IjBPn+2BxlsnWIh4o4XgqWJzrWhG7JkDFRdmw2h7kDTLw4+FLrRfGtM8S/oHVeS9uVuQxkheuTsRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBrYjt+T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FDEC4CEEB;
	Sat, 14 Jun 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749915317;
	bh=d/EY3r7M0Oqj/yKEoNpBZWTyk+esJAhtZ5aqvrMM2to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBrYjt+TsccDL8IyUV+0MyZuV+x2m0KQPMmUzqif+KvB70rMn7led0twGlZSOv+t0
	 wqPvrCyT+uA9Z5XOlOIdI5pcbu5oVCQgUJvstu7ldKG+0EPa0GDztZqOzyorcowOzw
	 4EBw4ObYoPcpy1d2xDYeU7Pz3mRHeHV+//E0H3qunHYBQ0UEorJrMi9euNHELcqIze
	 eBLmuhZ4cmO+hJHlfjLgsN+nBTr783gvtcdcrg6DfSc9sgF8dL8wyoqJdlweEZA1MQ
	 WIpCt2olStUt4E/jeV80IUcYJLSSgGemvn2xJ95HMx53m0jOpHWiESG443k3f+VgZ+
	 KRQOty20KW+zg==
Date: Sat, 14 Jun 2025 16:35:12 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
Message-ID: <20250614153512.GQ414686@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>

On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russell,

The nit below notwithstanding this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e30bdf72331a..2e398574c7a7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
>  	}
>  }
>  
> +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> +{
> +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);

FWIIW, I would have gone for the following, as all the type of
three of the trailing parameters is bool.

	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

> +}
> +
>  /* On interface toggle MAC registers gets reset.
>   * Configure MAC block for SGMII on ethernet phy link up
>   */

...

