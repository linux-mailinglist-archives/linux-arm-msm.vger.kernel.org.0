Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26536620347
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbiKGXHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiKGXHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:07:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DBE2C67F
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:07:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 133C0492;
        Tue,  8 Nov 2022 00:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667862419;
        bh=N0sUr1gASY7tZbY60ADDHkTFGTrQM54JT8hf8XPS7DA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MmJTxFiCxVhUcC7KkJl56G9rUGL2Qai4zH66EbEGE/pY61UqOZQ0bdTVErENaMBZI
         612iucMMpAOtQ+e20W/Vyj7VxrenUeEE51phbTPSxrpY6TTttfWPurl4aya9rdq0+k
         VUeiEchPrXCvG+HDSAMpg1E7+p3C7WRwTL0XS0KQ=
Date:   Tue, 8 Nov 2022 01:06:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <Y2mPgB4LoOqhhOUe@pendragon.ideasonboard.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2leZDfLj/5963wl@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 07, 2022 at 09:37:08PM +0200, Ville Syrjälä wrote:
> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> > Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> > properties. When the color fill value is set, and the framebuffer is set
> > to NULL, memory fetch will be disabled.
> 
> Thinking a bit more universally I wonder if there should be
> some kind of enum property:
> 
> enum plane_pixel_source {
> 	FB,
> 	COLOR,
> 	LIVE_FOO,
> 	LIVE_BAR,
> 	...
> }

That's something I could use on (older) Renesas hardware, where planes
can be fed with a live source. The issue there is that the live source
is a compositor with multiple inputs, handled through the V4L2 API. How
to synchronize the configuration of the compositor and the display
engine is an unsolved problem at the moment, but it could be solved
another day.

> > In addition, loosen the NULL FB checks within the atomic commit callstack
> > to allow a NULL FB when color_fill is nonzero and add FB checks in
> > methods where the FB was previously assumed to be non-NULL.
> > 
> > Finally, have the DPU driver use drm_plane_state.color_fill and
> > drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
> > and add extra checks in the DPU atomic commit callstack to account for a
> > NULL FB in cases where color_fill is set.
> > 
> > Some drivers support hardware that have optimizations for solid fill
> > planes. This series aims to expose these capabilities to userspace as
> > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > hardware composer HAL) that can be set by apps like the Android Gears
> > app.
> > 
> > Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
> > DRM format, setting COLOR_FILL to a color fill value, and setting the
> > framebuffer to NULL.
> 
> Is there some real reason for the format property? Ie. why not 
> just do what was the plan for the crttc background color and
> specify the color in full 16bpc format and just pick as many
> msbs from that as the hw can use?
> 
> > Jessica Zhang (3):
> >   drm: Introduce color fill properties for drm plane
> >   drm: Adjust atomic checks for solid fill color
> >   drm/msm/dpu: Use color_fill property for DPU planes
> > 
> >  drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
> >  drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
> >  drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
> >  drivers/gpu/drm/drm_plane.c               |  8 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
> >  include/drm/drm_atomic_helper.h           |  5 +-
> >  include/drm/drm_blend.h                   |  2 +
> >  include/drm/drm_plane.h                   | 28 ++++++++++
> >  10 files changed, 188 insertions(+), 76 deletions(-)

-- 
Regards,

Laurent Pinchart
