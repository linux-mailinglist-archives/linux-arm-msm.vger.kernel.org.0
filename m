Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD401CA280
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 07:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgEHFGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 01:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgEHFGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 01:06:07 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D88C05BD0C
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 22:06:06 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id s5so208023uad.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 22:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOyJCplE0htCyKO+7S6/vnX0Dv0M9OHzxvwXwcOQOP4=;
        b=yOR+kZsOgcu3/Opchfd0y0C8bGMkBMGR0doFFK9FPvDPc7z8ErZvL7sKHTdw/qa/dz
         vwQb7uq+1bBHAJitd7DHu33y1u5/2XWL6XeR7xIfarln2m0W5tyjJxIQtragP/eGPxSZ
         QICFM4RGditudJKQTQrhmZJqvAMtj+Yli1q6nJY0g3+7l/ikFJYY48TWu6Mx7KHEHC/4
         Ir622C0eVbJVEXEqtkrkjMVfd/sijw36iAinDFuIlOYVM2FNShq5zd9P1r0ydAMOBLn9
         4G1Ez4KEljvtrT13T1s5DY74tCI1M7t50tW71tit6nh8LhN7AeyBuWfJIeLwQXONv5aQ
         yQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOyJCplE0htCyKO+7S6/vnX0Dv0M9OHzxvwXwcOQOP4=;
        b=Jmk1JXASAQXpIuzB9Zzb1Ibi3qQ97ZwbIEcfwnwKQQgSJDiN/AKqk0SLFL4sZJlrSJ
         ObMsxQGFAgWBRBXd00ypK8+tJdabrdK+KZz86x6D7oWK0oCkXRx0pHFNOP91OMgnpGNK
         n6xi/vrxKK9sif/Eiq933FT7hKCeZl1q0EQF48zcS9HDgD76anhODhO/NIcerOKGszaS
         9dw/GTmTVUiuUJUhomb9CVo1i3ymmFs8eEbUTmhH8vyH7VCSR0heax96nZOrv5SGKOrY
         ZTGAQARh8288yckPLUSXGFqKQrT2FBDp7JCgP0bb962NribEE4sCVXM5ISm1qTMq7CEo
         I6Bg==
X-Gm-Message-State: AGi0PuYvC24ZU6IYMyXkfCx4UbZUdSG7UD+WTZWJX6OZbQxSBMZSAZcZ
        /dvEyJXZiLybOmP4I0I8OPDSeEUS5NJZX2PY06aoNw==
X-Google-Smtp-Source: APiQypIV3sbG4ZSLW2R9RC7kszUeNGv4pTkPCpr++SJIgTpFreELrbQMO3vTo+toXhRCi6FYQeprQHSzN9Qws1pY5HQ=
X-Received: by 2002:ab0:5ca:: with SMTP id e68mr505205uae.19.1588914365738;
 Thu, 07 May 2020 22:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org> <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
 <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
In-Reply-To: <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 May 2020 07:05:29 +0200
Message-ID: <CAPDyKFoAa3=Rg77Af7nNQOZN13m9NQYERosrqiK_kuL3s-YECA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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

On Thu, 7 May 2020 at 18:33, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 5/6/2020 10:06 PM, Ulf Hansson wrote:
> > On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
> > <vbadigan@codeaurora.org> wrote:
> >>
> >> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> >>> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> >>> in mmc_of_parse().
> >>>
> >>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >>> ---
> >>>    drivers/mmc/core/host.c | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> >>> index c876872..47521c6 100644
> >>> --- a/drivers/mmc/core/host.c
> >>> +++ b/drivers/mmc/core/host.c
> >>> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> >>>                host->caps2 |= MMC_CAP2_NO_SD;
> >>>        if (device_property_read_bool(dev, "no-mmc"))
> >>>                host->caps2 |= MMC_CAP2_NO_MMC;
> >>> +     if (device_property_read_bool(dev, "supports-cqe"))
> >>> +             host->caps2 |= MMC_CAP2_CQE;
> >> This change is breaking emmc driver on qcom platforms where this dt
> >> property is defined.
> >>
> >> [    1.543453]  cqhci_deactivate+0xc/0x38
> >> [    1.545627]  sdhci_msm_reset+0x40/0x58
> >> [    1.549447]  sdhci_do_reset+0x48/0x7c
> >> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> >> [    1.556913]  sdhci_setup_host+0x58/0xce8
> >> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> >> [    1.564900]  platform_drv_probe+0x4c/0xb0
> >>
> >> So, we cant have this flag defined before sdhci_setup_host().
> >>
> >> I will have to clear this cap and re-enable it in our initialization.
> > Thanks for reporting! I have dropped all the four patches from
> > Chun-Hung, so we can figure out how to fix this.
> >
> > Please help to review the next version of the series.
>
> Thanks Ulf.
>
> Hi Chun-Hung,
>
> On qcom controller CQE also gets reset when SDHC is reset. So we have to
> explicitly disable CQE
> by invoking  cqhci_deactivate() during sdhc reset
>
> SDHC gets reset in sdhci_setup_host() even before cqe is initialized.
> With MMC_CAP2_CQE_DCMD cap set even before sdhci_set_host(), we are
> getting null pointer access with cqhci_deactivate().
>
> If CQE getting reset with SDHC reset is generic (applicable to other
> controllers) then you have revisit your logic.
> If its not the case then only qcom driver would get affected.

Thanks for clarifying the problem, much appreciated.

To me, it looks like the DT parsing of the CQE properties are better
suited to be managed by each sdhci variant, to continue to leave some
room for flexibility.

Chun-Hung, can you please drop patch 1 and patch2 from the series and
adapt to this change in the mediatek variant?

[...]

Kind regards
Uffe
