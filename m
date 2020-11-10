Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCAE2AD796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbgKJNds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730473AbgKJNdr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:33:47 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC8BC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:33:46 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id j205so10149997lfj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q+6VXi/5fY0aP8aAL5vEFMrlAfYUy6hH2SKWPsznW1Q=;
        b=FmlAGRfSk4J3zgXbJDv8yHH20lrNZWFBkHg/DnPlYXHe2VccCLgYFTG8bjdBptozIj
         C2SnnYxyrVFoEIY8U1UhC6ub3gwPf//MyHB4gfw2rbPTQhPCPbO5KO4f2s9/x01x5c2q
         d6E8PMeQIsrG5wuAilg4l2FHg93/R/9JGkgflAWK9Hl3OzEvAijLIUAx7ofhK+AaESb+
         1GmPNkrH2tMp7ciAAlxzkR08SQ+fhcGiiToI55gcDiBOR7/lsm7BVrnvEM5ycDQakWp1
         s0DF7ekcsMLZBvO0AbIver97jjPizf/gVWAnl+PQFCdABi/mw1+gmjWTI039J+xVWXTO
         gE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q+6VXi/5fY0aP8aAL5vEFMrlAfYUy6hH2SKWPsznW1Q=;
        b=eNHxtcOYT8N9D4UbgelMC9I/6yue1vZyyOKpKgXFwL1rOMXWV2S/EkaR+dsrcTs7Gd
         fLtQYzf/hb8SV0Czky1UZ86a0tjjwzfKVTNt8M9Bk8jwxJJ0bdlwdYMJkA45e2Ey6ig+
         DGbG79FmVhdDfUDRNcDvJI0lguDTX6tgF2OlJzkdu67ELCIvsASNM0bZx6BXlFCgRzrC
         NbshAbfDPFvBIkkvvKJvhY6zQnlDE0DYRSVs2VjNVZGIfSaeeA3XwKRX3p5tws5qv1iW
         0QMJIez5f7jvBVvUOvjiYlqYG9m1RpwxohyOWfDot1DfHwSAB9vYiWTsXVTwJ/evVcOr
         xD5g==
X-Gm-Message-State: AOAM5327R0hwj33DEpvDdJJF50FDpBKUV1CA9fPIDyZPzM60GRAljYj1
        JF3xw6i7BPXFAUV066CIx8NeO9FLffHYB3mdne0oUg==
X-Google-Smtp-Source: ABdhPJwuAaqcMMw0q1QKD4oDxOC2Zd/QBV3ne5UQWRpT2XN+r51MyMsPZhWlpVqWlaIpmZiQGEvtoy7cfNG7jCXEoB0=
X-Received: by 2002:a19:f00b:: with SMTP id p11mr7200799lfc.585.1605015225371;
 Tue, 10 Nov 2020 05:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-1-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:33:34 +0100
Message-ID: <CACRpkdY2oH47Om1Xa=ku4csU-YHBB8XFrsemgfOvh0XCTog-aQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a
 depenency rather then a selected config
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

> This patch reworks PINCTRL_MSM to be a visible option, and
> instead of having the various SoC specific drivers select
> PINCTRL_MSM, this switches those configs to depend on
> PINCTRL_MSM.
>
> This is useful, as it will be needed in order to cleanly support
> having the qcom-scm driver, which pinctrl-msm calls into,
> configured as a module. Without this change, we would eventually
> have to add dependency lines to every config that selects
> PINCTRL_MSM, and that would becomes a maintenance headache.
>
> We also add PINCTRL_MSM to the arm64 defconfig to avoid
> surprises as otherwise PINCTRL_MSM/IPQ* options previously
> enabled, will be off.
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
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Patch applied!

Yours,
Linus Walleij
