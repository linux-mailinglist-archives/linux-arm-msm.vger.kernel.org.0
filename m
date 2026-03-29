Return-Path: <linux-arm-msm+bounces-100638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P6iaOoxyyWmcyAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:42:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CF353A18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FE3301348A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6470337D10D;
	Sun, 29 Mar 2026 18:42:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F93372684
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809738; cv=none; b=HXfUyxpR9mhLltI23QqV+d5EglRD6l+RG7LAI7lRSTICKSTYmTD69saVFzPzViPBkvrrwa/tCyhKIWcKf6BF/d5H9ePor+knAs3fn3hf1k0XJV0P3qDir8ix0IJviEpBae8xUkqwSh6fP08mdZOVbCevdt/NePy89BhdwhBfA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809738; c=relaxed/simple;
	bh=D4pbv9Nl3bhKqdID2nmTehSOb5LNRurbrkbgm4lLBJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hz9qb+lie+lzAsI1McGD9JJtFo/15J7r5bUKTnuGKJ+bzG1nmgAeaqlo79u/uOymT9OisLS+OLzvX9citjNuteN25gltW8Esp2b360hTwc0IGC71BUftyB16HD37OpiK8EjayODtHraYU8kFO1GO6RGb0HzPKUfsXEhkoFmulVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C5E213F727;
	Sun, 29 Mar 2026 20:04:30 +0200 (CEST)
Date: Sun, 29 Mar 2026 20:04:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode
 panel
Message-ID: <acloO6wNq4ObclGZ@SoMainline.org>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
 <20260307111250.105772-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307111250.105772-2-mitltlatltl@gmail.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-100638-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[somainline.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marijn.suijten@somainline.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,SoMainline.org:mid]
X-Rspamd-Queue-Id: 453CF353A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-07 19:12:49, Pengyu Luo wrote:
> ac47870fd795 incorrecly broke hdisplay calculation for CMD mode, fix
> it.

Where's the what/how/why?  This commit message explains exactly nothing while a
description is a requirement for submitting patches upstream:

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Take my version of this patch as an example.

> 
> Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7c16216e8b..f63165c7ce 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1016,8 +1016,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		/*
>  		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
>  		 * enabled, MDP always sends out 48-bit compressed data per
> -		 * pclk and on average, DSI consumes an amount of compressed
> -		 * data equivalent to the uncompressed pixel depth per pclk.
> +		 * pclk and on average, for video mode, DSI consumes only an
> +		 * amount of compressed data equivalent to the uncompressed
> +		 * pixel depth per pclk.

This needs a source and justification (in the commit message).  For most
panels where bpc is simply 8, the resulting rate is the same as when widebus is
disabled, meaning that widebus has no effect on the pclk rate in video-mode?

- Marijn

>  		 *
>  		 * Calculate the number of pclks needed to transmit one line of
>  		 * the compressed data.
> @@ -1029,10 +1030,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		 * unused anyway.
>  		 */
>  		h_total -= hdisplay;
> -		if (wide_bus_enabled)
> -			bits_per_pclk = dsc->bits_per_component * 3;
> -		else
> +		if (wide_bus_enabled) {
> +			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +				bits_per_pclk = dsc->bits_per_component * 3;
> +			else
> +				bits_per_pclk = 48;
> +		} else {
>  			bits_per_pclk = 24;
> +		}
>  
>  		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
>  
> -- 
> 2.53.0
> 

