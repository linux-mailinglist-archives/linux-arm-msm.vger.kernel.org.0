Return-Path: <linux-arm-msm+bounces-87891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14ACFDC95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0125C3008178
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3405830FF29;
	Wed,  7 Jan 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrvrUhv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C13090C5;
	Wed,  7 Jan 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790652; cv=none; b=dFwdcyY1ykldPJ2PNLDvrjsryfWlOzhQBA46FmXD+nXhXLs/yXvFfPU07Z3YX2PB2h0gA2SNcGqTXJJJa/9ASbZ5f6MYDNjNc5piRDnvk8Q511uBBHj8cgvCcfVPykMWUKU8CgoAfVJxwf4Ztx8TjXeVfX21eTjD2fUivh+3B4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790652; c=relaxed/simple;
	bh=AZ3FTUzyEnjHa8UimWASucIjpUtAemrhK/cj4twknT8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qyewA69j+cro03mE+rAptxNu89e3cuZTCtGhZDUnbzCBdDWhVgk9Jq6ciSXXll6H/e0s9Dg5LyHhfC21j1/I/nBzLfkE1WVoOclnBErOuVw6aPvBJPCnFoxILnEOI2/3WfF5U6KU6WBzZFLp/wbivefNGWvagOV77Pf6LfuI4hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrvrUhv7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D685C16AAE;
	Wed,  7 Jan 2026 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790651;
	bh=AZ3FTUzyEnjHa8UimWASucIjpUtAemrhK/cj4twknT8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QrvrUhv7AKUyuhxnfnZD8aTRrkLEqDa3FVHhBC6qxSbAoejvO1zyJrbl3ODgv5Dnm
	 08L0MIErAX/jzBq66LOvzH4bDL4k0rOQgvNl+95WMn33WJIFTdD2C1QFOUKoADoM1B
	 W3zJ1EnPSHcuH9ube8VJlwcD1Gsk7czmsRt3zaif5ClvKfgXa6i8sDoKcVHy0H+cX9
	 RpVEnA2KjR6S8BMQ+ka8FOmbx7AfXEVPkA0PQtj3xwQyfOWku0YZWfEI74lRRzWrPU
	 6GI9Nex4iLl4Dgfxu5Yb9Wns3l1FMX4xw3PAoGaLkO/FE7IYDI4v3Txku23hQ7vfKT
	 t3AFfQhoyVrvQ==
Message-ID: <2cc04e3f503dc7ed74d8faade50cf69c@kernel.org>
Date: Wed, 07 Jan 2026 12:57:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
In-Reply-To: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Wed, 24 Dec 2025 03:02:57 +0200, Dmitry Baryshkov wrote:
> There is little point in generating InfoFrames which are not supported
> by the driver. Skip generating the unsupported InfoFrames, making sure
> that the kernel never tries to write the unsupported frame. As there are
> no remaining usecases, change write_infoframe / clear_infoframe helpers
> return an error if the corresponding callback is NULL.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

