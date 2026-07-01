Return-Path: <linux-arm-msm+bounces-115782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xQLbM2B1RWp0AgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A86F15BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CbVYFDl4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A97BB304BBC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3153D395AE2;
	Wed,  1 Jul 2026 20:05:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EDD374A03;
	Wed,  1 Jul 2026 20:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936342; cv=none; b=VTxCIabHxS1ZcvULGbFMaUBdiyz6U/17ma8/9WrSN6EyPNPkNRQH2yV05HTkGlN5zfdy2ImV2fxtVBpW6J+GBt+UdMBN9jL8ibYu7xnI+GXiaOm0ZQt9zTgvNOTjaoKJv0gpFRQB7WMR21dYuSUYagly6WaBVuODRm81wpfmhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936342; c=relaxed/simple;
	bh=ulxgbENz4oihKoctbm58668XFEp1rf1BSQNovLiRYoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBlx8VHjzFXZaFWhx5rnAQTGx9K9sUSH4uPs6y1SgoIglXQdMyKwxZRWegX5aDHJrZKMZoarCfZ10naE8OQvvwpVKssk0U6XGekkH58qpjdCBnBhA2KuefDqP7uP+7/pQ814SOxRFFOOHD7RQxbjW97y/vkvGuOX2Fh8ZPG/bJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbVYFDl4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E33A1F000E9;
	Wed,  1 Jul 2026 20:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936340;
	bh=g7/A390eY5J9OJzf+cYzH6TGGqISp3TPh1uGKzUtdKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CbVYFDl4Shd272uwnCiHpQE1ttFBPprzn5qjetkapaoNjn5iNWiFmCLK1GtLc9av2
	 vIK63933K01L7Bza6tkk4xdRXCuhFrvKe1cOXCWgKO2ZR2Droc4143XPqph1crI5+v
	 soVnzcks2sZOCwZwBZ1y6LmdB0DNCI4VzPfOf2YBaFm6tb8fZho/2ujsIv4gWGkgLw
	 jlet6LVoU/9Amn0GXS+BRTm2IOSwN2bOAqq8NBlOLn0riWiyOAkzljqSbEH1qgxeXB
	 UmlfKSgrW0nFTAEZ3bGaaeDXlxrBkC3ygQpSuOJZgiC8/PDJ0JcghWFKp+tKYh6ko/
	 EWHV451NN+b/A==
Message-ID: <bb91ed5e-0fe9-4317-b73d-b28b593d4c25@kernel.org>
Date: Wed, 1 Jul 2026 21:05:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: reject overflowing invoke buffer ranges
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
References: <20260624174410.6074-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260624174410.6074-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,qti.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115782-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 445A86F15BB



On 6/24/26 6:44 PM, Yousef Alhouseen wrote:
> fastrpc_get_buff_overlaps() builds end addresses from user ranges.
> 
> A wrapped end can understate the payload size.
> 
> It can also feed bad ranges into the invoke metadata.
> 
> Reject invoke buffers whose pointer plus length overflows.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
You have sent 11 patches independently, I would prefer it to be sent as
single series.

Are these patches fixing anything that your usecases are hitting?

Have you looked at the patches in the mailing list which fixes some of
these issues?

Or

Is AI generating these patches ?


--srini


> ---
>  drivers/misc/fastrpc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f3a493845..ba4ade874 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of.h>
> +#include <linux/overflow.h>
>  #include <linux/platform_device.h>
>  #include <linux/sort.h>
>  #include <linux/of_platform.h>
> @@ -607,14 +608,17 @@ static int olaps_cmp(const void *a, const void *b)
>  	return st == 0 ? ed : st;
>  }
>  
> -static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> +static int fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  {
>  	u64 max_end = 0;
>  	int i;
>  
>  	for (i = 0; i < ctx->nbufs; ++i) {
>  		ctx->olaps[i].start = ctx->args[i].ptr;
> -		ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
> +		if (check_add_overflow(ctx->olaps[i].start,
> +				       ctx->args[i].length,
> +				       &ctx->olaps[i].end))
> +			return -EOVERFLOW;
>  		ctx->olaps[i].raix = i;
>  	}
>  
> @@ -641,6 +645,8 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  			max_end = ctx->olaps[i].end;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> @@ -675,7 +681,13 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			return ERR_PTR(-ENOMEM);
>  		}
>  		ctx->args = args;
> -		fastrpc_get_buff_overlaps(ctx);
> +		ret = fastrpc_get_buff_overlaps(ctx);
> +		if (ret) {
> +			kfree(ctx->olaps);
> +			kfree(ctx->maps);
> +			kfree(ctx);
> +			return ERR_PTR(ret);
> +		}
>  	}
>  
>  	/* Released in fastrpc_context_put() */


