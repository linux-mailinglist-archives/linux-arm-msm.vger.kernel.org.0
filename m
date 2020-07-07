Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530B9217309
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 17:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727886AbgGGPw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 11:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgGGPw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 11:52:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32271C08C5E2
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 08:52:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 1so902636pfn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EeGA6LB+HFNkoLBVE4aTa5jOaOZtyplY9EK/jYR+rwc=;
        b=EMBq4R+0mEDvZ7sRMtIfaF8ZuLJ3wFPsdDywqeXwC4hmnDilo7dwuI4m002cYiZAN9
         59/TTSsVyEKSFLGOUt+yzETCuqkrNl23eN0wOqnZnuT1i4Su6X4d8wzaTl0yQekNpkOO
         MWO49LZXRE49hAWtZSZaw2Jvkb0IucDFk2AUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EeGA6LB+HFNkoLBVE4aTa5jOaOZtyplY9EK/jYR+rwc=;
        b=sOUtCJdbKe7uS0LnyE55SKwCwRpEa85vmBuLG8yHAtsY5BzmhiZSZ9VGz0EuDUiij0
         +FTZY4twz6kKH62TlZsWRKxqXRdFewAJGbwas/xXzLJgQSVAUuqeTMEwBCq597zNvBlm
         6pIbktEeoV5T+TtA/GIYBpXrKdam+U4MldL/XxjpEloCfKoVIdC3A0yDKGdAbLKvQfZh
         snUcU5XrWT9SRn70FtXLZ2H1uQAc15c9SXq0szBG01BdKVhYYrCLb48nqq1BioDF/hAe
         cPh9QfmE9DsmADFQnAfs7Vf5NbaxTQLbrVM7pjVpcuXNloP/VtIeGquCOQcxQR//KYbt
         sLEA==
X-Gm-Message-State: AOAM531mKLU2q8TFlpd3XB2bVvFDBaNHw6uAnyXMEkAsN/T7dks9UBbQ
        BaYfsbchwjcZUB9oysM+7gL/Kw==
X-Google-Smtp-Source: ABdhPJwUKNNTZYK5tBGW2Vv+Xe/QTNA+mJCAgDGfed/vc07mJGvi2gMNFdtmPG0f5fhEyxjD36QY7g==
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr36538494pgb.56.1594137147111;
        Tue, 07 Jul 2020 08:52:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id t19sm1345287pgg.19.2020.07.07.08.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 08:52:26 -0700 (PDT)
Date:   Tue, 7 Jul 2020 08:52:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200707155225.GH3191083@google.com>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
 <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
 <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
 <20200615194239.GW4525@google.com>
 <3f8fcb0e-387d-e902-9f6b-1fde9d6ae404@codeaurora.org>
 <20200616203849.GY4525@google.com>
 <20200630224243.GH39073@google.com>
 <8ac28471-7c0a-1850-6560-50da0d734445@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ac28471-7c0a-1850-6560-50da0d734445@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 07, 2020 at 10:41:24AM +0530, Sandeep Maheswaram (Temp) wrote:
> 
> On 7/1/2020 4:12 AM, Matthias Kaehlcke wrote:
> > On Tue, Jun 16, 2020 at 01:38:49PM -0700, Matthias Kaehlcke wrote:
> > > On Tue, Jun 16, 2020 at 10:22:47AM +0530, Sandeep Maheswaram (Temp) wrote:
> > > > On 6/16/2020 1:12 AM, Matthias Kaehlcke wrote:
> > > > > On Thu, Jun 04, 2020 at 04:16:31AM -0700, Stephen Boyd wrote:
> > > > > > Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
> > > > > > > On 6/3/2020 11:06 PM, Stephen Boyd wrote:
> > > > > > > > Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
> > > > > > > > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > > > > index 1dfd024..d33ae86 100644
> > > > > > > > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > > > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > > > > @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
> > > > > > > > >            return 0;
> > > > > > > > >     }
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> > > > > > > > > + * @qcom:                      Pointer to the concerned usb core.
> > > > > > > > > + *
> > > > > > > > > + */
> > > > > > > > > +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> > > > > > > > > +{
> > > > > > > > > +       struct device *dev = qcom->dev;
> > > > > > > > > +       int ret;
> > > > > > > > > +
> > > > > > > > > +       if (!device_is_bound(&qcom->dwc3->dev))
> > > > > > > > > +               return -EPROBE_DEFER;
> > > > > > > > How is this supposed to work? I see that this was added in an earlier
> > > > > > > > revision of this patch series but there isn't any mention of why
> > > > > > > > device_is_bound() is used here. It would be great if there was a comment
> > > > > > > > detailing why this is necessary. It sounds like maximum_speed is
> > > > > > > > important?
> > > > > > > > 
> > > > > > > > Furthermore, dwc3_qcom_interconnect_init() is called by
> > > > > > > > dwc3_qcom_probe() which is the function that registers the device for
> > > > > > > > qcom->dwc3->dev. If that device doesn't probe between the time it is
> > > > > > > > registered by dwc3_qcom_probe() and this function is called then we'll
> > > > > > > > fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
> > > > > > > > qcom->dwc3->dev device from the platform bus because we call
> > > > > > > > of_platform_depopulate() on the error path of dwc3_qcom_probe().
> > > > > > > > 
> > > > > > > > So isn't this whole thing racy and can potentially lead us to a driver
> > > > > > > > probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
> > > > > > > > and we're trying to time it just right so that driver for dwc3 binds
> > > > > > > > before we setup interconnects? I don't know if dwc3 can communicate to
> > > > > > > > the wrapper but that would be more of a direct way to do this. Or maybe
> > > > > > > > the wrapper should try to read the DT property for maximum speed and
> > > > > > > > fallback to a worst case high bandwidth value if it can't figure it out
> > > > > > > > itself without help from dwc3 core.
> > > > > > > > 
> > > > > > > This was added in V4 to address comments from Matthias in V3
> > > > > > > 
> > > > > > > https://patchwork.kernel.org/patch/11148587/
> > > > > > > 
> > > > > > Yes, that why I said:
> > > > > > 
> > > > > > "I see that this was added in an earlier
> > > > > >    revision of this patch series but there isn't any mention of why
> > > > > >    device_is_bound() is used here. It would be great if there was a comment
> > > > > >    detailing why this is necessary. It sounds like maximum_speed is
> > > > > >    important?"
> > > > > > 
> > > > > > Can you please respond to the rest of my email?
> > > > > I agree with Stephen that using device_is_bound() isn't a good option
> > > > > in this case, when I suggested it I wasn't looking at the big picture
> > > > > of how probing the core driver is triggered, sorry about that.
> > > > > 
> > > > > Reading the speed from the DT with usb_get_maximum_speed() as Stephen
> > > > > suggests would be an option, the inconvenient is that we then
> > > > > essentially require the property to be defined, while the core driver
> > > > > gets a suitable value from hardware registers. Not sure if the wrapper
> > > > > driver could read from the same registers.
> > > > > 
> > > > > One option could be to poll device_is_bound() for 100 ms (or so), with
> > > > > sleeps between polls. It's not elegant but would probably work if we
> > > > > don't find a better solution.
> > > > if (np)
> > > >          ret = dwc3_qcom_of_register_core(pdev);
> > > >      else
> > > >          ret = dwc3_qcom_acpi_register_core(pdev);
> > > > 
> > > >      if (ret) {
> > > >          dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> > > >          goto depopulate;
> > > >      }
> > > > 
> > > >      ret = dwc3_qcom_interconnect_init(qcom);
> > > >      if (ret)
> > > >          goto depopulate;
> > > > 
> > > >      qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
> > > > 
> > > > Before calling dwc3_qcom_interconnect_init we are checking
> > > > 
> > > >      if (ret) {
> > > >          dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> > > >          goto depopulate;
> > > >      }
> > > > 
> > > > Doesn't  this condition confirm the core driver is probed?
> > > Not really:
> > > 
> > > // called under the hood by of_platform_populate()
> > > static int really_probe(struct device *dev, struct device_driver *drv)
> > > {
> > > 	...
> > > 
> > > 	if (dev->bus->probe) {
> > > 		ret = dev->bus->probe(dev);
> > > 		if (ret)
> > > 			goto probe_failed;
> > > 	} else if (drv->probe) {
> > > 		ret = drv->probe(dev);
> > > 	        if (ret)
> > > 	       		goto probe_failed;
> > >          }
> > > 
> > > 	...
> > > 
> > > probe_failed:
> > > 	...
> > > 
> > > 	/*
> > >           * Ignore errors returned by ->probe so that the next driver can try
> > >           * its luck.
> > >           */
> > >          ret = 0;
> > > 
> > > 	...
> > > 
> > > 	return ret;
> > > }
> > > 
> > > As a result of_platform_populate() in dwc3_qcom_of_register_core()
> > > returns 0 even when probing the device failed:
> > > 
> > > [    0.244339] dwc3-qcom a6f8800.usb: DBG: populate
> > > [    0.244772] dwc3 a600000.dwc3: DBG: dwc3_probe
> > > [    0.245237] dwc3 a600000.dwc3: DBG: dwc3_probe err: -517
> > > [    0.245264] dwc3-qcom a6f8800.usb: DBG: populate (done)
> > > [    0.245317] dwc3-qcom a6f8800.usb: DBG: dwc3_qcom_interconnect_init() failed: -517
> > > 
> > > Probe fails because the interconnect stuff isn't ready yet, otherwise
> > > it could access invalid data.
> > > 
> > > A later _populate() is successful and the probing of the core is done
> > > synchronously, i.e. after _populate() the core driver is fully
> > > initialized:
> > > 
> > > [    3.898106] dwc3-qcom a6f8800.usb: DBG: populate
> > > [    3.908356] dwc3 a600000.dwc3: DBG: dwc3_probe
> > > [    4.205104] dwc3 a600000.dwc3: DBG: dwc3_probe (done)
> > > [    4.210305] dwc3-qcom a6f8800.usb: DBG: populate (done)
> > > 
> > > The synchronous probing in _populate() suggests that using device_is_bound()
> > > would actually be a valid option, either the core device was successfully
> > > probed or not, there should be no race.
> > > 
> > > I sent a patch that adds this check to dwc3_qcom_of_register_core(), which
> > > is less confusing and makes clear that the core device is valid unless
> > > this function returns an error:
> > > 
> > >    https://lore.kernel.org/patchwork/patch/1257279/
> > > 
> > > It might make sense to add your "driver core:Export the symbol
> > > device_is_bound" patch, mine and this one to a single series.
> >  From the discussion on "driver core:Export the symbol device_is_bound"
> > (https://patchwork.kernel.org/patch/11584225/) it is clear that
> > this won't fly. The split dwc3 driver is considered a broken
> > design.
> > 
> > This is what Rob Herring said:
> > 
> >    We never should have had this split either in the DT binding nor
> >    driver(s) as if the SoC wrapper crap and licensed IP block are
> >    independent things. The thing to do here is either make the DWC3 code
> >    a library which drivers call (e.g. SDHCI) or add hooks into the DWC3
> >    driver for platform specifics (e.g. Designware PCI). Neither is a
> >    simple solution though.
> > 
> > That seems to be the desirable solution in the longer term, but it
> > doesn't seem reasonable to me to expect you to fix this design issue
> > to add interconnect support.
> > 
> > Some possible options to move forward:
> > 
> > - try to determine the max speed without involving the core device
> > - select a reasonable default when 'maximum-speed' is not specified
> > - use the core device to determine the max speed and pray
> 
> Can we do as below to get speed
> 
> qcom->max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);

Yes, that would get the maximum speed from the DT if it is specified.
In case of USB_SPEED_UNKNOWN you probably want to assume it's
USB_SPEED_SUPER, which in the worst case would result in the ICC
running at a higher speed than needed.
