Return-Path: <linux-arm-msm+bounces-87897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E950ECFDF96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16091305A745
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6589733F8A8;
	Wed,  7 Jan 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhURNNCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0FA2F659F;
	Wed,  7 Jan 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792494; cv=none; b=sXSaZDQsJi8rFLkH9E3VQNX+zbQwxbZ7EzZg+C8HrItWtTtAb5UDaKIvOR8/d5Jk+vZih1WM2BDXtnH88e5F5wJuPBMyn9s5e32kUd8Oc8GmDpD3L4QUZyHfoZ2y3touyl2T0wcKrkIPCv+9hodzpuOWldeflGjjqK/smzO/P2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792494; c=relaxed/simple;
	bh=TKVtYnPnQD/KzKy0E9YEdozPRAwFIjfCUKP8liHDliM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=iyYEebgZatj0NGMCSYEEDL2r0Yo3QlmqnQAVBn5VfYNoFWAwqu/F52bqGI54S4C9P60Xb10Sg2Yv5r+1Obl5wbUVzmRvpRwhLnp1aS6XkAdA7FE/yxYnx+qVGFaly5I4v7ITaNi8eOJzjOqg21uGOs9IPGkXiy1Bk/kgKoD1Gbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhURNNCf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46121C4CEF7;
	Wed,  7 Jan 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792493;
	bh=TKVtYnPnQD/KzKy0E9YEdozPRAwFIjfCUKP8liHDliM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dhURNNCfaS8MP8amX9Dbh0GoVJJ5s9X+uzzLxLADMs6LaZXJiTcL/xyPZN49A8Be2
	 WxKj0pkQwgICzIQpt4DfyBEN2907ll1pvYmex5cuR0P9bZLAqKmT4ikgWIUay6gDQp
	 iK2noXliZ2Cvba7X5Bm6+aWxtno+eheiiIHGxn4v6viF5GHCywyQPjhg+gWoGI3A4V
	 ohCwZzVrIg1G7UeR2VFZ6SJ+kjVdq/ArVWd+HEJM547aoldxzjTCtrFdQh2P9cFDJm
	 K+qkRC813XqTDe/aXr0rlPj0Cp/EiEVp4/ggGMv+BPinUsefuE9dy+RAZoMraz/AWJ
	 jRztjiQRcftbg==
Message-ID: <b9d355a21bed01af4ec1e4f087670a38@kernel.org>
Date: Wed, 07 Jan 2026 13:28:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] drm/display: hdmi_state_helper: split
 InfoFrame functions per type
In-Reply-To: <20251224-limit-infoframes-2-v3-6-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-6-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:55 +0200, Dmitry Baryshkov wrote:
> Havign a single set of InfoFrame callbacks doesn't provide enough
> information to the DRM framework about the InfoFrame types that are
> actually supported. Also it's not really future-proof: it provides a way
> to program only a single Vendor-Specific frame, however we might need to
> support multiple VSIs at the same time (e.g. HDMI vs HDMI Forum
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

