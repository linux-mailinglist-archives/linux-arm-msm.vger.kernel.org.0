Return-Path: <linux-arm-msm+bounces-87896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D47CFDEE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51AED30491B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E5033FE22;
	Wed,  7 Jan 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VybgdxEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F433FE18;
	Wed,  7 Jan 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792438; cv=none; b=CD5c5ObbDORUNVnQDDo0CWFq+ViHIesO7DEvw9K+NkiHmdBu2ichgaTwpKwJ8anRZGLr/QK4BJ4cfrr948D4uapDZYghbBEZNUhCYHbWGmUJ/gxA0ZgEyxps56UKR0OV46SlwT6KZOxNuZ+Gn4vm1im6pJgjjahpHG6/1pTrLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792438; c=relaxed/simple;
	bh=hfyekdsHmWdQS0kJEhufEEa1Z3aDl+tOujQ3/cqxLFE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KcCXhTCtH6M5gjIqKhIpLYMLfr46I26x8voGB8HFFWRu4mcSybtiPI7DVpHDMMy2F76X3XW1S0J4/DuLUw5a4RBH1cdhmWL7pbHR1bZHDTKRjhceVUPH0nF4yc8vY2z9q2ZfsOfNYqPPD58GY0mcqk+1FtDtMW8o4DKsQuMjcbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VybgdxEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F18C19424;
	Wed,  7 Jan 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792437;
	bh=hfyekdsHmWdQS0kJEhufEEa1Z3aDl+tOujQ3/cqxLFE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VybgdxEp6pxfAJ0W6fs9mZgmkhrybuLHyBke+InCoOSN7vrIISSGq1MeQuv6tlEys
	 ueW2YQw7cQC0mPhgGpEsHxRs2+k1PmFzlds33LY0KCNQhqYNRYWPQ0opfWWHyqXIRy
	 DvKm7SmTQduTdjZ0Xa+MA2YH1gv9/hfTLVFzNfCMIEzd9SO9AzbmRpm9gTlTm53N6a
	 KxofVLD2YhlF1rCAxYkJKg7t9pL+U7klKPHlikk0Z+zFTvMurqoY1+C138Ypmq7GNR
	 ZwIe+L/907iDy51Mhnuz3DOm0tYNTPtGSMisht6BChhJbuEKYDYkWjfeC2z8KRFoRJ
	 AbkyMwpzUC2Aw==
Message-ID: <a06a7221e2a0afc92b74c54962ea0924@kernel.org>
Date: Wed, 07 Jan 2026 13:27:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
In-Reply-To: <20251224-limit-infoframes-2-v3-5-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-5-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:54 +0200, Dmitry Baryshkov wrote:
> Having only a single set of callbacks, hdmi_clear_infoframe and
> hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> the DRM framework, which InfoFrames are actually supported by the
> hardware and by the driver and which are not. Also, it makes it
> extremely easy for HDMI bridge drivers to skip implementing the
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

