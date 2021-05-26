Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA89F39101C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 07:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhEZFsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 01:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhEZFsU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 01:48:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58489606A5;
        Wed, 26 May 2021 05:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622008009;
        bh=ilgmusErlwIFJYQRA3ardBcRg28msFxATNE31YLfrxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=It70ferE7CzZH35zUGnfY4vR7J2/q46na1wowciyqZDlCYeFhcGLU9Sgb0CDo/Soz
         2nT1Lt2PnTH50AKmMkS4MfZ1TvhcmNgNDNuGZ/UZ5/6RCBG+puDp3yiTMp0I2ADz5J
         A5m67QniO9tSXr8PNiYJ4yAJFZXpK+s/VJhtqYDF4PuEJyoeNDRx8zqQ6aLjM7yD4T
         3qPw6wRgU3eGFrn91k2CNcC3EYrkfNKj7WxKb2zHGznt8+L5ZNoF3G3xfwL4QhKDw5
         igyepZ7OO4SodAXOVA7ZCFziFLjSrIz6uawXkFc4nKQtjO9EtymWg479xlUVTEyZ3L
         rTUh2Mgcom8Dw==
Date:   Wed, 26 May 2021 11:16:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, DTML <devicetree@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
Message-ID: <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Jeff,

On 21-05-21, 08:09, Jeffrey Hugo wrote:
> On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Display Stream Compression (DSC) compresses the display stream in host which
> > is later decoded by panel. This series enables this for Qualcomm msm driver.
> > This was tested on Google Pixel3 phone which use LGE SW43408 panel.
> >
> > The changes include adding DT properties for DSC then hardware blocks support
> > required in DPU1 driver and support in encoder. We also add support in DSI
> > and introduce required topology changes.
> >
> > In order for panel to set the DSC parameters we add dsc in drm_panel and set
> > it from the msm driver.
> >
> > Complete changes which enable this for Pixel3 along with panel driver (not
> > part of this series) and DT changes can be found at:
> > git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
> >
> > Comments welcome!
> 
> This feels backwards to me.  I've only skimmed this series, and the DT
> changes didn't come through for me, so perhaps I have an incomplete
> view.

Not sure why, I see it on lore:
https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/

> DSC is not MSM specific.  There is a standard for it.  Yet it looks
> like everything is implemented in a MSM specific way, and then pushed
> to the panel.  So, every vendor needs to implement their vendor
> specific way to get the DSC info, and then push it to the panel?
> Seems wrong, given there is an actual standard for this feature.

I have added slice and bpp info in the DT here under the host and then
pass the generic struct drm_dsc_config to panel which allows panel to
write the pps cmd

Nothing above is MSM specific.. It can very well work with non MSM
controllers too.

I didn't envision DSC to be a specific thing, most of
the patches here are hardware enabling ones for DSC bits for MSM
hardware.

> Additionally, we define panel properties (resolution, BPP, etc) at the
> panel, and have the display drivers pull it from the panel.  However,
> for DSC, you do the reverse (define it in the display driver, and push
> it to the panel).  If the argument is that DSC properties can be
> dynamic, well, so can resolution.  Every panel for MSM MTPs supports
> multiple resolutions, yet we define that with the panel in Linux.

I dont have an answer for that right now, to start with yes the
properties are in host but I am okay to discuss this and put wherever we
feel is most correct thing.  I somehow dont like that we should pull
from panel DT and program host with that. Here using struct
drm_dsc_config allows me to configure panel based on resolution passed

> Finally, I haven't seen the DT bits, but I'm concerned about using DT
> for this.  It inherently excludes ACPI systems.  You appear to have
> sdm845 support in this series, but what about ACPI boot on the Lenovo
> C630 for example?  Or any of the 8cx laptops?  We don't read the panel
> resolution, etc from DT, so why the DSC?

But you must read from somewhere like ACPI tables. I think ACPI systems
would have some ACPI table info out there which would help on this.
Yes that is another task which we need to start with once we enable OF
systems.

Thanks
-- 
~Vinod
