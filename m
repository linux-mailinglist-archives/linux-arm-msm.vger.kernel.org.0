Return-Path: <linux-arm-msm+bounces-92330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEtqCZkBimluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:47:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0911221E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9173038A73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E639F2F5A1F;
	Mon,  9 Feb 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVf8QK/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B661F419A;
	Mon,  9 Feb 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651673; cv=none; b=gCYv8YAG5RHw7yGkx3MBiYbnwA3YT/CU6y2oE6GFJf3/2OyyXYXGbKx1SjF3/in5vGhxOi6Zg0Lv0FrH+HxsiBN79GztavgRjP7wl+lkS6byV5fLu8jgiERfXCBpTLeD7b//WaIaUlTiNS+uSAghST31a+bsPsRoVwOf7eWSBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651673; c=relaxed/simple;
	bh=yk/j+cv8s6ZqO5RjEEgqIUDbOQdfDKem/x34hIoDoHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqCSF1t2Y41HbeDKK/aOJx0jL0VmEIgnwLnuN2L08aEqNN51o/IRzTEuGYSSlTff1UYIvzGd6YVad1jNDMV8rQT6DpfceE+T9q5VjJYCM2tUeAUWtnUxIEa2RyxCB5T3JD5UYoVA5jPEOs8Hfx8RnBe30pCDMf7U2HG41RrGAE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVf8QK/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5C1C116C6;
	Mon,  9 Feb 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651673;
	bh=yk/j+cv8s6ZqO5RjEEgqIUDbOQdfDKem/x34hIoDoHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVf8QK/NgA2qTbeB7Xilww3bMle7wo/MRaXIQxFJ5PLxqs9qziOw7J77TsquNsqlE
	 vQLBus29zVLaNOACcP7oN/A6vPcl/SsR+H5phVDPd+0FOYEuw0ew08X8LxOD1CFfDq
	 Q4fxasxUu7Op9apMd5AFBQtdxXeq52KIbwd8spiCnhsUvnZamwBSj6/fy1bix9uU20
	 wQWv0tRNesQHHnGZQvDcatV7OAyliJfZiC35fbe6lBfG9fo3b8VdFSLATk9seq30Z3
	 6R5fPP8YMl55vQxipnOULf1MwrCBZjlhy6l/4LPohI1oWNnwR6u94xMADPl5JcQgFv
	 YoEJlR3fTFGdg==
Date: Mon, 9 Feb 2026 09:41:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 09/15] rpmsg: glink: smem: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <ca4qpm5biig27ixkc4zmkg7z7gpcwxiqrmqbqckeytu5viwlga@7woetufvblya>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92330-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 71F0911221E
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 08:01:31PM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().
> 
> This client only ever sent NULL messages, so the transition is
> straightforward. We can remove the call to mbox_client_txdone(). The
> call didn't do anything for NULL messages and it's now officially
> documented not to be called for doorbells.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/rpmsg/qcom_glink_smem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 7a982c60a8dd..f2a6d94e72ea 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -197,8 +197,7 @@ static void glink_smem_tx_kick(struct qcom_glink_pipe *glink_pipe)
>  	struct glink_smem_pipe *pipe = to_smem_pipe(glink_pipe);
>  	struct qcom_glink_smem *smem = pipe->smem;
>  
> -	mbox_send_message(smem->mbox_chan, NULL);
> -	mbox_client_txdone(smem->mbox_chan, 0);
> +	mbox_ring_doorbell(smem->mbox_chan);
>  }
>  
>  static irqreturn_t qcom_glink_smem_intr(int irq, void *data)
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 

