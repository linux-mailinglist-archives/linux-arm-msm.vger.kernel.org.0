Return-Path: <linux-arm-msm+bounces-51019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDFA5CAD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F28189BFB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A64260373;
	Tue, 11 Mar 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGihK8Rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37326036F;
	Tue, 11 Mar 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710538; cv=none; b=XZDOfHR6yRcw37cDsj/FTr9mxBTYK0FjCuUMqKqSiB+40VqMEzU/ft5jD1+lNxj6E3wXZ3J294Rh5ttlj71BfhznhqX8CbTy/H2RJO5fIOWQuq5xnl9O8HHcaNcU9KMcpiHmaN3QsvJWTIL2HI9bridUn3ns8YFLeUuyH5+M8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710538; c=relaxed/simple;
	bh=8OMFcL17uY6gRsTtXxJDcoNAW0nxjeHevA06z8Dqk8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9lYCrFfefnl5dp+J44m9IvvJpjOaXh1ZTO8qz04VZuh8pDlKSkkdh3H78n93GRyAkdNDRMNFqq/sm8qa/Vya/hrIoILy8eLM5Jj+R85Tz6XvXbuYu9AUVnIWSseD0LoRbMf/rFsTmi/RxB2HboeMOmmlsfqBOLuPeFIu3iy22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGihK8Rw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE5AC4CEE9;
	Tue, 11 Mar 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741710537;
	bh=8OMFcL17uY6gRsTtXxJDcoNAW0nxjeHevA06z8Dqk8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGihK8RwnXcf3DnbbaIW/U/FdSBz92bwToI+TYJyMCBQPfDWDeKNjt1OK52W+W+x5
	 9Wel/gkGxvsan8B5WywVcuX/uw/fOOzDF1ivuAxc+p6V1r0Ik+jxE/be3wJm+JmikA
	 tB2l76Cj8LiTXcWVwUAPr024J3qDTybb034auXx1KqHXlnE/A4zo8z7XZy+zwwJrWf
	 ow9nBgOUT3Mu94FZ/DJ4WErLdwpEUn/oRHgLLzU9wi9H8lghTRqOFLVco/zIlF9zOu
	 lNnzLt/5axCkugPxNwGQIEXcHArQPZo98Zik5rg0Aw4GfXRYLhPTDe/Iyhu3wZ/3uZ
	 D1kV980Lv+utg==
Date: Tue, 11 Mar 2025 18:28:50 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <wass63nz24l4h3umszsyptb5bnkny4h2wmnbeunjrdfhyacl4l@w6emq2ipt552>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
 <20250311-intrepid-obedient-lizard-64ad2c@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-intrepid-obedient-lizard-64ad2c@houat>

On Tue, Mar 11, 2025 at 09:07:10AM +0100, Maxime Ripard wrote:
> On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > > > values in the VC4 driver.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > > > 
> > 
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > > >  	 * KMS hooks. Protected by @mutex.
> > > >  	 */
> > > >  	enum hdmi_colorspace output_format;
> > > > +
> > > > +	/**
> > > > +	 * @tmds_char_rate: Copy of
> > > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > > +	 * KMS hooks. Protected by @mutex.
> > > > +	 */
> > > > +	unsigned long long tmds_char_rate;
> > > >  };
> > > 
> > > This should be in drm_connector_hdmi if it's useful
> > 
> > That would mean bringing the state to a non-state structure on the
> > framework level. Is it fine from your POV?
> 
> Sorry, I'm changing my mind a little bit, but it's pretty much the same
> case than for accessing the infoframes from debugfs: we want to get some
> information stored in the state from outside of KMS.
> 
> What we did for the infoframes is that we're actually just taking the
> connection_mutex from the DRM device and access the drm_connector->state
> pointer.
> 
> I guess it would also work for ALSA?

I'd really prefer to follow the drm_connector.infoframes.audio. It makes
sense to group all ALSA-related functionality together. Maybe I should
refactor it to:

struct drm_connector {
    struct {
	struct mutex lock;
	struct drm_connector_hdmi_infoframe audio_infoframe;
	unsigned long long tmds_char_rate;
    } audio;
};

WDYT? If that doesn't sound appealing, I'll go the connetion_mutex and
drm_connector_state way.

-- 
With best wishes
Dmitry

