Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912C843770D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbhJVMZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 08:25:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:59396 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232797AbhJVMZ2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 08:25:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="315495986"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="315495986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 05:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="569038517"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by FMSMGA003.fm.intel.com with SMTP; 22 Oct 2021 05:22:58 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 22 Oct 2021 15:22:57 +0300
Date:   Fri, 22 Oct 2021 15:22:57 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Claudio Suarez <cssk@net-c.es>
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 13/13] drm/i915: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Message-ID: <YXKtIUDk+f2Bnn++@intel.com>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es>
 <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain>
 <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa>
 <YXKoMEF/gU98cL9n@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXKoMEF/gU98cL9n@intel.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 22, 2021 at 03:01:52PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 22, 2021 at 12:25:33PM +0200, Claudio Suarez wrote:
> > On Thu, Oct 21, 2021 at 04:49:59PM +0300, Ville Syrjälä wrote:
> > > On Wed, Oct 20, 2021 at 12:51:21AM +0200, Claudio Suarez wrote:
> > > > drm_get_edid() internally calls to drm_connector_update_edid_property()
> > > > and then drm_add_display_info(), which parses the EDID.
> > > > This happens in the function intel_hdmi_set_edid() and
> > > > intel_sdvo_tmds_sink_detect() (via intel_sdvo_get_edid()).
> > > > 
> > > > Once EDID is parsed, the monitor HDMI support information is available
> > > > through drm_display_info.is_hdmi. Retriving the same information with
> > > > drm_detect_hdmi_monitor() is less efficient. Change to
> > > > drm_display_info.is_hdmi
> > > 
> > > I meant we need to examine all call chains that can lead to
> > > .detect() to make sure all of them do in fact update the
> > > display_info beforehand.
> > 
> > Well, I studied it carefully and, yes, all call chains that can lead to
> > drm_display_info.is_hdmi / drm_detect_hdmi_monitor() update display_info
> > beforehand. In the case that this doesn't happen, the code is unchanged.
> > 
> > Do you want I explain the changes in the code here again ? Or do you want
> > to me change the commit message to be more clear ? In the first case, I can
> > write here a detailed explanation. In the second case I can make a longer commit
> > message.
> > 
> > Or both?
> 
> I want all those call chains explained in the commit message,
> otherwise I have no easy way to confirm whether the change
> is correct or not.

Hmm. OK, so I had a bit of a dig around and seems that what we do now
.detect()->drm_get_edid()->drm_connector_update_edid_property()->drm_add_display_info()

Now the question is when did that start happening? Looks like it was
commit 4b4df570b41d ("drm: Update edid-derived drm_display_info fields
at edid property set [v2]") that started to call drm_add_display_info()
from drm_connector_update_edid_property(), and then commit 5186421cbfe2
("drm: Introduce epoch counter to drm_connector") started to call
drm_connector_update_edid_property() from drm_get_edid(). Before both
of those commits were in place display_info would still contain
some stale garbage during .detect().

That is the story I think we want in these commit messages since it
a) explains why the old code was directly parsing the edid instead
b) why it's now safe to change this

PS. connector->force handling in drm_get_edid() looks a bit busted
since it doesn't call drm_connector_update_edid_property() at all
in some cases. I think there might be some path that leads there
anywya if/when we change connector->force, but we should fix
drm_get_edid() to do the right thing regarless.

-- 
Ville Syrjälä
Intel
