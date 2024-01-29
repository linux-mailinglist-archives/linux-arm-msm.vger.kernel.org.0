Return-Path: <linux-arm-msm+bounces-8896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA822840B32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 17:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51E28B2448B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 16:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC898156974;
	Mon, 29 Jan 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehWlkqAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2B156982
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706545226; cv=none; b=b7xA3aqi941UnABC26JGSIVvrevsNZn6te/Vy9pjnz/BbRmfqZT0qTYvmqQJw38Rrhq+ixr0L9T2T+AzemyykwoZRoBbJpNJfgRb1NNUJEKyvFy746f4bN1izvcoNHv3vwNJVZoRpbAa7shckYyWSB17WCxopKohN6E1fuAWZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706545226; c=relaxed/simple;
	bh=CA9YXb52zHxNoJyM9bnjexzncDackHl12fdvQ+SnC1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIUf3nyr2zW4v3CadiydxDg2qTJTvU0GwO9fiOBiACFCN4UT8QQLVMT4ag9wBitU6/ufXpNkNLoDWKt095dZbE17meKe5uHUGYlP4M1jBUSKTOrXsd2npM/XQZskVn7na62RxmPXvcM8CHdgATp4TGuy9q1Y87hmC+uVgq4tYLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehWlkqAS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706545224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mo1W7ExgCY6iWhd9e2KHzVa+OP0q66DqyIj9dXsOdME=;
	b=ehWlkqASnLfVGITR6fSqhOFU3jre5fylOt2oshWu/eLVWtH6bxm9U0Ee4kUZ0iVE5HNF5o
	8hti5zvwNCEqydba45IKmTjxoekrveTJ4eFwqw4oI7NOdnvuN0ZBeNmDFx3XqDUdXKCKTI
	TjtQjpsyfvWEASMQvTySjw38Ffw0KgI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-6H6aCyWbNIuBhtdJS4Xo_g-1; Mon, 29 Jan 2024 11:20:22 -0500
X-MC-Unique: 6H6aCyWbNIuBhtdJS4Xo_g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68058b0112cso87346146d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 08:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545222; x=1707150022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo1W7ExgCY6iWhd9e2KHzVa+OP0q66DqyIj9dXsOdME=;
        b=ZxMYoUvIzcW6qgjvQ/2pWARaMR1XMuUoy5f9LxLNZgXwdOPkJ9cFEPxGgFvclkfk8O
         9OOCqgFZNt9esDjB6jYZ2YUeL08nOvqSjsPRPRF56Dh1TJFeESDBEOeQHphu6CAEsytp
         CV1J5rDekpFtwilvGN4jCXBhpVCnNlzx4NkzAr2alW2O9Cdj/1c0lA/poot3VcomZTYr
         FLDHMZ4yJTYjQ35BA7q2B8yYJpfvffrbHw8p734YSWFkz/Dx/BWxJ3CAMg0vVjhI7Ua7
         qwhoy8aFvvNUgeChCkVoGsb3RnzD/l9GJwdLg6gI6t4MLcpvxDktoDikCoL4LfbPK4jl
         Z/Og==
X-Gm-Message-State: AOJu0Yyd6SBv3HuiVoHG7oCyxHXfLxwYvzJClpVKDGq7pHNQcL6D+ZhR
	ohhL8eW08SA1drym1MGSyEx9t/MB26VGli3WNDx3vPeirRfss94GtLjjADM4VCoM94Zpkbpi+4e
	UxEb8fYIa7TIxn11sVjvoVpRjaYNO43fGiv1B1BF1LZtLsHOOxaB7lq/jHQc7jrA=
X-Received: by 2002:a05:6214:20a1:b0:688:5400:811 with SMTP id 1-20020a05621420a100b0068854000811mr6417151qvd.87.1706545221989;
        Mon, 29 Jan 2024 08:20:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoYFaxi6i63GMesy2TW9Qwb+TJB7ZVXexhyygSPu/lzIz4CN3YWqNIgPkiGCbDzIk8NwJ0jw==
X-Received: by 2002:a05:6214:20a1:b0:688:5400:811 with SMTP id 1-20020a05621420a100b0068854000811mr6417123qvd.87.1706545221598;
        Mon, 29 Jan 2024 08:20:21 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id e9-20020ad45369000000b0068c46068b09sm1878215qvv.141.2024.01.29.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:20:21 -0800 (PST)
Date: Mon, 29 Jan 2024 10:20:18 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Prasad Sodagudi <psodagud@quicinc.com>, 
	Rob Herring <robh@kernel.org>, kernel@quicinc.com
Subject: Re: [PATCH net-next v10 3/3] net: stmmac: Add driver support for
 common safety IRQ
Message-ID: <zfnh5lfz63zlxm6ysexlfv2xstaw4pfnqazmmhdtywxdpwihqu@dfh6wwhcziuo>
References: <20240129121129.3581530-1-quic_jsuraj@quicinc.com>
 <20240129121129.3581530-4-quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129121129.3581530-4-quic_jsuraj@quicinc.com>

On Mon, Jan 29, 2024 at 05:41:29PM +0530, Suraj Jaiswal wrote:
> Add support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault in common IRQ line.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 41 ++++++++++++++++++-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++++
>  4 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 721c1f8e892f..b9233b09b80f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -344,6 +344,7 @@ enum request_irq_err {
>  	REQ_IRQ_ERR_ALL,
>  	REQ_IRQ_ERR_TX,
>  	REQ_IRQ_ERR_RX,
> +	REQ_IRQ_ERR_SFTY,
>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
>  	REQ_IRQ_ERR_LPI,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 9f89acf31050..ca3d93851bed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -31,6 +31,7 @@ struct stmmac_resources {
>  	int wol_irq;
>  	int lpi_irq;
>  	int irq;
> +	int sfty_irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
>  	int rx_irq[MTL_MAX_RX_QUEUES];
> @@ -297,6 +298,7 @@ struct stmmac_priv {
>  	void __iomem *ptpaddr;
>  	void __iomem *estaddr;
>  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
> +	int sfty_irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
>  	int rx_irq[MTL_MAX_RX_QUEUES];
> @@ -305,6 +307,7 @@ struct stmmac_priv {
>  	char int_name_mac[IFNAMSIZ + 9];
>  	char int_name_wol[IFNAMSIZ + 9];
>  	char int_name_lpi[IFNAMSIZ + 9];
> +	char int_name_sfty[IFNAMSIZ + 10];
>  	char int_name_sfty_ce[IFNAMSIZ + 10];
>  	char int_name_sfty_ue[IFNAMSIZ + 10];
>  	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..e0192a282121 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;
> +	case REQ_IRQ_ERR_SFTY:
> +		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
> +			free_irq(priv->sfty_irq, dev);
> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> @@ -3661,6 +3665,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */
> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> +		int_name = priv->int_name_sfty;
> +		sprintf(int_name, "%s:%s", dev->name, "safety");
> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  0, int_name, dev);
> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc sfty MSI %d (error: %d)\n",
> +				   __func__, priv->sfty_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	/* Request the Safety Feature Correctible Error line in
>  	 * case of another line is used
>  	 */
> @@ -3798,6 +3819,21 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */
> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  IRQF_SHARED, dev->name, dev);
> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: ERROR: allocating the sfty IRQ %d (%d)\n",
> +				   __func__, priv->sfty_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -6022,8 +6058,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
>  
> -	/* Check if a fatal error happened */
> -	if (stmmac_safety_feat_interrupt(priv))
> +	/* Check ASP error if it isn't delivered via an individual IRQ */
> +	if (priv->sfty_irq <= 0 && stmmac_safety_feat_interrupt(priv))
>  		return IRQ_HANDLED;
>  
>  	/* To handle Common interrupts */
> @@ -7462,6 +7498,7 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
>  	priv->lpi_irq = res->lpi_irq;
> +	priv->sfty_irq = res->sfty_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;
>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 70eadc83ca68..ab250161fd79 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -743,6 +743,14 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  
> +	stmmac_res->sfty_irq =
> +		platform_get_irq_byname_optional(pdev, "sfty");
> +	if (stmmac_res->sfty_irq < 0) {
> +		if (stmmac_res->sfty_irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");

Serge had this comment on v9: https://lore.kernel.org/netdev/giimpexp3qk3byb725r3ot3aund2bwmi45yrctkydatm73d5af@e36xmjf2ehvu/

    s/IRQ safety IRQ/IRQ sfty
    * Although I would have also converted this to just dev_dbg() since
    * the IRQ line is optional and is present on a single platform you
    * have.


    With the subject and the log-message fixed feel free to add:

    Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

    -Serge(y)

If you would have changed the dev_info() here it would have been
appropriate to add his "Reviewed-by:" tag, which makes your series more
likely to get merged. I assume you just misunderstood/didn't see the
request (I'd expect a comment somewhere about why you *don't* want to do
that if you did see it but decided not to do it), but in the future my
advice is for a minor change like this to just make it and take the
Reviewed-by tag on your patch!

> +	}
> +
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
>  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> -- 
> 2.25.1
> 


