Return-Path: <linux-arm-msm+bounces-97284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLpWHW9Hs2luUAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 00:08:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A027B2CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 00:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 188963064B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 23:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508213DC4AB;
	Thu, 12 Mar 2026 23:08:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD02BD5A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773356908; cv=none; b=PZdoNziEYun1+YC8ITEDUHRlo6DLBnChIA+s8t1ykdMUtxbzRReLKFqsn2fNxsLPtDn7ImeTOANQaoEfmRhn9ExC/DWfYltr2no+B+9OMn6N7FbH0aRAhiugwKhufm2z/2m4Ck4Bjff+T12HxrLCu68mQ6mdEs6+qoyab1pdivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773356908; c=relaxed/simple;
	bh=cNtkSwF4xuj8kUsbL9et7goSZBHkj/+juv2mOYwDesA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnDNYoNqo4ozo9MRoO6Lt6jcrHquJ40bC0jrJP6W2Uaw4Tl8OlgS5tlGJkDjrYLOFH7qB2aF2NPp9ah9QXuN9ntP7aO1EC3pmTh09h0WFHwpLaAYh+ItkNLaD9bE/Z8lCrC8FZW/iiD6yw7Td7/NawXNwro3OOALMlFg2fEP1UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A9410208BD;
	Fri, 13 Mar 2026 00:08:16 +0100 (CET)
Date: Fri, 13 Mar 2026 00:08:15 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Pengyu Luo <mitltlatltl@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode
 panels
Message-ID: <abNCphH1cGeora16@SoMainline.org>
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
 <f88c030f-ebdb-49d1-8334-62f1f85154e7@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f88c030f-ebdb-49d1-8334-62f1f85154e7@collabora.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-97284-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[somainline.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marijn.suijten@somainline.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,SoMainline.org:mid]
X-Rspamd-Queue-Id: 123A027B2CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-12 14:18:43, AngeloGioacchino Del Regno wrote:
...
> Marijn et al,
> 
> I don't really know this hardware specifically, but I had a very fast look
> at this patch, and I believe that however you put it, this looks like being
> either plain wrong or very weird.

I would say I also don't know the hardware here very well, and which parameters
apply when and were.  Most importantly, just be aware that the code we're
looking at is for **DSC**, i.e. when we're no longer transfering single pixels
per pclk, but compressed slices of a given number of bytes that can loosely be
converted back to a "number of pixels".

> I think this should be, instead....
> 
> 	/* (don't add this comment) assuming RGB888/666, this will be 24 for both Command 
> and Video modes */
> 	bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);

That would make sense, if it weren't for DSC.  The older downstream kernel I'm
looking at -for at least CMD mode- disregards the format entirely, and just
divides the "width" (computed like msm_dsc_get_bytes_per_line()) by 3 or 6
depending on widebus.

In other words that's clearly demonstrating that input/output "bits per
component" (in uncompressed space) are irrelevant when we're transmitting
compressed pixels.

> 	/* Can send twice the bits per clock if WideBus with Video Mode */
> 	if (wide_bus_enabled && msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> 		bits_per_pclk *= 2;

And this is where the original patch got things wrong too; widebus isn't limited
to VIDEO mode, in fact we were specifically only allowing CMD mode to use it
thus far.  That comment and condition should be inverted.

In this old downstream, widebus also doesn't seem to affect the pclk rate for
VIDEO mode, only the ratio between bits per component and the chroma format
(making up the total size of the pixel) and the configured "bits per pixel"
value are taken into account; that ratio is generally 3.

> ...because, unless there's a hardware quirk (and that should be really clarified
> with a big comment stating that), I don't see why command mode should always be
> 24 bits per clock, and I also don't see why a widebus case would do 48 bits per
> clock even in the RGB666_PACKED and RGB565 cases (which may not even be possible
> but *meh*).
> 
> Just my two cents.
> 
> Reminding you all again that I don't know this HW, so I may have said something
> wrong here.
>
> Cheers!
> Angelo

Kind regards,
Marijn

