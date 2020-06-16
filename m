Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B9B1FC0F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 23:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgFPVWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 17:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgFPVWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 17:22:09 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E2DC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 14:22:09 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id y45so4373670ooi.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1WTjVtVQHawTUGhoVtzUqLBrhOe6FD5mLMeqvgfDzVg=;
        b=M4fPpFWneE9bnyXRYRY3Mn84h60xJrEkkF9vFW3Q9pcy/KKGQ5UrPvuZ4lWrZQ8/4G
         9miARSs02wr9PKZWhq0Vw6Rq72C5RFpxZHumND2rpKJZiRdxXHDsjl2FqMZid6dfz/UR
         ZTqF6NiyURgd0q+jR3JyBuFd2e7ixojyPqdz7rfY80U0YB0fiS/dBO9rk5IowumDz5NU
         b8B7GPvsbqH982dU9YW502JFqOwRVTIfs6DlxbTEr/k/c2fKUDh8W+7OHH6ZGAb5JG93
         DvToRR1Ge0+fj/RBUEOI35BkFGq8T2tn8aW5tN5iacF3Fi0xZPbHN0D5ACToeRxVulJ9
         vusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1WTjVtVQHawTUGhoVtzUqLBrhOe6FD5mLMeqvgfDzVg=;
        b=f/UDPM9+rbTRMPGiN8SZFVZodd8/xvfa47UgLwGGNHc5A+rG16UUAKbeW2ZRcoe7J3
         EvIRxmkbIapuI58JigKn5EW/NKhy91/W++7Ps2Umj6VwkD+7joEPdds1dRovEp5UthgF
         nd5K7f6HoJe38hzRlFhyo1tepPn0j6iQ4/a71mZ3PwLDFuaeO7ZA+nJ+ZqTWIiuJnaoc
         4zJvXd4K/OFfWIwYCpCEfoUdkdSvWIM5oOS5adJn4o1R4ykgbuFu8cFwWBeSVeSMUt7L
         hueIgu1CSfTpbfp8pOEPgF143yoI9ECLr8t3HTCtoqY8taxgCrTnTvbKD7w068vxHS1K
         duDA==
X-Gm-Message-State: AOAM530Ne5LhlMuD0xDUIeG0Vn0NQXi5a8ZXqqemNiPwZZhU5NFZFnkw
        r8I+NCKm9SSEpgMAVQoQtc0u2hyj5aMui5QNgzgZwg==
X-Google-Smtp-Source: ABdhPJzIgCP4J42f64sJb6GXSPJX1olg9X9JFjeVFC4T8jGcQXs1ijKnE/J6hxJaHOZoWyhr9TFaRSdMWjuhuHGnjIg=
X-Received: by 2002:a4a:94d1:: with SMTP id l17mr4120054ooi.88.1592342528795;
 Tue, 16 Jun 2020 14:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-4-john.stultz@linaro.org> <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
In-Reply-To: <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 16 Jun 2020 14:21:55 -0700
Message-ID: <CALAqxLUvnhgL98T3LPaaCPq3w9b1notu=1a8ZhcRJNCkF3dXrQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 perment module
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 16, 2020 at 4:30 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 6/16/2020 11:43 AM, John Stultz wrote:
> > Allows qcom-pdc driver to be loaded as a permenent module
>
> typo: permanent
>
> > Also, due to the fact that IRQCHIP_DECLARE becomes a no-op when
> > building as a module, we have to add the platform driver hooks
> > explicitly.
> >
> > Thanks to Saravana for his help on pointing out the
> > IRQCHIP_DECLARE issue and guidance on a solution.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Lina Iyer <ilina@codeaurora.org>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Todd Kjos <tkjos@google.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >   drivers/irqchip/Kconfig    |  2 +-
> >   drivers/irqchip/qcom-pdc.c | 30 ++++++++++++++++++++++++++++++
> >   2 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 29fead208cad..12765bed08f9 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -425,7 +425,7 @@ config GOLDFISH_PIC
> >            for Goldfish based virtual platforms.
> >
> >   config QCOM_PDC
> > -     bool "QCOM PDC"
> > +     tristate "QCOM PDC"
> >       depends on ARCH_QCOM
> >       select IRQ_DOMAIN_HIERARCHY
> >       help
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 6ae9e1f0819d..98d74160afcd 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -11,7 +11,9 @@
> >   #include <linux/irqdomain.h>
> >   #include <linux/io.h>
> >   #include <linux/kernel.h>
> > +#include <linux/module.h>
> >   #include <linux/of.h>
> > +#include <linux/of_irq.h>
> please move this include in order after of_device.h
> >   #include <linux/of_address.h>
> >   #include <linux/of_device.h>
> >   #include <linux/soc/qcom/irq.h>
> > @@ -430,4 +432,32 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >       return ret;
> >   }
> >
> > +#ifdef MODULE
> > +static int qcom_pdc_probe(struct platform_device *pdev)
> > +{
> > +     struct device_node *np = pdev->dev.of_node;
> > +     struct device_node *parent = of_irq_find_parent(np);
> > +
> > +     return qcom_pdc_init(np, parent);
> > +}
> > +
> > +static const struct of_device_id qcom_pdc_match_table[] = {
> > +     { .compatible = "qcom,pdc" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > +
> > +static struct platform_driver qcom_pdc_driver = {
> > +     .probe = qcom_pdc_probe,
> > +     .driver = {
> > +             .name = "qcom-pdc",
> > +             .of_match_table = qcom_pdc_match_table,
>
> can you please set .suppress_bind_attrs = true,
>
> This is to prevent bind/unbind using sysfs. Once irqchip driver module
> is loaded, it shouldn't get unbind at runtime.

Thanks, I really appreciate the review! I've made these changes on my
side and they'll be included in v2.

thanks
-john
