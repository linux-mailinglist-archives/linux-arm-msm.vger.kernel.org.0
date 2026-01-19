Return-Path: <linux-arm-msm+bounces-89603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6AD3A499
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 190173092C39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFFB357705;
	Mon, 19 Jan 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeDvMHo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A6246782;
	Mon, 19 Jan 2026 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817641; cv=none; b=ulmxLGTHd/rS+nuLtERB/oIgr50w98WjNidk7EjyjYYmd4m+jOa4sDv1vuxl8T69+p7MX23KlyqSD2/l2/9viZLMyMCMOohHU9ejuG62L4CT3vrIGmFQdEj/yzsFk49qr1QZ7WXgk7rhrmdf/3aQq3PcN718/1mn6QROJ0lZ8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817641; c=relaxed/simple;
	bh=NYdJQrmH02NA6Tbg7YbuRjFQaGimaDqIcuD9t2JJMBQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=GCbz+jXhQG1+TEb/tbx5sxWf0zMGbeyWZ5hlBOhijfTinFCtFCjbymh9AwP87fWhoRYtNjgBKDH7HDNCGSx85VkdB9orBFWZY4gz1i3eymFy2K7k/GDj5aWOhisHrqsJgCNEe0N/uLpwzJyQzrOHum712k1oAemcu9gwE96U3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeDvMHo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D94C16AAE;
	Mon, 19 Jan 2026 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768817639;
	bh=NYdJQrmH02NA6Tbg7YbuRjFQaGimaDqIcuD9t2JJMBQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AeDvMHo3DwRyyOwsOt3Jiff3SJaHaI2TfoOMnycd8ue94ufW3X2ZpsF5JcszxdXUc
	 99hNu2JtkOZ5cz0f9co2ywnQRG4iUmRAcalXQa3PXdAGi9q7O0igqVcMNLB24CJ/7N
	 U8w+R/ohSCTb/vVN1uKOeBRoEwuttAp7PCPpo/Z+z+AT0rExbUyP6gEo8P6xV9Dq96
	 qxaw406z3/DWloyzjHoWvgxE7taQOk8S58Btjo1yeiT8pzUrDxq0UPsbZSXHi/ppnN
	 Q1nJ0ThhOIm2KrJ7Hgqhe9cG6X2Yq6c+T8vVGpA78L/RCzsCY/wHLLT2Xh1G7ITpYm
	 UTSrxZGZkorMw==
Message-ID: <12c1669e5947ce144bd295e5a26a93da@kernel.org>
Date: Mon, 19 Jan 2026 10:13:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio
 IF updates if it's not supported
In-Reply-To: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
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

On Wed, 7 Jan 2026 20:15:04 +0200, Dmitry Baryshkov wrote:
> Updating the InfoFrame if it can not be sent over the wire makes no
> sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> an error if Audio InfoFrame callbacks are not implemented.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

