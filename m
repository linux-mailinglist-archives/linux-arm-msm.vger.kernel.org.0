Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F3146BB05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 13:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhLGM3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 07:29:42 -0500
Received: from mga06.intel.com ([134.134.136.31]:21863 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231718AbhLGM3m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 07:29:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="298359149"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="298359149"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 04:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="657661600"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 07 Dec 2021 04:26:06 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Dec 2021 14:26:05 +0200
Date:   Tue, 7 Dec 2021 14:26:05 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Imre Deak <imre.deak@intel.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
References: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
 <Ya6PTGN4zaZ8RD9K@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya6PTGN4zaZ8RD9K@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Hans and Imre

On Mon, Dec 06, 2021 at 02:31:40PM -0800, Bjorn Andersson wrote:
> On Thu 07 Oct 03:17 PDT 2021, Heikki Krogerus wrote:
> > On Wed, Oct 06, 2021 at 01:26:35PM -0700, Prashant Malani wrote:
> > > (CC+ Heikki)
> [..]
> > > On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
> [..]
> >         void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
> > 
> > If your USB Type-C controller/port driver does not yet register the DP
> > alt mode, the it's responsible of handling HPD separately by calling
> > drm_connector_oob_hotplug_event() on its own.
> > 
> 
> Finally found my way back to this topic and it doesn't look like I can
> reuse the existing altmode code with the firmware interface provided by
> Qualcomm, so  I just hacked something up that invokes
> drm_connector_oob_hotplug_event().
> 
> But I'm not able to make sense of what the expected usage is. Reading
> altmode/displayport.c, it seems that I should only invoke
> drm_connector_oob_hotplug_event() as HPD state toggles.
> 
> I made a trial implementation of this, where my firmware interface
> driver calls drm_connector_oob_hotplug_event() every time HPD state
> changes and then in my oob_hotplug_event callback I flip the DP
> controller between on and off.
> 
> Unfortunately when I then connect my HDMI dongle, I get HPD state HIGH,
> call the oob_hotplug_event, the DP driver powers up and concludes that
> there's nothing connected to the dongle and goes to idle. I then connect
> the HDMI cable to the dongle, the firmware sends me another message with
> HPD irq and state HIGH, which I ignore because it's not a change in
> state.
> 
> In the end I hacked up drm_connector_oob_hotplug_event() to allow me to
> pass the HPD state and this solves my problem. I can now distinguish
> between connect, disconnect and attention.
> 
> Can you please help shed some light on what I might be missing?

Originally I wanted an API that we could use to pass all the details
that we have in the USB Type-C drivers (that would be the
configuration and status) to the GPU drivers, but Hans was against
that because, if I remember correctly, the OOB hotplug event may need
to be delivered to the GPU drivers in some cases even when the
connector is not USB Type-C connector, and he wanted a common API.
Hans, please correct me if I got it wrong.

I think that the GPU drivers need to handle USB Type-C connectors
separately one way or the other, but maybe the notification from the
connector can continue to be generic - not USB Type-C specific.

Imre proposed that the GPU drivers should be able to query the
DisplayPort configuration and status from the USB Type-C drivers
instead of the USB Type-C drivers just dumping the information
together with the notification about some event (so connection,
disconnection or attention) like I originally proposed. Imre, please
correct me if I misunderstood you :-).

I'm fine with anything, but we do need improvement here as you guys
can see.

thanks,

-- 
heikki
