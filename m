Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5441A8E7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 00:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbgDNWYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 18:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387968AbgDNWYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 18:24:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52BCC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:24:15 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id r25so2026817oij.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSvchkcd7+hD8iM08aRUkD2W1lGagSQVw2VCgv+Z9nA=;
        b=Y7K5AROPPWJ638uxbT81geDe7XOK+VI9SoMFP1YkVmSkr3nFmZ4qaRAajdMY5P3cIT
         SfndfJhq49V/M1qXysnmbyC1ZZJ2HASiDh7WhpLyW130dAR5jDd1clzwNZ2IIXlvlTJs
         RuVnt6U8FTMVETGKy2UII3b9auwVgCiA9xsWe2d7tnlSeQ4GB+ZDSa1s/8EZKG/Eu2dp
         9QJVhh+8EYf+/ICMkMZCiGzvaS8FgUg/to9uBToJ/Olv61Pwh8w00WyZhGmD8sOa4/bP
         syRATQgjXVh2l+DCx1pZG1S6lQjGbdGCWgWZoqNMMcAJvjHa9t2lCzzBBEIrg+aZvFCy
         lwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSvchkcd7+hD8iM08aRUkD2W1lGagSQVw2VCgv+Z9nA=;
        b=t8051P81EkSIWcwf2k1bOnoSy0HCCeJD4YVz1xkUfamgaKTeiAmTwJNRSRV/Iequ4z
         dQAY/GAHG5yhJXFLGyBu1Th8hKS4Nq2yjY34gCiGq4x5biAVeklXjt2canTs8oxShdCm
         hJkpTldKybY4M1TF+hl3WYnJdYXjOcr1y5zOT85a/i3GdSNOOQpFQqhpfb8nlSm2DXGW
         mPSt2Vr/fM2tBediYJsOqtcu8xvyvcQnEstFFs0hoRSNXMgWMkrsyYxME9kwG4u3zFDK
         aqaNHojUDhlEa71L+uRQRe9Xv/o6HAeJdYSJFHEaY8dkTtG8RFgTIAKIWvE2mn0kGD9A
         zFYQ==
X-Gm-Message-State: AGi0PuZW4Dj25O98VtRi1ZM7SQ2naQmVCUKqv4EEmejtEIiOqIJOzR7Q
        +V2McpAMSQWlAFz5+1hzxUrtaCltLdBCI+aL9uFfoML7iP4=
X-Google-Smtp-Source: APiQypIHJWkal3YwLBhlR620KMxrsEGRChkItlIWHc8j6blfLVRMMIm6PKtY+yBy7aZLzjZWyt4bhDdw+/Bvv0ZliPU=
X-Received: by 2002:aca:b1d7:: with SMTP id a206mr7137583oif.97.1586903054325;
 Tue, 14 Apr 2020 15:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200326224459.105170-1-john.stultz@linaro.org>
 <20200326224459.105170-2-john.stultz@linaro.org> <20200414222158.GL576963@builder.lan>
In-Reply-To: <20200414222158.GL576963@builder.lan>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 15:24:02 -0700
Message-ID: <CALAqxLWSxJsxF9ti=0hfM6487UuQMGK-bpZkkdABpngfHuu+1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] soc: qcom: rpmpd: Allow RPMPD driver to be loaded
 as a module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 3:21 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 26 Mar 15:44 PDT 2020, John Stultz wrote:
>
> > This patch allow the rpmpd driver to be loaded as a permenent
> > module. Meaning it can be loaded from a module, but then cannot
> > be unloaded.
> >
> > Ideally, it would include a remove hook and related logic, but
> > apparently the genpd code isn't able to track usage and cleaning
> > things up? (See: https://lkml.org/lkml/2019/1/24/38)
> >
> > So making it a permenent module at least improves things slightly
> > over requiring it to be a built in driver.
> >
> > Feedback would be appreciated!
> >
> > Cc: Todd Kjos <tkjos@google.com>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rajendra Nayak <rnayak@codeaurora.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Acked-by: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v2:
> > * Fix MODULE_LICENSE to be GPL v2 as suggested by Bjorn
> > * Leave initcall as core_initcall, since that switches to module_initcall
> >   only when built as a module, also suggested by Bjorn
> > * Add module tags taken from Rajendra's earlier patch
> > ---
> >  drivers/soc/qcom/Kconfig | 4 ++--
> >  drivers/soc/qcom/rpmpd.c | 6 ++++++
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index d0a73e76d563..af774555b9d2 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -123,8 +123,8 @@ config QCOM_RPMHPD
> >         for the voltage rail.
> >
> >  config QCOM_RPMPD
> > -     bool "Qualcomm RPM Power domain driver"
> > -     depends on QCOM_SMD_RPM=y
> > +     tristate "Qualcomm RPM Power domain driver"
> > +     depends on QCOM_SMD_RPM
> >       help
> >         QCOM RPM Power domain driver to support power-domains with
> >         performance states. The driver communicates a performance state
> > diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> > index 2b1834c5609a..22fe94c03e79 100644
> > --- a/drivers/soc/qcom/rpmpd.c
> > +++ b/drivers/soc/qcom/rpmpd.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mutex.h>
> > +#include <linux/module.h>
>
> module comes before mutex in the alphabet.

:) Thanks for catching that.

> >  #include <linux/pm_domain.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> > @@ -226,6 +227,7 @@ static const struct of_device_id rpmpd_match_table[] = {
> >       { .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
> >       { }
> >  };
> > +MODULE_DEVICE_TABLE(of, rpmpd_match_table);
> >
> >  static int rpmpd_send_enable(struct rpmpd *pd, bool enable)
> >  {
> > @@ -422,3 +424,7 @@ static int __init rpmpd_init(void)
> >       return platform_driver_register(&rpmpd_driver);
> >  }
> >  core_initcall(rpmpd_init);
> > +
> > +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPM Power Domain Driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:qcom-rpmpd");
>
> Is there any reason for this alias?
>
> The module will be automatically loaded based on compatible and the
> MODULE_DEVICE_TABLE() information above, and for ACPI would need a
> similar acpi_device_id table.

I pulled it in from Rajendra's earlier patch. I'm ok to drop it though.

I'll fix these up and respin. Thanks for the review!

thanks
-john
