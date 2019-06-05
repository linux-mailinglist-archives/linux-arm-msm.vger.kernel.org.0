Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEDA3586D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 10:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfFEIUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 04:20:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40544 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfFEIUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 04:20:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so13647429wre.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4N4wbbPbH5vFPQ02lIzPzQHg+yDqqNmeJgiKq0aKWHQ=;
        b=EEsoVwHJfcVfB0ReGOh4L2CQa6hWhl7NbcxauHoct4OV4K/eJmfkm8ODRylrWf0538
         cFa6Ud53SF9GDxPzTf2QH8ClrklK6SAbghEFIvkPB08cXK8dmhn83Xof+s2ZK+q518Aj
         2GSJmz2YyAyeCySlO/be4cLEbL9RVXGU2l/CaV+hYuqsyJZHVcKKnBUKrOw96GNUV40b
         KNe4oyVp/g92y3oHSnA66Q/gFpFB8Qukzyhelc9SvseBGDW6imI5ONkiObzQkjBsYMub
         PuXqEPcOMPhEBrpFa02315DvejuZd4l+e3SZjyFqd8VDsFe7rOanchMNtkmv8jUP81la
         /Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4N4wbbPbH5vFPQ02lIzPzQHg+yDqqNmeJgiKq0aKWHQ=;
        b=OXeMk2AXry2P97EVlM0xpqPjJ1qS6PeiTw00GhpTmDxUJVjIkSStT+6fxCFJI5A467
         o6DKVzaFV2c1+5jnVRQL+cyS1Di/vEMG1fV387WBMtYAnosUBht1zlTZYJDjOzV1bayI
         Y/WVVnu39wCNjkqeEo6p8iEbua/2dcoR4LdDczvsc/JFfpgKi1XvFw5lNVt3zZBs3H4P
         DtTbbcae40uSdNslYqeP4yzN3vrLAXBRScLatquUkhkBuYxpJrI0tSwPPr3uNA0g/KWt
         8ZTTNrIMSy/TnryetAZtODXQY53o3cAys78ELihHDDeDVDMQ9ehe3IJQ/3Md0zcQ5YD6
         98Hg==
X-Gm-Message-State: APjAAAVnjGiWM16Meuszn8IknwmLsUWBFtnt/FXeleeRE8v2z73Qx2Y1
        eNdBBsRPQqyN44hkJTxlURy/Gw==
X-Google-Smtp-Source: APXvYqx/8oIyrbj4ascfwZpwcyMAKVAvtaBu7KaV63F4l5bAfkhGLPkaQF18jo6DwFQGyXdhimt4dQ==
X-Received: by 2002:adf:f38a:: with SMTP id m10mr9150235wro.81.1559722850820;
        Wed, 05 Jun 2019 01:20:50 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id a62sm21930094wmf.19.2019.06.05.01.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 01:20:49 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:20:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605082047.GM4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <20190605075656.GC29637@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605075656.GC29637@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 05 Jun 2019, Johan Hovold wrote:

> On Wed, Jun 05, 2019 at 08:16:25AM +0100, Lee Jones wrote:
> > On Tue, 04 Jun 2019, Bjorn Andersson wrote:
> > 
> > > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > > 
> > > > The Qualcomm Geni I2C driver currently probes silently which can be
> > > > confusing when debugging potential issues.  Add a low level (INFO)
> > > > print when each I2C controller is successfully initially set-up.
> > > > 
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > > > index 0fa93b448e8d..e27466d77767 100644
> > > > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > > > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > > > @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > +	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> > > > +
> > > 
> > > I would prefer that we do not add such prints, as it would be to accept
> > > the downstream behaviour of spamming the log to the point where no one
> > > will ever look through it.
> > 
> > We should be able to find a middle ground.  Spamming the log with all
> > sorts of device specific information/debug is obviously not
> > constructive, but a single liner to advertise that an important
> > device/controller has been successfully initialised is more helpful
> > than it is hinderous.
> > 
> > This print was added due to the silent initialisation costing me
> > several hours of debugging ACPI device/driver code (albeit learning a
> > lot about ACPI as I go) just to find out that it was already doing the
> > right thing - just very quietly.
> 
> No, we don't add noise like this to the logs just because it may be
> useful while debugging. Even one-liners add up.

One line per device is should not cause an issue.

Problems occur when developers try to print all kinds of device
specifics to the boot log.  A simple, single line for such an
important device/controller has more benefits than drawbacks.

> There are plenty of options for debugging already ranging from adding a
> temporary dev_info() to the probe function in question to using dynamic
> debugging to have driver core log every successful probe.

This is what I ended up doing.  It was time consuming to parse though
a log of that size when you have no paging or keyboard.

> And in this case you say the driver was in fact already bound; that can
> easily be verified through sysfs too in case things aren't behaving the
> way you expect.

Not in a non-booting system with no keyboard you can't. ;)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
