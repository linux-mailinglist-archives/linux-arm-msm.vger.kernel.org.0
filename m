Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4588D1ACFA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 20:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390032AbgDPS0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 14:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgDPS0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 14:26:05 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7FDC061A0C;
        Thu, 16 Apr 2020 11:26:05 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id z13so7833725ilp.11;
        Thu, 16 Apr 2020 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXJ60xh3HRzmHUILtuHmOWVVlEEjctRU4VDOT5aOyJA=;
        b=B46r11rA0nYCy2R28GWGYHdW0Mc3ND/KQWNLb4j1VcOse4QKYvSSEGAwV9SAU6AqG1
         QaULdLnV8qwb6Vq0v8DCiQUtSISrDPdTEO00xZUbJ4SsIclKX1AN1h8mXWTv0N8CL3ez
         XkrVb26oJMpy2UE9Ohv9dtdV+VtHkoq7NlW7Md6qGnh/znZj2a4UsgMM9zBOMS36iXNm
         WVjm8QbiMXOWmugYo0V5iqMViRahoUqXQDvwxLOltFFA75FA4hgu9v8YPlzkSWUxaOhe
         rw6Gp/HevEYAtcDesDgSl+YBgNsW/MlV1hOqzcYAzMsnUE6OWhDswZ4tlsCc3Aa3snSJ
         HiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXJ60xh3HRzmHUILtuHmOWVVlEEjctRU4VDOT5aOyJA=;
        b=sVJVenIC4awq868cR/F47aJsxdz6Vsvr1zFKNpz9bUCId7rf7WGSu99pzqHzikbhgK
         HgQGpvbTvuY10JMar2UUUKg/0s45YXK7+fOyhZsTWynZMyk398HNNjReJcH30QjoTtRF
         hXtg614Ayavo+FenLQT8n1bbJ9onLztdbS4s7Wqjf+bphW564Sx991R4t6/lvOoJHyyc
         qqrV1BCqCtoCsDOgmIDGwYAaplBol0/sL7JBBOmkRz1k920dUgE6hJqFOsbVMSqUoCfx
         492C5uXrc3xMgaUAbOSlfJFm7MaCqYCaqTzy+/T/97Sy2mDZjm5Q6NzXOHMkvSwbnPjF
         GzKQ==
X-Gm-Message-State: AGi0PuZQtnlqEoiovqEuOMRusLjnU52nfdp5ZW5V/6hZVEy7jhnntqdi
        eKJXtNGKGufCe6BGFvIzVyGctrurzRRgh7Lhpz8=
X-Google-Smtp-Source: APiQypI0D2gbwvLqma38KDzK0z014Rfy0n2y547t4k9gphWQG0y+NQwRvKkvS+gnOgt7J+WNMxsXZw1ZEoAiq3JqnFo=
X-Received: by 2002:a92:7a07:: with SMTP id v7mr12363629ilc.238.1587061563488;
 Thu, 16 Apr 2020 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
 <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
 <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com> <1586823738.16047.7.camel@mtkswgap22>
In-Reply-To: <1586823738.16047.7.camel@mtkswgap22>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Thu, 16 Apr 2020 14:25:52 -0400
Message-ID: <CAOGqxeWvo0Dd6DaSEnosFV8xWngUq9By-hdtu4yJZwh6R=PgLw@mail.gmail.com>
Subject: Re: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc:     mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        kernel-team@android.com,
        ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        DTML <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 13, 2020 at 8:22 PM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> On Mon, 2020-04-06 at 09:59 -0400, Alan Cooper wrote:
> > On Mon, Apr 6, 2020 at 5:28 AM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
> > >
> > > CQE bindings "supports-cqe" and "disable-cqe-dcmd" is parsed
> > > in mmc_of_parse(). Remove vendor code which parses CQE bindings,
> > > and use mmc_host->caps2 to decide support CQE or not.
> > >
> > > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > > ---
> > >  drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++-----
> > >  drivers/mmc/host/sdhci-msm.c       |  3 +--
> > >  drivers/mmc/host/sdhci-of-arasan.c |  3 ---
> > >  drivers/mmc/host/sdhci-tegra.c     |  2 +-
> > >  4 files changed, 8 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> > > index ad01f64..07c90c6 100644
> > > --- a/drivers/mmc/host/sdhci-brcmstb.c
> > > +++ b/drivers/mmc/host/sdhci-brcmstb.c
> > > @@ -247,10 +247,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >                 return res;
> > >
> > >         memset(&brcmstb_pdata, 0, sizeof(brcmstb_pdata));
> > > -       if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
> > > -               has_cqe = true;
> > > -               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> >
> > The above line that sets the irq was moved to later in the function,
> > but needs to come before sdhci_pltfm_init()
> >
> > Al
> After check the code in sdhci_pltfm_init(), I don't see where
> match_priv->ops->irq being used in code section.
> Only "host->ops = pdata->ops;" is assigned, may I know why should
> we put match_priv->ops->irq = sdhci_brcmstb_cqhci_irq; before
> sdhci_pltfm_init()?
> By the way, host only added to kernel after sdhci_brcmstb_add_host(),
> So, I suppose isr assignment is ok before anywhere of it.

I thought I remembered having to move the "set irq" to before
sdhci_pltfm_init() when I first added the functionality, but it looks
like it isn't necessary
I tested your changes and they worked correctly.
Acked-by: Al Cooper <alcooperx@gmail.com>



> >
> > > -       }
> > >         brcmstb_pdata.ops = match_priv->ops;
> > >         host = sdhci_pltfm_init(pdev, &brcmstb_pdata,
> > >                                 sizeof(struct sdhci_brcmstb_priv));
> > > @@ -261,7 +257,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >
> > >         pltfm_host = sdhci_priv(host);
> > >         priv = sdhci_pltfm_priv(pltfm_host);
> > > -       priv->has_cqe = has_cqe;
> > >
> > >         /* Map in the non-standard CFG registers */
> > >         iomem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > @@ -276,6 +271,12 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >         if (res)
> > >                 goto err;
> > >
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> > > +               has_cqe = true;
> > > +               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> > > +       }
> > > +       priv->has_cqe = has_cqe;
> > > +
> > >         /*
> > >          * If the chip has enhanced strobe and it's enabled, add
> > >          * callback
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index c3a160c..fbb2f57 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -1880,7 +1880,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >         u8 core_major;
> > >         const struct sdhci_msm_offset *msm_offset;
> > >         const struct sdhci_msm_variant_info *var_info;
> > > -       struct device_node *node = pdev->dev.of_node;
> > >
> > >         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
> > >         if (IS_ERR(host))
> > > @@ -2076,7 +2075,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >         pm_runtime_use_autosuspend(&pdev->dev);
> > >
> > >         host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> > > -       if (of_property_read_bool(node, "supports-cqe"))
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> > >                 ret = sdhci_msm_cqe_add_host(host, pdev);
> > >         else
> > >                 ret = sdhci_add_host(host);
> > > diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> > > index e49b44b..359eff6 100644
> > > --- a/drivers/mmc/host/sdhci-of-arasan.c
> > > +++ b/drivers/mmc/host/sdhci-of-arasan.c
> > > @@ -1281,9 +1281,6 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
> > >                                         sdhci_arasan_voltage_switch;
> > >                 sdhci_arasan->has_cqe = true;
> > >                 host->mmc->caps2 |= MMC_CAP2_CQE;
> > > -
> > > -               if (!of_property_read_bool(np, "disable-cqe-dcmd"))
> > > -                       host->mmc->caps2 |= MMC_CAP2_CQE_DCMD;
> > >         }
> > >
> > >         ret = sdhci_arasan_add_host(sdhci_arasan);
> > > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> > > index 403ac44..d09abdd 100644
> > > --- a/drivers/mmc/host/sdhci-tegra.c
> > > +++ b/drivers/mmc/host/sdhci-tegra.c
> > > @@ -715,7 +715,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
> > >         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
> > >
> > > -       if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> > >                 tegra_host->enable_hwcq = true;
> > >         else
> > >                 tegra_host->enable_hwcq = false;
> > > --
> > > 1.9.1
>
