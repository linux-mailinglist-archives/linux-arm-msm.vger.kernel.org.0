Return-Path: <linux-arm-msm+bounces-93728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN6JNg13nGlfIAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:49:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 478CD1790A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17F13046065
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B6B2FF153;
	Mon, 23 Feb 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgoYgS1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DE2F83A2;
	Mon, 23 Feb 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861585; cv=none; b=XJp16TBkyjT+FsYFapret3tgeVobrkREnyeAd/kmOb1yInOuC7DaYB5/Splr59T460AgdOd8TnjheO2+bJuUHq2Cl2M5VYZFVVnUYlrd1+7ihsymVr+STRFrVSX/h/6lFogy69iBsS1rrBXFs/H4TCmV6zTj1bnKCPyLzNSOGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861585; c=relaxed/simple;
	bh=J53PFl/U9SA+MmtAxPqFCl2GNL3yhCHMNyNbwtCHJeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYt/RrnkK+BH/7df1vF2DCLlK5dVialP3dmEOGpWxJkXe2y90oh7z3tzBBta5nC5/aCaKngfjljm8f8D1xdpL5IhKh7eMcYEVn0Eb8S9HqF3yhwI3MMJj5rgQ0tvrPVE4PQgMpOZmsDUXrhW6eRPFR/5xH45FpxH/805UzIwF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgoYgS1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB51C116C6;
	Mon, 23 Feb 2026 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861585;
	bh=J53PFl/U9SA+MmtAxPqFCl2GNL3yhCHMNyNbwtCHJeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgoYgS1q3ojvTAtp91VDNHFtqC/a3JZVBieL4+eFaTZaQ+k6dGQIeASDfx9Es6P3r
	 qmAzBwyDXpucnyb32ybUo8IIybmwlwwHeecNhgb/Uz3rs2z0xpfNVBS0gylFj87X++
	 m9cadazicTxuLfP9/rwPQoYTrI2DatBIAysaGRO5bV7LvUrtRXLvi5lEUD5mPjpym8
	 +Txj4xu8Y2GLZ6hpcnQFYL+7cV1ra/ScsV3TgeZffx9eIm2EYCSb+J4R1F3cb09INF
	 e66sGBRsI+qac4YIfhPYAyS4dcH6EjwztdYhjQ0YuWDSCA3YzdwNV1d2+F/EBm2S2G
	 lGDoqBadADSiw==
Date: Mon, 23 Feb 2026 09:46:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] soc: qcom: smsm: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <odccfm56qymfz7hs6bi7vobqnlempz7y6se2a47r73wcohbvva@bshf6mv5aky7>
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.13.I18ba5837ac5c89cdd3531b6b09a2ab24a95912fa@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216100943.v3.13.I18ba5837ac5c89cdd3531b6b09a2ab24a95912fa@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93728-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 478CD1790A2
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:09:50AM -0800, Douglas Anderson wrote:
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
> 
> (no changes since v1)
> 
>  drivers/soc/qcom/smsm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
> index 021e9d1f61dc..1e127678fd9c 100644
> --- a/drivers/soc/qcom/smsm.c
> +++ b/drivers/soc/qcom/smsm.c
> @@ -182,14 +182,12 @@ static int smsm_update_bits(void *data, u32 mask, u32 value)
>  		if (!(val & changes))
>  			continue;
>  
> -		if (hostp->mbox_chan) {
> -			mbox_send_message(hostp->mbox_chan, NULL);
> -			mbox_client_txdone(hostp->mbox_chan, 0);
> -		} else if (hostp->ipc_regmap) {
> +		if (hostp->mbox_chan)
> +			mbox_ring_doorbell(hostp->mbox_chan);
> +		else if (hostp->ipc_regmap)
>  			regmap_write(hostp->ipc_regmap,
>  				     hostp->ipc_offset,
>  				     BIT(hostp->ipc_bit));
> -		}
>  	}
>  
>  done:
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

