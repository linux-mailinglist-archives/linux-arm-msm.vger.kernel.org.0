Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B71F42F6E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 17:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240914AbhJOPVK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 11:21:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:15887 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232267AbhJOPVK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 11:21:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="208731858"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; 
   d="scan'208";a="208731858"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 08:18:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; 
   d="scan'208";a="481724815"
Received: from tzahur-mobl.ger.corp.intel.com (HELO localhost) ([10.251.211.201])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 08:18:37 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/15] drm/i915: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
In-Reply-To: <YWl7D9Qnt/Ysk2JI@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015113713.630119-1-cssk@net-c.es> <20211015113713.630119-16-cssk@net-c.es> <87a6jav4n3.fsf@intel.com> <YWl7D9Qnt/Ysk2JI@intel.com>
Date:   Fri, 15 Oct 2021 18:18:34 +0300
Message-ID: <874k9iuxit.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Oct 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> On Fri, Oct 15, 2021 at 03:44:48PM +0300, Jani Nikula wrote:
>> On Fri, 15 Oct 2021, Claudio Suarez <cssk@net-c.es> wrote:
>> > Once EDID is parsed, the monitor HDMI support information is available
>> > through drm_display_info.is_hdmi. Retriving the same information with
>> > drm_detect_hdmi_monitor() is less efficient. Change to
>> > drm_display_info.is_hdmi where possible.
>> >
>> > This is a TODO task in Documentation/gpu/todo.rst
>> >
>> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_connector.c | 5 +++++
>> >  drivers/gpu/drm/i915/display/intel_connector.h | 1 +
>> >  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
>> >  drivers/gpu/drm/i915/display/intel_sdvo.c      | 3 ++-
>> >  4 files changed, 9 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
>> > index 9bed1ccecea0..3346b55df6e1 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_connector.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_connector.c
>> > @@ -213,6 +213,11 @@ int intel_ddc_get_modes(struct drm_connector *connector,
>> >  	return ret;
>> >  }
>> >  
>> > +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector)
>> > +{
>> > +	return connector->display_info.is_hdmi;
>> > +}
>> > +
>> 
>> A helper like this belongs in drm, not i915. Seems useful in other
>> drivers too.
>
> Not sure it's actually helpful for i915. We end up having to root around
> in the display_info in a lot of places anyway. So a helper for single
> boolean seems a bit out of place perhaps.

*shrug*

Maybe it's just my frustration at the lack of interfaces and poking
around in the depths of nested structs and pointer chasing that's coming
through. You just need to change so many things if you want to later
refactor where "is hdmi" comes from and is stored.

Anyway, if a helper is being added like in this series, I think it
should be one helper in drm, not redundant copies in multiple
drivers. Or we should not have the helper(s) at all. One or the other,
not the worst of both worlds.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
