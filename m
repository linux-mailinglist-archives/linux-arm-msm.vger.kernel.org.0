Return-Path: <linux-arm-msm+bounces-24311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E84918509
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B801F22D36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857FA18629B;
	Wed, 26 Jun 2024 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hqVCury/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098C186291
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413912; cv=none; b=pCAwwqxpEuRp68HNOV73NdwRpBKVpQdaM77lW3BfmQ5KCnAC/uRdbxMvpUPQ+OAZ29vqNFtUXFkbYuymTMKdDBVnm5ljryxDvE7WaJIkz2TD63BM8Y8fFFS833tZxp+e8OVuJrKfDmRYJJqwF/uCDg7Da48a59n+M7LOIpNwABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413912; c=relaxed/simple;
	bh=I0D6e6Fg9mEuPCvMsSlvOuOX5/XCzgzm4K0nMEj8N7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUhpoHV0s+CaASmtU17/gs0OI8xVcsxqrrY1cMJkGXuiu4cA01zY0HHh5CRMEGHFOi+yKVSLX3BPMISOgEoBP97m+h3mRbnPetLiMV7SJUN9THDdx7BFIPJ/oj9ZgGAlOMrUjeYw+bDx9MIZ4EkmEzZLVJfwXFq6DWylZ2i9hhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hqVCury/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719413910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aya9QIUU1dceOpRSHwLiYWRs5fBhpIvpFHsqd9ObPGw=;
	b=hqVCury/LQW1aL/8KmtaUXBsFDVQnQ8vlQQhQzgF8hcEE2clW4InEuFa5NsEvwaZc+FcNq
	FPpJ1VXIc+0IMqMBeXX1tfgyFMnT6E3RAJZRjv1Kr5RNCQZD1R0ydvnENKypYMWgb7HE+n
	w75JcN7Okr4H9IIXB4U0ndLI4OBZ8DU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-HsDdmdzwNgKzFgGuNZ4GVA-1; Wed, 26 Jun 2024 10:58:28 -0400
X-MC-Unique: HsDdmdzwNgKzFgGuNZ4GVA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b500743a3fso102416466d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 07:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413908; x=1720018708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aya9QIUU1dceOpRSHwLiYWRs5fBhpIvpFHsqd9ObPGw=;
        b=MOspGoThJFNk5aL6gJjCgWZlly7k/0+8BlM5VfQXxzvKC5vca94dmzT5QFg0Vk44nr
         63HS3arRCyEgGt1xyF/BzwiYuw9JGX4bEcVXmwRSAD5iEQ6Kda5q3ZMaRWpvTnXF4axQ
         gLBrMNqOWsf0l23GKkZEtmD3XbXWWDrkTJfV0ygxFmALj/4Px5Ss31xtKJ/rc8xTuwzr
         0rCjTSt6GIOsFy8AFVHPfIPLs3KP4r1xruP570w8GHqFQdmiwiYFaECMAu80QLblgLSW
         5oi/R5yQ1uo0ZqDfBv8Qp5d1ALpkuqFwJKUHtCYT5Z55NcSgjBplzKnDuVrXo8z0l9rH
         CwZg==
X-Forwarded-Encrypted: i=1; AJvYcCWy+sf0X+l/AXD4ET80rKoaejtbO+6XnspMO16AXdLNtBUyrmJW06K/yFWv6JFuRbC2Kh1NW1Tv+/HCbNz2W5qrftKMDQ/5Jd86wyy0/Q==
X-Gm-Message-State: AOJu0YwdIzZjJYa/A175T4K3lnDYszKXzrolc0uLvh4FuCoZpt9oqSGU
	tw6t5mUdsm1mJ1ZG9fl/5/817G9+TeZIDazt+8o8CevT+o8UdUGlX6IkiY96R0x568PFFM6w2BK
	szzWeke/AYGIvwh/dZXQ2czpMb23cxkST0Aj3D8J3xYobsg1qIPWcbFUQ2cfYrQQ=
X-Received: by 2002:ad4:424e:0:b0:6b4:fe0c:1a92 with SMTP id 6a1803df08f44-6b53bff41abmr121545846d6.43.1719413908144;
        Wed, 26 Jun 2024 07:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6nPLCGa2C50EKUtysGXYh0LMEa5egqmh4lDlG99IlgJl3jje0UqDxnnZntsdaxpPxTw2dxA==
X-Received: by 2002:ad4:424e:0:b0:6b4:fe0c:1a92 with SMTP id 6a1803df08f44-6b53bff41abmr121545616d6.43.1719413907762;
        Wed, 26 Jun 2024 07:58:27 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b531673e6esm42461056d6.85.2024.06.26.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:58:27 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:58:24 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com, 
	Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] net: stmmac: Bring down the clocks to lower
 frequencies when mac link goes down
Message-ID: <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>

On Tue, Jun 25, 2024 at 04:49:30PM GMT, Sagar Cheluvegowda wrote:
> When mac link goes down we don't need to mainitain the clocks to operate
> at higher frequencies, as an optimized solution to save power when
> the link goes down we are trying to bring down the clocks to the
> frequencies corresponding to the lowest speed possible.
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ec7c61ee44d4..f0166f0bc25f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>  
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
> +
>  	stmmac_mac_set(priv, priv->ioaddr, false);
>  	priv->eee_active = false;
>  	priv->tx_lpi_enabled = false;
> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  
>  	if (priv->dma_cap.fpesel)
>  		stmmac_fpe_link_state_handle(priv, false);
> +
> +	stmmac_set_icc_bw(priv, SPEED_10);
> +
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);


I think you're doing this at the beginning and end of
stmmac_mac_link_down(), is that intentional?

I'm still curious if any of the netdev folks have any opinion on scaling
things down like this on link down.


