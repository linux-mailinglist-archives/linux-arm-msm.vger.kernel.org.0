Return-Path: <linux-arm-msm+bounces-100098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPNCGb4OxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D24333B83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91F27313CFA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BED3C1978;
	Thu, 26 Mar 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l4hAFNSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D725785D;
	Thu, 26 Mar 2026 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521309; cv=none; b=aP1sy1Yx9AjimNqwQoo36dVCOB0B1e7rxBH/ssuJqNwzquwXxoejCKHv5AujUCD6cNK2Tl2NYsbovxn5Y+vfPFTbFHxILkkq8CynzfBBrws7n/nqpHAlVgVFtpeagaZQfvvu/7mAmiuXVAzxDL7hPK99W7OokUnup2w4ruyFZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521309; c=relaxed/simple;
	bh=48PPiZK0H+dGBKkYs4yREpgo3KxkqWw/SNIYavvOeSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InXl/MQrtDMKomvU5dSjcNwdiFADizyAZeRq3AeQAaGMhErqlle5X+18DnJqzfmM042t7BT9T1VMQbYLuKzmAKZfEKRmXrxWmcRBLyIvJUA9YQG7ioBx/bxkFFsVaX9r9A61cPvBZqqLnlqYr4zmakaHPwRKXvOk7nAmrRlz2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l4hAFNSf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774521306;
	bh=48PPiZK0H+dGBKkYs4yREpgo3KxkqWw/SNIYavvOeSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l4hAFNSfoAhNPDRkMGBRyvaTclouGju3MiUvSzkCIC+RZ6vFqjNwL472zSiOTwiH7
	 5Kue1uAmY1n1wrVhH+fAlZTOtXPBzGaZ/yvsw7WbOIAKH0S9i2g779mIvy7+KHKeK7
	 8fabpINTEVcCghdiS/fYJbuXTbigs4gzHeVfZ7rytXpPhuMOIfYffRufNtu8FHF+sV
	 oXR0dpp/OkAnQ6Wu+NRcoJ/EZHHteHUs/K6EMifMY5HMQchSgHx7u/yRi/75eXPPjA
	 1kHYsX4dMyvK4g1Y5g7xYXKBtPXJlMCoUiPgr8gEXb8IJvvMmN69X57pkHF0Ri/JBa
	 4wyCw4Jb+mfJg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32C5E17E47E6;
	Thu, 26 Mar 2026 11:35:06 +0100 (CET)
Date: Thu, 26 Mar 2026 11:35:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] drm/msm/shrinker: Fix can_block() logic
Message-ID: <20260326113501.0e88741b@fedora>
In-Reply-To: <20260325184106.1259528-1-robin.clark@oss.qualcomm.com>
References: <20260325184106.1259528-1-robin.clark@oss.qualcomm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100098-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: B8D24333B83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 11:41:05 -0700
Rob Clark <robin.clark@oss.qualcomm.com> wrote:

> The intention here was to allow blocking if DIRECT_RECLAIM or if called
> from kswapd and KSWAPD_RECLAIM is set.
> 
> Reported by Claude code review: https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-patch9-20260309151119.290217-10-boris.brezillon@collabora.com/ on a panthor patch which had copied similar logic.
> 
> Reported-by: Boris Brezillon <boris.brezillon@collabora.com>
> Fixes: 7860d720a84c ("drm/msm: Fix build break with recent mm tree")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 1039e3c0a47b..31fa51a44f86 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -26,9 +26,8 @@ static bool can_swap(void)
>  
>  static bool can_block(struct shrink_control *sc)
>  {
> -	if (!(sc->gfp_mask & __GFP_DIRECT_RECLAIM))
> -		return false;
> -	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
> +	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
> +	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
>  }
>  
>  static unsigned long


