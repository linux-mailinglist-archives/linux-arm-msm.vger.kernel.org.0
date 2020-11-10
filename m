Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FA82AD7A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbgKJNfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgKJNfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:35:24 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BD2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:35:24 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id o24so7992664ljj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TwpBqZ9wlj7+aBjYzX3QdgPnoVhWXfegb/AHhFFvol8=;
        b=Cu4E3yWJ7MzfCcz1Z/f26Tyr8WutTCFXbfM0UR249wRJakMTDIUbLlBL84QdcbeuHF
         hxLx7t4IVjBj9F21rR+xXYKQ2yQTP25xJGR3vsSvG7hNUgdJ6K2xv7h2AQJobyrHjiTt
         iBCCE8JugddN0iqqsX2rppLtwGBIFie1v8wKAHYQivVxdsqflXEWeGMDRkBR111EJ6EQ
         Sg+gtibz03ieM1v4GlmM5xmEVi5ulmIWru4CkRGrK7l8MXJzHw6nWWTzzhYNmOh6v1Aj
         YmhSxZiX4bYIwl2uIkkTnqntFODGSr8io9hYFZ44SBDIjCzIDylSqo9+Nxjpb0sOQok7
         dQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TwpBqZ9wlj7+aBjYzX3QdgPnoVhWXfegb/AHhFFvol8=;
        b=O2O5MLarXuI4j89ruZSLI2KsLceuwrgFzlJnnOZvRhG7cedovxWleeXln5Xs7L+ndO
         mjY7kPaExrYrZicQ55qCUiNh/nzDA4Tqisd1qvuvmk9hclVe94BKz8p7QAxDBRPXSn10
         pVCCcAfwq9Uk1Ge9EKDQjG9ZbwQAktncZawpay5l3zM41DNY1OZUjrCxVAIYNcA5DIwb
         y4uG4yGW8NRv6L2J7ayNEJEwmt6j8nzps/s90hjI8fIfLNqbuoHeeMHNMurK2r2nT+iZ
         vfPM7SeROpCDMvJFl5bYrHuD+ymltv69KPkmG4RCFYAzp6VQX57/Ioc32yEGe0rGAFbS
         fhEw==
X-Gm-Message-State: AOAM5336X2aFJ+5kajlzB9j0DeIOig8DtXcakHD5dt68JNMbKr5g5uJr
        imWCLumw7/IJ3PuZ8DIDH9R/bSfDRKZwEBuPlX7i9g==
X-Google-Smtp-Source: ABdhPJwGVBWeBazu2okiJzWVPEutrrd1hrLuJ+fP/VIU2W3kUAdBSK6UGspEDbJXOApbyIq5kqIDpPZ7r0IoZSyMALc=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr8918344lja.283.1605015323045;
 Tue, 10 Nov 2020 05:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org> <20201106042710.55979-3-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-3-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:35:12 +0100
Message-ID: <CACRpkdYhfjRBz8GwMyCrOTzjd-Y6-G16xPjH6xhwSHcnaJfuXA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     John Stultz <john.stultz@linaro.org>
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

On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:

> Allow the qcom_scm driver to be loadable as a permenent module.
>
> This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> ensure that drivers that call into the qcom_scm driver are
> also built as modules. While not ideal in some cases its the
> only safe way I can find to avoid build errors without having
> those drivers select QCOM_SCM and have to force it on (as
> QCOM_SCM=n can be valid for those drivers).
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

I applied this patch to the pinctrl tree as well, I suppose
that was the intention. If someone gets upset I can always
pull it out.

Thanks for your perseverance in driving this John.

Yours,
Linus Walleij
