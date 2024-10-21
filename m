Return-Path: <linux-arm-msm+bounces-35164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F829A5C84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA5F1F2127B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4746A194AF3;
	Mon, 21 Oct 2024 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDKxBnuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15923194A75;
	Mon, 21 Oct 2024 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495073; cv=none; b=NGlzzfq4JI3LdRbQqlwUfuYSHJJLDOYd5g6zxyD61rr0nbE+XRsuCp3xQvyvh2pxx1y3DukRDNGQX/L1HiHUcmRoX1DrmSlAMw+NzO1fBAbb94Mki3Yjf5LM0wDx3XZ0WxcvuiqAh9rkhn4CM24fnUhZ45RWcxVp1yHBv0+mEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495073; c=relaxed/simple;
	bh=JlgTjAP3ky+Oilz/rDXUrx4ib4ZWloaLx9eDP59DYWc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ACdnngoObwD/LLD9i1+EYu/kHkLX9/zCsN16D7az1C8SVW8DQDRz5/chwxld9RgWXBt3IHlafIvTcE6ewbct0ScluSl7ZQX6IRECRfcY5/yZulZ1FiyAtsyXKRXNl/00RpPlqP8Ddh5Pxi+JfoLqh79yYfMw04+MTi5NFsZdyyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDKxBnuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCE3C4CEC3;
	Mon, 21 Oct 2024 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495072;
	bh=JlgTjAP3ky+Oilz/rDXUrx4ib4ZWloaLx9eDP59DYWc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=BDKxBnuN3ge25rZUKYv5xiZkNYQgrhZSQ8Jr08+i5cOzT9JA5Dmt/lhz12B15J+fm
	 QqADyFxeGpf/1Qko/jWk2VXs36TK3Drvuid/d9p7+gIGss1BDUM3BJgnfqsc0KfqrP
	 L6QJHwp8ClnSclGLms11w1haL+20RXJGV06b40xY+vHUI2xTAw3XQJ3X9FFILw5uTc
	 U4uZ/M8qPZzKdz7zqnk37yd974cREL8+0KY/ZPjongWzDQZWzlkm6jsTvCUiStywMH
	 DFtZOOySch1FMrti2ntpVXeXDKEUHkVIpLHM4IK3eDLrdBBuRTBFE0gOoeHyYjtOic
	 evFfuHYc8reog==
Message-ID: <7f54c943d952a8bbc0f725304b8ab907@kernel.org>
Date: Mon, 21 Oct 2024 07:17:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alexander Stein" <alexander.stein@ew.tq-group.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Sat, 19 Oct 2024 00:49:11 +0300, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

