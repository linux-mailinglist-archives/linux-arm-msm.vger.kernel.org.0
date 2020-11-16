Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03DE2B5161
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 20:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgKPTlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 14:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKPTlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 14:41:07 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EFBC0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 11:41:07 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id w188so20044242oib.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 11:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6keoknQ1MsKwnGp8atRoEQd/F72ZsuKmob9p0v6BNfM=;
        b=tasZqXsCQKKnY90DDBOFueK9bf/kmpGBOAMyvne0z9yM75iExvuVlnIk0btPNoCiCW
         yBmB+CMAN2cCImV2JGL6cpu714isOmHVLvsDEAO62hR3/dtTAQjN1lWQes+JEayo9rmB
         500b83lVZ/U5gjKhj7DHSvEwv0Dq75nbcJd3BKzd82GcHv2oH0iq+catANFxSt/ijASr
         sV5A7ECRSgg5x8ZJrv9XEQ94yyPRPGBZVW8MxWLb/Z4w5TaBkabO1CCmTtqPoREqgHS9
         lE0Iqa6FxfaQU7AcM3ngJPdJSY0Hw/6W+vD+vLQepB7oE+fQA7uoAEuYolzsyADOj3AO
         O8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6keoknQ1MsKwnGp8atRoEQd/F72ZsuKmob9p0v6BNfM=;
        b=TWMckZC20y/LVJF+ru6ZCn9jmfWMcadlSTYDRF830rwNO9ZtX2x9xpfOVSJliFAPNZ
         f+GHSCTnqPzDzGw0XN/dGYrIAyvSWhy2GsP35ZPXnhPJPy6n321rnSuoHQcLZGkEwzOG
         GabH3JMFVgjxkOczVO2K+1m5/mul6EPHvpW+xd6TXclTBt3ZcAC9Ni4mS3ilq/GTOwlh
         tNwd6jCfBoGgfB6HE8wlGNpHP4mQn+q1o/hyvGWEeW4YBfAbQyvLMd0HrqL6gfCvTzBL
         d75MYIKtRwIjwaBX4FSI7G9KIaICK8JOhuaJSiwIcDYqUIxgBL2FL4OBUPcAPSSPh1FX
         5Jmw==
X-Gm-Message-State: AOAM5323H7PFwpcr/a7LnILll2t+8d5tBKwCgM6i3nS/TlW2sU0zB/j6
        HTy0LwIxbknwcmDv0QzqcnGp/vSaOOdp+dOJUd0PpTUJjHY=
X-Google-Smtp-Source: ABdhPJwJgF7lB1wdlG4FfTWlBxtm5nm8SQZOWNMyXCDlUcOypoXNgjIFwoE/Hheuqlcxou/pA7ro3Cacgg/Nbmah4fU=
X-Received: by 2002:aca:c3d6:: with SMTP id t205mr218361oif.10.1605555666955;
 Mon, 16 Nov 2020 11:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org> <20201116155936.GE2224373@ulmo>
In-Reply-To: <20201116155936.GE2224373@ulmo>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Nov 2020 11:40:55 -0800
Message-ID: <CALAqxLXhpE-vw_jL-0_fc1eg-aU5_sLwoNAUiPdUUHx2ubxrkw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 7:59 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 04878caf6da49..c64d7a2b65134 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -248,6 +248,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >       tristate "ARM Ltd. System MMU (SMMU) Support"
> >       depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >       select IOMMU_API
> >       select IOMMU_IO_PGTABLE_LPAE
> >       select ARM_DMA_USE_IOMMU if ARM
>
> This, in conjunction with deferred probe timeout, causes mayhem on
> Tegra186. The problem, as far as I can tell, is that there are various
> devices that are hooked up to the ARM SMMU, but if ARM SMMU ends up
> being built as a loadable module, then those devices will initialize
> without IOMMU support (because deferred probe will timeout before the
> ARM SMMU module can be loaded from the root filesystem).
>
> Unfortunately, the ARM SMMU module will eventually end up being loaded
> once the root filesystem has been mounted (for example via SDHCI or
> Ethernet, both with using just plain, non-IOMMU-backed DMA API) and then
> initialize, configuring as "fault by default", which then results from a
> slew of SMMU faults from all the devices that have previously configured
> themselves without IOMMU support.

Oof. My apologies for the trouble. Thanks so much for the report.

Out of curiosity, does booting with deferred_probe_timeout=30 avoid
the issue for you?

thanks
-john
