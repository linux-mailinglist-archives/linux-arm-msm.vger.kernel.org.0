Return-Path: <linux-arm-msm+bounces-38197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A79D0C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C1B282E4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 09:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D171922F2;
	Mon, 18 Nov 2024 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CVkichzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3518FDD8;
	Mon, 18 Nov 2024 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923058; cv=none; b=S8VLu7XcIOu3WtkHEnPisRpfx0dhNR2b9a0N0PKUKqHVnsFyzv8T+wWzFSdqhPlcGtnTbD0UUIWgoNCRWv90Nwz5ltDzh6lW6WyTg/7m636n+yyv5lDS7/yOf6da3QFq+cm0pdMbGm51V7G/t5ZJhDst80K9RCJBo9b4elkbJgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923058; c=relaxed/simple;
	bh=xkGDIVTsjYl2daXkQELzdBVqI1NqFFTGHwZ9oH4jtg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt6EBlejTwLl19wCdDYl4ThmwhLILheDPospJg4RSp41cC2tVdDXoH+p0+xCRCAhCLZ3k9XCifoU8bIItveyzlrHCwq8LgG5jXJdP+tjjj/Mhbh/7zlxvsMEse1pPLLK2+xi/aaH19PxkIlGkiTox6JtEHaQQoaRwe6b9Neu/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CVkichzM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5D385B3;
	Mon, 18 Nov 2024 10:43:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731923031;
	bh=xkGDIVTsjYl2daXkQELzdBVqI1NqFFTGHwZ9oH4jtg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVkichzMiV3e0BGfVJwqOmN7JW9UFAdFwYknwJi9NFaABsS3vVTKVteKogEj7B2Uy
	 bR5k0lZfhuetEpIa/WAnnHYEGgmjcIm+jmVePtfT5OURVmlbegALQOou8quBwgZCgj
	 9q65vqEOFKvCU5olGrCy7664A1rYY3kWESwRkeu8=
Date: Mon, 18 Nov 2024 11:43:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/encoder_slave: make mode_valid accept const
 struct drm_display_mode
Message-ID: <20241118094358.GK31681@pendragon.ideasonboard.com>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-1-b1b523156f71@linaro.org>
 <20241117205426.GE12409@pendragon.ideasonboard.com>
 <CAA8EJpr=4AQVRKbtR2MaCQfguGW0a=3ay-ttew-mFR4f086Uyg@mail.gmail.com>
 <20241117233250.GK12409@pendragon.ideasonboard.com>
 <CAA8EJpq6Gkp4W=rGbpY6ASPgoDt=64HTFDk4_OZsTmbSUxhhGw@mail.gmail.com>
 <87plms51w4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87plms51w4.fsf@intel.com>

On Mon, Nov 18, 2024 at 11:26:03AM +0200, Jani Nikula wrote:
> On Mon, 18 Nov 2024, Dmitry Baryshkov wrote:
> > On Mon, 18 Nov 2024 at 01:33, Laurent Pinchart wrote:
> >> On Mon, Nov 18, 2024 at 01:22:12AM +0200, Dmitry Baryshkov wrote:
> >> > On Sun, 17 Nov 2024 at 22:54, Laurent Pinchart wrote:
> >> > > On Fri, Nov 15, 2024 at 11:09:26PM +0200, Dmitry Baryshkov wrote:
> >> > > > The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> >> > > > accept const struct drm_display_mode argument. Change the mode_valid
> >> > > > callback of drm_encoder_slave to also accept const argument.
> >> > > >
> >> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > >
> >> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> > >
> >> > > On a side note, there's only two I2C slave encoder drivers left... I
> >> > > wonder if we could so something about them. The ch7006 and sil164
> >> > > drivers seem to be used by nouveau only, could they be moved to
> >> > > drivers/gpu/drm/nouveau/ ? We would move the whole drm_encoder_slave
> >> > > implementation there too, and leave it to die (or get taken out of limbo
> >> > > and fixed) with dispnv04.
> >> >
> >> > Or it might be better to switch to drm_bridge. Currently we also have
> >> > sil164 (sub)drivers in ast and i915 drivers. I don't know if there is
> >> > any common code to share or not. If there is some, it might be nice to
> >> > use common framework.
> >>
> >> That would require porting nouveau and i915 to drm_bridge. As much as
> >> I'd love to see that happening, I won't hold my breath.
> >
> > Me neither. Probably moving those two and drm_encoder_slave to nouveau
> > is really the best course for now.
> 
> Granted, the dvo part of i915 is ugly, but it's also only relevant for
> the oldest hardware i915 supports. Like 20 years old. Not sure there's
> much return on investment in big refactoring, more risk that it breaks
> without nobody noticing. Just let it be in i915?

That's my opinion too. The gain is not worth the risk.

-- 
Regards,

Laurent Pinchart

