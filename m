Return-Path: <linux-arm-msm+bounces-113062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4pBeAhwxL2rg8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 00:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE8682714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 00:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dCWgXfDa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113062-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113062-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8A4F3006F15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 22:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC0237CD39;
	Sun, 14 Jun 2026 22:54:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB982E0B71;
	Sun, 14 Jun 2026 22:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781477656; cv=none; b=jjHamC6Fw0TMDRWize+znDte52CYG2bT14/AYEWW0C4Sfb2NR7zRDNhnPJlgYt0EjWMiryKg84lCUH2ZTNu2EexmbIEniac4LQmBwNC+sEms4UZoF6uUXinVNPRHnbtRfpvZsvkb5q/RU1DSPNnaATjK4uPPXlXu/qmikm7mdCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781477656; c=relaxed/simple;
	bh=ij3q8fytRmsaKViHW2U7HXCuFqX0qj9vr/VnlS6mKwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMUxFVI2vJFZQjswiteOgPAsPmIE1KbaWdPYLr/r4D6AJKzfhl6x0Rd423u2B5VYno21wOdfX/GpgzWvGfp7z+a3cofo8uzWhvkr/l/FE172XoccmsmvKSPoGGJHL1Q8fkw99DkahAOhbu3Mk8vFuEUU4PQNPMTzwj3EyQgaT5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCWgXfDa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9370A1F000E9;
	Sun, 14 Jun 2026 22:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781477655;
	bh=NT80Su7sC/6qCAEuKL4Mu5N866S2UBvcEvyQ1Wrt7NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dCWgXfDam9R/PqygxgZVkT6PqK1dBTLajc1kClVOfn+0bQSZWqnIxqx6Vsbf1Nki8
	 b7Sk64zMy5grUB8oStt5LYZRNdeQpxB/riMQ/e+u2kjkpPtRyfMLEYGcDEN4Rx0Uhz
	 PSlv4hnsTciMkTGQ2HIUjLa8V2fVMOVCpK9uy7KioJdGjaeqSgJNa6fKYZI/4aC7RY
	 MmcsD27JX8+1c+pkemTppfGS3eKcmxfFRZk7FerZOnqcUlVRXcWbDyrxfG4tfJ+2Rm
	 DxFINUfzYWIsmwo9QXC3EmThoVbq/wf2lyfMF0XkUiN6Bif+ApJnYvR3o5BBakH9lp
	 ber0DPdKQdn3Q==
Date: Sun, 14 Jun 2026 17:54:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
Message-ID: <ai8wxequ5yWxoi5H@baldur>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113062-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DE8682714

On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
> glink_smem_rx_advance() wraps the tail index with a single subtraction,
> which only corrects for one full wrap. The advance count is derived from
> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
> if such a count reaches or exceeds pipe->native.length, the tail remains
> outside [0, length) after the subtraction and the next FIFO access uses
> an out-of-bounds offset.
> 
> Use modulo so the tail is always normalised back into [0, length),
> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
> checks added to the FIFO helpers.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 42ad315d7910..4f143921b719 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>  
>  	tail += count;
>  	if (tail >= pipe->native.length)
> -		tail -= pipe->native.length;
> +		tail %= pipe->native.length;

It seems unlikely that the "tail" will point to the start of a valid
header after this. How can we make sure this is more robust?

Regards,
Bjorn

>  
>  	*pipe->tail = cpu_to_le32(tail);
>  }
> 
> -- 
> 2.34.1
> 

