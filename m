Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E142ADECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 19:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbgKJSv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 13:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgKJSv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 13:51:58 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AAFC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 10:51:58 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id t16so15536480oie.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=826np2PxKqFL3zSQ2fpJeZlz2mlRc601JZEk4tIHC1M=;
        b=Rlrl4p2Y6lZvqNR8E24S8da/cXQGeB1M27W/LlGW4hy5KNmaQobM8OTxClsc9Yl5uN
         6SPIANnQNxRhyZlcmHsQuyKTUs5CNu9s79IZ5oREJd0xETjA0dTCuGgA40DnTG+bxdGR
         LwEzdv2py8dGpXOoswmeHQY3Dt3slRmwRzEIqIEma59rg+BfjtznkGKOOELPMtcZCzyx
         YnaccValyI4B96qYUYEubMPqCHg/AuvnL+7UJvM9EHpSkhRjz2si2cKUJT3gn/A5xsSE
         i7/de52Op0WPOYrVperu3vFx8kGFYvWM+e2clE/EiCAiiG7SbVWdO7g9ZIbnbpz2PWWg
         Be4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=826np2PxKqFL3zSQ2fpJeZlz2mlRc601JZEk4tIHC1M=;
        b=HTZgEU9tx+9UGwE6+Kpz0S/jaXusk774TBXEm/p5jmRzyXxNZObQSCbIyyyvxXY2qh
         JAs60s2CmmvKt4jTOLdBooGBSuwhFbr0kOq6U84KVKJcFFIYfSfSXyLz5Mu8OPRXSKlS
         Rz9R8Yx9rLzLyW9d88t8vOPWn+QQSlUsx9xjYvDArYl7M8Nx2/qE0y8aK3+NmMiWJYe8
         RLXk2b6+s/bNhtGbut1PrLfCJq0mdmQRcjkfQ6wN2iTHX38bf45KBACbZJlQGRM9tRQa
         hXIt/Z4XsPWFrZx/YiLZ8WVB48o2vfn1V+/mAn92aO2kAMBe5Fcz3PY4dYjh7O5C2avN
         9M5w==
X-Gm-Message-State: AOAM532Klzir6N6utMb5mJLEd7j23vV7+EekX4kxVVjEmMRsQlLSb8Vx
        BiznVWKSYCeD4DHtzcE5ZCsU5p+f92y9dkEXcYzgdQ==
X-Google-Smtp-Source: ABdhPJx88dzHpuYy9bRpNGryBDTkX3nWTsEfw1TsuASXA/NUJ1dZb2sTcAyETEW/Ic3NbIkjRbQ8kWz0+ErBnlh8dlU=
X-Received: by 2002:aca:c3d6:: with SMTP id t205mr380138oif.10.1605034317546;
 Tue, 10 Nov 2020 10:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org> <CACRpkdYhfjRBz8GwMyCrOTzjd-Y6-G16xPjH6xhwSHcnaJfuXA@mail.gmail.com>
In-Reply-To: <CACRpkdYhfjRBz8GwMyCrOTzjd-Y6-G16xPjH6xhwSHcnaJfuXA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 10 Nov 2020 10:51:46 -0800
Message-ID: <CALAqxLXigwvauJgvN5FxoND60zybYw1L78POHY6KoxP2_gpkFA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 10, 2020 at 5:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:
>
> > Allow the qcom_scm driver to be loadable as a permenent module.
> >
...
> I applied this patch to the pinctrl tree as well, I suppose
> that was the intention. If someone gets upset I can always
> pull it out.

Will: You ok with this?

thanks
-john
