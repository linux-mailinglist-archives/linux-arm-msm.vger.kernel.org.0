Return-Path: <linux-arm-msm+bounces-88818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 479CDD1A050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DB64304E5E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAF22773F0;
	Tue, 13 Jan 2026 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODQ4NksF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E51CAA79;
	Tue, 13 Jan 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319356; cv=none; b=cGLKUQ1zoDU5BQx/Dg1GTJ80NTgfyi3GbUNquz9v4rX4gR+1CiAiXAvLC7TfErEcxJS+MylkmJZoEmtne/Cx2sFOxNc+KC+KQjUq8CdTpFtlIsaLFMUUlsTwSI3RPDTXD+pG6RKMs3igOzG1JTJXIzr2bzYJe7iPitCb2KHc4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319356; c=relaxed/simple;
	bh=DL6DumQuAKzxPXqlFPaLc/uXsPbWMPmwgxQv1tCvmW0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=p+R0cKUlHkaBlJ8jB1J51hkvlfp0wx0MKfDnT4CXHqw1m5As+klbVHV0qdreNdi3WvNQqQz6bfZf8VidAXlzGQvI7OwEnyrd9T9Q6C+vlZnZFenuvuogz/dLjPwO87RotQ2rwbMraLfG0ixP3vs9NA1oWnVokgAytqi4AuvQ89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODQ4NksF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C9CC116C6;
	Tue, 13 Jan 2026 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319355;
	bh=DL6DumQuAKzxPXqlFPaLc/uXsPbWMPmwgxQv1tCvmW0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ODQ4NksF3kuHZBXFrgVhO5YpFUJpkPm/Y/ykp4ja265B9koe5WMdyqy+E05tAAZ9I
	 72miO/eTCw+4ieuqPduuyfRQ8fH/f6RevBvbLVDbhX3MAjoniVXn0FCesEe72DJAo/
	 3fUqPSxrvHxlr8Ffqk32DIEOkuVdNOF7MNY4plwxnA6wIsnNx2GgqyaQ07DkdZ93q7
	 GTpJaGN1F+uPxz31M4z56R8tgVXqeREpMudytTEwp6Md/UwHOHqmomDvhT5PuYPXDz
	 9m8ijAKcWHtnoYyPTs3TsO9dFvZ2fSwcgxvzJ73hCoeYb0U/pZlaBzOKf7T7MA1Nnn
	 94EzzfkDfKcjQ==
Message-ID: <a3405fd8966a11655e39685e751832bf@kernel.org>
Date: Tue, 13 Jan 2026 15:49:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
In-Reply-To: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
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

On Wed, 7 Jan 2026 20:15:00 +0200, Dmitry Baryshkov wrote:
> In preparation to making clear_infoframes callbacks required, add a stub
> to the sun4i driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

