Return-Path: <linux-arm-msm+bounces-93727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGwVHO12nGmwHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:49:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A8179084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 877E53072A2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9B32F83A2;
	Mon, 23 Feb 2026 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8esIttU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D5512F585;
	Mon, 23 Feb 2026 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861571; cv=none; b=DqHmoQ8mt14RTAQ/gmkf7vXSde+oYhkgMjps84e/FU4IC67fHSBrEy5NrXHF7/mVRq7WILa88ozsPzvn1bkwKxlwLHZG48avRf8Ixtis4plwTSwkzUJlRdL8FPquqPLPDQPoOuqCvXPcUov/3uRWwl6/XpdnCh3xl4Ka48Tw99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861571; c=relaxed/simple;
	bh=KRtSbUZdMtih2olh9A3n4S6u067+4Pv79Ki9E9J6R6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ4cTmDdUmpgDndM3vI+wSHURF4GNZt4KJYeudqKX3/jb/3bsEKVbibiFYSkhKZdJB0eCy6Cs8j8f5DGtmi5FYCSz45+b9ULD+dc3qbW5YOu+Vmlq3TKYP7dFvua38M8/Z5XHSzwyI61h3bMwyHe4P8R2aXbyvks3/u2FIMFt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8esIttU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3A8C116C6;
	Mon, 23 Feb 2026 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861570;
	bh=KRtSbUZdMtih2olh9A3n4S6u067+4Pv79Ki9E9J6R6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8esIttUgs/QCHeETg17rtYYoTbFVqA032CNesSvSVcwmHcG8d7WUfBEzASqG/NGS
	 TpSY1EaWP0JT2ctONLW8RYajHlEJOJWQsRP7ytR0kFStHCQgPj/K7y5V0cErZbrY4S
	 /BWfuZJWIK1ZcbJzlhScUmdPrPJDECrbgmkfqAXyl2pOs6wNqMaeYpX3PrNfpvLcV2
	 ay2KoeEXfXEw4g5xX9ptih8XrAtPi3V76CZownTWz9h4C9XTkUyHXQNW5tyMRtvNGO
	 qygCztkWAgip6yBG6WO9bzViacuklC0qq4UmtBQm/HtHW8k9UUjphyCSzjWNlmT/Uj
	 6zu8OwZts2z8w==
Date: Mon, 23 Feb 2026 09:46:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/15] soc: qcom: smp2p: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <5urpvf5wihb4eejtwyub3jcclzru2ocgzatliup76ce63rorc7@tb6sbzqb4rv3>
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.12.I4e47dc2356edbaadac7298ddd65dd649d9b5ee16@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216100943.v3.12.I4e47dc2356edbaadac7298ddd65dd649d9b5ee16@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93727-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: C88A8179084
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:09:49AM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().
> 
> This client only ever sent NULL messages, so the transition is
> straightforward. We can remove the call to mbox_client_txdone(). The
> call didn't do anything for NULL messages and it's now officially
> documented not to be called for doorbells.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This driver is used on my sc7180-trogdor Chromebook. While I haven't
> stress tested with it, I can confirm that the system boots normally to
> UI and can suspend/resume with this patch in place.
> 
> (no changes since v1)
> 
>  drivers/soc/qcom/smp2p.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cb515c2340c1..139307b66a47 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -169,12 +169,10 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>  	/* Make sure any updated data is written before the kick */
>  	wmb();
>  
> -	if (smp2p->mbox_chan) {
> -		mbox_send_message(smp2p->mbox_chan, NULL);
> -		mbox_client_txdone(smp2p->mbox_chan, 0);
> -	} else {
> +	if (smp2p->mbox_chan)
> +		mbox_ring_doorbell(smp2p->mbox_chan);
> +	else
>  		regmap_write(smp2p->ipc_regmap, smp2p->ipc_offset, BIT(smp2p->ipc_bit));
> -	}
>  }
>  
>  static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

