Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137FF137120
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 16:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgAJP0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 10:26:06 -0500
Received: from mga01.intel.com ([192.55.52.88]:1918 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgAJP0G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 10:26:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 07:26:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; 
   d="scan'208";a="216694447"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga008.jf.intel.com with SMTP; 10 Jan 2020 07:25:56 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 10 Jan 2020 17:25:56 +0200
Date:   Fri, 10 Jan 2020 17:25:56 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct
 drm_driver.get_scanout_position()
Message-ID: <20200110152556.GK13686@intel.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-4-tzimmermann@suse.de>
 <87eew7o73u.fsf@intel.com>
 <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
 <875zhjo1op.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875zhjo1op.fsf@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 03:56:06PM +0200, Jani Nikula wrote:
> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> > Am 10.01.20 um 12:59 schrieb Jani Nikula:
> >> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> The callback struct drm_driver.get_scanout_position() is deprecated in
> >>> favor of struct drm_crtc_helper_funcs.get_scanout_position().
> >>>
> >>> i915 doesn't use CRTC helpers. The patch duplicates the caller
> >>> drm_calc_vbltimestamp_from_scanoutpos() for i915, such that the callback
> >>> function is not needed.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>  drivers/gpu/drm/i915/i915_drv.c |   3 +-
> >>>  drivers/gpu/drm/i915/i915_irq.c | 117 ++++++++++++++++++++++++++++++--
> >>>  drivers/gpu/drm/i915/i915_irq.h |   9 +--
> >>>  3 files changed, 119 insertions(+), 10 deletions(-)
> >> 
> >> Not really enthusiastic about the diffstat in a "cleanup" series.
> >
> > Well, the cleanup is about the content of drm_driver :)
> >
> >> 
> >> I wonder if you could add a generic helper version of
> >> drm_calc_vbltimestamp_from_scanoutpos where you pass the
> >> get_scanout_position function as a parameter. Both
> >> drm_calc_vbltimestamp_from_scanoutpos and the new
> >> i915_calc_vbltimestamp_from_scanoutpos would then be fairly thin
> >> wrappers passing in the relevant get_scanout_position function.
> >
> > Of course. Will be in v2 of the series.
> 
> Please give Ville (Cc'd) a moment before sending v2 in case he wants to
> chime in on this.

Passing the function pointer was one option I considered for this a while
back. Can't remeber what other solutions I condsidered. But I guess I
didn't like any of them enough to make an actual patch.

-- 
Ville Syrjälä
Intel
