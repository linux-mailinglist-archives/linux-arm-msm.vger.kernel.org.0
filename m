Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2EC2AD79A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731787AbgKJNeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbgKJNeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:34:15 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E11C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:34:14 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y16so8625913ljh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
        b=h3fs2yDbhXzIKAaNrM+h8p/XSPvr3EH34ss06aruBBygOKO9jCk2Y2fGVpLMiUHrXI
         LE6Lep9wERBSv9edvF2R2doBF6UAXzV/t6wvEqJGmP2fv/BKT/WdMvx9o3EnhCP6JLVi
         Q1xUeqe6Uu/vuhmQBEe7HAqerEUcGEq2nQwgaTgrpDmXvvfR5zTO9Gvv6n00nixmJ40E
         IwnKLpjoF9/iK0H8bBSdj24Ftf0Wj/OpGR7dBsrwYGZC2Z+nEBeRufIeob+3TLmbiUHU
         tgVSzrE7cn5YGxROsHaRqAZ4NEXXzsPQLOwEu1nPCsTN9ZyJANwF9wGuLlNEpwaEPI9O
         /iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
        b=eksxy6qvOkD0Xl/C4LWeUXQSlNpDnILFkVzS3LUKwj3KviP1R36F9a+bjzRr69D/gW
         qWVVUtcgKWV5SZIujTGnYRxnjaGcU6mdWNHgSkBUESvf6yxggo9qzUZGufJLousfx549
         /RJvhBP4t0arMAXSn35nrDL+qKRe3I+NxsEHLHXQodlsIwwQpIteo4OpdCubJT/uCLfG
         AJBaw2YFCy2WyTNqmtuTT9RKWpIqemVKc8pwBkL8Z2+sw/D0QvLd82JaWYkhvMidobDS
         jlJDB0Vxe2om4zUQCIghIazjMlqSsWsCi/xlNooljs3dA3w3iv5dNPKeoJGuMLTYIqk/
         ajHw==
X-Gm-Message-State: AOAM531QeYEnUaPd5g9GCtwLxp7HbQlEaQm4Sgd/HO1nPrAM+1Rz7Qjc
        4X7OFjN5wd14xvIXHw3My8mV00qY3+bdHyWBvCV06A==
X-Google-Smtp-Source: ABdhPJw4l95Aug60napiBX1bSOo2GaerufcLINoM+ZkU5hACFyVVdkrKEpvI/w+Qkg+bt6DgzwF/QHjFBj4ZnqZLbQo=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr8277742lji.100.1605015253248;
 Tue, 10 Nov 2020 05:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org> <20201106042710.55979-2-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-2-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:34:02 +0100
Message-ID: <CACRpkdYf-SGfqjbE_SFfJLidH8v+Q3=_hwKkHZGfKNgD_GdLMg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
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

> Tweaks to allow pinctrl-msm code to be loadable as a module.
>
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> module setting of QCOM_SCM.
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
