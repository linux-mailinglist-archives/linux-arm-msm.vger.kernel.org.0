Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7861FD719
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 23:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFQVY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 17:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbgFQVY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 17:24:26 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53786C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 14:24:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h22so1683022pjf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S3t8HV5cD+UvKm/s6OAGKuC+RhY6EhAS3pG0wdNqFYM=;
        b=JmhPPd6Ppf93jZyJoXCw/nFtnxT82g7g2KBVG7QjX29v9wZ6Es+KyR3H/cPvKEK9Rj
         JQooftLg7gV5AKhy6cnR7XCHLKXNdD+lxlpUDPpxVG6Q7FjR87QDocuKzs5gg1MYjhvH
         W7xXkqzHQXFd1oWQ1Lm3Kl4lQbPWmZcPYYB4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S3t8HV5cD+UvKm/s6OAGKuC+RhY6EhAS3pG0wdNqFYM=;
        b=UlJRUesus6gda82hSo39ZIBpseyB/ukUEgZ3wmwZDk5JTWpYoE8tbZff9Y7xBSb4bB
         cJ2UkGvmdyjqcl1RvuLAQARwVGNsqH2/GHYrzHZtxc1zuki48RwHpTE7kFGll9MP8RhX
         ksAr9kdUrmnEtZ7YogtWazUHaZ544V6WofklrhEQ4zOqdQKhrAyV+4p+sK4Zjdb2mM6y
         pfKmrdIubR2imygmEmacv3wb/ugXoCyhOxBqp4DfSVrqGvQnGEflf1jNRC/LQqwxo5Ki
         BhLOusIX0RGmyK8R5OhBA9nWWQeCiIQ5I5kAAZlGUspIZ2BJA7cnWpad/q9IsfFWBZvo
         qJKg==
X-Gm-Message-State: AOAM533fxR2vlYxqVBAyjBvJWcesWheB7gY6MsJjQUbW34t/+gpi9n8O
        4UOGdn9JfuGWaGSdTK9YZ8reBQ==
X-Google-Smtp-Source: ABdhPJzEopqKmH/ntr0d+5pOVr2pEeHy5ZAzJtZ4Umh282ew0jB41M9YvrfWbt8lQd6tE+A69Pcx+w==
X-Received: by 2002:a17:902:bd88:: with SMTP id q8mr845105pls.296.1592429065579;
        Wed, 17 Jun 2020 14:24:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b24sm698787pfo.112.2020.06.17.14.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 14:24:24 -0700 (PDT)
Date:   Wed, 17 Jun 2020 14:24:23 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Make sure core device is fully
 initialized before it is used
Message-ID: <20200617212423.GB4525@google.com>
References: <20200616133734.1.I1902d0d48e4f3d4c5b5f1a2008108a4cd3c5ddb5@changeid>
 <159242335325.62212.8113067612959846891@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <159242335325.62212.8113067612959846891@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Wed, Jun 17, 2020 at 12:49:13PM -0700, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2020-06-16 13:37:37)
> > dwc3_qcom_of_register_core() uses of_platform_populate() to add
> > the dwc3 core device. The driver core will try to probe the device,
> > however this might fail (e.g. due to deferred probing) and
> > of_platform_populate() would still return 0 if the device was
> > successully added to the platform bus. Verify that the core device
> > is actually bound to its driver before using it, defer probing of the
> > dwc3_qcom device if the core device isn't ready (yet).
> > 
> > Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver").
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > depends on:
> >   https://lore.kernel.org/patchwork/patch/1251661/ ("driver core:Export
> >     the symbol device_is_bound")
> > 
> >  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 1dfd024cd06b..5a9036b050c6 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -537,6 +537,16 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> >                 return -ENODEV;
> >         }
> >  
> > +       /*
> > +        * A successful return from of_platform_populate() only guarantees that
> > +        * the core device was added to the platform bus, however it might not
> > +        * be bound to its driver (e.g. due to deferred probing). This driver
> > +        * requires the core device to be fully initialized, so defer probing
> > +        * if it isn't ready (yet).
> > +        */
> > +       if (!device_is_bound(&qcom->dwc3->dev))
> > +               return -EPROBE_DEFER;
> 
> Isn't this still broken? i.e. the dwc3 core driver may bind much later
> and then device_is_bound() will return an error here and then we'll
> return to the caller, dwc3_qcom_probe(), and that will depopulate the
> device with of_platform_depopulate(). It seems like we need to run some
> sort of wait for driver to be bound function instead of a one-shot check
> for the driver being bound.

My understanding is that the probing is done synchronously and either done,
failed or deferred when returning from of_platform_populate(). Ideally we
would be able to differentiate between a failure and deferral, and not defer
probing in case of an error, however I'm not aware of a way to do this with
the current driver framework.

The call flow is:

  of_platform_populate
    of_platform_bus_create
      of_platform_device_create_pdata
        of_device_add
	  device_add
	    bus_probe_device
	      device_initial_probe
	        __device_attach
	          __device_attach_driver
	            driver_probe_device
                      really_probe
                        ->probe()


> Also, what about acpi? That has the same problem but it isn't covered by
> the dwc3_qcom_of_register_core() function.

I wouldn't be surprised if it had the same problem. I'm not familiar with ACPI
though and don't have a device for testing, hence I limited the patch to the
platform device.
