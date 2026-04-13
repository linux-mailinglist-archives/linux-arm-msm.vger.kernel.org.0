Return-Path: <linux-arm-msm+bounces-102973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FvqHFP53GnXYgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6D3ED16C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E992F302663F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6400D3D890B;
	Mon, 13 Apr 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv6Tsm0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A433D7D9E;
	Mon, 13 Apr 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089316; cv=none; b=Xky34MYSN0QQawcCCauVDGl5RRdKZsUn81cpotDJ0zwGVmtj93I+QlMgmZm4linYLw7ugovkZoW232F18DoUfQxHNX5k9bhg/448vXaeuMvxZLkL3qG6PgsPZVlgVMW2CKU5rlNyQfygHVWK4/Y4gJ+SDy0zzqCXjuwXFlxzCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089316; c=relaxed/simple;
	bh=q0MjYcTJVLaR5d0DE/TEg6bKVzBus3R3lsOoTnumFws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7sv0Gj9WgAg9aKGsdbdvRPb0sFtAYBwaswbyYI9Bf00iWyG0LePCrPjY3usjuOrvlm8ftL+CHjh5WZ4JPCWctn24jl0orCYj3J2OK8sEWs9aQ+Sd8AXl2KBJChDWfZbXZCUuZO6O7lCcP74c8afijCLDfGlZTav5LBiOqJsJpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv6Tsm0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DA0C2BCAF;
	Mon, 13 Apr 2026 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776089316;
	bh=q0MjYcTJVLaR5d0DE/TEg6bKVzBus3R3lsOoTnumFws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bv6Tsm0Q8sdM2Yf35WWRRN4HZAl/4MwIeWQQqEF0boZHDFBmNzx/wX6jZwJK/bQBF
	 lroEJJ3I9San0oZZPyiZWxHPBYi9oKH6nUTP7c/Nd1B2Ei13ryqvkHYZ3v96YWrelK
	 9R+6qzso+TLOSLovKP+VCaRrl4smAx4s4S1EbBpKGkgakOMOwFz7sD/d44CsdhiaCl
	 7IlwS8OMsdomnoUcoVfzhXwEEwtqVW19KbI6QL4brAfodWSfvK1YVrnbqjkii2HYoT
	 H1oMxV6Sx5IhPSvy9Rk9drE+tgN/LCt3jwhHIRqvg5qKV+lRaWXSw124Ibhzt2RIIW
	 5z7dL0WYZ5S/Q==
Message-ID: <44d79f33-26ea-4a57-b292-74ef474fe0a9@kernel.org>
Date: Mon, 13 Apr 2026 14:08:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
 konrad.dybcio@oss.qualcomm.com
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
 <20260402054923.3061925-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260402054923.3061925-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102973-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 15D6D3ED16C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 5:49 AM, Ekansh Gupta wrote:
> The fdlist is currently part of the meta buffer which is set during
> fastrpc_get_args(), this fdlist is getting recalculated during
> fastrpc_put_args().
> 
> Move fdlist to the invoke context structure to improve maintainability
> and reduce redundancy. This centralizes its handling and simplifies
> meta buffer preparation and reading logic.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 47356a5d5804..11f4ae749e51 100644
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
> @@ -1016,6 +1017,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1118,18 +1120,11 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_map *mmap = NULL;
> -	struct fastrpc_invoke_buf *list;
> -	struct fastrpc_phy_page *pages;
> -	u64 *fdlist;
> -	int i, inbufs, outbufs, handles;
> +	u64 *fdlist = ctx->fdlist;

fdlist is available after input , output buffers and handles.

why this is now changed to nscalars?

--srini
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


