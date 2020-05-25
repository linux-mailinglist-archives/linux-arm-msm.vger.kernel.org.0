Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FC91E0DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390343AbgEYLzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390169AbgEYLzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:55:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDC8C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:55:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m12so18056267ljc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+mkEBPdVGpBGFyoI8j8HFLVKYs4hB0Ze1NrDN+H9//4=;
        b=Dl9TrwmQPeoE3jaUpcbhwTsZJCgQoRRdu4baaLsu04TpdTNzaqoI6O3YXQ+GOf6Sjp
         FB0MZ0UTIz1JjeI1Z2dk6xN2Fp9Fmkmep7JxkbmiabYb5gilLzb3dxM5Rrm8qBIsa7ku
         sPaakWkOAr6eIqCD+XlAJbUP3W0TuDCwK2BNkVndEMiBbKxXGomN4j7kaLJgKZwbWXc9
         8jHHyW8egtFvlYcDOvqFxk4kjTXOovA6bT1z7CQKYB/RMjnSuSE9M8bzVT5c8PHdel3b
         zBhhIdRVdIa0/32PC73lIN8+gsj0wVNTOdl7Gg51WLQgMJB6sTWXu9c7Da+QEorLu53m
         dxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mkEBPdVGpBGFyoI8j8HFLVKYs4hB0Ze1NrDN+H9//4=;
        b=iTnSAHtFz1yvhEr6YUfu3obcyapX696XGIUZAc4NSUzEqLft3+mNG9jPhINNBcH3Q6
         Kt4sr0QMpFm97uUpHRGtjc6RXqfYUmEi1DTloeh1ojJAcN+HY4D1TUdoJHGShrjxM0tI
         adNjCdhhwcJ0OrGbyWD30dDQUlBSRTg9c2vpKmAkHQr5nbOgakTNx//4HHgCjeSGfja9
         GRzZNiWvFHxch2ImqXbegxFQFaeEvx0IowJt8+NuxuVHcKQWnKMZUDVFC7FzCb4Erjms
         06gc5ixvvFnSUFa7+Jz9zNalELd6xMC5tPtOnGXwg4H22BWiDRC8LelVVfLpTUzoSmTK
         TbJQ==
X-Gm-Message-State: AOAM532uXMa8dDcFKQXUeEOlCEd2M/KvPC3j+xP2CIYK0Pfy3hq3gkEx
        NQMf4nw5KUH3PKVPcLS+rUyCqXmZUZ7Cx924ffGWpA==
X-Google-Smtp-Source: ABdhPJyCykHTiRF9bx/CWTPtp2I0DZ+jTkLxBQaoNUbWITp445SBYxAQbXbtO2c017bHBytURvA27YjWsWZBsXSIrME=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr10762076ljk.144.1590407748281;
 Mon, 25 May 2020 04:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:55:37 +0200
Message-ID: <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Maulik Shah <mkshah@codeaurora.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:

> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
> callback is implemented then genirq takes unlazy path to disable irq.
>
> Underlying irqchip may not want to implement irq_disable callback to lazy
> disable irq when client drivers invokes disable_irq(). By overriding
> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>
> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
> if irqchip implemented irq_disable. In cases where irq_disable is not
> implemented irq_mask is overridden. Similarly override irq_enable callback
> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>
> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

I definitely want Hans Verkuils test and review on this, since it
is a usecase that he is really dependent on.

Also the irqchip people preferredly.

But it does seem to mop up my mistakes and fix this up properly!

So with some testing I'll be happy to merge it, even this one
patch separately if Hans can verify that it works.

Yours,
Linus Walleij
