Return-Path: <linux-arm-msm+bounces-75892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9AEBB6D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F24B4A0D08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552C91DED77;
	Fri,  3 Oct 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfbXoc6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540319CCEC;
	Fri,  3 Oct 2025 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759496607; cv=none; b=Ln+FjE/0LpdSWJsIqd2srnZWG9yVMoPk38nci5/ACvxTh+M3VSflOPePCdp/KVLWuCAEZSH+kiNCSEsoDjK+e05fIttZUemswHkcs/2YSzZI67asI0y9IuPZr/X69qyx/mAqvkoKYecQzTPZcuWM+bbqOdcHHxI3pUDN8KfdO3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759496607; c=relaxed/simple;
	bh=Gd7Oq5ZU+13w8PNpzBPg8aE98Rba9qJgv1pDoDLal7Q=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=VJG5iK+hsUEfXg2vxKllNH8vZPNyveMiSak3uBp4W5LvaOkXTHDP7p+FvzYWEn9N8jvdvobKeowXtCYeEhqVVt5g+rvO/l4LVhLeCOqKeorMfG8KFySJzIAqN+Osycv4TF0eNs/vYT2sIERe4OqmYydnlQv2RV+dBzS4w2RT33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfbXoc6i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C28C4CEFB;
	Fri,  3 Oct 2025 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759496605;
	bh=Gd7Oq5ZU+13w8PNpzBPg8aE98Rba9qJgv1pDoDLal7Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=tfbXoc6iH2ebCBIYmywEqOfOL/br7+yO0pTJ1zHz+lzYWI4OM+43mHTAer5bdl6eg
	 343HXDFp8oVnTSn8W9v8ePX8PQuPAVggFPOOjvqRHK8W1/a5+tX5Z99Z8NtRsS0kmz
	 0rPGKsA0kInxjb1wqWndhnavSx5EzOMBYz2157XwoNY11ApGGHNWOfdsI5pxfqT6si
	 bfiokh0TN7SjphfFMa9UP3cx5TsWqeAtHZZuuLnY6j0b5bKV8GnrrMk7LDMbhHnwfj
	 Gr1hossT+lKhqL09Zkl7sCKn3mvSr4Oc1TuqCYPItKtmSstLQM2bhWrZ+ihVaTNDfp
	 2sbvGsJMbhn8g==
Message-ID: <795f1dc6b340cc75c40c957ef8d38b0d@kernel.org>
Date: Fri, 03 Oct 2025 13:03:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
In-Reply-To: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Sun, 28 Sep 2025 11:24:46 +0300, Dmitry Baryshkov wrote:
> In preparation to tightening driver control over generated InfoFrames,
> make sure to warn the user if the driver rejects the InfoFrames on the
> grounds of it being unsupported.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

