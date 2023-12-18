Return-Path: <linux-arm-msm+bounces-5273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D6817755
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 17:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655391C25631
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 16:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF193D57A;
	Mon, 18 Dec 2023 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Em0KCyQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B94FF7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702916558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RzF2JbZXyIcepSdPLxopsW7MW0ToCu0TxILicJdkReA=;
	b=Em0KCyQJ/slzGrJ4L+KdRfujPDiVMcHcMNUdat3uhuIqsrlhg7KiV+6s/4qxVVrZ67RHkj
	eJD3CslIvBDzH+KyNIC8CwNokXiKNLjSLZ5I2tJMGWaICHQOX/ADgHgh5mMfB1+MviesEU
	82XhLhYgXkZx71Uj3Cv1hWK7xxqAyVE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-7_znvknyNEetioJLR8RHhw-1; Mon, 18 Dec 2023 11:22:36 -0500
X-MC-Unique: 7_znvknyNEetioJLR8RHhw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77f46b7ef40so569822985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 08:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916556; x=1703521356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzF2JbZXyIcepSdPLxopsW7MW0ToCu0TxILicJdkReA=;
        b=WiuTIpUeFJDCef3kzlhmi6mPc5v2zGFSHEH+mbvyglpnwehkC89S+e2ZzW6RczZjdr
         dAbf0cu0qjXDBJoewzkE9qljjhuddEBuqY0Y+ai5qn56GAik1aMSbscwZamgFB8OxHbG
         MZRRfssOAdtKcYPf98OSzbPXrN7qFyZmVlpgTZoVqqT4e3LGM9vx4XdIdjlDY+hSS0Be
         /pg6OTka1HjS72rE7BekM7TMt8FvEFsF/A61OYoCTbiRhA0B7ZU+2yNAS9xXGfT7OM/F
         4O2jt+necx442NaHQHTuqX2/SshMxzuH99tvGkDsvOk9B1dMERGYhWKeaIevPvyWwco8
         t9sg==
X-Gm-Message-State: AOJu0YwJG9C7W27t6c7KKus3/gBTcwg0A1+uwiEbbc/3InfEw9uzlF2m
	2sflEfFCip85WuKBGm5zMR9rTIno5h1dcifKHSego22BQVHfLoUWiFN777zKpSOdbIZT8u98CRr
	fUqrp95BThFTH0wnQPwp3l5Ns/Q==
X-Received: by 2002:a0c:d84d:0:b0:67e:f2a3:65b3 with SMTP id i13-20020a0cd84d000000b0067ef2a365b3mr10243371qvj.43.1702916069122;
        Mon, 18 Dec 2023 08:14:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6/x18YmncDwyp50UjFRfP/NiAFTZa/XpjJpoegbGivyb5S1NuE3buhOUOC8ymOCWqVGkP/Q==
X-Received: by 2002:a0c:d84d:0:b0:67e:f2a3:65b3 with SMTP id i13-20020a0cd84d000000b0067ef2a365b3mr10243358qvj.43.1702916068894;
        Mon, 18 Dec 2023 08:14:28 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id l10-20020a0ce84a000000b0067f38f0afd1sm1644254qvo.19.2023.12.18.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:14:28 -0800 (PST)
Date: Mon, 18 Dec 2023 10:14:25 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH net-next] net: stmmac: Fix ethool link settings ops for
 integrated PCS
Message-ID: <lcfvxawesjc3r2n66zjd2qu5gan7gvvpefgjqjzqwcxosh3n4l@kcggappvytkm>
References: <20231218135032.27209-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218135032.27209-1-quic_snehshah@quicinc.com>

Hi,

I think the subject should be [PATCH net] since this is a fix.

On Mon, Dec 18, 2023 at 07:20:32PM +0530, Sneh Shah wrote:
> Currently get/set_link_ksettings ethtool ops are dependent on PCS.
> When PCS is integrated in MAC, it will not have separate link config.
> Bypass cofiguring and checking PCS link config for integrated PCS.

s/cofiguring/configuring/

Please add:

    Fixes: ("aa571b6275fb net: stmmac: add new switch to struct plat_stmmacenet_data")

This fixes using the ethtool ops for me so also please feel free to add:

    Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

Thanks for the patch!

> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index f628411ae4ae..e3ba4cd47b8d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -311,8 +311,9 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	    priv->hw->pcs & STMMAC_PCS_SGMII) {
> +	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> +	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
>  		struct rgmii_adv adv;
>  		u32 supported, advertising, lp_advertising;
>  
> @@ -397,8 +398,9 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> -	    priv->hw->pcs & STMMAC_PCS_SGMII) {
> +	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> +	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
>  		/* Only support ANE */
>  		if (cmd->base.autoneg != AUTONEG_ENABLE)
>  			return -EINVAL;
> -- 
> 2.17.1
> 


