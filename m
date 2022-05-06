Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EB151DDEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 18:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443967AbiEFQzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 12:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389290AbiEFQze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 12:55:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FC266AE6
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 09:51:49 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 202so6549006pgc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8CjPh+bfg9FeD4L33j+vl0as/9NZnd8bSEbyXP8g7WM=;
        b=Hmb66AOkOay154HlbmrZiCSrPZhss1uyez/WWDvOU1oYt4IH/+ZcEiBDia0jEf1SpT
         ENKTAoBFILmVfQgb7K/+vOcsUbe5WUIlXIr8x6J8wOcDvo2wfiIyG2hP2ko5zymHscYB
         YT6hd2RpFiQVZQoZaFfWe06fyCbLvU4RmbfSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8CjPh+bfg9FeD4L33j+vl0as/9NZnd8bSEbyXP8g7WM=;
        b=kIbVEyDelkVOMhVEQHZ3nkLIMQ2+/xLZZV5EKTLBqP5HU0KquoDrdWm/jIBiFgtYXQ
         gHn9PPGy1lMjXwr5zTs/UsX3H/L69vdJ5ckozKtOSBQIsNbiIIjdNH12FOEryjTnwVHU
         S6Xt+okUiETMt0OGMBe5djdrBwlp8LCp8i+OSIcJuvhEEz6sbtQwtX63e0Jfb/uqKXb+
         2GuzMdCWtkN9a3mla9hxwTTtE3MaDjd14WZt08QUAWVVHF0SDXfa+b8M+bdOG76SUWM+
         h2+uOXWR9TzC4MUCj2wbt2d6cMTd1WsenysIYHkU+zcQmflPzCvMg+eTQKQTUvHenAHo
         DYaA==
X-Gm-Message-State: AOAM530PPfi2kIm/gr7EcppbvsoDo4Q1B2+NxN9a39osPsdfRe+o7/w1
        wKLxoaQln1IszrUcrHbeLrYoTA==
X-Google-Smtp-Source: ABdhPJxgMQ1i3BHka8S2fWHqHyjIQLDycbKmqf5OsGqno4rWYcWYXY5wJezWWIGw+N85L117g6Iauw==
X-Received: by 2002:a63:2c8a:0:b0:3c5:f760:2e36 with SMTP id s132-20020a632c8a000000b003c5f7602e36mr3494211pgs.372.1651855909179;
        Fri, 06 May 2022 09:51:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5605:d5cd:699b:1b26])
        by smtp.gmail.com with UTF8SMTPSA id u10-20020a170902e80a00b0015e8d4eb24asm2111268plg.148.2022.05.06.09.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 09:51:48 -0700 (PDT)
Date:   Fri, 6 May 2022 09:51:46 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_vpulyala@quicinc.com
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnVSIvwXsKySg33M@google.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-4-git-send-email-quic_kriskura@quicinc.com>
 <YnRUPxBZB55TPmf2@google.com>
 <a83dea08-0920-17e6-ec1c-f9d8a490a08d@quicinc.com>
 <20220506051448.GE4640@hu-pkondeti-hyd.qualcomm.com>
 <YnVD+ltiQhKE+jPf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YnVD+ltiQhKE+jPf@google.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 06, 2022 at 08:51:22AM -0700, Matthias Kaehlcke wrote:
> On Fri, May 06, 2022 at 10:44:48AM +0530, Pavan Kondeti wrote:
> > On Fri, May 06, 2022 at 10:41:01AM +0530, Krishna Kurapati PSSNV wrote:
> > > 
> > > On 5/6/2022 4:18 AM, Matthias Kaehlcke wrote:
> > > >On Thu, May 05, 2022 at 02:26:10PM +0530, Krishna Kurapati wrote:
> > > >>From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > >>
> > > >>During suspend read the status of all port and set hs phy mode
> > > >>based on current speed. Use this hs phy mode to configure wakeup
> > > >>interrupts in qcom glue driver.
> > > >>
> > > >>Check wakeup-source property for dwc3 core node to set the
> > > >>wakeup capability. Drop the device_init_wakeup call from
> > > >>runtime suspend and resume.
> > > >>
> > > >>Also check during suspend if any wakeup capable devices are
> > > >>connected to the controller (directly or through hubs), if there
> > > >>are none set a flag to indicate that the PHY is powered
> > > >>down during suspend.
> > > >>
> > > >>Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > >>Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > >>---
> > > >>  drivers/usb/dwc3/core.c | 33 ++++++++++++++++++++-------------
> > > >>  drivers/usb/dwc3/core.h |  4 ++++
> > > >>  drivers/usb/dwc3/host.c | 24 ++++++++++++++++++++++++
> > > >>  3 files changed, 48 insertions(+), 13 deletions(-)
> > > >>
> > > >>diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > >>index 950e238..cf377f5 100644
> > > >>--- a/drivers/usb/dwc3/core.c
> > > >>+++ b/drivers/usb/dwc3/core.c
> > > >>@@ -33,6 +33,7 @@
> > > >>  #include <linux/usb/gadget.h>
> > > >>  #include <linux/usb/of.h>
> > > >>  #include <linux/usb/otg.h>
> > > >>+#include <linux/usb/hcd.h>
> > > >This is not needed anymore
> > > >
> > > >>  #include "core.h"
> > > >>  #include "gadget.h"
> > > >>@@ -1787,6 +1788,7 @@ static int dwc3_probe(struct platform_device *pdev)
> > > >>  	platform_set_drvdata(pdev, dwc);
> > > >>  	dwc3_cache_hwparams(dwc);
> > > >>+	device_init_wakeup(&pdev->dev, of_property_read_bool(dev->of_node, "wakeup-source"));
> > > >>  	spin_lock_init(&dwc->lock);
> > > >>  	mutex_init(&dwc->mutex);
> > > >>@@ -1936,6 +1938,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > > >>  {
> > > >>  	unsigned long	flags;
> > > >>  	u32 reg;
> > > >>+	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
> > > >This isn't used anymore, delete it
> > > My bad, Will fix this in next version.
> > > >>  	switch (dwc->current_dr_role) {
> > > >>  	case DWC3_GCTL_PRTCAP_DEVICE:
> > > >>@@ -1948,10 +1951,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > > >>  		dwc3_core_exit(dwc);
> > > >>  		break;
> > > >>  	case DWC3_GCTL_PRTCAP_HOST:
> > > >>-		if (!PMSG_IS_AUTO(msg)) {
> > > >>-			dwc3_core_exit(dwc);
> > > >>-			break;
> > > >>-		}
> > > >>+		dwc3_check_phy_speed_mode(dwc);
> > > >>  		/* Let controller to suspend HSPHY before PHY driver suspends */
> > > >>  		if (dwc->dis_u2_susphy_quirk ||
> > > >>@@ -1967,6 +1967,16 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > > >>  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
> > > >>  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
> > > >>+
> > > >>+		if (!PMSG_IS_AUTO(msg)) {
> > > >>+			if (device_may_wakeup(dwc->dev) &&
> > > >>+					device_wakeup_path(dwc->dev)) {
> > > >nit: the indentation is odd, align it with device_may_wakeup()?
> > > Sure, Will take care of it.
> > > >>+				dwc->phy_power_off = false;
> > > >>+			} else {
> > > >>+				dwc->phy_power_off = true;
> > > >>+				dwc3_core_exit(dwc);
> > > >As commented earlier, taking the controller and PHYs completely down causes a
> > > >significant power draw in some USB clients. Let's clarify what the specific
> > > >benefits are of doing dwc3_core_exit() vs. entering a low power mode.
> > > Sure, once we come to a conclusion on this, I will refresh the patches.
> > 
> > I think, Matthias is asking you to clarify in the commit description. we can
> > even quote Matthias observations.
> 
> Actually I would like to have a discussion about the benefits of powering down
> the controller and PHYs vs. entering a low power state. Maybe there are good
> reasons for powering everything down (e.g. significant power savings), but
> as we have seen there are also significant downsides, so let's make sure
> we understand both.

I found this, as I commented on the other thread:

  commit c4a5153e87fdf6805f63ff57556260e2554155a5
  Author: Manu Gautam <mgautam@codeaurora.org>
  Date:   Thu Jan 18 16:54:30 2018 +0530

  usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode

  Commit 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during
  host bus-suspend/resume") updated suspend/resume routines to not
  power_off and reinit PHYs/core for host mode.
  It broke platforms that rely on DWC3 core to power_off PHYs to
  enter low power state on system suspend.

  Perform dwc3_core_exit/init only during host mode system_suspend/
  resume to addresses power regression from above mentioned patch
  and also allow USB session to stay connected across
  runtime_suspend/resume in host mode. While at it also replace
  existing checks for HOST only dr_mode with current_dr_role to
  have similar core driver behavior for both Host-only and DRD+Host
  configurations.

  Fixes: 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during host bus-suspend/resume")
  Reviewed-by: Roger Quadros <rogerq@ti.com>
  Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
  Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>


So apparently powering off the core and PHYs is needed on some
platforms.

Let's move forward with the core/PHYs off for now and try to
come up with a solution (e.g. a DT property that indicates
that the core/PHYs can remain powererd) in a separate
patch/series.
