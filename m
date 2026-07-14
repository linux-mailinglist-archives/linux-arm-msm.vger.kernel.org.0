Return-Path: <linux-arm-msm+bounces-118903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VG3/G9aoVWrwrQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:11:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F475092D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:11:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AGufD2QM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E127300788D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B5A38A71B;
	Tue, 14 Jul 2026 03:11:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D209374E48;
	Tue, 14 Jul 2026 03:11:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783998674; cv=none; b=kuunH21v915qcjY2VxUVxYzKV7pLL9Sr9kU5pX9C4arw3gF0gXB2NiJP98bEF/IQg3IZpEQU9yKqd+q6wEIGrp3Orv2lva1uDf+b6XSAq0VZZ/uwCAPYk98HlSbXm8mo2xXBTOnGeic+/LZb/r9Sn6+DgpKiL/McMCdW80pKyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783998674; c=relaxed/simple;
	bh=LjjT35fSVOzy3i17prl0SgCWMsEEM3TXbI6hNpMBiCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feT28XERVazFu1cigHEjrRQAazgsxbj3PCgdQV1d2rTncK8DTglo33ajreb9iGBF4YFEkc44RC2D0Baky+s/vPHj4tnlcdDdF7ENT2xBh2XEi4westKC7jDXZLo/LOBHkwU98Nexcy6jl/vmkMcmqY2kfvbUoB98XvkdtDeyhkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGufD2QM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB4E1F000E9;
	Tue, 14 Jul 2026 03:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783998673;
	bh=WQO27JXCZrAXB48JPGlTU+aqgSxyvxXOkxoRWPDVquw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AGufD2QMN1KY/qkzOtIvKJk80WJP4i/txLpkQ8UIlCc70eb6KBHdvKJu8ff0Qj5hE
	 Xg3cYVZxCP/Hkfvby3BpC6m+3YLL7uL51AV/9Yf8Ex0680BiHmiKtRfwYCNDCI9ilQ
	 kmdUXYgxss5mk/jnHCJIrVP9yevkr53llp5e2FqFOQRdy3wWKA1x8Jw9UhkmCHZ8iM
	 HnNF2jefm1b+f/Qyamm+ssCRgbnIwUVbIZYndDnVGpSc3tcYoe6+3uBHFA0u+8gL3b
	 gyWrLoI65XKs6T+83J3BlITlzWSiry3lpw9UZ8cLp8FdBg43ryLA96m0u/vg/baUMm
	 WUvFl27ie2tOQ==
Date: Mon, 13 Jul 2026 22:11:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chris.lew@oss.qualcomm.com, tony.truong@oss.qualcomm.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO
 index invariants
Message-ID: <alWlzzi7uxbSkw8c@baldur>
References: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
 <20260617-rpmsg-improvements-v2-2-477d4eb569dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-rpmsg-improvements-v2-2-477d4eb569dc@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118903-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A9F475092D

On Wed, Jun 17, 2026 at 07:07:14PM +0800, Chunkai Deng wrote:
> The FIFO read/write helpers assume the head and tail indices stay within
> [0, pipe->native.length) and use them directly as offsets into the
> mapped FIFO region. If that invariant is ever broken, the subsequent
> memcpy or memcpy_fromio would access memory outside the FIFO.
> 
> Add WARN_ON_ONCE checks in these helpers so a broken invariant is
> caught and reported once, and the out-of-bounds access is skipped
> instead of proceeding silently.
> 
> Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index edab912557ac..42ad315d7910 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
>  	tail = le32_to_cpu(*pipe->tail);
>  
>  	if (head < tail)
> -		return pipe->native.length - tail + head;
> +		len = pipe->native.length - tail + head;
>  	else
> -		return head - tail;
> +		len = head - tail;
> +
> +	if (WARN_ON_ONCE(len > pipe->native.length))
> +		len = 0;
> +
> +	return len;

Looks good.

>  }
>  
>  static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
> @@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
>  	if (tail >= pipe->native.length)
>  		tail -= pipe->native.length;
>  
> +	if (WARN_ON_ONCE(tail >= pipe->native.length))
> +		return;
> +

Wouldn't it be preferable to check the original "tail", before the
addition and subtraction?

Perhaps also validate that `offset + count < pipe->native.length`?

>  	len = min_t(size_t, count, pipe->native.length - tail);
>  	if (len)
>  		memcpy_fromio(data, pipe->fifo + tail, len);
> @@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
>  	else
>  		avail = tail - head;
>  
> +	if (WARN_ON_ONCE(avail > pipe->native.length))
> +		avail = 0;

`head - tail < length` does not guarantee that head and tail are valid
offsets within the fifo, so I think you should check both of them
instead of the difference.

> +
>  	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
>  		avail = 0;
>  	else
> @@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
>  {
>  	size_t len;
>  
> +	if (WARN_ON_ONCE(head >= pipe->native.length))
> +		return head;

This makes glink_smem_tx_write_one() do nothing, twice. But then we
return to glink_smem_tx_write() which will adjust and update pipe->head;
possible subtract head into the valid range.

I think it would be better to move this check up to
glink_smem_tx_write().

And also check that `hlen + dlen < pipe->native.length`?

Regards,
Bjorn

> +
>  	len = min_t(size_t, count, pipe->native.length - head);
>  	if (len)
>  		memcpy(pipe->fifo + head, data, len);
> 
> -- 
> 2.34.1
> 

