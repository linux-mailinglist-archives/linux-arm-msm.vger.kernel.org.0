Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7B4285B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 06:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhJKENV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 00:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJKENT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 00:13:19 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0931AC061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 21:11:20 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t2so15318485qtx.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 21:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJkzv/qLRuMHpfFpS4P34KqTWJ3Vx+EAHqhp1ZZOPqI=;
        b=g7nfie8pkWJr8W9Kqw/m1Vzt+2qKlzvyuggXbDSXZwyI3x53OnoV+ClCoAT6bMqbo+
         Fw9xw9Q+uutz8BMZkylGG9FSYeCVHjZlVmRe4dG9eAzOFyL8OtwLXuwyJMGujzhjOCqT
         4xbpCjnVe8bTFEsxJpdMDp1oRQjQVP9rkw3UjLxf7y75Pt82JMC26UcvpJHuYPifUF7x
         hse5hvFMSgnTujr4TFfW8sleWouVyzHOPNRji5xM7EcFK0c+HMaln5X+EUOu8swmQQBm
         0CzyD03a0bQfFRESp5UrOPO3KClKDCJz72DEewHOE/75UzuGCOABNP+DD+3sFpi+ZGi6
         9RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJkzv/qLRuMHpfFpS4P34KqTWJ3Vx+EAHqhp1ZZOPqI=;
        b=sf2FtebUdCLeaYGLsOw6D2Lk9b9DYX3FounP3EP5Zw7hh807Og0FU1uVBnE5h+uZiK
         i+bEN31BGp9EVtheH/hwhNVGNz3w++NqXKxV6FYXN0xHdHGFUYNvHl4j4udWRpRmLJy+
         PSbjN930+0Y3NxJ5bce8vtzFXcxXJ1tlJUNBlZCh/iX53JGkAySk5fEWAbXjOHNOu9aV
         p1xVRZMoEFl2nwx8k5gKFTQ4L/xBEPfXxhYmuaywiKNtkKCvnW4imVVRg62GcAifYw+4
         u8NuznBEclNQ12qbBQ16pFXANMMc+r8q3aXixOYo5QS8lq7EUg5fJfS42T+qDFVOMFHQ
         2MvA==
X-Gm-Message-State: AOAM530L1f6mChNX4yVEczGTpP+VAcXZfFTU+ZTGvkJ8kMKXJ3Nh/UVU
        e9K+IhLNMrPdupF5VI3F7flCfLYFdJM8Ybw55etzBA==
X-Google-Smtp-Source: ABdhPJxRuJ9TkoBbKOvVwOudaBHMqMs50XuLzRSTTUx4oR/M2EB3whe37CwIsMGxez4j3kIQ4T8PvHWhehH7hl2PAYo=
X-Received: by 2002:ac8:1011:: with SMTP id z17mr12653163qti.388.1633925479158;
 Sun, 10 Oct 2021 21:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga> <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
In-Reply-To: <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Oct 2021 07:11:07 +0300
Message-ID: <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Oct 2021 at 20:42, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Oct 10, 2021 at 6:17 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Sat 09 Oct 21:33 CDT 2021, Dmitry Baryshkov wrote:
> >
> > > After commit 424953cf3c66 ("qcom_scm: hide Kconfig symbol") arm-smmu got
> > > qcom_smmu_impl_init() call guarded by IS_ENABLED(CONFIG_ARM_SMMU_QCOM).
> > > However the CONFIG_ARM_SMMU_QCOM Kconfig entry does not exist, so the
> > > qcom_smmu_impl_init() is never called.
> > >
> > > So, let's fix this by always calling qcom_smmu_impl_init(). It does not
> > > touch the smmu passed unless the device is a non-Qualcomm one. Make
> > > ARM_SMMU select QCOM_SCM for ARCH_QCOM.
>
> Sorry about this bug. I was sure I had it working, but I lost part of the commit
> during a rebase, and my randconfig builds still succeeded without it, so I
> sent a wrong version.
>
> > Arnd's intention was to not force QCOM_SCM to be built on non-Qualcomm
> > devices. But as Daniel experienced, attempting to boot most Qualcomm
> > boards without this results in a instant reboot.
> >
> > I think it's okay if we tinker with CONFIG_ARM_SMMU_QCOM for v5.16, but
> > we're getting late in v5.15 so I would prefer if we make sure this works
> > out of the box.
>
> Yes, makes sense. For reference, see below for how I would fix this properly,
> this is what I had intended to have in the patch. Feel free to pick
> either version
> as the immediate bugfix. I'll give the below a little more randconfig testing
> overnight though. The pasted version of the patch is probably
> whitespace-damaged,
> let me know if you would like me to send it as a proper patch.
>
>        Arnd
>
> 8<-----
> Subject: iommu: fix ARM_SMMU_QCOM compilation
>
> My previous bugfix ended up making things worse for the QCOM IOMMU
> driver when it forgot to add the Kconfig symbol that is getting used to
> control the compilation of the SMMU implementation specific code
> for Qualcomm.
>
> Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c5c71b7ab7e8..2dfe744ddd97 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -311,6 +311,7 @@ config ARM_SMMU
>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU if ARM
> +       select QCOM_SCM if ARM_SMMU_QCOM
>         help
>           Support for implementations of the ARM System MMU architecture
>           versions 1 and 2.
> @@ -355,6 +356,13 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
>           'arm-smmu.disable_bypass' will continue to override this
>           config.
>
> +config ARM_SMMU_QCOM
> +       def_bool y
> +       depends on ARM_SMMU && ARCH_QCOM
> +       help
> +         When running on a Qualcomm platform that has the custom variant
> +         of the ARM SMMU, this needs to be built into the SMMU driver.
> +
>  config ARM_SMMU_V3
>         tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>         depends on ARM64

The patch seems correct, but it becomes overcomplicated. What about:
- restoring QCOM_SCM stubs
- making ARM_SMMU select QCOM_SCM if ARM_SMMU_QCOM

This would have almost the same result as with your patch, but without
extra ARM_SMMU_QCOM Kconfig symbol.

-- 
With best wishes
Dmitry
