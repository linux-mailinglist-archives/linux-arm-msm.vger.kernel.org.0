Return-Path: <linux-arm-msm+bounces-47732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E215A3234A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180C81882B99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5392066C5;
	Wed, 12 Feb 2025 10:13:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E99207DFA;
	Wed, 12 Feb 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355212; cv=none; b=Uq+YKKfkOmbFMeitU+Fk2LzPpfPuNtZkIrRvZ3jzQ9aXGOQ7dVoZhadyYS2HDNVL5+qYme5D9/TozaAD/lo2i0QgQm9LFAM0hMLFlHeK+7kJIuBjm3TYmhBkMdMq170kTodfZoCT/AqYETKpDzXo/RQugYjdsjPtGNfFTQOUbZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355212; c=relaxed/simple;
	bh=u0POKleZOe4dMxdL8h1RlApxW8zC4QsHKpSBuUZJbNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+49wWpvRU/Y9oNW4uxdL53YfRnZ1Vwd5bpioYUDDbiGDb+LSavy33Pblvmb/ooabe36s2Z0Wuw9/6Whpjtdxnq7dA3s7aEwVm06t4g0JphJay3M0AcLSCI3ZkNAFl2/35f1K0Mw6rbqNTCylvs9HH4dvWZnc9WnCaF3M5SWJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EF85A3F618;
	Wed, 12 Feb 2025 11:13:25 +0100 (CET)
Date: Wed, 12 Feb 2025 11:13:24 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, 
	sean@poorly.run, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <v4lpt45c7miwt45ld4sfinixnpje6tb73dhqmahl6kin4i7wyj@6ss563kvk63v>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
 <20250212034225.2565069-3-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212034225.2565069-3-james.a.macinnes@gmail.com>

On 2025-02-11 19:42:25, James A. MacInnes wrote:
> Type-C DisplayPort inop due to incorrect settings.
> 
> SDM845 (DPU 4.0) lacks wide_bus support; porch shift removed.

Same comment on "inop", elaborating the meaning of "incorrect settings" and
describing relevance to DPU 4.0 from patch 1/2.

> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

This commit came long before wide bus support, are you sure this is the right
Fixes tag?

> 

Drop empty line between tags.

> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb..3e0fef0955ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -94,17 +94,17 @@ static void drm_mode_to_intf_timing_params(
>  		timing->vsync_polarity = 0;
>  	}
>  
> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> +
>  	/* for DP/EDP, Shift timings to align it to bottom right */
> -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> +	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {

This code existed long before widebus: are you sure this is correct?

Note that an identical `if` condtion exists right below, under the "for DP,
divide the horizonal parameters by 2 when widebus is enabled" comment.  If
this "Shift timings to align it to bottom right" should really only happen when
widebus is enabled, move the code into that instead.

- Marijn

>  		timing->h_back_porch += timing->h_front_porch;
>  		timing->h_front_porch = 0;
>  		timing->v_back_porch += timing->v_front_porch;
>  		timing->v_front_porch = 0;
>  	}
>  
> -	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> -	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> -
>  	/*
>  	 * for DP, divide the horizonal parameters by 2 when
>  	 * widebus is enabled
> -- 
> 2.43.0
> 

