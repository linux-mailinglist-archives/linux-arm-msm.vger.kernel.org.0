Return-Path: <linux-arm-msm+bounces-51011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BEA5CA06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C64167AD67B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F26261387;
	Tue, 11 Mar 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M37FfNOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EB261382;
	Tue, 11 Mar 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708706; cv=none; b=LMI0vCGHptl/hslFbc4EMJ4HMgVbk68w5CljL/fEImJSCv0XZNELN5XgsPqlfkm5vD0XUhcfmWqi3nBHlRaPCVlAMQZHny0XT6wctvR98LC8bGFqmQX/xwQ4SSSO8UEGwb0Fy8sh9CLJMG/nRrqcKOWOfjCbaSt4HlA/QHMjLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708706; c=relaxed/simple;
	bh=s/BI0c/mXjRIlHmmtIUh0vfxDHCIvIHWrReoajMcp3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEPjCpvt/RHEVje8E1FlTS1RzRsyNrXb5QwaR9iAlnzrigwWy/HW820jzmmX1Si3wuZJe+5DgWAB7pmieKj0on6MmQ8SOKuJthICJaiuR5BkBOGw9T2RTd+XPx4d5WNkwG93ulWxkVPan4A9C7W/Rhsa/b38prasfHPE9wCbpg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M37FfNOU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC7EC4CEE9;
	Tue, 11 Mar 2025 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708706;
	bh=s/BI0c/mXjRIlHmmtIUh0vfxDHCIvIHWrReoajMcp3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M37FfNOUp8wIK6kCnGLOcug2rsqGqnA2ypPy4D1rjVfsu0hwzbBfTyxhC/fFO7SB3
	 vZaCDm/fSf3F4iKXhAWODZPyeBQYmtKVZzgq7jsmOTBLGj/imFRenVxJfM6j2T6+A0
	 kU6YKGremPgPfdmMToSpOzfT8TO+GFU4QaIWngkOJWyEQjG3IfpSOzKr7vFuw0Olz/
	 0DvToCb4pdILnhZxsMoBgtGkl2DRcxgcaVnpRm1h/uRDo+WOUd65Fd/1SGCYuA5myO
	 fx7IcWkOYSBLP6RsoqIggTbYsXE+mQnxm7/SFWe6ehpc0wYG6+YtRhui1DpizRkmO2
	 NOQORL9/gfBhQ==
Date: Tue, 11 Mar 2025 17:58:19 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Hermes Wu <Hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec
 implementation
Message-ID: <ecw5wdvkf2iqwxvigze374q3lb3esqbokv43mkblbnpfmudutu@e75i4lqhuux7>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
 <20250310-daft-bittern-of-foundation-67c657@houat>
 <CALT56yMSs7K_0b5YtkCW5Ypyt9Hu_YLkitFFJwTtBkwUJk-NHA@mail.gmail.com>
 <20250311-vivid-almond-elk-83fda5@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-vivid-almond-elk-83fda5@houat>

On Tue, Mar 11, 2025 at 09:41:13AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Mar 10, 2025 at 08:53:24PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 10 Mar 2025 at 17:08, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Fri, Mar 07, 2025 at 07:55:53AM +0200, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > in the driver, e.g. it manually manages HDMI codec device registration,
> > > > returning ELD and plugged_cb support. In order to reduce code
> > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > > > integration.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/Kconfig         |   1 +
> > > >  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> > > >  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > >  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > >  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > >  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > >  6 files changed, 31 insertions(+), 170 deletions(-)
> > > >

[...]

> > > >
> > > >  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > > > @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
> > > >        */
> > > >       if (!msm_dp_display->is_edp) {
> > > >               bridge->ops =
> > > > +                     DRM_BRIDGE_OP_HDMI_AUDIO |
> > > >                       DRM_BRIDGE_OP_DETECT |
> > > >                       DRM_BRIDGE_OP_HPD |
> > > >                       DRM_BRIDGE_OP_MODES;
> > > > +             bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
> > > > +             bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > > > +             bridge->hdmi_audio_dai_port = -1;
> > > >       }
> > >
> > > I think I'd prefer the toggle to be OP_DP_AUDIO, even if the
> > > implementation is exactly the same. That way, we'll be able to condition
> > > it to the DP support when that arrives, and we have the latitude to
> > > rework it to accomodate some DP subtleties without affecting the drivers
> > > later on.
> > 
> > I don't think that there is a point in having OP_DP_AUDIO. There is
> > not so much difference in the driver. Also currently OP_HDMI_AUDIO
> > follows existing approach (which was pointed out by Laurent) - that
> > OP_foo should guard a particular set of callbacks. From this
> > perspective, OP_HDMI_AUDIO is fine - it guards usage of
> > hdmi_audio_foo(). OP_DP_AUDIO would duplicate that.
> 
> HDMI and DP are two competing standards, with different governing
> bodies. I don't think either have claimed that they will strictly adhere
> to what the other is doing, and I don't have the will to cross-check
> every given audio feature in both HDMI and DP right now.

Hmm. Currently (or before the first hdmi_audio patchset) everybody has
been plumbing hdmi-codec directly from the driver (even for DP audio).

> However, I think we should really have the flexibility to deal with that
> situation if it happens, and without having to do any major refactoring.
> That means providing an API that is consistent to the drivers, and
> provides what the driver needs. Here, it needs DP audio support, not
> HDMI's.

Would OP_HDMI_CODEC be a better name for the OP? (we can rename the
existing callbacks to be hdmi_codec instead of hdmi_audio too).

> How we plumb it is an implementation detail, and I do agree we can use
> the same functions under the hood right now. But the driver is a DP
> driver, it wants DP infrastructure and DP audio support.

Would OP_DP_AUDIO require a different set of callbacks on the bridge
level? I don't want to end up with too much of duplication. Maybe we
should the cdns bridges which implement both HDMI and DP functionality
IIRC.


-- 
With best wishes
Dmitry

