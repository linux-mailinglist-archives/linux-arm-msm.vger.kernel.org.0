Return-Path: <linux-arm-msm+bounces-86821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54ACE68F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3BCE3001FF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DE430C35F;
	Mon, 29 Dec 2025 11:39:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02C2DC344
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008362; cv=none; b=uj2ShycftfgWJD6IkOhe7kHfIFdC+JOjCWhe9Pp2SJ7YFEdUcSGKJam9BafyZH7IpPviKjCvS6VnPR+u5JnbAP10tlL4BjM1kWMYqfexm90cTZs8QxPlBDKwkjvyGDcLSlrMkwq3a3vLaVWZNCJoGyEimMI9pzK27tYLShXRHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008362; c=relaxed/simple;
	bh=aP14hXO/NpcteQzLY2zOHzlnaCkulYfG9nmFbU8ASDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKapbMO2f+hKE+nzMpdmTTARkF9DdHE4HqhjvZh3h8nGwjXBdtdXX3+/anmrISOhZSzvjOw1JL9S+svaHn4y6raB9nfPHGLQ1Uaj5U+dsL6TCtq0jE03ahq2AmykTnu0c4IbKopS7oaYfoCociNBybdhaHI55bzt+6TbZ9fcAxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A9C993F6A7;
	Mon, 29 Dec 2025 12:39:14 +0100 (CET)
Date: Mon, 29 Dec 2025 12:39:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Message-ID: <aVJlvFWcq5QMVWYM@SoMainline.org>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
 <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>

On 2025-12-28 05:57:12, Dmitry Baryshkov wrote:
> Since DPU 8.x Watchdog timer settings were moved from the TOP to the
> INTF block. Support programming the timer in the INTF block. Fixes tag
> points to the commit which removed register access to thos registers on

thos -> those

> DPU 8.x+ (and which also should have added proper support for WD timer
> on those devices).

Right, yes.  Commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming
through TOP on >= SM8450") was already a fixup of that (though marked as fixing
the followup commit 100d7ef ("drm/msm/dpu: add support for SM8450") for being
the first to use the new DPU_MDP_PERIPH_0_REMOVED flag).

> 
> Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

...
> @@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  
>  		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
>  			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -							 vsync_cfg.vsync_source);
> +							 &vsync_cfg);

In some way this makes me wonder if we simply need another struct, in favour
of not missing fields that are never / not-yet read, although resulting in more
clutter.

(Just a nit / question, not a request)

...
> +	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
> +		u32 reg;
> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
> +			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
> +		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
> +		reg |= BIT(8);		/* enable heartbeat timer */
> +		reg |= BIT(0);		/* enable WD timer */

My downstream also sets BIT(1) for "select default 16 clock ticks":

https://github.com/sonyxperiadev/kernel-techpack-display-driver/blob/61a727e1ce1fda617a73793b2cbb76b5ca846ea2/msm/sde/sde_hw_intf.c#L511

Although it doesn't read back the current register value.  Do we need that; or
maybe you are inferring this "missing" BIT(1) via this readback?

After all downstream removed the readback exactly in favour of setting BIT(1)
though because of a "default value change" since MDSS 9.x.x:

https://github.com/sonyxperiadev/kernel-techpack-display-driver/commit/e55c68138b04770d51067c158f92de526e0c926e

- Marijn

