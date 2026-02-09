Return-Path: <linux-arm-msm+bounces-92329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AKjEg4AimluFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:41:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9996112026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 16:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CE3E3008332
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 15:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED15737FF50;
	Mon,  9 Feb 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdgXAwti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61237E2F1;
	Mon,  9 Feb 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651659; cv=none; b=hN+le+LCC12rWhwo4BDWYJsyZUKTyxf13z/th97W4JDL22v0uOcPgNzsIGHNh5GwgyuxgrHmSfLWdIpeDtjWt0o6Osh+zdLj+kUDqmGhbhSAcIySfW2ywq15uxqAYSKYm72I38u6iJoTzXdL5jGdJ+jWBwmqdSxLTL+8NB4rNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651659; c=relaxed/simple;
	bh=s85QXji6X3+y0PIbY6WxqlRaax3H6dBL9DFgg0MdgT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5gb5XHhCdD1ISWlzJY7d/9TSKyCqkIoJA77sT3EhdIrZtnuAhwHa7LtJILzMu4oH4asYbJrwvK9vtOmA0k6jdYhBGK0/wXYdfuyqJoW2tDnnWK+eZJqKAO13cgUUEnXGQlCdRr5m1dEr5R1XK8c0N7gXngMBp6lDcK0HSxwXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdgXAwti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AD2C116C6;
	Mon,  9 Feb 2026 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651659;
	bh=s85QXji6X3+y0PIbY6WxqlRaax3H6dBL9DFgg0MdgT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdgXAwtiWKiNsQ1kEGi2o3twt8hDc9ZvHb4d7cnEiCP7YLvGRU8uRd4o8LkjionJF
	 gAJsxC/uLSTfl8wuNh8pV9FykxAKj1XmnTAKK6pTxw3BVplhlZC6Em4XTMoqD7fbmY
	 A2qUhRsRKagogDJYnzWImdqD8UNAhSI/MvrrwWgSsaSbJ+LZNpb8AkBU2jQDENHJtp
	 5CYxOalD17rzHvJXz7no7Zurw/Um+bxU9RpCgMKTYLWRKdPyvl3wF7Uie4v8dlO2eg
	 8XtAxnaeVtsYBxblOqgK4hevzUBWXgri5tWL6TgVYO1/x8Jov7kAXuNsqe3+7Kt/Mb
	 +H1QurKBqhWlA==
Date: Mon, 9 Feb 2026 09:40:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 08/15] rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <vl25packrz4awbrfr4cg3jjyuv4io64fz2gv4rpzo32jfvuqjj@iayxnuqngfsu>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92329-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: D9996112026
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 08:01:30PM -0800, Douglas Anderson wrote:
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
>  drivers/rpmsg/qcom_glink_rpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
> index e3ba2c63a5fc..4cb9c36adcd4 100644
> --- a/drivers/rpmsg/qcom_glink_rpm.c
> +++ b/drivers/rpmsg/qcom_glink_rpm.c
> @@ -197,8 +197,7 @@ static void glink_rpm_tx_kick(struct qcom_glink_pipe *glink_pipe)
>  	struct glink_rpm_pipe *pipe = to_rpm_pipe(glink_pipe);
>  	struct glink_rpm *rpm = container_of(pipe, struct glink_rpm, tx_pipe);
>  
> -	mbox_send_message(rpm->mbox_chan, NULL);
> -	mbox_client_txdone(rpm->mbox_chan, 0);
> +	mbox_ring_doorbell(rpm->mbox_chan);
>  }
>  
>  static irqreturn_t qcom_glink_rpm_intr(int irq, void *data)
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 

