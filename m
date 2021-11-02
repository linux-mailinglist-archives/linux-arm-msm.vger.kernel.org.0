Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3819442E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 13:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKBNBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 09:01:31 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:40424 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231314AbhKBNBa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 09:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1635857790; bh=CxtE17YE8bTxc2OZMsovWXK3+dSK0SB9WZtSH2RbPug=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=aXtmxAY1SH2wPjJvfHmAvgVeCVrMuJ6syrBNDNUerpV/YLeEqhs5miXhGUOqDZG5t
         r7lWYCaq7pBEeKveN4Tu42NfydGmsF5X4KWqaHj++7GbM27PJqfoCESSq5WX5BOVWK
         NNx4WNbtT4n3PE7H+vgLavkHmkcW2dCaKn8zDZ+Y=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Tue,  2 Nov 2021 13:56:30 +0100 (CET)
X-EA-Auth: YdEHunKGztPDVs0BRuuYltTcf81Ut8uI6tAipFjzxRq1G8jzqA4E913inzbs1+c4T8oxY2G5RSvtViKvlHZ3omj5ufd2PEoZ
Date:   Tue, 2 Nov 2021 13:56:27 +0100
From:   Claudio Suarez <cssk@net-c.es>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
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
Subject: Re: [PATCH v3 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YYE1ezTN/O+4S/vt@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es>
 <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain>
 <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa>
 <YXKoMEF/gU98cL9n@intel.com>
 <YXKtIUDk+f2Bnn++@intel.com>
 <YXXbgWNHts9CMJXD@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXXbgWNHts9CMJXD@gineta.localdomain>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 25, 2021 at 12:17:37AM +0200, Claudio Suarez wrote:
[...]

No new comments about this, I suppose everything is fine.

I'm going to send the patch with this changes. Thanks to all and
special thanks to you, Ville. Hope this helps the kernel.
Don't hesitate to ask new changes if necessary.

Best regards
Claudio Suarez



