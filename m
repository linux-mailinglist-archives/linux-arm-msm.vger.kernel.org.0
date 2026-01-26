Return-Path: <linux-arm-msm+bounces-90580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH07NIqId2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:30:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BA8A2C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 409A4302C6FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DBE33CEB7;
	Mon, 26 Jan 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIxvYjEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD933B979;
	Mon, 26 Jan 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441062; cv=none; b=jrISUblbVSDQBRcvwdiQ00GHzs4/pEuk4RRHiZZPzg44i15ASz97nEbgQ7uIRhtKcCpAroyvBBERtQ9wEXzQLNNBPT35ESfk4DA8ebctjY2a6DCbQuOln6mAdHie/TimUz4fKu+shDRLG/T7Qzn2BO5qVdY+biHbN74vJYnk07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441062; c=relaxed/simple;
	bh=si1LFN6ROqn1g02PVvuwyz0atQYO6Ys4XxkHlnrqqPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t81N9Pt8Owm97ZaX3e6vSr5aIYUe6tQIi6Re7OBjT/z8Wb9KU5xJS4w1nD2fQcl/sau60h8j+3ew0gLAd/exAy9jLj3xqpZL+LM9Bq94d9WoLg8ZHlz35nBPyD6tukc18U+O2Z4S4I/0n3v04S/uCm9fyUY/GoKOPM5IW4P47UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIxvYjEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF6DC116C6;
	Mon, 26 Jan 2026 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769441061;
	bh=si1LFN6ROqn1g02PVvuwyz0atQYO6Ys4XxkHlnrqqPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIxvYjECDa2TDFkLGxmDy8w+xKoxWqx9f/rmgKo2ogvWI1uEl6uZUeuKrQE1m42hd
	 07RbG3nFmTN+0jCPM9pjQE1CzOUziCJz6PW6FDuNv60jqtRmFwS970dcweGwhTl975
	 nkGHqh9dm5R+jAv9l/MxTH8V6f7Y82xLBV3Ma3oQ=
Date: Mon, 26 Jan 2026 16:24:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026012641-snazzy-upstate-a815@gregkh>
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90580-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,buaa.edu.cn:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 221BA8A2C4
X-Rspamd-Action: no action

On Sat, Jan 17, 2026 at 10:09:59PM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> ---
> 
> v3:
> - Adjust the email format.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t
> 
> v2:
> - Add Fixes: and Cc: stable@vger.kernel.org.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t
> 
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..fb3b54e05928 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> +	fl->cctx->remote_heap = NULL;
>  err_name:
>  	kfree(name);
>  err:
> -- 
> 2.25.1
> 
> 

How was this found and tested?

And randomly setting a pointer to null doesn't really document what is
happening here, what would you want to see here if you were to look at
this code in 5 years?

thanks,

greg k-h

