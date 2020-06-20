Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097772026CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 23:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgFTVW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 17:22:58 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33574 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729000AbgFTVW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 17:22:57 -0400
Received: by mail-lf1-f66.google.com with SMTP id g2so7538127lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bu69mp6xYWLDQSTwZZePNMWDQ59FaV2SiSFYy8pjBQY=;
        b=BEK7VN2OmrlKRSG/e9OsYVGM9t0SGut4yO1XoCDqBns+EyWe9Og4n1eX2t4nRltuL+
         x5wfhHR7jj3CWrLxOCc/LnjcDRGn+rRWym+xRsNFal5F7BVlIaNboF1Ff5lY7mkcVhWE
         /JEM0Eo8ek/fwjZ64aZFUCx4MEpNUiR4uNUdjQTfPproxhWLhl/CMnd6vRMJ/Vh+olps
         ESgLuxAtySplCfoo6fYq9gGdfDhkF3xosvL8nhrcKABMAJduOdka/pQcUaJgAO8l26Vm
         kbfRxelGF5uRFZcgvdniVOyCHhz8FcHM95iT57XAuctop0mBCkRlA/zLwFo1hkKAXzsg
         Ss8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bu69mp6xYWLDQSTwZZePNMWDQ59FaV2SiSFYy8pjBQY=;
        b=eTAl4s98zgn827CDnjlX4PIIT3JoURaaAG7MFjZEsWdaYEHlQNcXgOfjLc6d5k6yRZ
         9Hehnf+CkSd24pJxqA24hQKYRfv9j75UR5P3/cjIc856KYU5fkxPzLVyR3nNESi7s0B0
         Qf7LAUs4aJqAe718Hzowg/Gbm/htbxH/pghBYdaGM5OaHMnJL3ThF8/PWMQZ3IkKW+pN
         hOSKZlW/KKL1UiIjvJZZd8dvAj+ujzWC/fhBCm/hOH3cKS2jbnwauIO4fDHPN661pF3C
         CLZFpMrLj9fR8zbnsWSbbNRsESJEMdqvSlpp+w9FLfXzlD0CzeJ8YWUmSfrFhAFA0PB5
         0B3Q==
X-Gm-Message-State: AOAM532KK7mKMHptcNXZRRpU9ofJxIjdJRZxZ/PQoNRqyRMcVOoPBYP9
        X6fQp7Y7LSFsRE2H3VUZ9MDPJ0s2P/vbaOARpSakdg==
X-Google-Smtp-Source: ABdhPJy/RkTLIDBZFRMNpiPSsRVm5Ak3I4Hbs3gJhBT50nyx7v4sALg7fToWgIJskHBwAdm4KDklfhLMkVmhKWNt8Ak=
X-Received: by 2002:a19:ccd0:: with SMTP id c199mr2956592lfg.194.1592688113991;
 Sat, 20 Jun 2020 14:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200616061338.109499-1-john.stultz@linaro.org> <20200616061338.109499-5-john.stultz@linaro.org>
In-Reply-To: <20200616061338.109499-5-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:21:42 +0200
Message-ID: <CACRpkda35FZC=uXr-ipxZQ2SWU2tUincOztJmDt+Sa52FKQs=w@mail.gmail.com>
Subject: Re: [RFC][PATCH 4/5] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 16, 2020 at 8:13 AM John Stultz <john.stultz@linaro.org> wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Unless there are dependencies on the irqchip patches I can apply
this if Bjorn is OK with it.

Yours,
Linus Walleij
