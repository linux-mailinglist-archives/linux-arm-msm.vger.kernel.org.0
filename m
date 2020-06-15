Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FB51FA09D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 21:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbgFOTmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 15:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbgFOTmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 15:42:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFE3C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n2so7205773pld.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tNVFiaYWMiO2hIPSPELA+UbwGrUr+c9/QS6tPzZlZsA=;
        b=Q1gomGsuoZPi4npsUFWHj1X8MZjjMEubXg7JRHxvk16FoLBYMBUvqQMm982CkHMfju
         kTVQPbwC0DsOCx0LE6fgPtUKSTAeU8r5AWd12DkRI0M02V8Z+b+P4J2xJcfSFVf8Wchh
         6A31hSMp5TIxadWGu7+0uTJE0uXGGueo9vk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNVFiaYWMiO2hIPSPELA+UbwGrUr+c9/QS6tPzZlZsA=;
        b=f33OJKg9tZA8ldVxe1nOn3YNAiv4Z96rYALfPSu2airDV0k9jxKWKWVOGXUQAyut1C
         oEWhlFAbMnkCfcOnwT9IcxeJ1lZFa5hadZ8pRfaXaSS53uCDAhgqZvsxGOVFEsDESVdR
         kcvf2Q3ycOtoW54nb6D0ZoNyuKClgIv8ZhLFAqfzuNNN1n3lq7/kxGD2AlOHU3F4TeLK
         BIYoQthnfSDu+guDiTQB7d/79hAV5+t1hjlSQEbXCd6i/bNRPdIJhoPAx6awm9wD3Z8R
         d9xVBa2ezIKa3g+wMPuT1c7TUs84nSXqUb5CcQ0dqHfYrnRXTUCt5HC6MLNi3Sb5gGye
         /nvQ==
X-Gm-Message-State: AOAM533Afr20lkSWdnizbhOrCnJVZ7C11tmNA843fj5KKgcbVMjPkHOx
        89rjXavx36FFFiUY04u9epSxeQ==
X-Google-Smtp-Source: ABdhPJxeWDuRfhj7W7RmVrlhoom2XQpVpwdGn2PnNXzzogrg7beHu71xLjlNVRnZ9EVTyBGEIkw/Uw==
X-Received: by 2002:a17:902:ed53:: with SMTP id y19mr13563762plb.318.1592250162297;
        Mon, 15 Jun 2020 12:42:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m1sm264533pjr.56.2020.06.15.12.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 12:42:41 -0700 (PDT)
Date:   Mon, 15 Jun 2020 12:42:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200615194239.GW4525@google.com>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
 <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
 <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 04:16:31AM -0700, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
> > 
> > On 6/3/2020 11:06 PM, Stephen Boyd wrote:
> > > Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
> > >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > >> index 1dfd024..d33ae86 100644
> > >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> > >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > >> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
> > >>          return 0;
> > >>   }
> > >>   
> > >> +
> > >> +/**
> > >> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> > >> + * @qcom:                      Pointer to the concerned usb core.
> > >> + *
> > >> + */
> > >> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> > >> +{
> > >> +       struct device *dev = qcom->dev;
> > >> +       int ret;
> > >> +
> > >> +       if (!device_is_bound(&qcom->dwc3->dev))
> > >> +               return -EPROBE_DEFER;
> > > How is this supposed to work? I see that this was added in an earlier
> > > revision of this patch series but there isn't any mention of why
> > > device_is_bound() is used here. It would be great if there was a comment
> > > detailing why this is necessary. It sounds like maximum_speed is
> > > important?
> > >
> > > Furthermore, dwc3_qcom_interconnect_init() is called by
> > > dwc3_qcom_probe() which is the function that registers the device for
> > > qcom->dwc3->dev. If that device doesn't probe between the time it is
> > > registered by dwc3_qcom_probe() and this function is called then we'll
> > > fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
> > > qcom->dwc3->dev device from the platform bus because we call
> > > of_platform_depopulate() on the error path of dwc3_qcom_probe().
> > >
> > > So isn't this whole thing racy and can potentially lead us to a driver
> > > probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
> > > and we're trying to time it just right so that driver for dwc3 binds
> > > before we setup interconnects? I don't know if dwc3 can communicate to
> > > the wrapper but that would be more of a direct way to do this. Or maybe
> > > the wrapper should try to read the DT property for maximum speed and
> > > fallback to a worst case high bandwidth value if it can't figure it out
> > > itself without help from dwc3 core.
> > >
> > This was added in V4 to address comments from Matthias in V3
> > 
> > https://patchwork.kernel.org/patch/11148587/
> > 
> 
> Yes, that why I said:
> 
> "I see that this was added in an earlier
>  revision of this patch series but there isn't any mention of why
>  device_is_bound() is used here. It would be great if there was a comment
>  detailing why this is necessary. It sounds like maximum_speed is
>  important?"
> 
> Can you please respond to the rest of my email?

I agree with Stephen that using device_is_bound() isn't a good option
in this case, when I suggested it I wasn't looking at the big picture
of how probing the core driver is triggered, sorry about that.

Reading the speed from the DT with usb_get_maximum_speed() as Stephen
suggests would be an option, the inconvenient is that we then
essentially require the property to be defined, while the core driver
gets a suitable value from hardware registers. Not sure if the wrapper
driver could read from the same registers.

One option could be to poll device_is_bound() for 100 ms (or so), with
sleeps between polls. It's not elegant but would probably work if we
don't find a better solution.
