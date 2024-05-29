Return-Path: <linux-arm-msm+bounces-21010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FAE8D3FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 22:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EADA41C2153E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907171C68BB;
	Wed, 29 May 2024 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHt+MPZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E881C688E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717015838; cv=none; b=bL7+jPbEIszkJha/qrqBc4suEXvhsfAnf1ABg2JlCrEW8L1t1/3EWnr6+U9JfBZHn75aEN459dqj51v84qgaZ/NF1KCsX4g5W5vC9yBNgeU8+nsdxb5AaaLH/3TdSB50C+MHiwTiFJ1nD/QqufVD1TmIf8Iyv33Yzr3aWGh75bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717015838; c=relaxed/simple;
	bh=lblQCcvQsEn3C0L7QF+8CmIxKphkimznAVnOBSt1Fq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAr1lrSJBuF4n20vEw5ytxS2ihy+F8xl43opkvkQrogwVO9WqsNIGWZQ37uvIU8Y3v5FgoodDUFR5vwn6Vurv64Skp4Ny5QKXrh/QTwSi/mDI4qpwFVfG6Bh8Uszm8ExgQdydwLcDs4CLyb+ITI5L/338y+JNg3NC6830CMEHtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHt+MPZ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717015834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1G4MuJLfcNe+eQlPR9y6C2DI9izpMDDpafLXltcFND8=;
	b=XHt+MPZ/lbhv1pMxuZjFaLaYe71ysbNkxUTlNk6IIhgo+su6shYnE27kcESG31w6LfKZ3s
	tm50fV/SzSzxl3BhP2jMpq734kfQjQUhMhH9jPRWKUz9IuQ/su/umD4uDvy/MBx6AKHVcE
	WZMIsPtw0f8ueY5g76108wQq8jhn9og=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-xsZH4CkKN32cRw0bII_1ew-1; Wed, 29 May 2024 16:50:33 -0400
X-MC-Unique: xsZH4CkKN32cRw0bII_1ew-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6f8e32f2a14so206870a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 13:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717015832; x=1717620632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G4MuJLfcNe+eQlPR9y6C2DI9izpMDDpafLXltcFND8=;
        b=jNiuhUmdkoJI4xJAk7RcxHi4q+/7lZav6d02NyQYHnajFsrrBMTbfHt8ZLWx4udizV
         HggSUtmL/zkuetXCd9eoKDWwKBppmiHVFXojJJ6tGLb3vJKyYnw7Wu7LJABv2qa7vAlR
         Km/30kviV801G3g+Ll+KothwP21W7Vzyjey0gEPmEoO57Qq7K00Wvg4P2r2Gt7wo/vtA
         8MyMpostv9hQXldXTG0WpkDsfpdgGzVCrteWQYInZNaaqVtEOGifcQqYUdp6eO1J6ZRD
         2xiM05AVfI/28MY0lvdtklpadtfxK0qR84l9VTxHrwgQMcIZEirEEzqswftMTT36oy4B
         Dwgg==
X-Forwarded-Encrypted: i=1; AJvYcCW0I5dWzkruV1w5pqN6gBufTKkUviyFLHca0dMpAlUt7V3x94/ysRE4ON2kKOXGmutpRetDkzrIS9201Hzvrp270KF/0CrE5opTmnjOXg==
X-Gm-Message-State: AOJu0Yy2xXxdnBTZ6wJ0TQb7ip0IL3ZqDwXDzHoPb9bl8QA3BgXdK+/Z
	16D7tB6xclHBmvnO7diNjrIYBoLynVT3h2ta4rC6JvIA/BjJyMH6J1F7MV+CuY/ntIIn054p+8V
	WQW13rVKwozqMsduRJ88+D17X0d8WV17JWx05ckL2FoK9kAqDlAF3IB+U3FBxznU3d8sWj9E=
X-Received: by 2002:a05:6808:1ab0:b0:3d1:c187:15d5 with SMTP id 5614622812f47-3d1dcca93c5mr144672b6e.20.1717015832378;
        Wed, 29 May 2024 13:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuJSmbdsoQ85Rq/8DqXZY+yAtM9jIMKwB2wvZYK6VBkogsAWKXFSzfzBTS9dp8U90qeTsfA==
X-Received: by 2002:a05:6808:1ab0:b0:3d1:c187:15d5 with SMTP id 5614622812f47-3d1dcca93c5mr144646b6e.20.1717015831958;
        Wed, 29 May 2024 13:50:31 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad8fa000eesm22065026d6.1.2024.05.29.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:50:31 -0700 (PDT)
Date: Wed, 29 May 2024 15:50:28 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jochen Henneberg <jh@henneberg-systemdesign.com>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
Message-ID: <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>

$Subject should be have [PATCH net] since this targets the net tree:

https://docs.kernel.org/process/maintainer-netdev.html

On Wed, May 29, 2024 at 11:39:04AM GMT, Sagar Cheluvegowda wrote:
> Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Please, always write a commit body, even if its simple. Just inferring
from this patch, I am guessing there is some limitation on CPU's DMA
address width that doesn't match up with the MAC's ability? Paint that
picture for us here please! We want to know the _why_ in this section.

Also, I think the Fixes: here would be for adding support for this SoC
in the driver, not what's listed? Might make more sense after you have a
proper body though.

> ---
> Change-Id: Ifdf3490c6f0dd55afc062974c05acce42d5fb6a7

I know this is under the ---, so its not actually in the commit, but I'd
not include that at all when submitting. Someone will complain about it
looking like this is from / for a downstream fork. At least checkpatch
doesn't warn about it, but a human probably will :P

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e254b21fdb59..65d7370b47d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -93,6 +93,7 @@ struct ethqos_emac_driver_data {
>  	bool has_emac_ge_3;
>  	const char *link_clk_name;
>  	bool has_integrated_pcs;
> +	u32 dma_addr_width;
>  	struct dwmac4_addrs dwmac4_addrs;
>  };
>  
> @@ -276,6 +277,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	.has_emac_ge_3 = true,
>  	.link_clk_name = "phyaux",
>  	.has_integrated_pcs = true,
> +	.dma_addr_width = 36,
>  	.dwmac4_addrs = {
>  		.dma_chan = 0x00008100,
>  		.dma_chan_offset = 0x1000,
> @@ -845,6 +847,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
>  	if (data->has_integrated_pcs)
>  		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
> +	if (data->dma_addr_width)
> +		plat_dat->host_dma_width = data->dma_addr_width;
>  
>  	if (ethqos->serdes_phy) {
>  		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
> 
> ---
> base-commit: 1b10b390d945a19747d75b34a6e01035ac7b9155
> change-id: 20240515-configure_ethernet_host_dma_width-c619d552992d
> 
> Best regards,
> -- 
> Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> 


