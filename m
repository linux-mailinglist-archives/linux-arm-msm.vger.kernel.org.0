Return-Path: <linux-arm-msm+bounces-102957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOrUIuPs3GkZYQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:17:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D26243EC769
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0BB2304D41E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889373CAE84;
	Mon, 13 Apr 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT41lC8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657683C141F;
	Mon, 13 Apr 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085786; cv=none; b=D+4kc25gbQyO5vn8PdrKqcH3m50f6cYkk+6wHqEwZpiWxBPZP7zjtotQqs7Yjqm7oaKNgZmfN7wFaLYwKIxDPNYphe24roGxBUXJp8uxg7dVx30hVX3BHpQ8xtCju9toUDaL659nUnSLg6q3o2/uI/JSP8WTPpg3yDpSVcAj4cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085786; c=relaxed/simple;
	bh=QH4op4dHbe6CRQlnjS84cCg4rHaeQIrs68CfPk8Sve0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Db10thAO4o1PKli64ovZf/5o5gdrmSOtkzKY9Zd3d8oEkzyI1256/1EMAS4WUF95gsaq3Biudcbl64X4E8+EMjOnTycoZScer0T5x4DXKmoGSLkhYkwommTbP9URo8ifNpoqeW6DVuKqTB8Zdz236hhdNVdZ7D7uhVEOPtVwTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jT41lC8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C03C2BCAF;
	Mon, 13 Apr 2026 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776085786;
	bh=QH4op4dHbe6CRQlnjS84cCg4rHaeQIrs68CfPk8Sve0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jT41lC8DISD2F4dGfcj6RIGhv7q20V0phG9qjWx36XlwfbVdlOypTzNaIpOQ8Q2ii
	 UtSLRsvtJnn5JVqyZ8HYZS2NVu11vGe8lHEJnqPp/GzxhH/Ux/XlKSJVViP9xlifWc
	 RjGaBUSF/RR8yrW63l0DUgzdPM8MF8vv8wsozHSU25f4xdhWT2eDEuAckKWRMKkU4g
	 bRX2w/1ItePkQrGI8ZU39ySEBmDNvtcRmK28gJNPoS7jOUnIT6SBWuWGtKOrQh7WAC
	 ydicU1JytMrgmTLxCQDMdXz5gfTHK4DS5W6W4vpzEKLri9AW9xE9Q/yG2uGGNiQjea
	 Hzb1wWQyG9MTw==
Message-ID: <c0506a61-c5fb-4962-8bf1-6715178860b2@kernel.org>
Date: Mon, 13 Apr 2026 13:09:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102957-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D26243EC769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/26/26 3:11 PM, Anandu Krishnan E wrote:
> Add reference counting using kref to the fastrpc_user structure to
> prevent use-after-free issues when contexts are freed from workqueue
> after device release.
> 
> The issue occurs when fastrpc_device_release() frees the user structure
> while invoke contexts are still pending in the workqueue. When the
> workqueue later calls fastrpc_context_free(), it attempts to access
> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:

I guess these are some of the pending invoke requests that are still
processing and receive callback after user closes the device.

> 
>   pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
>   lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>   ...
>   fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>   fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
>   process_one_work+0x180/0x450
>   worker_thread+0x26c/0x388
> 
> Implement proper reference counting to fix this:
> - Initialize kref in fastrpc_device_open()
> - Take a reference in fastrpc_context_alloc() for each context
> - Release the reference in fastrpc_context_free() when context is freed
> - Release the initial reference in fastrpc_device_release()
> 
> This ensures the user structure remains valid as long as there are
> contexts holding references to it, preventing the race condition.
> 
> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 47356a5d5804..3ababcf327d7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -310,6 +310,8 @@ struct fastrpc_user {
>  	spinlock_t lock;
>  	/* lock for allocations */
>  	struct mutex mutex;
> +	/* Reference count */
> +	struct kref refcount;
>  };
>  
>  /* Extract SMMU PA from consolidated IOVA */
> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>  	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>  }
>  
> +static void fastrpc_user_free(struct kref *ref)
> +{
> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
> +
> +	fastrpc_channel_ctx_put(fl->cctx);
> +	mutex_destroy(&fl->mutex);
> +	kfree(fl);
> +}
> +
> +static void fastrpc_user_get(struct fastrpc_user *fl)
> +{
> +	kref_get(&fl->refcount);
> +}
> +
> +static void fastrpc_user_put(struct fastrpc_user *fl)
> +{
> +	kref_put(&fl->refcount, fastrpc_user_free);
> +}
> +
>  static void fastrpc_context_free(struct kref *ref)
>  {
>  	struct fastrpc_invoke_ctx *ctx;
>  	struct fastrpc_channel_ctx *cctx;
> +	struct fastrpc_user *fl;
>  	unsigned long flags;
>  	int i;
>  
>  	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>  	cctx = ctx->cctx;
> +	fl = ctx->fl;
>  
>  	for (i = 0; i < ctx->nbufs; i++)
>  		fastrpc_map_put(ctx->maps[i]);
> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>  	kfree(ctx->olaps);
>  	kfree(ctx);
>  
> +	/* Release the reference taken in fastrpc_context_alloc() */
> +	fastrpc_user_put(fl);
>  	fastrpc_channel_ctx_put(cctx);
>  }
>  
> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  
>  	/* Released in fastrpc_context_put() */
>  	fastrpc_channel_ctx_get(cctx);
> +	/* Take a reference to user, released in fastrpc_context_free() */
> +	fastrpc_user_get(user);
>  
>  	ctx->sc = sc;
>  	ctx->retval = -1;
> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	spin_lock(&user->lock);
>  	list_del(&ctx->node);
>  	spin_unlock(&user->lock);
> +	fastrpc_user_put(user);
>  	fastrpc_channel_ctx_put(cctx);
>  	kfree(ctx->maps);
>  	kfree(ctx->olaps);
> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  	}
>  
>  	fastrpc_session_free(cctx, fl->sctx);
> -	fastrpc_channel_ctx_put(cctx);
> -
> -	mutex_destroy(&fl->mutex);
> -	kfree(fl);
>  	file->private_data = NULL;
> +	/* Release the reference taken in fastrpc_device_open */
> +	fastrpc_user_put(fl);

Now that we are trying to handle(wait) for the cases where wq will get
callbacks after the fd is closed, how are we making sure that memory
associated with these invoke, init memory and mmaps are not released?



Also now that we have a refcount for the fastrpc_user, is it possible to
 remove the refcount on the context, as this seems redundant now, we
could just use the user refcount instead. May be other patch..


--srini
>  
>  	return 0;
>  }
> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	list_add_tail(&fl->user, &cctx->users);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> +	kref_init(&fl->refcount);
>  
>  	return 0;
>  }


