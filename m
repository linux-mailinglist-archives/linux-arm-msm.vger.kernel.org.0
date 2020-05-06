Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4DB1C76A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 18:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgEFQgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 12:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729683AbgEFQgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 12:36:49 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751E3C061A10
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 09:36:49 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id g129so699568vkh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEp/F3SbsRoDv1jpNGzhOxbfis7J4KDcT9P9z6XWkHg=;
        b=eVnVRn4S8Hb7sl1mAhlDpCkwg2p7TvzKWg0qVVe/dWs+kNzu0dkUnF12cuHSLRfxJA
         k1JsPhNHp6gpFvg3metDV/hPplaRlu3pQXHecw2lhBu91JqE8L0mSdp5Zmc9jNhUWqIB
         1xGIHjkcCR9gqoJXy85LS+19SdMWYi5+Ih9W8LUXfrQqUUPxnoOEUhmxOrI+MLwWHhr+
         E9RKn25uZiu4s/nZwk/EVD7PaM11znkaVIxenvyVhmirLDphTRgJue6k6ZZ0J3TwDTz6
         0ZY1n1k1WDVUIhczz4M4qBDev1+txdlb4jFvLkVck7EDsXiBjF4LLHsLj3SpxlVGryrw
         tIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEp/F3SbsRoDv1jpNGzhOxbfis7J4KDcT9P9z6XWkHg=;
        b=Nvzv1P6tRMyvfQaB0eK5PjmquJ4uiI2YjDREPtOw3RAOfML8OXHshnDPA1E7tzp7NA
         jQxbZvINbCQOAzpX2zh5UxDR119ySeU2uKhE7al+EWCXmD3eEWtuKcpkrgiH343112rP
         adVt1yO0Xs7VORjG1VxlMezuODLtGgFZSsEUnWcMvNF161t+SHH5vlbLpc4BYc2t3VKz
         AckkzzR3QxXaU3JZ4gZlOFio5J3uL0EExGgvW6f+pJPz74sLlrJRbIWuGC2p4c5SvNI4
         opiXhggleyyJSo029tZQhqRizrKR5D/9AQTj0BGIEaqQcw35rxWZwbvleU4BgTXZ2LMZ
         6kzQ==
X-Gm-Message-State: AGi0Pualeiy/DmzctYRNIsJny1f6xhkXvqNHpH+aK6qcIbznOBugFcZy
        OhucFB4F/2/ZoypLVqJdlDV+VhkxWAFMo/vreEnAmg==
X-Google-Smtp-Source: APiQypLm9f0btuKktuvMb+D03IME6dlX6dRX4NRiQ4NXE3O3t6sARzsGX6NfhfAe3VIx+4GZEIKh+9FQbLrJ4BJaBxM=
X-Received: by 2002:a1f:8ccf:: with SMTP id o198mr8122974vkd.53.1588783008587;
 Wed, 06 May 2020 09:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com> <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
In-Reply-To: <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 May 2020 18:36:12 +0200
Message-ID: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Chun-Hung Wu <chun-hung.wu@mediatek.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
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
        Yong Mao <yong.mao@mediatek.com>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> > Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> > in mmc_of_parse().
> >
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >   drivers/mmc/core/host.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index c876872..47521c6 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> >               host->caps2 |= MMC_CAP2_NO_SD;
> >       if (device_property_read_bool(dev, "no-mmc"))
> >               host->caps2 |= MMC_CAP2_NO_MMC;
> > +     if (device_property_read_bool(dev, "supports-cqe"))
> > +             host->caps2 |= MMC_CAP2_CQE;
>
> This change is breaking emmc driver on qcom platforms where this dt
> property is defined.
>
> [    1.543453]  cqhci_deactivate+0xc/0x38
> [    1.545627]  sdhci_msm_reset+0x40/0x58
> [    1.549447]  sdhci_do_reset+0x48/0x7c
> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> [    1.556913]  sdhci_setup_host+0x58/0xce8
> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> [    1.564900]  platform_drv_probe+0x4c/0xb0
>
> So, we cant have this flag defined before sdhci_setup_host().
>
> I will have to clear this cap and re-enable it in our initialization.

Thanks for reporting! I have dropped all the four patches from
Chun-Hung, so we can figure out how to fix this.

Please help to review the next version of the series.

>
> > +     if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> > +             host->caps2 |= MMC_CAP2_CQE_DCMD;
> > +     }
> >
> >       /* Must be after "non-removable" check */
> >       if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {

Kind regards
Uffe
