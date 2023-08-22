Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F737843CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbjHVOTO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235914AbjHVOTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:19:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757FFCCB;
        Tue, 22 Aug 2023 07:19:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA5F899;
        Tue, 22 Aug 2023 16:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692713873;
        bh=eD+izc8bUwwz2t3KEjxTSgEH3H8sNfBmfB49EaZJhI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fzQYYjCGwoZc5rrGoqlGmNRMO1N2fR8QKjJLZifbtjn/Tjz8gCxqRhldk7tChUqdK
         4SDNbfxoAZruiTdT5EQ7KZJ1V4QFdRFjtGQRPBWrCFd9uRkaXEfjPohgb1+4xMEY+g
         IfbEtUmVOcXl+anMb9m+znZpREosOtYcv2UnX55I=
Date:   Tue, 22 Aug 2023 17:19:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Message-ID: <20230822141918.GB14396@pendragon.ideasonboard.com>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822141735.GA14396@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 22, 2023 at 05:17:37PM +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patches.
> 
> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > similar boilerplate code for such bridges.
> 
> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> handled as one, especially if it's completely transparent ?
> 
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device.
> 
> Can't device links help avoiding defer probing in those cases ?
> 
> > Last, but not least, this results in the the internal knowledge of DRM
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> 
> Why so ? The PHY subsystem should provide a PHY, without considering
> what subsystem it will be used by. This patch series seems to me to
> actually create this DRM dependency in other subsystems,

I was wrong on this one, there are indeed existing drm_bridge instances
in drivers/usb/ and drivers/phy/. That's certainly not nice. Why do we
even need drm_bridge there, why can't the PHYs be acquired by their
consumers in DRM (and anywhere else) using the PHY API ?

> which I don't
> think is a very good idea. Resources should be registered in their own
> subsystem with the appropriate API, not in a way that is tied to a
> particular consumer.
> 
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge. During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
> 
> I'm not thrilled :-( Let's discuss the questions above first.
> 
> > Proposed merge strategy: immutable branch with the drm commit, which is
> > then merged into PHY and USB subsystems together with the corresponding
> > patch.
> > 
> > Changes since v3:
> >  - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> >  - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> >  - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> >  - Added missing kfree and ida_free (Dan Carpenter)
> > 
> > Changes since v2:
> >  - ifdef'ed bridge->of_node access (LKP)
> > 
> > Changes since v1:
> >  - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> > 
> > Dmitry Baryshkov (3):
> >   drm/bridge: add transparent bridge helper
> >   phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >   usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> > 
> >  drivers/gpu/drm/bridge/Kconfig            |   9 ++
> >  drivers/gpu/drm/bridge/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
> >  drivers/phy/qualcomm/Kconfig              |   2 +-
> >  drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
> >  drivers/usb/typec/mux/Kconfig             |   2 +-
> >  drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
> >  include/drm/bridge/aux-bridge.h           |  19 ++++
> >  8 files changed, 167 insertions(+), 86 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> >  create mode 100644 include/drm/bridge/aux-bridge.h

-- 
Regards,

Laurent Pinchart
