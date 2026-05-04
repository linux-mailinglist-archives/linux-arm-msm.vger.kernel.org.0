Return-Path: <linux-arm-msm+bounces-105791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNsrJHnr+Gmi3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:54:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8534C2CD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E591303B72B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 18:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70B43E638E;
	Mon,  4 May 2026 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYnOJMGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936653E6383;
	Mon,  4 May 2026 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920853; cv=none; b=cRdH4AKfWAwJ0UFa/E6E1MGFBJClfLDfMsZIosYNPuuaEfDUryExJfMS9uiASD0EqeY9Knp9VZjcyvQs8glNYItU8OhrlZPaIxx8NwwzV/nKlraJhAbBBMAw1zJG34gHONd4vGMRUnHq/uzf4ujKThVGuxweZk5Ke18ZsdYgrvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920853; c=relaxed/simple;
	bh=dy5/55QBdeydztrFJq5mNMnljqTizOtwp3CZd2/hRmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbF42ao3nN7M4pVubirCAz9NFo0FKS2rRLwVKhi95ouNIbaJfQDrPUIyYtr+SXMW4ZcX5zWl9MNZCwQE4q5WQcTxN9NqSOnd0ZxmYyMBrELxI8qjZSYCq4A3cC/THQiuQ7J0RZohUbqB1nzQkvXOpzG15xLu3/kg0Xa0RnOUuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYnOJMGy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E3AC2BCB8;
	Mon,  4 May 2026 18:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777920853;
	bh=dy5/55QBdeydztrFJq5mNMnljqTizOtwp3CZd2/hRmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYnOJMGyLY6GnbhKSxQI3if2bRfT23sQId4QsjcB6hEd2SI5L5ptm6JErN7L1w/I2
	 yR6nwRtw9k+ctpWUK30Oef6NYZjW6LpB5yNX+O8DM2WOFvZTdqaOR9bBPf6z6P/vCU
	 hetQqKXCOUC/jEnGplIrwbcZdIzqk7b+8ALehxzIlm3fSnGWgsKxzl2F4hQWQZBOce
	 O1Lzk78XGDoE7Hy71480HESZlxbdyfE9huHYn8o6zTJc9myX2uznn92yNOQAtC05th
	 FlgpsFVop3KdRkzUELptY5E9fgaBo0Jwk2uqwSQ5jtV2e/ln9eT4G1R+9S0Fk0uURq
	 76Yw2Y0XqXiOQ==
Date: Mon, 4 May 2026 13:54:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Escande <thierry.escande@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Move prints outside spinlock in
 fastrpc_cb_probe
Message-ID: <afjrOx44kOHmmm66@baldur>
References: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
 <20260504171701.18164-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504171701.18164-2-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: EF8534C2CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105791-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 10:47:01PM +0530, Mukesh Ojha wrote:
> dev_err() and dev_info() were called while holding a spinlock with
> IRQs disabled, which is incorrect as printk can be slow and should
> not be called in atomic context.
> 
> Move the dev_err() for the FASTRPC_MAX_SESSIONS check to after the
> spinlock is released, and save the return value of of_property_read_u32()
> to print dev_info() after the lock is dropped. Minor variable style
> correction in probe function.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - New change.
> 
>  drivers/misc/fastrpc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a1a54453bb7e..d169dea961f0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2197,19 +2197,22 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int i, sessions = 0;
>  	unsigned long flags;
> -	int rc;
>  	u32 dma_bits;
> +	u32 sid = 0;
> +	int rc;
>  
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
>  		return -EINVAL;
>  
>  	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> +	if (of_property_read_u32(dev->of_node, "reg", &sid))
> +		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
> -		dev_err(&pdev->dev, "too many sessions\n");
>  		spin_unlock_irqrestore(&cctx->lock, flags);
> +		dev_err(&pdev->dev, "too many sessions\n");
>  		return -ENOSPC;
>  	}
>  	dma_bits = cctx->soc_data->dma_addr_bits_default;
> @@ -2218,13 +2221,11 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->valid = true;
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);
> +	sess->sid = sid;
>  
>  	if (cctx->domain_id == CDSP_DOMAIN_ID)
>  		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>  
> -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> -
>  	if (sessions > 0) {
>  		struct fastrpc_session_ctx *dup_sess;
>  
> -- 
> 2.53.0
> 
> 

