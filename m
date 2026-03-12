Return-Path: <linux-arm-msm+bounces-97218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ONOKWC9smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:19:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A12726BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E609630082A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E4E3C73C0;
	Thu, 12 Mar 2026 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bvdCyCj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B8382F05;
	Thu, 12 Mar 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321532; cv=none; b=B6rH4u1y+wxYbJRW6dZOLWB1osWd/SSnw4xbi4Tw5mKh1cA+VqASmonNEnCYiWV7qvxPt2kbDtudpK/NCkGRAsa5o+sIvuHQRLNaCV89RJnidEzZKAOH/36Tuc0e4TzcmY8YabH1O2E4h3V2A7Jnjdh/oUmlYl1Eaado6/sCPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321532; c=relaxed/simple;
	bh=GE9L1zaNRQfi+E3nkLw0E2ueYNvEqDq6XZiDAGuAmpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bajrxzKgyv8hWi+uq366F5y4d60OZMrrUDbHN5BvqdLYAcHrHAl5XYt7uJsziTTTC14Nvqv5lLyCBpcym7L6j7rz2rIqDOxkrLuxYoucs+kKvx0Z21OphN5Xx6v4F8kyRpEEBdyitjiBdYqyTGXZdA2oCNfXoiwaxaEhdeX7i6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bvdCyCj6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773321525;
	bh=GE9L1zaNRQfi+E3nkLw0E2ueYNvEqDq6XZiDAGuAmpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvdCyCj6KKkeGK8qpgUgRZ3jMv2Lb5CfRP/77c2hJnBkAX/MyJm0HpDVj8ze26Bd3
	 K02ejEaWiSeMhOZk3qTH1R/xN8kswoxY9YdH/T47ynv09VLpB5Pcz6p+mDJiOnsD/v
	 dV1lQoomGAtsel3AqP4vOsqzHBwNQUGhaepqTIzZ2hQyrw2ygAGwcFl9ir4PDCWwU6
	 B827F91px2hffOOQwIyZs+koxV7AIDhNDjDsrYnnBpm5bzhNrEKFN0hpe7iNo4cqeF
	 Qq/AXJZLetreeM0majZRztu4yD7/v6MLSE0431t30j+Fn2ulKWUyJOsMKEzhZuXDaq
	 5Rp87mOUGNx7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BE7517E026C;
	Thu, 12 Mar 2026 14:18:44 +0100 (CET)
Message-ID: <f88c030f-ebdb-49d1-8334-62f1f85154e7@collabora.com>
Date: Thu, 12 Mar 2026 14:18:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode
 panels
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[somainline.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97218-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,somainline.org:email]
X-Rspamd-Queue-Id: 266A12726BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 11/03/26 23:31, Marijn Suijten ha scritto:
> Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> programming dsi registers") makes a false and ungrounded statement that
> "Since CMD mode does not use this, we can remove !(msm_host->mode_flags
> & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> dsi_timing_setup() affects both command mode and video mode panels, and
> by no longer having any path that sets bits_per_pclk = 48 (contrary to
> the updated code-comment) all DSI DSC panels on SM8350 and above (i.e.
> with widebus support) regress thanks to this patch.
> 
> The entire reason that video mode was originally omitted from this code
> path is because it was never tested before; any change that enables
> widebus for video mode panels should not regress the command mode path.
> 
> Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
> on command mode DSI panels with widebus, restoring the panel on devices
> like the Sony Xperia 1 III and upwards.
> 
> Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> In addition I can't say I understand the original commit message
> at all; it mentions a BPC=10 mode however the highest format that
> mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> ever return anything above 24, which is the original amount the
> non-command-mode path defaulted to (regardless of widebus)...  Was that
> patch doing anything for video mode at all?
> 
> It feels like the conditional introduced here is only making things more
> confusing, but I don't have enough input to confirm what the video-mode
> path should be doing in widebus mode (multiply BPC by the number of
> components and by 2 in case of widebus?).
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e8e83ee61eb0..168e37e38fc7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1029,10 +1029,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		 * unused anyway.
>   		 */
>   		h_total -= hdisplay;
> -		if (wide_bus_enabled)
> -			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
> -		else
> +		if (wide_bus_enabled) {
> +			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +				bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
> +			else
> +				bits_per_pclk = 48;
> +		} else {
>   			bits_per_pclk = 24;
> +		}

Marijn et al,

I don't really know this hardware specifically, but I had a very fast look
at this patch, and I believe that however you put it, this looks like being
either plain wrong or very weird.

I think this should be, instead....

	/* (don't add this comment) assuming RGB888/666, this will be 24 for both Command 
and Video modes */
	bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);

	/* Can send twice the bits per clock if WideBus with Video Mode */
	if (wide_bus_enabled && msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
		bits_per_pclk *= 2;

...because, unless there's a hardware quirk (and that should be really clarified
with a big comment stating that), I don't see why command mode should always be
24 bits per clock, and I also don't see why a widebus case would do 48 bits per
clock even in the RGB666_PACKED and RGB565 cases (which may not even be possible
but *meh*).

Just my two cents.

Reminding you all again that I don't know this HW, so I may have said something
wrong here.

Cheers!
Angelo

>   
>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
>   
> 
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260311-dsi-dsc-regresses-again-4be27dfc4001
> 
> Best regards,


