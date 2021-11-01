Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242474421E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 21:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhKAUvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 16:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhKAUvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 16:51:22 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523B9C061714
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 13:48:48 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t4so26735548oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kLZlvGuYfD48cZVymavfiR4ir/NsVXyW2QnosTPuKps=;
        b=c4g3rqpdHKuTRwD+snh7K+fGicBlHHzoPlSKNJU7CvA+mQdU2E73tmZYCTZ8Q2cFPd
         ahiPJMT8fmTE9LM2YIGG9mnX1//mciM3G+b9Uv25iR6uUpD0DeEvkjlCdWwcRgwfbZTa
         8+kvGTt6S2ILLVcBmd/mdYNHgypv2K47ip5xENxhageOjOYVuldlE78sLHmZ77urfFpt
         whgP09g1iEQCuIrZTrV9eh436SjwFVBNEGmRCsMub7rQzriBZV0SnWjNvHH03GsI2KBO
         OMfeoRwuuKSyqjfBvjjRANBXUT0YpvqMFRuuQkDDMIDybwJhkuIxLGmD9s0LA5JEO7ek
         bpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kLZlvGuYfD48cZVymavfiR4ir/NsVXyW2QnosTPuKps=;
        b=gZT3l9ABSXU2jq2mhWkoUp8HCVnQ3EiAIpDPJFvitZ6LJZJ1SHgXi7v5fHpsIjGwdU
         OKemLihLGTUPB4Y7v+dRbrhRfXn9wRLsEr8au+G3LOs2XtWPEcO2jyH6pmbQz/O2s0WE
         W2E5jZ++3XH7oHe5gp68oQ7EoQr8JezMD6DJpc5Q7KOVFMj8W2jJBrYeGPzz5WIpZ57a
         AM5S02p28o/ZjMVNA2gqbADWehz/770VFhSD/vIKAUzIwUCZ4B4i+Q29cH24Er0hC53U
         yKvpeuGnVrLOk1WjrHcMm7EaSEuO4WSs+uxc8ffPeIGw4yu9y9fPUFiBjUoM+HSM/CfU
         a6LQ==
X-Gm-Message-State: AOAM533vibAICULcxHrcmIsqvwgqTbsb3jhzDevjKA8LUuB3O0ZXPyrN
        88N0V8PAJQ2ykzOO920Ne4nYmw==
X-Google-Smtp-Source: ABdhPJxyE5t0F0whY4HGQUe45RXybQr7psjtvxGWvIXmCKh04S/x+z4pOJN3feE5PrfnuXCDGj+lIA==
X-Received: by 2002:a05:6808:1885:: with SMTP id bi5mr1188843oib.151.1635799727602;
        Mon, 01 Nov 2021 13:48:47 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t2sm3914558oou.38.2021.11.01.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:48:47 -0700 (PDT)
Date:   Mon, 1 Nov 2021 13:50:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
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
Message-ID: <YYBTFxU8biWxNeJ5@ripper>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com>
 <YYA4/rjSN/QvIM+w@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYA4/rjSN/QvIM+w@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Nov 11:59 PDT 2021, Matthias Kaehlcke wrote:

> Hi Sandeep,
> 
> On Mon, Nov 01, 2021 at 01:23:40PM +0530, Sandeep Maheswaram wrote:
> > During suspend check if any wakeup capable devices are connected to the
> > controller (directly or through hubs), and set the wakeup capable property
> > for xhci plat device.
> > 
> > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > ---
> >  drivers/usb/host/xhci-plat.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index c1edcc9..7ab272b 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -431,6 +431,14 @@ static int xhci_plat_remove(struct platform_device *dev)
> >  	return 0;
> >  }
> >  
> > +static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd, struct device *dev)
> > +{
> > +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> > +		device_set_wakeup_capable(dev, true);
> > +	else
> > +		device_set_wakeup_capable(dev, false);
> 
> IIUC wakeup capability is typically a static property that reflects the
> actual hardware (or firmware) support for wakeup. In that sense it doesn't
> seem a good idea to change it dynamically at suspend time, depending on
> what is connected to the bus. I understand though that the odd split
> of the dwc3 driver makes it hard to do things properly ...
> 
> Earlier in this discussion Felipe suggested to add a function like
> device_children_wakeup_capable(), to avoid having to call
> usb_wakeup_enabled_descendants() from the dwc3 drivers.
> 
> Below is an initial implementation for device_children_wakeup_capable(),
> could you try if calling it from dwc3_suspend/resume_common() and
> dwc3_qcom_suspend() would work instead of relying on the wakeup
> capability?
> 
> Thanks
> 
> Matthias
> 
> From 97c838334045ed67c3943f8e035ac70acd12b89b Mon Sep 17 00:00:00 2001
> From: Matthias Kaehlcke <mka@chromium.org>
> Date: Mon, 1 Nov 2021 11:37:19 -0700
> Subject: [PATCH] PM / wakeup: Add device_children_wakeup_capable()
> 
> Add device_children_wakeup_capable() which checks whether the device itself
> or one if its descendants is wakeup capable.
> 
> Change-Id: Ib359eb5ac8650ddf9889c7d1f77707f50777fe99
> Suggested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Looks neat and useful.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

(Without the Change-Id of course...)

Regards,
Bjorn

> ---
>  drivers/base/power/wakeup.c | 17 +++++++++++++++++
>  include/linux/pm_wakeup.h   |  6 ++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> index 9c0932603642..2aee7fa8230f 100644
> --- a/drivers/base/power/wakeup.c
> +++ b/drivers/base/power/wakeup.c
> @@ -483,6 +483,23 @@ int device_set_wakeup_enable(struct device *dev, bool enable)
>  }
>  EXPORT_SYMBOL_GPL(device_set_wakeup_enable);
>  
> +static int __device_children_wakeup_capable(struct device *dev, void *dummy)
> +{
> +	return device_may_wakeup(dev) ||
> +		device_for_each_child(dev, NULL, __device_children_wakeup_capable);
> +}
> +
> +/**
> + * device_children_wakeup_capable - Check whether a device or one of its descendants is
> + *                                  wakeup capable.
> + * @dev: Device to handle.
> + */
> +bool device_children_wakeup_capable(struct device *dev)
> +{
> +	return __device_children_wakeup_capable(dev, NULL);
> +}
> +EXPORT_SYMBOL_GPL(device_children_wakeup_capable);
> +
>  /**
>   * wakeup_source_not_registered - validate the given wakeup source.
>   * @ws: Wakeup source to be validated.
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index 661efa029c96..a0ca42aac6d6 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -97,6 +97,7 @@ extern int device_wakeup_disable(struct device *dev);
>  extern void device_set_wakeup_capable(struct device *dev, bool capable);
>  extern int device_init_wakeup(struct device *dev, bool val);
>  extern int device_set_wakeup_enable(struct device *dev, bool enable);
> +extern bool device_children_wakeup_capable(struct device *dev);
>  extern void __pm_stay_awake(struct wakeup_source *ws);
>  extern void pm_stay_awake(struct device *dev);
>  extern void __pm_relax(struct wakeup_source *ws);
> @@ -167,6 +168,11 @@ static inline bool device_may_wakeup(struct device *dev)
>  
>  static inline void device_set_wakeup_path(struct device *dev) {}
>  
> +static inline bool device_children_wakeup_capable(struct device *dev)
> +{
> +	return false;
> +}
> +
>  static inline void __pm_stay_awake(struct wakeup_source *ws) {}
>  
>  static inline void pm_stay_awake(struct device *dev) {}
