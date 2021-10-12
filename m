Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92824429C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 05:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhJLDxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 23:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhJLDxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 23:53:19 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E25C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:51:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so82134022lfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xDjD7RZHpOUApPSwMJVUbWhkPb2dLWqLjd7p/yXant4=;
        b=zG7azwV81RO4QSJWumjEluj44iLDdvO6uEXZFWcfOWxf830iXJt7DaXFoll37RuVnQ
         nqPvlWSpdouL0tqFFI4TRIwyDl/w64SsIBEgeb9oXeCUg0WiTu6RvBFhL6NmPgUXgtxQ
         OFeLj96HEVMGrOtOct551A3E7KivhbKxV323aYhj0a7vcOTe2rLt9bY+ihHWQp+na4NZ
         rSenHSs+16C8vDCWaNivFyedmJw4tWB+7/wabSm1h5zxn8tijbwCLewYy1Sdht/mcxpR
         dGUouSFDTBtse1kfLeNKt+VteMwQpl2LArrn35yHuERCdOPKvMM2niSWYEoRVKOKWBqr
         ReRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xDjD7RZHpOUApPSwMJVUbWhkPb2dLWqLjd7p/yXant4=;
        b=skAJI3hJyJLZ97oidJ83lqRLbpjcQDETdbbegoBoQqpUlwzmkr/BqVyB6Sy5W1vcbQ
         GYxREPOltJOwoh5tMNCAump6tPvWta2X2c1rB0+UM4RCl0aQ2rY+r4VaIpRf7c82ulhX
         vH4RlLzAZz3fdu9DqnGf+3wJMJ4bG96zSbnl2uXtZ7Tfn6vJyChGOhiJxQqEdi9sjZ3s
         IHbxgWHZCx1OYwfWQuh/sCuT7VeJReWsHILQfMFMWopoclv0H7dpuHF3G1fC+Z7GGcLx
         nBS0OeFsU1bdHBze0OdCFesBjj/7gX9Hij5EnLhdm8wxlh5s5jSmvOZ5Jb5AcsQTjqDO
         OwbQ==
X-Gm-Message-State: AOAM531hJdlLtdsRn/mk0F2qCYveOoTyEhvGr7mcYAsvf4/WU0igfG4p
        1dfo6uKLGqdtQyITFj7VWXPlWKPEyU5BsMf5orgjXw==
X-Google-Smtp-Source: ABdhPJz4STbFFLSQ0yNRubH73OZ3bYCjOoIFDPPPo2B/adQ5KePnE56ta0US4JJxfaoMXLSYFaaC4/49MZdrO0ZG9M0=
X-Received: by 2002:a05:6512:1196:: with SMTP id g22mr8179076lfr.661.1634010676610;
 Mon, 11 Oct 2021 20:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211012032633.4169364-1-john.stultz@linaro.org> <YWUDAoDoPPewqcdO@yoga>
In-Reply-To: <YWUDAoDoPPewqcdO@yoga>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 11 Oct 2021 20:51:04 -0700
Message-ID: <CALAqxLW2BrbAmvTGA4t-+Sw0k70qR9u+Sorzo5bp1vtBHF_5Eg@mail.gmail.com>
Subject: Re: [RFC][PATCH] iommu: Kconfig: Fix missing config option for CONFIG_ARM_SMMU_QCOM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Amit Pundir <amit.pundir@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 8:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 11 Oct 22:26 CDT 2021, John Stultz wrote:
>
> > In commit 424953cf3c665 ("qcom_scm: hide Kconfig symbol"), some
> > logic was added to make the code depend on CONFIG_ARM_SMMU_QCOM,
> > however no such option exist.
> >
> > This caused regressions on db845c (and I suspect other qcom
> > platforms), but can be easily fixed up by adding a new option
> > to re-enable the newly conditionalized code.
> >
> > I set it to default to ARCH_QCOM, so folks don't have to
> > discover this new option to keep things booting, but if folks
> > would rather, I'm ok to drop that line.
> >
>
> I've not looked where the discussion went, but Dmitry posted this end of
> last week:
>
> https://lore.kernel.org/linux-arm-msm/20211010023350.978638-1-dmitry.baryshkov@linaro.org/

Oh, my apologies for not seeing this! I did search my mail log
earlier, but I must have missed it.

So yes, I validated earlier that reverting the problematic chunks
works as well, and I see Arnd did already have a similar patch to what
I sent out.

I'd probably lean towards Arnd's patch, as he has been uncovering the
problematic Kconfig edge cases.

thanks
-john
