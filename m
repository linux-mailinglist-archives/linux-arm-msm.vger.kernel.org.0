Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C566E739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 16:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbfGSOPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 10:15:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:59297 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727717AbfGSOPd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 10:15:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jul 2019 07:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; 
   d="scan'208";a="176303842"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with SMTP; 19 Jul 2019 07:15:29 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 19 Jul 2019 17:15:28 +0300
Date:   Fri, 19 Jul 2019 17:15:28 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Sean Paul <sean@poorly.run>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org,
        seanpaul@chromium.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190719141528.GN5942@intel.com>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
 <20190719135558.GC104440@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190719135558.GC104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 19, 2019 at 09:55:58AM -0400, Sean Paul wrote:
> On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
> > On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
> > > On 2019-07-16 02:07, Daniel Vetter wrote:
> > > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
> > > > >     Hello All,
> > > > >     	drm_mode_modeinfo::flags is a 32 bit field currently used to
> > > > >     describe the properties of a connector mode. I see the least order
> > > > 22 bits
> > > > >     are already in use. Posting this RFC to discuss on any potential
> > > > plans to
> > > > >     expand the bit range support of this field for growing mode
> > > > properties and
> > > > >     ways to handle one such property needed by the msm dpu driver.
> > > > > 
> > > > >     msm drivers support panels which can dynamically switch between
> > > > >     video(active) and command(smart) modes. Within video mode, they
> > > > > also
> > > > support
> > > > >     switching between resolutions seamlessly i.e. glitch free
> > > > > resolution
> > > > switch.
> > > > >     But they cannot do a seamless switch from a resolutions from video
> > > > to
> > > > >     command or vice versa. Clients need to be aware for these
> > > > capablities before
> > > > >     they switch between the resolutions. Since these capabilities are
> > > > identified
> > > > >     per drm_mode, we are considering the below two approaches to
> > > > > handle
> > > > this
> > > > >     use case.
> > > > > 
> > > > >     Option 1:
> > > > >     Attached patch adds flag values to associate a drm_mode to
> > > > video/command
> > > > >     mode and to indicate its capability to do a seamless switch.
> > > > > 
> > > > >     Option 2:
> > > > >     drm_mode_modeinfo can expose a new "private_flags" field to handle
> > > > vendor
> > > > >     specific mode flags. Besides the above mentioned use case, we are
> > > > also
> > > > >     expoloring methods to handle some of our display port resolution
> > > > switch use
> > > > >     cases where the DP ports can be operated in a tiled/detiled modes.
> > > > This
> > > > >     approach will provide a standard channel for drm driver vendors
> > > > > for
> > > > their
> > > > >     growing need for drm_mode specific capabilities.
> > > > > 
> > > > >     Please provide your inputs on the options or any upstream friendly
> > > > >     recommendation to handle such custom use cases.
> > > > > 
> > > > >     Thanks and Regards,
> > > > >     Jeykumar S.
> > > > > 
> > > > > Jeykumar Sankaran (1):
> > > > >   drm: add mode flags in uapi for seamless mode switch
> > > > 
> > > > I think the uapi is the trivial part here, the real deal is how
> > > > userspace
> > > > uses this. Can you pls post the patches for your compositor?
> > > > 
> > > > Also note that we already allow userspace to tell the kernel whether
> > > > flickering is ok or not for a modeset. msm driver could use that to at
> > > > least tell userspace whether a modeset change is possible. So you can
> > > > already implement glitch-free modeset changes for at least video mode.
> > > > -Daniel
> > > 
> > > I believe you are referring to the below tv property of the connector.
> > > 
> > > /**
> > >  * @tv_flicker_reduction_property: Optional TV property to control the
> > >  * flicker reduction mode.
> > >  */
> > > struct drm_property *tv_flicker_reduction_property;
> > 
> > Not even close :-)
> > 
> > I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl. This
> > is not a property of a mode, this is a property of a _transition_ between
> > configurations. Some transitions can be done flicker free, others can't.
> 
> Agree that an atomic flag on a commit is the way to accomplish this. It's pretty
> similar to the psr transitions, where we want to reuse most of the atomic
> circuitry, but in a specialized way. We'd also have to be careful to only
> involve the drm objects which are seamless modeset aware (you could imagine
> a bridge chain where the bridges downstream of the first bridge don't care).
> 
> > 
> > There's then still the question of how to pick video vs command mode, but
> > imo better to start with implementing the transition behaviour correctly
> > first.
> 
> Connector property? Possibly a terrible idea, but I wonder if we could [re]use
> the vrr properties for command mode. The docs state that the driver has the
> option of putting upper and lower bounds on the refresh rate.

Not really sure why this needs new props and whatnot. This is kinda what
the i915 "fastset" stuff already does:
1. userspace asks for something to be changed via atomic
2. driver calculates whether a modeset is actually required
3. atomic validates need_modeset() vs. DRM_MODE_ATOMIC_ALLOW_MODESET
4. if (need_modeset) heavyweight_commit() else lightweight_commit()

Ie. why should userspace really care about anything except the
"flickers are OK" vs. "flickers not wanted" thing?

Also what's the benefit of using video mode if your panel supportes
command mode? Can you turn off the memory in the panel and actually
save power that way? And if there is a benefit can't the driver just
automagically switch between the two based on how often things are
getting updated? That would match how eDP PSR already works.

-- 
Ville Syrjälä
Intel
