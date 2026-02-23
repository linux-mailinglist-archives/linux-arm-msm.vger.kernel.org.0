Return-Path: <linux-arm-msm+bounces-93726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dm/DbV2nGmwHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:48:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12C17903D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ADA93093461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A022FFF8D;
	Mon, 23 Feb 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwc6Itkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47D2FF153;
	Mon, 23 Feb 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861553; cv=none; b=aDv82QGofuvxqzmt+tNuHTDoF79MPsckWyrhOKCPXV1BSIQUce49jPz8ON7XAXReUdZNyFEri2O0C5p1lNs1WwozXMUMWyyF848zfHnFuomFmXTWheWc9V4wqdYu6JhWnMx2+Yl7iUsXn/SgUV0KJh0wOycf24bAtRIgNF4kMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861553; c=relaxed/simple;
	bh=z7EzMc1tNN0Ada6qRRaVzlpT+prXBOM1w0IqO5FQHoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqzVAJ4S/RvqgsEku10lpCLypD3nPRBHnMU4toqCYOmPlkbQPH+ywVx965Uk6rgRD3fS9CNG65751Yn6Vrfi2PQnarh2S60UW/wCjozO2Ebobh6mJwSYyoMXshnt2B36KqopNlkNn4XqWtQFs5MaH8RmxZlKnUmuUlbqGU1BcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwc6Itkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B464C116C6;
	Mon, 23 Feb 2026 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861553;
	bh=z7EzMc1tNN0Ada6qRRaVzlpT+prXBOM1w0IqO5FQHoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwc6ItkcY03ByEer1yWzJnN5qr0caDXIeS3EEnM0526uYdKhaeM6qPn/lyZu7nhVd
	 0L/ABhtePfB60RjBJ6rsoY68QecDpg70rdzXyutqbPJuQHGv3FGgzcVcLiUJI1Huz6
	 VGAhoypXq5UNR4aIYjbVg1gcrVsdxhl0h3A3NXjekJaz7sqegbhL9MikRAZL0hBVGt
	 cwnyRWE6bi2D67zsMDpIBkx94CD6DZtUx+Tsi1NATAdGtJWMMp2hwAlCvlX9an4E1+
	 fTGU/hXXk3kPmGhYo0kkrp/INhRoZulb4YQrG8NRij7M4VVlNh0jPoF/bygzgk2Jio
	 GU0Ct2j4OhgTw==
Date: Mon, 23 Feb 2026 09:45:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] soc: qcom: aoss: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <r65dm5tzz6moibiihvemq4tls4swpbdnvb2vtrflsodger6pz2@ymspk6wtkokh>
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.11.Id882cb3027e9d3a948ae95dfa6d310e3b29faa38@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216100943.v3.11.Id882cb3027e9d3a948ae95dfa6d310e3b29faa38@changeid>
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
	TAGGED_FROM(0.00)[bounces-93726-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 8F12C17903D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:09:48AM -0800, Douglas Anderson wrote:
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
>  drivers/soc/qcom/qcom_aoss.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index a543ab9bee6c..2ecab93239d2 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -97,8 +97,7 @@ struct qmp {
>  
>  static void qmp_kick(struct qmp *qmp)
>  {
> -	mbox_send_message(qmp->mbox_chan, NULL);
> -	mbox_client_txdone(qmp->mbox_chan, 0);
> +	mbox_ring_doorbell(qmp->mbox_chan);
>  }
>  
>  static bool qmp_magic_valid(struct qmp *qmp)
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

