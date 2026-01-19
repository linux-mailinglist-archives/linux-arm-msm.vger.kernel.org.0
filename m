Return-Path: <linux-arm-msm+bounces-89602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADAD3A491
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F813006F74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983EB357A2F;
	Mon, 19 Jan 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoP7E/9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26378357729;
	Mon, 19 Jan 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817627; cv=none; b=WAQBTyQCX6aQGLTgVrV6p/HCEklVuEoTeLzxpVbFXLWo/yRB6fpJwo2hyQiq5aO/qnZUx3R7SdleXbfNkrkuXcssPFivASSaRL8GiShbBJxpOJbFGxHu1iyCyQsYbfq+8Rjbv0uXAu3W0LN1kVOA5RBkAgujwWnw40avgsRUYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817627; c=relaxed/simple;
	bh=1P25O01V1+pU3qLbbBJW/GjfXAE5BGBvNtHpKC+MLLk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=C1kN5n0bOkEHbUBAywqt6T+xEsgqtCTHptYemFkI8m4MOSTSCm5o7+dYVYZrFeD7/Jk4pvcTzTyTOfDP36DyHe4m77AlnO/3LbPtq32OzlPUXIUIX7IkFSuvDk7mM7uCcNOlKU8lemnUbdgi+1OARyVTzkLpQOIplMDK2uoIym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoP7E/9p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E657EC116C6;
	Mon, 19 Jan 2026 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768817626;
	bh=1P25O01V1+pU3qLbbBJW/GjfXAE5BGBvNtHpKC+MLLk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IoP7E/9pRu+7PDLd0H764jZC/uaNamD0WEa4z1KHQ1LWmWDuerkPTvD00JtG85EOm
	 SzdPIkNXbCfn6Md0mGJ1ogDNrUlWfYU1KRUElYJpxZ3ji5qbTBJlJDcSjQcC2+mviQ
	 ZE/wyaZPh8k7s/KFqIk92XNEj6nHbp+MKbgOVDgXzCLBRNPoVgD69UHUxtGvi1aqJi
	 iNASTiwUxup4KrDlPpADUKJgItJpUr2eliuygQdOW5LikrdFAKge0CU9xKkXvS/5es
	 ZLften5mQg2ZaW9SoWZc5htrDu8insI8Ww82s/O0GqFp0V6EbvOVPO8lCv97yl2k9S
	 EZ2Y8jIU3vGdw==
Message-ID: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
Date: Mon, 19 Jan 2026 10:13:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes
 behaviour
In-Reply-To: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
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

On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> unsupported doesn't result in a commit error. Also check that HDR and
> Audio InfoFrames are not triggered if corresponding features are not
> enabled.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

