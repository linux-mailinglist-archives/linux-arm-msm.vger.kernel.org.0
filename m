Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242AB442247
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 22:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhKAVH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 17:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhKAVH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 17:07:56 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB82CC061764
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 14:05:21 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b13so1233642plg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v746gIRw4x6w6whi0eejVKvGEzFDafBMr3o6GGyDCJ0=;
        b=AWHwBOSzCJlF13ayRM+Lt2V27tz9OejIOGqHJteYh7Z32UaztRaeTSYQFBpDTIPvGi
         KRReYsQ+U99ElLPrAAfm45NwZiRFK9WtR/F3Oq/8K9UnkkuVCHuRq4A4i89yScV7LJLu
         mggGwUrlIxQhxsg6wn02H/6zrd8ZAb9Dw9AoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v746gIRw4x6w6whi0eejVKvGEzFDafBMr3o6GGyDCJ0=;
        b=wUml+seJVRb2EKB+TOl1hWNNUlCDttSX1t0h5nJcvQ9GirBDrXcCtkaYBe4TaUNxab
         AyLPFAFIcC/iGVNbDUy3Hd+yNIeHZ1Rh3Dr0rGoEFvYsgFm0/bIqxv+F3kNaztJ/Vc9o
         UUyndgwTC+rvmitxYQnhw1Q9IqSwUQgc7DdnZyP2/3Z0vNNDYpSgJn6pnrMUWuM9h+XS
         Xyap3ub1CQrzK9aZzboL4ce+mSSM3ySdHcrMtlgBrWKufdg9JyIO801lSSqMoVxpRISm
         5x06i/xTmpX9LUK8dRHRn+d1HQk4doX9yHwC2DLSCZMsVVS4qaKd+wR+uUDUUuXpM+Oh
         kmMQ==
X-Gm-Message-State: AOAM531vBM6kn5OvsMIMNKWie/jW0AFyyaKNxMBS/DyURaatvrOKwhGO
        TS8t9bh3AFoq5/RQO38gFDBhdw==
X-Google-Smtp-Source: ABdhPJxksk3j8H3XPkcNl5tSrZWRHLx2YSenJKmami6yq2fQCYI6CxvKGY6+hZ+UuW2Mw91wGmOESA==
X-Received: by 2002:a17:90b:1d8f:: with SMTP id pf15mr1532052pjb.70.1635800721350;
        Mon, 01 Nov 2021 14:05:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6278:520b:a2e1:4ece])
        by smtp.gmail.com with UTF8SMTPSA id p23sm297902pjg.55.2021.11.01.14.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 14:05:20 -0700 (PDT)
Date:   Mon, 1 Nov 2021 14:05:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 1/5] usb: host: xhci: plat: Add suspend quirk for dwc3
 controller
Message-ID: <YYBWj7sxLIqlql5M@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com>
 <YYA4/rjSN/QvIM+w@google.com>
 <YYBTFxU8biWxNeJ5@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YYBTFxU8biWxNeJ5@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 01, 2021 at 01:50:31PM -0700, Bjorn Andersson wrote:
> On Mon 01 Nov 11:59 PDT 2021, Matthias Kaehlcke wrote:
> 
> > Hi Sandeep,
> > 
> > On Mon, Nov 01, 2021 at 01:23:40PM +0530, Sandeep Maheswaram wrote:
> > > During suspend check if any wakeup capable devices are connected to the
> > > controller (directly or through hubs), and set the wakeup capable property
> > > for xhci plat device.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > ---
> > >  drivers/usb/host/xhci-plat.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > > index c1edcc9..7ab272b 100644
> > > --- a/drivers/usb/host/xhci-plat.c
> > > +++ b/drivers/usb/host/xhci-plat.c
> > > @@ -431,6 +431,14 @@ static int xhci_plat_remove(struct platform_device *dev)
> > >  	return 0;
> > >  }
> > >  
> > > +static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd, struct device *dev)
> > > +{
> > > +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> > > +		device_set_wakeup_capable(dev, true);
> > > +	else
> > > +		device_set_wakeup_capable(dev, false);
> > 
> > IIUC wakeup capability is typically a static property that reflects the
> > actual hardware (or firmware) support for wakeup. In that sense it doesn't
> > seem a good idea to change it dynamically at suspend time, depending on
> > what is connected to the bus. I understand though that the odd split
> > of the dwc3 driver makes it hard to do things properly ...
> > 
> > Earlier in this discussion Felipe suggested to add a function like
> > device_children_wakeup_capable(), to avoid having to call
> > usb_wakeup_enabled_descendants() from the dwc3 drivers.
> > 
> > Below is an initial implementation for device_children_wakeup_capable(),
> > could you try if calling it from dwc3_suspend/resume_common() and
> > dwc3_qcom_suspend() would work instead of relying on the wakeup
> > capability?
> > 
> > Thanks
> > 
> > Matthias
> > 
> > From 97c838334045ed67c3943f8e035ac70acd12b89b Mon Sep 17 00:00:00 2001
> > From: Matthias Kaehlcke <mka@chromium.org>
> > Date: Mon, 1 Nov 2021 11:37:19 -0700
> > Subject: [PATCH] PM / wakeup: Add device_children_wakeup_capable()
> > 
> > Add device_children_wakeup_capable() which checks whether the device itself
> > or one if its descendants is wakeup capable.
> > 
> > Change-Id: Ib359eb5ac8650ddf9889c7d1f77707f50777fe99
> > Suggested-by: Felipe Balbi <balbi@kernel.org>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Looks neat and useful.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!

> (Without the Change-Id of course...)

Sure, I usually use patman to send patches upstream, which filters the
Change-Id if present, forgot to remove it when copying and pasting the
patch manually.
