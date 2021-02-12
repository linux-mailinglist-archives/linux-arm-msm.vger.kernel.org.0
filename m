Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5D131A405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 18:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBLRt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 12:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhBLRt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 12:49:57 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369E4C061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 09:49:18 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id c16so9160225otp.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 09:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IgQTDGA6KT8/4jMzE32KCsQnjArbvr7991kH2ywcpDI=;
        b=t3/6LAI+MTU0yz3XDVuCBRaJa3CG+qinq/4GAAlJ4NBY9OrzQzj/zb9hLfV9jxo1DW
         sMyyvPJR4tO4iTCTSS/hqm/j659WKZnU8q11M1dhv50M1EE6GLLrB1byTajvIGIpJKy6
         KNERzywy/ZWIP49QDfmtscUelVLDBQccPcWx1CI24mJnf4HCfhNECXd0oOnBwxUdhKhF
         gtefIvRLbq0/4feqLvo0lLHlzadkn/ev5vj21lcTx8c0sM9Cxx+8ezNoAJUwvaY5ukNC
         zdMjyVRcah4fhuOELy7prlOFXchrPcmjJzE8YV3uKwHrcUpBxmSBKx3LrWXTxOs/gOmf
         r18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IgQTDGA6KT8/4jMzE32KCsQnjArbvr7991kH2ywcpDI=;
        b=cleVwqzM7mhy+WFC881/uaIHAD/V9Q5QKrrM3UO9Fuyw/HuSm2cilS6Nwza4Qxdf8K
         HDrj8gC0+IArjKnD4wMh7BoThszQYWrRkdVTuECaHGrX0TkA9C6aRkbKM7DNe6bDd6gj
         aNx7ml7dEEvVa23HLuY3lXjHFK0fQY494p1cPKSj8WaCxRlW7m6vPnxXiCvt2E1Qfd98
         6uZtLJwoWSc7g1FJjOZ2bUP5oL5q+slSPXt8mlpMfY9taijJzNCyLX0/ipsY2Et4fLpS
         Wm0hFBn4pqvuxhlmVgvIkm8JgAWe5uolQmu/HXwyzzbmbYHUrZTK523KTRiXQz1BQybt
         N3Cw==
X-Gm-Message-State: AOAM533j3Ba7+1AHmcyMVo0X1f2tN0hVe+/i3P6I2D4aR/8CiA7wvgrN
        GBR7HFE4AjAkoUOSgoayX+ODPg==
X-Google-Smtp-Source: ABdhPJxqBMM8uqcRxkqMgXnF4x2r1EDMBw5gPnBeHG1iQ6G8RhAqJxAsmLzvsLpDK7LyYITTc6iWgg==
X-Received: by 2002:a9d:6016:: with SMTP id h22mr2860194otj.63.1613152157372;
        Fri, 12 Feb 2021 09:49:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a71sm1666148oob.48.2021.02.12.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 09:49:16 -0800 (PST)
Date:   Fri, 12 Feb 2021 11:49:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <YCa/m4qfT1T4e6CW@builder.lan>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
 <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
 <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
 <YCQse9EtEHtLVe9A@builder.lan>
 <20210210193325.inp7rgpsfr624zhd@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210193325.inp7rgpsfr624zhd@mobilestation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Feb 13:33 CST 2021, Serge Semin wrote:

> On Wed, Feb 10, 2021 at 12:56:59PM -0600, Bjorn Andersson wrote:
> > On Wed 10 Feb 12:40 CST 2021, Serge Semin wrote:
> > 
> > > On Wed, Feb 10, 2021 at 12:17:27PM -0600, Rob Herring wrote:
> > > > On Wed, Feb 10, 2021 at 11:29 AM Serge Semin
> > > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > > >
> > > > > In accordance with the USB HCD/DRD schema all the USB controllers are
> > > > > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > > > > existing DT-nodes will be renamed in a subsequent patch let's first make
> > > > > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > > > > deprecated naming so not to fail on the legacy DTS-files passed to the
> > > > > newer kernels.
> > > > >
> > > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > ---
> > > > >  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > index c703d552bbcf..49ad8d507d37 100644
> > > > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> > > > >         struct device           *dev = &pdev->dev;
> > > > >         int                     ret;
> > > > >
> > > > > -       dwc3_np = of_get_child_by_name(np, "dwc3");
> > > > > +       dwc3_np = of_get_child_by_name(np, "usb") ?:
> > > > > +                 of_get_child_by_name(np, "dwc3");
> > > > 
> > > 
> > > > Is there some reason using compatible instead wouldn't work here?
> > > 
> > > I don't know for sure. The fix has been requested in the framework of
> > > this discussion:
> > > https://lore.kernel.org/linux-usb/20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru/#t
> > > by the driver maintainer Bjorn. To get a firm answer it's better to
> > > have him asked.
> > 
> > My feedback was simply that it has to catch both cases, I didn't
> > consider the fact that we have a compatible to match against.
> > 
> > > As I see it having of_get_compatible_child() utilized
> > > here would also work. At least for the available in kernel dt-files.
> > > See the affected dts-es in:
> > > https://lore.kernel.org/linux-usb/20210210172850.20849-11-Sergey.Semin@baikalelectronics.ru/
> > > 
> > > A problem may happen if some older versions of DTS-es had another
> > > compatible string in the dwc3 sub-node...
> > > 
> > 
> > Afaict all Qualcomm dts files has "snps,dwc3", so you can match against
> > that instead.
> 
> Ok then. I'll replace of_get_child_by_name() here with
> of_get_compatible_child() matching just against "snps,dwc3" in v7. Can you
> confirm that noone ever had a Qcom-based hardware described with dts having
> the "synopsys,dwc3" compatible used as the DWC USB3 sub-node here? That
> string has been marked as deprecated recently because the vendor-prefix
> was changed sometime ago, but the original driver still accept it.
> 

I don't see any Qualcomm users of "synopsys,dwc3", past or present.

> Alternatively to be on a safe side we could match against both
> compatibles here as Rob suggests. What do you think?
> 

Let's go with only "snps,dwc3".

Regards,
Bjorn
