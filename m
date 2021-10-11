Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE12428968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 11:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbhJKJLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 05:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbhJKJLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 05:11:32 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6B6C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:09:33 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id r15so7705741qkp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmIaLKrbsPcdQfNFBZqmZSPhrHWq8Kaob/N8FHo8Fls=;
        b=bngqbi74I3OBcqTY+RIZ8kWeuOyHiNmThFK5GldqFngvi3XfTkB/kMa4N7aEWxGf4C
         kmh669p4sU54vplIHzevZ6ejfSTv8hQ21EVKnM3Jwjd1juoNN9ok18sOGEGqKGm5O9aH
         yhIP76S1l/RUi3QUGSxRbqeKPvS+o6qroqohq5p8ltaBoa+yfGFdtK5ZE3EMpU4WKzMe
         CJMphtVwLtgfuCENg9doUy6BDJckfpz3LduUs/nX7anoP4IElpegKccrPUZlfiuoxQCR
         waBzIhbVBdiKwgqZ5Bw+t2UKyjagxdCSTYIJcAMPGNUOLWOYTDu/jgsdMw45ow121n44
         6s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmIaLKrbsPcdQfNFBZqmZSPhrHWq8Kaob/N8FHo8Fls=;
        b=GqyaaUxyIUWkBAvKhTnCDzJ+IcNXgW7sWfias/7ZQQoDYochjQoBUuyqONAPTvPfb9
         XrwI01sjY+1z2iJf98bZLsQqGjG3jEVYC4QtaTZZjHBSaf+AosVsfMvnuxJyjrOX8hRp
         ojDHJXQsiHhKvt2Sf8akMaEjxxGBV9f2xBfP4Sx3wWuyK6AZ0kjuxqQkH1Rq171xCaez
         btyaW0Bzsd9D9on66ru64XhS6uYat+2ZGagGCYohv6Rxm0/iHC1ezHdJwBABcetBLkA5
         LQurt1TvG78gZiSZyJBlr9UqGdgfnuAh8GjBfeDfjJAHNGWcDfSrxEALnvgy3+6V/Pdo
         nHDQ==
X-Gm-Message-State: AOAM532TrFu9T4F5n8vng4l7+DDZpbtmIeeBA7vXNwdWRHY0g7s7TOHE
        nona4DDymEE+olN3FRm2kUyDTpC2/pxgQTea7ni1hg==
X-Google-Smtp-Source: ABdhPJzCAxoh0kT9ewt0cklMxy0VT0v9K2ZuPa0Z4w1Vsd8VSQc2Y+VzTMDaIihHeM05/lPiH0fVvh6FpbA5nCRCiuM=
X-Received: by 2002:a37:bac6:: with SMTP id k189mr13621788qkf.186.1633943372114;
 Mon, 11 Oct 2021 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga> <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
 <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com> <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com>
In-Reply-To: <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Oct 2021 12:09:21 +0300
Message-ID: <CAA8EJppAx_bweNhQuQuA5pQkWpyvtYNqttL-fiKgqpJpRqHMKw@mail.gmail.com>
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

On Mon, 11 Oct 2021 at 09:09, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Oct 11, 2021 at 6:11 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Sun, 10 Oct 2021 at 20:42, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > The patch seems correct, but it becomes overcomplicated. What about:
> > - restoring QCOM_SCM stubs
>
> The stubs are what has led to the previous bugs in this area to often
> go unnoticed for too long, as illustrated by your suggestion
>
> > - making ARM_SMMU select QCOM_SCM if ARM_SMMU_QCOM
>
> I assume you meant "select QCOM_SCM if ARCH_QCOM",
> after we stop using ARM_SMMU_QCOM?
>
> > This would have almost the same result as with your patch, but without
> > extra ARM_SMMU_QCOM Kconfig symbol.
>
> The "almost" is the problem: consider the case of
>
> CONFIG_ARM=y
> CONFIG_COMPILE_TEST=y
> CONFIG_ARCH_QCOM=n
> CONFIG_ARM_SMMU=y
> CONFIG_DRM_MSM=m
> CONFIG_QCOM_SCM=m (selected by DRM_MSM)
>
> The stubs here lead to ARM_SMMU linking against the QCOM_SCM
> driver from built-in code, which fails because QCOM_SCM itself
> is a loadable module.

I see. The idealist in me wishes to change my suggestion to
'select QCOM_SCM if ARCH_QCOM || COMPILE_TEST'
but I have the subtle feeling that this also might fail somehow.

>
> We can move the "select QCOM_SCM" in the ARM_SMMU_QCOM
> symbol if we make that a tristate though, if you want to separate it
> a little more.

This would complicate things a bit, as we would no longer be able to
use 'arm-smmu-$(CONFIG_ARM_SMMU_QCOM) +=' construct.

-- 
With best wishes
Dmitry
