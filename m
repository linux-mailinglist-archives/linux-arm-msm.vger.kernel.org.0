Return-Path: <linux-arm-msm+bounces-51018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0308A5CAC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C2A03B1B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F125526036F;
	Tue, 11 Mar 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbUe9Dtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9625FA17;
	Tue, 11 Mar 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710304; cv=none; b=o97dQHDa1ZUDmJoyoS1Jql+rOz9SbIVAq4oVIx/exI2RlgbYbTTW49EkpUX2wVemTj0kb+a0LkdcHfeNz+lU+c00pEP7K2GJQiLwmmeNcreD6/NkBTK4Hs9WI4kpnlLXb/w0mFEDGFdGgJEsuWXM6Suj5CeZQ9ewy782A9KRNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710304; c=relaxed/simple;
	bh=qaHg9TZ/u/KpRnHhdqQajkXaqiwDjPjVD2+Cg0eyXsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFvTWhxd+4Rd2VfH2pqJVjzwiwxw45njk6zN7LsIXH1xy6l1WMEwtyvPP0qMiSC7FfNB+0WXUirxBtYStcNi7gYGIo/lxTK2K7ZxL4tQRIlXZ3OoITuszeDjNBZYGkIZG7BQFMI6CIuQsTB72PKDIJxcEfVmkrPykUZLK4aJNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbUe9Dtc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5628C4CEE9;
	Tue, 11 Mar 2025 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741710304;
	bh=qaHg9TZ/u/KpRnHhdqQajkXaqiwDjPjVD2+Cg0eyXsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbUe9DtcpfHIGEMT6uz1RREf5ezvlrsD5/16BqY3BmsFPfH2WQWm012jQgDeoYQdq
	 RxRZpw7I+FxNkedlHT05lthDo5ZypiCaf+yliE4VYtsIoEv8+SioJUx4zbm0LMq8Ut
	 lPuzxiKpfynwx+hc/9YCoYY9Zv1M6b7BK4yCt0/+UoQfJclQfvMRjXCVT8CND7fnzL
	 tB78j2VCVQXEVEo5IH8dCj8k/cPIeow1KB2cZDpS8WY92eOZ7gswxNHoJyHJD8Q+Vf
	 LvcbHMV5z1ODAHskN64E8ISEt4H2MzNmXlqGG/BiyPKQGShYBsvXzGBm2ndotXMkxB
	 EpkzwV6kThOfA==
Date: Tue, 11 Mar 2025 18:24:57 +0200
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
Subject: Re: [PATCH 1/4] drm/display: hdmi: provide central data authority
 for ACR params
Message-ID: <xidaohhyugexyapghteaioladfs2ma3trett6lyenmz2ubnlud@hnxjccqvbvz2>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-1-bb9c242f4d4b@linaro.org>
 <20250310-funny-malamute-of-promotion-bb759e@houat>
 <bensvtxc67i566qqcjketdlffyrwxcnydwarqyjau6b7ibcq4b@d6d4sbm3rubf>
 <20250311-bouncy-hissing-chupacabra-0dff3f@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-bouncy-hissing-chupacabra-0dff3f@houat>

On Tue, Mar 11, 2025 at 08:59:45AM +0100, Maxime Ripard wrote:
> On Mon, Mar 10, 2025 at 10:14:52PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 10, 2025 at 03:46:33PM +0100, Maxime Ripard wrote:
> > > On Sun, Mar 09, 2025 at 10:13:56AM +0200, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > HDMI standard defines recommended N and CTS values for Audio Clock
> > > > Regeneration. Currently each driver implements those, frequently in
> > > > somewhat unique way. Provide a generic helper for getting those values
> > > > to be used by the HDMI drivers.
> > > > 
> > > > The helper is added to drm_hdmi_helper.c rather than drm_hdmi_audio.c
> > > > since HDMI drivers can be using this helper function even without
> > > > switching to DRM HDMI Audio helpers.
> > > > 
> > > > Note: currently this only handles the values per HDMI 1.4b Section 7.2
> > > > and HDMI 2.0 Section 9.2.1. Later the table can be expanded to
> > > > accommodate for Deep Color TMDS char rates per HDMI 1.4 Appendix D
> > > > and/or HDMI 2.0 / 2.1 Appendix C).
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_hdmi_helper.c | 164 ++++++++++++++++++++++++++++++
> > > >  include/drm/display/drm_hdmi_helper.h     |   6 ++
> > > >  2 files changed, 170 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > > index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..89d25571bfd21c56c6835821d2272a12c816a76e 100644
> > > > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > > > @@ -256,3 +256,167 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> > > >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> > > >  }
> > > >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > > > +
> > > > +struct drm_hdmi_acr_n_cts_entry {
> > > > +	unsigned int n;
> > > > +	unsigned int cts;
> > > > +};
> > > > +
> > > > +struct drm_hdmi_acr_data {
> > > > +	unsigned long tmds_clock_khz;
> > > > +	struct drm_hdmi_acr_n_cts_entry n_cts_32k,
> > > > +					n_cts_44k1,
> > > > +					n_cts_48k;
> > > > +};
> > > > +
> > > > +static const struct drm_hdmi_acr_data hdmi_acr_n_cts[] = {
> > > > +	{
> > > > +		/* "Other" entry */
> > > > +		.n_cts_32k =  { .n = 4096, },
> > > > +		.n_cts_44k1 = { .n = 6272, },
> > > > +		.n_cts_48k =  { .n = 6144, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 25175,
> > > > +		.n_cts_32k =  { .n = 4576,  .cts = 28125, },
> > > > +		.n_cts_44k1 = { .n = 7007,  .cts = 31250, },
> > > > +		.n_cts_48k =  { .n = 6864,  .cts = 28125, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 25200,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 25200, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 28000, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 25200, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 27000,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 27000, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 30000, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 27000, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 27027,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 27027, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 30030, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 27027, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 54000,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 54000, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 60000, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 54000, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 54054,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 54054, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 60060, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 54054, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 74176,
> > > > +		.n_cts_32k =  { .n = 11648, .cts = 210937, }, /* and 210938 */
> > > > +		.n_cts_44k1 = { .n = 17836, .cts = 234375, },
> > > > +		.n_cts_48k =  { .n = 11648, .cts = 140625, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 74250,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 74250, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 82500, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 74250, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 148352,
> > > > +		.n_cts_32k =  { .n = 11648, .cts = 421875, },
> > > > +		.n_cts_44k1 = { .n = 8918,  .cts = 234375, },
> > > > +		.n_cts_48k =  { .n = 5824,  .cts = 140625, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 148500,
> > > > +		.n_cts_32k =  { .n = 4096,  .cts = 148500, },
> > > > +		.n_cts_44k1 = { .n = 6272,  .cts = 165000, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 148500, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 296703,
> > > > +		.n_cts_32k =  { .n = 5824,  .cts = 421875, },
> > > > +		.n_cts_44k1 = { .n = 4459,  .cts = 234375, },
> > > > +		.n_cts_48k =  { .n = 5824,  .cts = 281250, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 297000,
> > > > +		.n_cts_32k =  { .n = 3072,  .cts = 222750, },
> > > > +		.n_cts_44k1 = { .n = 4704,  .cts = 247500, },
> > > > +		.n_cts_48k =  { .n = 5120,  .cts = 247500, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 593407,
> > > > +		.n_cts_32k =  { .n = 5824,  .cts = 843750, },
> > > > +		.n_cts_44k1 = { .n = 8918,  .cts = 937500, },
> > > > +		.n_cts_48k =  { .n = 5824,  .cts = 562500, },
> > > > +	}, {
> > > > +		.tmds_clock_khz = 594000,
> > > > +		.n_cts_32k =  { .n = 3072,  .cts = 445500, },
> > > > +		.n_cts_44k1 = { .n = 9408,  .cts = 990000, },
> > > > +		.n_cts_48k =  { .n = 6144,  .cts = 594000, },
> > > > +	},
> > > > +};
> > > > +
> > > > +static int drm_hdmi_acr_find_tmds_entry(unsigned long tmds_clock_khz)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	/* skip the "other" entry */
> > > > +	for (i = 1; i < ARRAY_SIZE(hdmi_acr_n_cts); i++) {
> > > > +		if (hdmi_acr_n_cts[i].tmds_clock_khz == tmds_clock_khz)
> > > > +			return i;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_hdmi_acr_get_n_cts() - get N and CTS values for Audio Clock Regeneration
> > > > + *
> > > > + * @tmds_char_rate: TMDS clock (char rate) as used by the HDMI connector
> > > > + * @sample_rate: audio sample rate
> > > > + * @out_n: a pointer to write the N value
> > > > + * @out_cts: a pointer to write the CTS value
> > > > + *
> > > > + * Get the N and CTS values (either by calculating them or by returning data
> > > > + * from the tables. This follows the HDMI 1.4b Section 7.2 "Audio Sample Clock
> > > > + * Capture and Regeneration".
> > > > + */
> > > 
> > > I think we need to make it clear that it's for L-PCM only (I think?),
> > > either through a format parameter or through the documentation.
> > 
> > Ack
> > 
> > > 
> > > > +void
> > > > +drm_hdmi_acr_get_n_cts(unsigned long long tmds_char_rate,
> > > > +		       unsigned int sample_rate,
> > > > +		       unsigned int *out_n,
> > > > +		       unsigned int *out_cts)
> > > 
> > > And we should probably take the connector (or EDID) to make sure the
> > > monitor can support the format and sample rates.
> > 
> > Interesting perspective, I'll give it a thought. I was really just
> > trying to get rid of the duplication.
> > 
> > I think that 'supported' parts should be implemented in the hdmi-codec
> > instead, parsing the ELD and updating hw constraints. WDYT?
> 
> Basically, I want to make sure we cover section 7.3 of HDMI 1.4, ie,
> make sure we can't end up (or validate) in a situation that isn't
> allowed by the spec.

I think that's a question for a separate function. This one really
targets 7.2 rather than 7.3.

> If ALSA covers it already, then I guess it's fine, but we should
> document it and point to where it's dealt with.

I'm not sure if it covers that right now, but it should be handled on
ALSA side. For example, see sound/pci/hda/patch_hdmi.c, I think it is
handling those bits. We are providing ELD to hdmi-codec, it can
implement and propagate HW constraints.


-- 
With best wishes
Dmitry

