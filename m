Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9709D1A8EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 00:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387609AbgDNWcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 18:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391991AbgDNWcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 18:32:33 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC09C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:32:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b72so618503pfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mewxKN45waQp3yEwv8ygkKqbfD23e+USBQbY/2hfBcM=;
        b=MizlYeXthCCHse0SrLsLnqm9HB2Flgt4rwixPBiJI0psblGSL03KSAwn4TQVM1O7oX
         9RxCbjRo5yAyBNpwsS++r/yNIztj1MMgWS71gdSzmz2k9ThJyec7eL6/GvIpMwfPc5HM
         raod9N3h0T12Tfhn59/AJfKX5fyShV+p50Aijth7i2xqkxPsFrOhDpUY6XRJ3P8gb69s
         g8YqfejmzMDwog2Cid4Vw6GjnUu7jH8erXei6hUjC81S4GxuPOF2zYe+7conBWeIItoq
         4Eg+tYyq84/lJjZWd4xMiDBkikvoILwyP1Ml95Xa5bggk2474nyzqGt7DcMA0y+QVOFP
         YFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mewxKN45waQp3yEwv8ygkKqbfD23e+USBQbY/2hfBcM=;
        b=ICv9s7QJODvLdSwaJJWzSECo18fi1wBLMuX6Scol8PS7heUYRAxdO7M7Dp6LsQWpTT
         TLghpLZWv8dCr63bism6vF//oWtYbQOXb69SvWKXtrHBuqGVv+wYnv488e9GOKvdLfKB
         z5StMGmIC5+D7MtIm8XHQDCsEUaiZc/3Z8394T/GXvf/lGNvzWmcLvi8ipdWJ6HVYvYp
         JjLEEeQEyP6wVGFnMLD58jvqJ2VrDVD2z6GQ1bU331E+M6tJG9Px+gzPxlAHeqhE/ZUG
         9b5/xey0IDLHtGrwfxGVdKJBxbhv3wkAJYMLDrTxd02vJ7xk5NehX998y/s/TdX6JqD2
         hudg==
X-Gm-Message-State: AGi0PuYVAmNBdIke82mEmX2vnzEkB6KAVJaWUbHCoJO2C1SYaJm8OWTc
        3TUG1i2b8l6Bwj2KIhJDJDZ40w==
X-Google-Smtp-Source: APiQypLgd0zBRbTAHSQ2KtJ/4NcBnUdQWkPTlaQo9eQ8AsV0nvjrE+uUkDpLsKKbrbhslupYL/Ngbg==
X-Received: by 2002:a62:7d11:: with SMTP id y17mr24597463pfc.127.1586903551481;
        Tue, 14 Apr 2020 15:32:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y131sm11967847pfb.78.2020.04.14.15.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:32:30 -0700 (PDT)
Date:   Tue, 14 Apr 2020 15:32:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] soc: qcom: rpmpd: Allow RPMPD driver to be loaded
 as a module
Message-ID: <20200414223246.GO576963@builder.lan>
References: <20200326224459.105170-1-john.stultz@linaro.org>
 <20200326224459.105170-2-john.stultz@linaro.org>
 <20200414222158.GL576963@builder.lan>
 <CALAqxLWSxJsxF9ti=0hfM6487UuQMGK-bpZkkdABpngfHuu+1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWSxJsxF9ti=0hfM6487UuQMGK-bpZkkdABpngfHuu+1w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Apr 15:24 PDT 2020, John Stultz wrote:

> On Tue, Apr 14, 2020 at 3:21 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 26 Mar 15:44 PDT 2020, John Stultz wrote:
> >
> > > This patch allow the rpmpd driver to be loaded as a permenent
> > > module. Meaning it can be loaded from a module, but then cannot
> > > be unloaded.
> > >
> > > Ideally, it would include a remove hook and related logic, but
> > > apparently the genpd code isn't able to track usage and cleaning
> > > things up? (See: https://lkml.org/lkml/2019/1/24/38)
> > >
> > > So making it a permenent module at least improves things slightly
> > > over requiring it to be a built in driver.
> > >
> > > Feedback would be appreciated!
> > >
> > > Cc: Todd Kjos <tkjos@google.com>
> > > Cc: Saravana Kannan <saravanak@google.com>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Rajendra Nayak <rnayak@codeaurora.org>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Acked-by: Saravana Kannan <saravanak@google.com>
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > ---
> > > v2:
> > > * Fix MODULE_LICENSE to be GPL v2 as suggested by Bjorn
> > > * Leave initcall as core_initcall, since that switches to module_initcall
> > >   only when built as a module, also suggested by Bjorn
> > > * Add module tags taken from Rajendra's earlier patch
> > > ---
> > >  drivers/soc/qcom/Kconfig | 4 ++--
> > >  drivers/soc/qcom/rpmpd.c | 6 ++++++
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > index d0a73e76d563..af774555b9d2 100644
> > > --- a/drivers/soc/qcom/Kconfig
> > > +++ b/drivers/soc/qcom/Kconfig
> > > @@ -123,8 +123,8 @@ config QCOM_RPMHPD
> > >         for the voltage rail.
> > >
> > >  config QCOM_RPMPD
> > > -     bool "Qualcomm RPM Power domain driver"
> > > -     depends on QCOM_SMD_RPM=y
> > > +     tristate "Qualcomm RPM Power domain driver"
> > > +     depends on QCOM_SMD_RPM
> > >       help
> > >         QCOM RPM Power domain driver to support power-domains with
> > >         performance states. The driver communicates a performance state
> > > diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> > > index 2b1834c5609a..22fe94c03e79 100644
> > > --- a/drivers/soc/qcom/rpmpd.c
> > > +++ b/drivers/soc/qcom/rpmpd.c
> > > @@ -5,6 +5,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/mutex.h>
> > > +#include <linux/module.h>
> >
> > module comes before mutex in the alphabet.
> 
> :) Thanks for catching that.
> 
> > >  #include <linux/pm_domain.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_device.h>
> > > @@ -226,6 +227,7 @@ static const struct of_device_id rpmpd_match_table[] = {
> > >       { .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> > >       { }
> > >  };
> > > +MODULE_DEVICE_TABLE(of, rpmpd_match_table);
> > >
> > >  static int rpmpd_send_enable(struct rpmpd *pd, bool enable)
> > >  {
> > > @@ -422,3 +424,7 @@ static int __init rpmpd_init(void)
> > >       return platform_driver_register(&rpmpd_driver);
> > >  }
> > >  core_initcall(rpmpd_init);
> > > +
> > > +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPM Power Domain Driver");
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_ALIAS("platform:qcom-rpmpd");
> >
> > Is there any reason for this alias?
> >
> > The module will be automatically loaded based on compatible and the
> > MODULE_DEVICE_TABLE() information above, and for ACPI would need a
> > similar acpi_device_id table.
> 
> I pulled it in from Rajendra's earlier patch. I'm ok to drop it though.
> 
> I'll fix these up and respin. Thanks for the review!
> 

No worries, I'll fix these two things and apply the patch. Just wanted
to check if I was missing something.

Regards,
Bjorn
