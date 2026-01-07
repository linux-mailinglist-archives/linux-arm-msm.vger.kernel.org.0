Return-Path: <linux-arm-msm+bounces-87899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367CCFDF1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0B3430194F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21AE33F8A0;
	Wed,  7 Jan 2026 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwpQDEJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7250329C60;
	Wed,  7 Jan 2026 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792540; cv=none; b=H2yqoB4izLAIB9R2MaLZDPqMZrKux8Viw9AMrabgIn814oIN/wEqUtLNFV0C6Y6UlTUktDtd6IFUztTj7MiCe3Z7ZPZK/YHaIFxjq/96US2iQQHCxIDujxsBfpCA/ExP+blLRLXtSAA++BXqjpZ6hLxs7DDxV0JMTTI0YjM/h28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792540; c=relaxed/simple;
	bh=PK1j6ce4GGTcpSge6J8AMXbZ8tvdblBxTwzpEYOUGQg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=USh+mkOCr1uIgvJ5zkDYyawMOgvezvcEGVfOZQAfHv1IJTZocBCIQYWx7QZJttN/HUqXs/nuntrc6Zd2YN8/oNYXvA6pp7IdYTOOIIskHIITrdWdFF5Ay332p2kYTCCK3NvbF/jnlMG9I9vHNkKO4igpkr16vXyEhIUxkASJx+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwpQDEJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7015C4CEF7;
	Wed,  7 Jan 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792540;
	bh=PK1j6ce4GGTcpSge6J8AMXbZ8tvdblBxTwzpEYOUGQg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TwpQDEJFw9eder+ACSMDQ+hh2IXQJhWM0qJedRQIGlwhlYpFPOIDu3w6JzkhZmfY5
	 v7cTyCpq5tlIbdCoMzYuktDk9LGEXCaxX9PvaXYDi4AcoHI5jSuVxSAO1q6Aehh2rL
	 J0fb80OArKVpkly5vd3OjFrcmDkHa0OZlI5XLW4L6Cjutsqn3t2x5K80tG4JzT3TWD
	 l7lIzuapfxCX7EwlxlEkujyT3ZJhmNgvCOVh0c2BeIKs1+AEVAKzR0nuF/6G+Jf3Jt
	 ukrAVsD7OELbx2WZjiav5Qp8x4PeztEzKyp0g/WkepHIoYQuMxPA5/AJVMZvzEl/36
	 V53gwahHgJWZA==
Message-ID: <5418c64c7c32a5bd651b097a47d28e00@kernel.org>
Date: Wed, 07 Jan 2026 13:28:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
In-Reply-To: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:58 +0200, Dmitry Baryshkov wrote:
> The rest of the DRM framework uses presence of the callbacks to check if
> the particular infoframe is supported. Register HDMI callbacks
> dynamically, basing on the corresponding drm_bridge ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

