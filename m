Return-Path: <linux-arm-msm+bounces-92331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDbbDFMAimluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:42:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB21911206F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 886E13009091
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310D37FF4E;
	Mon,  9 Feb 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3jdcVHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD70186A;
	Mon,  9 Feb 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651722; cv=none; b=OdZNUtVnilDw4wWF8V6GzcvJRmQYhRix1Cca3mULYoMDnYG8DeuK+aUTwxA+MteO+8vtHKaOV4+2t27PK0ChtQxdcj7+9YseDx6lT6GMDHcIUcRoH3cCVd8iCuFGRecREjVahsS+ONHAmsMqU7x+7iVoUFEzGNdXHBarrzYLzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651722; c=relaxed/simple;
	bh=M8S6CadrxGyGiJkPMj19ILFdik8V0Bt9lXxxcEb1BFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqOz5w5GQve+CZfuYbAxZzk0rs4SwD+ug8vtqpF+ZUFHAY6XFeyOVA2s78dMFsnpdmLjotd3CEHvcaxeNaMRNjVWimnZIT0CU+UEkIMe+rqH2zYm+xICo8JIFGlgyGDBQzyfDII9GVaVaauSe2NFfTA0Pi6bPaXxDE/ZRVJrilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3jdcVHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266C5C116C6;
	Mon,  9 Feb 2026 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651721;
	bh=M8S6CadrxGyGiJkPMj19ILFdik8V0Bt9lXxxcEb1BFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3jdcVHrDTv2BHglTl1hh94wVb2LP6rrsW7ZfcAe/8zJEK0bBp/TUyyuihU/ODK+Q
	 kikT4YwPf9PikgDIbEHYVqb/A0xPo+a3RPmCVbZMh2q3RUMEOzqOekSWt+kQW5bZ8T
	 TUZmjuTv5X5PMNO75U8QIKZbEuoaZw+aDNoK1bJ4WiojAe6Ex9qucf4exkPFbAOD95
	 AAQne9w2K5mNkA/1/nkD8TV05/Cd0q/IFCvQQwZb3+k06Tvr8plYLvhH1PTGkpgJgR
	 rmY8vscHEzIxqe1i6aBLGEE2oJkt50UvrGClRpG989O/aSb2cSQg7rqUyehtIOgMOc
	 YefCtN5YGx0sQ==
Date: Mon, 9 Feb 2026 09:41:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 10/15] rpmsg: qcom_smd: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <fyskrfbfhxzmih3w5wazpl3jjriv3ubdaxywaxr3eluvx5bzxv@2k3klb66p33i>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92331-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: CB21911206F
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 08:01:32PM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().
> 
> This client only ever sent NULL messages, so the transition is
> straightforward. We can remove the call to mbox_client_txdone(). The
> call didn't do anything for NULL messages and it's now officially
> documented not to be called for doorbells.
> 
> Also remove the comment about the only cause of errors for
> mbox_send_message() being if the framework's FIFO was full since we
> don't queue doorbells.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/rpmsg/qcom_smd.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 42594f5ee438..afe1177d092e 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -371,17 +371,10 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
>  {
>  	struct qcom_smd_edge *edge = channel->edge;
>  
> -	if (edge->mbox_chan) {
> -		/*
> -		 * We can ignore a failing mbox_send_message() as the only
> -		 * possible cause is that the FIFO in the framework is full of
> -		 * other writes to the same bit.
> -		 */
> -		mbox_send_message(edge->mbox_chan, NULL);
> -		mbox_client_txdone(edge->mbox_chan, 0);
> -	} else {
> +	if (edge->mbox_chan)
> +		mbox_ring_doorbell(edge->mbox_chan);
> +	else
>  		regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
> -	}
>  }
>  
>  /*
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 

