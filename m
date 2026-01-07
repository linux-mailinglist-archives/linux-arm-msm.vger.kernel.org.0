Return-Path: <linux-arm-msm+bounces-87881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192ECFDA2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 970EA300D400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160A5328256;
	Wed,  7 Jan 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFJ5sp8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA22327210;
	Wed,  7 Jan 2026 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788632; cv=none; b=hqlbdSy9tfv5S8Pd1mXuLPKDeC2YAIq+b4chNcYrXr30+MJwVu7s6Oy+OmfgjEEYQYy6zBfz7iInpX+Mr9Y+pjlbPaAB8ZThobeIoMA3t6Ky1k/a5csRHDUPMjxRO7NqdOrUrGGZ8QGsTTdC0QUDVUsm5D11u6JkWGrEjOtBS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788632; c=relaxed/simple;
	bh=b8Etf9Ux2d/4mljHjahgtB9DZrTyWaQ9AiYmAkqWiiQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=PpaRyElczx0n7xOjhPO/vf2ELfTvadkhHrvpCl6b8Je3AVxhpqcTkt5gVhrGzbiFHfR/NKJwk9wuyPuLr2sWVc/ftWOKaHMcMhcxG3U0GgerLzr1X7m3G+22eU7VeXZxgqNN4tkZQOGXlAX0KX5pgZ8/wRb0aAqsN0XJIxlG7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFJ5sp8f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6F3C4CEF7;
	Wed,  7 Jan 2026 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788631;
	bh=b8Etf9Ux2d/4mljHjahgtB9DZrTyWaQ9AiYmAkqWiiQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IFJ5sp8fiVS99y8gOAM4iABccbY1d+5f1Mf0fJtCVx9tusrJ4qVgCssKPQL5h3i1I
	 c9Ac9h/h6V6DtuzySwROCCPfpp3BAAdyc9MK+8x/vVuVYF6yyAVJ1MlgniNkZzf8ax
	 fwFepEaKVZLDUhKgCZLH+vXV/qExuYvgBohl10UQVZAihqhUQqNpC2TQHdZN1Qo51P
	 HYp+EbzAG8SQ6YdrIRf2v9Oc+inbXg3aAUM77lr1SDmkiAdjp4Hdozzq0zhhIwZ+Vr
	 c5lIvP9fRJse7vzi8Qg/8IGTv5vdo5FDSbKZ7bFZph3AwUDH4cZgZWVhwYMg3jeWdR
	 I8sUlKhCJ8B5g==
Message-ID: <49d2e8155d4ab283053c79f08c3e5334@kernel.org>
Date: Wed, 07 Jan 2026 12:23:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
In-Reply-To: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:51 +0200, Dmitry Baryshkov wrote:
> Implement the clear_infoframe callback, disabling corresponding
> InfoFrame type.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

