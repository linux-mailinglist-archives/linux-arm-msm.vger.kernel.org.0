Return-Path: <linux-arm-msm+bounces-105790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOCpHIDr+Gmi3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C304C2CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63136301BA40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 18:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F993E717F;
	Mon,  4 May 2026 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1xw8aKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF533E7140;
	Mon,  4 May 2026 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920822; cv=none; b=U0N1i9Ue84o8Ul7aOKnAMK1aEtLRPBGVouCghAzv3I5FNoJNwmtEnNP5cCazUhUIlSEOPJYZ5M4KXXnvr7+ccmbma/+FS26Rdsel2T1hq30mBswPpcZUwcU6wRZmnV6IhjgVXxPS/LqVmGqZRl2KQZh0e9zxaV6PhW7f0fTpXhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920822; c=relaxed/simple;
	bh=VMUPvLHotG5xVtk6Co7SxW4Y31dip3x6XXbgEu8a9fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYMnYDLkC1WC9HdBU3+JEMllqCg6vKQlDq2jHPgH3uq2XNpgv/dUNcBJlenSMHCsB7PiFxQ9LkEAR+aCLriQJ8hycCFerNJWyQp3w2GZHSsTJMkxw202Sgab220ZHo3wddVthOL+rb/+htZ8f4+9iLZ0/6tuPtRX0gckAx4Mt5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1xw8aKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8A6C2BCB8;
	Mon,  4 May 2026 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777920822;
	bh=VMUPvLHotG5xVtk6Co7SxW4Y31dip3x6XXbgEu8a9fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1xw8aKLrrWn0XepDsWxGwpRejcjOQLPMF8kG2vRgrE5JDrEFkAmpjBCSWTWAb/pa
	 H6qhqvJjV1EDgIsUmjXmi7RlussvSjcJRG1/I+lQaBIGJiSLsN+AVt4xQzYJ0/oKkf
	 Fns3g2gIv7e617+QY643u+fh620nAiEMw/N9v32jgzqJ+k8mQUH5jPRrcZtmkY+oCO
	 yS8kJgmD2RPmsG+jsjFBm9gXuwX8W5i5UN/NlgLQtiWBC7ca5EhM6X1gmOqVljcH+0
	 lKTsXD2Wd5qpQPmlxj/Js+/KSKrpIgu4Vp5ORVMBv8zut2vjWx2CsKQT87bocWruy1
	 QR8AUdAt8y1aw==
Date: Mon, 4 May 2026 13:53:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Escande <thierry.escande@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Fix NULL pointer dereference in
 rpmsg callback
Message-ID: <afjprOhBhP15-2lU@baldur>
References: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: 06C304C2CE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105790-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, May 04, 2026 at 10:47:00PM +0530, Mukesh Ojha wrote:
> A NULL pointer dereference was observed on Hawi at boot when the DSP
> sends a glink message before fastrpc_rpmsg_probe() has completed
> initialization:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
>   pc : _raw_spin_lock_irqsave+0x34/0x8c
>   lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>   ...
>   Call trace:
>    _raw_spin_lock_irqsave+0x34/0x8c (P)
>    fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>    qcom_glink_native_rx+0x538/0x6a4
>    qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> 
> The faulting address 0x178 corresponds to the lock variable inside
> struct fastrpc_channel_ctx, confirming that cctx is NULL when
> fastrpc_rpmsg_callback() attempts to take the spinlock.
> 
> There are two issues here. First, dev_set_drvdata() is called before
> spin_lock_init() and idr_init(), leaving a window where the callback
> can retrieve a valid cctx pointer but operate on an uninitialized
> spinlock. Second, the rpmsg channel becomes live as soon as the driver
> is bound, so fastrpc_rpmsg_callback() can fire before dev_set_drvdata()
> is called at all, resulting in dev_get_drvdata() returning NULL.
> 
> Fix both issues by moving all cctx initialization ahead of
> dev_set_drvdata() so the structure is fully initialized before it
> becomes visible to the callback, and add a NULL check in
> fastrpc_rpmsg_callback() as a guard against any remaining window.
> 
> Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

The fix looks good to me.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>


But I can't help wonder, what's in that message? Should we make sure to
handle it, longer term?

Regards,
Bjorn

> ---
> Changes in v2: https://lore.kernel.org/lkml/20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com/
>  - Added stable mailing list and fixes tag.
> 
>  drivers/misc/fastrpc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..a1a54453bb7e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2431,7 +2431,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	kref_init(&data->refcount);
>  
> -	dev_set_drvdata(&rpdev->dev, data);
>  	rdev->dma_mask = &data->dma_mask;
>  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
>  	INIT_LIST_HEAD(&data->users);
> @@ -2440,6 +2439,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	idr_init(&data->ctx_idr);
>  	data->domain_id = domain_id;
>  	data->rpdev = rpdev;
> +	dev_set_drvdata(&rpdev->dev, data);
>  
>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>  	if (err)
> @@ -2513,6 +2513,9 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> +	if (!cctx)
> +		return -ENODEV;
> +
>  	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -- 
> 2.53.0
> 
> 

