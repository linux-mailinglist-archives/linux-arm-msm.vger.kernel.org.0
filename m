Return-Path: <linux-arm-msm+bounces-92886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gvLbJlyVkmnguwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 04:56:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA64140CAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 04:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26A12300CE67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 03:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D99522576E;
	Mon, 16 Feb 2026 03:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbbf+85o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285021E1DE9;
	Mon, 16 Feb 2026 03:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771214168; cv=none; b=D0Ey8b0gFaYsI7ujgxU6IaIf7cgtiFftOeQkTcgCPlTRwyc1x9fdNQZR6aV0HUedyXZqAsXNA4tztQfaEjtdSw4Hk8ilSsj+4FrT649oky5ymadrT40h6Sj5sAtUQTPKExlsbks3HWx48yD7AClgIGthJJDDHmpAzSlGc/Gz4Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771214168; c=relaxed/simple;
	bh=vBwVPkXHaAloXeyRNqYtL278gpP2AT8kuV0aHkehyJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlW/kuZBNwSj+yLYDES/BBQ2oiHQ3jh461UB+49T3TZgv5Xbg/jBrRn6GuCGgobUpMEetzn8LClz19dKxObQDBVRD5Qo/BFUWVYMRqMYMq4Kni/wnqLzPNKpyt+0S4M18bPT3QH4rIHNLlmW5+GpHBc040JzfyPDfxswDDYLlrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbbf+85o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDED3C116C6;
	Mon, 16 Feb 2026 03:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771214167;
	bh=vBwVPkXHaAloXeyRNqYtL278gpP2AT8kuV0aHkehyJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pbbf+85o/bDwYQbt/j0GlE/sgl4LWPxO0soJKbz29+vgbCJGiDR3ZVZ88XxF0j17Q
	 1ZpNfUURpcI8yEef37fKarBJYCZmoCxmCXiEiF0f6+1+gus55Uqp7H6Y8AI81RxcQ+
	 9XdsAUgZhVPH43WnWNqfOxDh/mdAuyI9XFm8jkUYxbU6/ObmPGsh5rHvC5KaLqFUvz
	 Ug+zwI1e8ixk2+0hrFnxOzw0NHZCDrlXwzlVUzwQFpK7hv2lzuu5pXp3AK2TUgvkyY
	 /c4U6kaL+NpnC2anJNGOTr+ersBZG4sse3pgAHHEmRWELO/jsoERjDVn5ZleCROSDu
	 HcAM4KBdi3g8A==
Date: Sun, 15 Feb 2026 21:56:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: DEA64140CAE
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:51:32PM +0530, Ekansh Gupta wrote:
> The fdlist is currently part of the meta buffer,

Do you mean "already part of"?

> computed during
> put_args.

The only "computation" I can see wrt fdlist in fastrpc_put_args() is
where we calculate it to be at pages + inbufs + outbufs + handles.

So, why do you say that the content of the meta buffer is calculated
there? Did you mean fastrpc_get_args()?

PS. Use full function names and suffix them with (), to be clear in your
description.

> This leads to code duplication when preparing and reading
> critical meta buffer contents used by the FastRPC driver.

"used by the whole entire FastRPC driver" is rather broad... 

As far as I can tell, the thing this patch is doing is caching the
"fdlist" address, to avoid having to derive "pages" (and thereby
indirectly "list"), "outbufs", "handles", and then sum these up.

> 
> Move fdlist to the invoke context structure to improve maintainability
> and reduce redundancy. This centralizes its handling and simplifies
> meta buffer preparation and reading logic.

I think the patch looks good, but your commit message is too high-level
sales pitch.

Describe the specific problem that you're solving (i.e. you're
recalculating the offset which was known at the time of
fastrpc_get_args()) and leave it at that.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4f5a79c50f58..ce397c687161 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>  	int pid;
>  	int client_id;
>  	u32 sc;
> +	u64 *fdlist;
>  	u32 *crc;
>  	u64 ctxid;
>  	u64 msg_sz;
> @@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_map *mmap = NULL;
> -	struct fastrpc_invoke_buf *list;
> -	struct fastrpc_phy_page *pages;
> -	u64 *fdlist;
> -	int i, inbufs, outbufs, handles;
> +	int i, inbufs;
>  	int ret = 0;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>  
>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>  		if (!ctx->maps[i]) {
> @@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  cleanup_fdlist:
>  	/* Clean up fdlist which is updated by DSP */
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
> -		if (!fdlist[i])
> +		if (!ctx->fdlist[i])

It wouldn't hurt to keep the local fdlist variable, keeps the code less
noisy - and you don't need to change these two places.

>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))

Why are the fds stored as u64 in the metadata? Are the actual fd numbers
somehow consumed by the DSP side?

Regards,
Bjorn

>  			fastrpc_map_put(mmap);
>  	}
>  
> -- 
> 2.34.1
> 
> 

