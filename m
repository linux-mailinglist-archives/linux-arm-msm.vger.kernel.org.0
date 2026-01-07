Return-Path: <linux-arm-msm+bounces-87883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C961DCFDAEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40FC3300181E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5475030BB91;
	Wed,  7 Jan 2026 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivCOlkKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25012301472;
	Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789144; cv=none; b=o77OZjHQCFYhmwvNk7LoJ1ltLRBpyEDL0pF56kuyNQp6zPKqwN9UQ6PI0r0qliMmeUl2ebIZRNx7T1L2qp1moyahC2lL8IKgE+tf84CnjE4nFTvfVO920zSc6bQXWknXyotBSYBlouraqa9UWYOOu0isZURiDCPUVAXBbEa8mRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789144; c=relaxed/simple;
	bh=2Nqjd5umGqQTshG/6KasLg0SyW2HMZV1B1Lxjp2ecFg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=eQjq1Tcmwzasrsa6/6wSkWN4Jc2tnS3RT5FC8ko9w+PTgz4AXQeLy2SIbRDrYuCVnEswi4uO9ZZ6Q/K+8NpMy+9ip2pt01EPG3bJrjpXFsRRyqJ7526PSuzeVzFRqoYHXuCApUk+g3F5TaoOVYZUpulf/COUbZQK6SvyYLIVnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivCOlkKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E98FC4CEF7;
	Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767789142;
	bh=2Nqjd5umGqQTshG/6KasLg0SyW2HMZV1B1Lxjp2ecFg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ivCOlkKs/3FPom4CAQW/8n5+RtJ+Ktgpa46WuEDsbvA9PTBeWuC7vV4+xBeDgQh6I
	 F+ikAwBIMxkTYm3UK5stlQN0iulvCSSl6E2JV1u4QXCSkGcTAkSB2mkHdzw/EdIDvc
	 FUSAzwPfQKz6h4ZHo8/hDOFRATtO4FNaGq9u8a+Hb0DB/mfzr37+BspAyH9jtluOP9
	 BThkvDxk9LJUGONm+dsYPaEtV1NScUVsoM3A4nX+KbKavoAkonyRlYC4BOBp/n+kNt
	 uNOpMaeFLn9fsFJzYYAUv+hgwkrlZmLWtZDdw79Ff4blsc6mcmnifNIw3KUSZqGA+X
	 RP1wITi7KGfyw==
Message-ID: <57ad1884d9080ebc37abf8b96ab71abf@kernel.org>
Date: Wed, 07 Jan 2026 12:32:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
In-Reply-To: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:53 +0200, Dmitry Baryshkov wrote:
> We already require both hdmi_write_infoframe and hdmi_clear_infoframe
> for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
> the clear_infoframes callback for HDMI connectors utilizing
> drmm_connector_hdmi_init().
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

