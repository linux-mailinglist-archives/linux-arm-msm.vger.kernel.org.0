Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB2441C728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 16:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344537AbhI2OsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 10:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344582AbhI2OsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 10:48:12 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C74C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:46:31 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so3105830ota.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JgcoX77LyqJgFfCrFyyxOmmlaV13zT4pyPZ6+xdzSpA=;
        b=spTZQ2DbWP0psTWqELtDKdf3ctbS0vkigNQvxkRIwhOKUH8KugD69eFtioiLkoK3Gy
         wtqV+fvcjNiD9+cDbUIXJF+qCw7Y3d8YdkSsHI7IVobxU9CSf3vqhqyWu/Oq2SRFBdHo
         neDrQGuVYezgzLNIKMm1q/0+ChFeu07DQsXdVBLPC5Qj84WxDssil2uJW+0l+TPuEHxn
         Ll6FKrKdGbGmGBGxLGRQmQdKBljtf5QtFgK2eTl3cDvLsBHoaJmId4Ifl7rnnbvBhn0D
         LTj441MSq8B+PPi3TmUJ+3vz8OX7s4Ovl41Aj0dWJafRLB3UbpVpcLmdU8ARwxFqFRiP
         nSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JgcoX77LyqJgFfCrFyyxOmmlaV13zT4pyPZ6+xdzSpA=;
        b=K9774v9AQZBxV6AVfYWcxZW1MDWI5zQNrS6f9m9P1f0c6QFP07bUR2fxONWsPirslJ
         gwmA2v5XPDb5cJPsB4SFEnugI3BLA7y0I3sm8m4HAkMgYaO6I6DLgfaZ8CO3453Snfiy
         POLmXnmXelok+Y9g/qtib2CPgr42/g89Zf2b5uhF2s3kB9Ew0DWMZXXPaqoN2XFPI/SZ
         1fCy2xF0iAQfeEo0LVZXzTk7hS2YeBmgXWSVvmBI/78MomKFk4P6t+K4BEVqFB057fKF
         lYVBoKX7rkileriR+AmCgcGk8vXZ3V+wledlKtGECsUKVUTPLwzKUudddxGH2eEY19JS
         sAyg==
X-Gm-Message-State: AOAM530tTGQF52+8+sQndjDrzaFCYVLkSM/ji9JCAwWC42s5yAoHprBe
        K50pXI0mmd16Eaas2WWvs20iCA==
X-Google-Smtp-Source: ABdhPJy1xutLgHZ1k75FBuuFr8v0/9rSKe4U8iMaiX+gLlBxKTV+rJxW6+Z2BJ3/QZooCn7GiUFhFA==
X-Received: by 2002:a9d:6254:: with SMTP id i20mr324075otk.349.1632926790406;
        Wed, 29 Sep 2021 07:46:30 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v14sm5473ook.2.2021.09.29.07.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:46:29 -0700 (PDT)
Date:   Wed, 29 Sep 2021 09:46:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
Message-ID: <YVR8Q7LO0weiFin+@yoga>
References: <20210927152412.2900928-1-arnd@kernel.org>
 <20210929095107.GA21057@willie-the-truck>
 <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 29 Sep 05:04 CDT 2021, Arnd Bergmann wrote:

> On Wed, Sep 29, 2021 at 11:51 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Sep 27, 2021 at 05:22:13PM +0200, Arnd Bergmann wrote:
> > >
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index 124c41adeca1..989c83acbfee 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -308,7 +308,7 @@ config APPLE_DART
> > >  config ARM_SMMU
> > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > >       depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > > -     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > +     select QCOM_SCM
> > >       select IOMMU_API
> > >       select IOMMU_IO_PGTABLE_LPAE
> > >       select ARM_DMA_USE_IOMMU if ARM
> >
> > I don't want to get in the way of this patch because I'm also tired of the
> > randconfig failures caused by QCOM_SCM. However, ARM_SMMU is applicable to
> > a wide variety of (non-qcom) SoCs and so it seems a shame to require the
> > QCOM_SCM code to be included for all of those when it's not strictly needed
> > at all.
> 
> Good point, I agree that needs to be fixed. I think this additional
> change should do the trick:
> 

ARM_SMMU and QCOM_IOMMU are two separate implementations and both uses
QCOM_SCM. So both of them should select QCOM_SCM.

"Unfortunately" the Qualcomm portion of ARM_SMMU is builtin
unconditionally, so going with something like select QCOM_SCM if
ARCH_QCOM would still require the stubs in qcom_scm.h.

Regards,
Bjorn

> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -308,7 +308,6 @@ config APPLE_DART
>  config ARM_SMMU
>         tristate "ARM Ltd. System MMU (SMMU) Support"
>         depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> -       select QCOM_SCM
>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU if ARM
> @@ -438,7 +437,7 @@ config QCOM_IOMMU
>         # Note: iommu drivers cannot (yet?) be built as modules
>         bool "Qualcomm IOMMU Support"
>         depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> -       depends on QCOM_SCM=y
> +       select QCOM_SCM
>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU
> 
> I'll see if that causes any problems for the randconfig builds.
> 
>        Arnd
