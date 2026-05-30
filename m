Return-Path: <linux-arm-msm+bounces-110417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILTPLjRBG2oMAgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 21:57:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23D613231
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 21:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95F3B301325C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 19:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3ACB2147F9;
	Sat, 30 May 2026 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MynyEmGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19202E7398
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171057; cv=none; b=QKa6hQkGtbvPEdJec21poFdftbqzfP5Y6r4/tfa6I2ZcFOtI2f3JP55yGYy7ZTtCx1BkiC/bXABb9y5H3U4LRBiY2P8s9JXdAlXmVA7QldknEc9hCm8Khu7nDQ3A+HEq7sBPIrWkAfH2O+bPthDF3XhDKz+UDw3kd5KzZaq23c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171057; c=relaxed/simple;
	bh=YuwkSd597qr0/5uqI0uCFYpLkdj5G6zRDrISrJkQQyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcmDo+Xepb4eshfgUygT9LnIavYnP9LOyHBkLBcfRXMeXrdWwO13JBu6u2JJTxLrBeEku+pbhcO5pX4yCncqiL9j2VZEn2VueuvEmYDkEulj6BZOdVpYToS2MFNHQx3qjfnhYwtzWR4sPPXoFxV+5ZejEvfMhPcUvuQvdo6ZKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MynyEmGo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C35E1F00893;
	Sat, 30 May 2026 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780171056;
	bh=ar9z3M2C9UqsfJVPjSt2uoyL+YBCX9SHC214e1gLo6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MynyEmGoF6s5cAryqwI3vTY900ev51f89UKotQgK5RzNJ9PIFOMcb4eVAY1rW7Zbf
	 NW+mQ9Maxt52MhbwocOwSFa2Ff9rvI1oaRRg/mGIe16oc9ZUbnGa49GqmeePwGLUj1
	 Tu2zsUFuBoerTk5POfSt1fywMazFYNeiFqezxrWrkTebxCf3Raur800wkzUzuEB/fG
	 53WIlceGenxnXVwCUN9iE3ZRnTVxNs2oqVNTyOPFrBtxUybEtnvC/GnSBk9DGbnGoZ
	 FGEz21ZkVA9B1QqlVaYFrqI7cTwueLRF0zGuay102VIcyWrWHJAae7JtHBHTNojJV6
	 O8eaYkqqFyUcg==
Message-ID: <0cab84c5-aa4f-4926-913d-f71e027cf9db@kernel.org>
Date: Sat, 30 May 2026 20:57:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH misc] misc: fastrpc: fix use-after-free race in
 fastrpc_map_create
To: Zhenghang Xiao <kipreyyy@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
References: <20260526101343.44838-1-kipreyyy@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260526101343.44838-1-kipreyyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110417-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1C23D613231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the patch,

On 5/26/26 11:13 AM, Zhenghang Xiao wrote:
> fastrpc_map_lookup returns a raw pointer after releasing fl->lock. The
> caller fastrpc_map_create then calls fastrpc_map_get (kref_get_unless_zero)
> on this unprotected pointer. A concurrent MEM_UNMAP can free the map
> between the lock release and the kref operation, resulting in a
> use-after-free on the freed slab object.
> 
> Restore the take_ref parameter to fastrpc_map_lookup so the reference
> is acquired atomically under fl->lock before the pointer is exposed to
> the caller.
> 
> Fixes: 10df039834f8 ("misc: fastrpc: Skip reference for DMA handles")
> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>

Patch itself looks sane to me, This needs cc: Stable
> ---
>  drivers/misc/fastrpc.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..123aa6f217ed 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -386,7 +386,7 @@ static int fastrpc_map_get(struct fastrpc_map *map)
>  
>  
>  static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
> -			    struct fastrpc_map **ppmap)
> +			    struct fastrpc_map **ppmap, bool take_ref)
>  {
>  	struct fastrpc_map *map = NULL;
>  	struct dma_buf *buf;
> @@ -401,6 +401,12 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  		if (map->fd != fd || map->buf != buf)
>  			continue;
>  
> +		if (take_ref) {
> +			ret = fastrpc_map_get(map);
> +			if (ret)
> +				break;
> +		}
> +
>  		*ppmap = map;
>  		ret = 0;
>  		break;
> @@ -871,19 +877,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>  {
> -	struct fastrpc_session_ctx *sess = fl->sctx;
> -	int err = 0;
> -
> -	if (!fastrpc_map_lookup(fl, fd, ppmap)) {
> -		if (!fastrpc_map_get(*ppmap))
> -			return 0;
> -		dev_dbg(sess->dev, "%s: Failed to get map fd=%d\n",
> -			__func__, fd);
> -	}
> -
> -	err = fastrpc_map_attach(fl, fd, len, attr, ppmap);
> +	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
> +		return 0;
>  
> -	return err;
> +	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
>  }
>  
>  /*
> @@ -1153,7 +1150,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>  		if (!fdlist[i])
>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> +		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
>  			fastrpc_map_put(mmap);
>  	}
>  


