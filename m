Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5689937EE35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 00:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346339AbhELVND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 17:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378784AbhELTRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 15:17:51 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E9FC06124F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 12:12:30 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x188so19319957pfd.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 12:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D4zra+2OcqLeXBKvPEfQ+zldqDvc4Lb04WXOVxk+t7s=;
        b=JWHHEVS5nCGdCEZURurGEYLRNNXVXUG738rX1fWuCafwFTzCliVgm9lgg6Bnw/Qj10
         GnY+2HlD5LoE6V6UhVfiz06hWvjjxirXJEFQx7tm4oxBU1dm3bm9N8TjnaTJn9tI4hsL
         qQwKh+0QMUcBR2KzJ+M1BKuUT9BKjLeaEWL94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D4zra+2OcqLeXBKvPEfQ+zldqDvc4Lb04WXOVxk+t7s=;
        b=QNEP4OtNugdeocUMlj1F7aX2uFMnMKsGJDYjUty3i9eg0cCaFG/K5X9x+d7bqirVwl
         uI8dVoIPeIoFzYcYgduz4msVLBhFdAFNLo8ddGd0X18LQLAx+iT1UdvDKhKYOg8C30bO
         HnaH9rTuqlBkX+n81u+2o8cY+/5E4Vm+K72vT/Eu8JQ0afw/Nv5ldvyGUGWXWqSzMNJt
         aCCS2t/05LgUp5PVni+jt5RRg9Y2AIJ7kuBXWpopKjgkSSO2UTx2OSHBLuCNLKBc976N
         naPhci5ss+SDpLh9DFGPG1gCZGRbTfaIiNULXzXymXMC7pfxYJ/Kyqv3KzteeixmJMYG
         6e2Q==
X-Gm-Message-State: AOAM533WC3lK6K+jzuFGWuHssvo32ATaKkoAFYFdq9djL79KNEEv5rrP
        0LVpolmw5LvPnf2zk9hBKDExdQ==
X-Google-Smtp-Source: ABdhPJykVjZEJ1xEZyXdu11r8zsTbD/6AB5b0X6vdDk11oVIuICCbksL/S4dmlwsDNEVd2hmNTK08w==
X-Received: by 2002:aa7:8503:0:b029:27d:497f:1da6 with SMTP id v3-20020aa785030000b029027d497f1da6mr37664610pfn.28.1620846750001;
        Wed, 12 May 2021 12:12:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:a89e:5bb2:e8e0:4428])
        by smtp.gmail.com with UTF8SMTPSA id t4sm473715pfq.165.2021.05.12.12.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 12:12:29 -0700 (PDT)
Date:   Wed, 12 May 2021 12:12:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 1/5] usb: dwc3: host: Set PHY mode during suspend
Message-ID: <YJwommGqKVeMdXth@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
 <87tunqka2e.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tunqka2e.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 28, 2021 at 12:55:21PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> > During suspend read the status of all port and make sure the PHYs
> > are in the correct mode based on current speed.
> > Phy interrupt masks are set based on this mode. Keep track of the mode
> > of the HS PHY to be able to configure wakeup properly.
> >
> > Also check during suspend if any wakeup capable devices are
> > connected to the controller (directly or through hubs), if there
> > are none set a flag to indicate that the PHY should be powered
> > down during suspend.
> >
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/core.h |  3 +++
> >  drivers/usb/dwc3/host.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index b1e875c..cecd278 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -1123,6 +1123,9 @@ struct dwc3 {
> >  
> >  	bool			phys_ready;
> >  
> > +	unsigned int            hs_phy_mode;
> > +	bool			phy_power_off;
> > +
> >  	struct ulpi		*ulpi;
> >  	bool			ulpi_ready;
> >  
> > diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> > index f29a264..527f04c 100644
> > --- a/drivers/usb/dwc3/host.c
> > +++ b/drivers/usb/dwc3/host.c
> > @@ -11,6 +11,14 @@
> >  #include <linux/platform_device.h>
> >  
> >  #include "core.h"
> > +#include "../host/xhci.h"
> > +#include "../host/xhci-plat.h"
> > +
> > +static int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
> > +
> > +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
> > +	.suspend_quirk = xhci_dwc3_suspend_quirk,
> > +};
> 
> we're passing data using device_properties, why do you want this here?
> 
> > @@ -115,6 +123,13 @@ int dwc3_host_init(struct dwc3 *dwc)
> >  		}
> >  	}
> >  
> > +	ret = platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
> > +			sizeof(struct xhci_plat_priv));
> > +	if (ret) {
> > +		dev_err(dwc->dev, "failed to add data to xHCI\n");
> > +		goto err;
> > +	}
> > +
> >  	ret = platform_device_add(xhci);
> >  	if (ret) {
> >  		dev_err(dwc->dev, "failed to register xHCI device\n");
> > @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
> >  	return ret;
> >  }
> >  
> > +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
> > +{
> > +
> > +	int i, num_ports;
> > +	u32 reg;
> > +	unsigned int ss_phy_mode = 0;
> > +	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
> > +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> > +
> > +	dwc->hs_phy_mode = 0;
> > +
> > +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> > +	num_ports = HCS_MAX_PORTS(reg);
> 
> there's a big assumption here that xhci is still alive. Why isn't this
> quirk implemented in xhci-plat itself?

That should work for determining which types of devices are connected to
the PHYs, however IIUC the xhci-plat doesn't know about the PHY topology.
Are you suggesting to move that info into the xhci-plat driver so that it
can set the corresponding PHY modes?
