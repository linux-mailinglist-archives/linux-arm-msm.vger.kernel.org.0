Return-Path: <linux-arm-msm+bounces-100875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECCuOhO5ymkk/gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:55:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24B35F89D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1BB6303A6ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E875F3DDDB7;
	Mon, 30 Mar 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRW69b8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59953DD524;
	Mon, 30 Mar 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893249; cv=none; b=anvTeLEuA6Fg6haseC9W4d8yOMZsCG4nziVVX2Jrsd07lee9eclTG5exXCAtoIjiwyVLUz33OMleu1712t9O0V9957Uj/Beod96fdedp6y+3ZujEt+bqO3rQsvOOSdfN5Xhfeje+pvIahKhpOGiZMPHnJKbQjAvTCCIScG9ZOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893249; c=relaxed/simple;
	bh=H3IgmI8SPQqZwZqBlE4k/HBTvNhjHHrneHdkjCbtS0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSECkWNqSjT8TGNl2eXZgAnwC8xypYlj/6e+c+7f7XsO7mwVDlT+H8yeZbo30yuwL2sqnLhQtGewFlxrh8cMO9hJswxwTM0t6s8i44O+sSW239yhF5mmYMHn+4+ZqCSsS7Nl7A1xtMXH4tM87vzJz2ywcaGD79lzDdYJoOjWbRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRW69b8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EDBC4CEF7;
	Mon, 30 Mar 2026 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774893249;
	bh=H3IgmI8SPQqZwZqBlE4k/HBTvNhjHHrneHdkjCbtS0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRW69b8xDpsonfZwvopUmO/koZ1TBhIo/k+vhWDLJnkT+pl8EOGPuG6FWQ3sy5OgY
	 I+EXY9Z9SH7ZcC2PQf0WphgN1lLs6n7hpiAIMaoYOGd3c5HcKXw5au//oxMQJHT6eR
	 yvM0cRT7/CbHNfL6IbmC7KYHlh755orPxoKSlB/FsdEQUMCu9yMuRA9ohrjA1Vqa+q
	 dGkEkLhldycHrejUbuF+v9uFWUibQKwjXxIISZwD9Gwk2PlynnhqpsnaLMPvG1pzbf
	 rkJL3lwJ6+Z1ZKFbSBcrp8libFkkqkmCz3UWY/LX5kdwn/cy9a5lNfjIy1/LevmEft
	 OCI8l1aIt2xlg==
Date: Mon, 30 Mar 2026 12:54:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce - simplify qce_xts_swapiv()
Message-ID: <acq4s7kcrS6vA2AW@baldur>
References: <20260330173923.479407-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330173923.479407-3-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email]
X-Rspamd-Queue-Id: 3E24B35F89D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:39:25PM +0200, Thorsten Blum wrote:
> Declare 'swap' as zero-initialized and use a single index variable to
> simplify the byte-swapping loop in qce_xts_swapiv(). Add a comment for
> clarity.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/crypto/qce/common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
> index 04253a8d3340..54a78a57f630 100644
> --- a/drivers/crypto/qce/common.c
> +++ b/drivers/crypto/qce/common.c
> @@ -280,17 +280,17 @@ static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
>  #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
>  static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
>  {
> -	u8 swap[QCE_AES_IV_LENGTH];
> -	u32 i, j;
> +	u8 swap[QCE_AES_IV_LENGTH] = {0};
> +	unsigned int i, offset;
>  
>  	if (ivsize > QCE_AES_IV_LENGTH)
>  		return;
>  
> -	memset(swap, 0, QCE_AES_IV_LENGTH);
> +	offset = QCE_AES_IV_LENGTH - ivsize;
>  
> -	for (i = (QCE_AES_IV_LENGTH - ivsize), j = ivsize - 1;
> -	     i < QCE_AES_IV_LENGTH; i++, j--)
> -		swap[i] = src[j];
> +	/* Reverse and right-align IV bytes. */
> +	for (i = 0; i < ivsize; i++)
> +		swap[offset + i] = src[ivsize - 1 - i];
>  
>  	qce_cpu_to_be32p_array(dst, swap, QCE_AES_IV_LENGTH);
>  }
> 

