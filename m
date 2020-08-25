Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92225252168
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 21:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYT73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 15:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgHYT70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 15:59:26 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:26 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id a127so71217vsd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8b4RVU+WnTo74tNhlNkNqnD8k6zvXZjBOKRfwHkRmnI=;
        b=Vo8PAURx7ORtd6yU5einn0LAVp/LY4DkDOYh0P4dgOmDIaVsQRPmUDC28SYLYa9rqq
         SDKtkNjLuobPZZ5I+QrAE/JInPIxlmrhZKHva5dOV+4H+EK1EvC/dDnBaL2d0qUPuW5s
         ACUhet6iMVgWy7rrxhpcnQ6E2hoN0yuhAH4f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8b4RVU+WnTo74tNhlNkNqnD8k6zvXZjBOKRfwHkRmnI=;
        b=crbRfsZmu9/+K61+SwPjYZXTAFc5W9ibuf+gOOC9PRh3ZqfRBOzNedC+hHzkg9KfO8
         Bjbw3n5yMDqGs88pzyGuUiQ/naVWnbosEuUJT0gczjsN6HDbR7AJffH4mk0qdXJ5sB52
         tSj1S0MjENCZDOQmTvQacxV6qlmFq78kIAonAcuWKUR4NBbJ+VBS7lBGZRPb1S5Ow8Mt
         nsnkQSLvOHtHnriL2r3ukR5gNgSlXGhZofb2i+R9PjwqL80FDeL91fhHtTys+NGpHvzc
         WY40h1NjYeZecyxKPzwPBs7eSn5pQUTgRsnRyPsbla0fBo61nweGhmKtmIk4dpFVv3bD
         t0Bw==
X-Gm-Message-State: AOAM530g2T8GFRjIR9/XaO7aLjUI44MnbkiafwR80EAToIQ2BZz1YP4p
        Cabkie1PsIUYm4bHoGkJ3QhTUfdj0d6jnQ==
X-Google-Smtp-Source: ABdhPJw+hel9bSI/sH5NO1g6jM8m0udmaL/loSxOqfCzHnzJbzc0P7rrlG5Ll6GHHEqAqI7Kztu6tA==
X-Received: by 2002:a67:2504:: with SMTP id l4mr6639571vsl.182.1598385565352;
        Tue, 25 Aug 2020 12:59:25 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id x124sm15644vka.34.2020.08.25.12.59.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id e14so48800vsa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
X-Received: by 2002:a67:2787:: with SMTP id n129mr7024016vsn.219.1598385564167;
 Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 12:59:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViaBn-HJ3d3ofLXNRKVaVDTKeOrMruvmEj9cVAGBntww@mail.gmail.com>
Message-ID: <CAD=FV=ViaBn-HJ3d3ofLXNRKVaVDTKeOrMruvmEj9cVAGBntww@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] irqchip: qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Aug 22, 2020 at 9:18 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
