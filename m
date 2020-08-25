Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4252825216C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 22:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgHYUAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 16:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgHYUAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 16:00:19 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290ECC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 13:00:19 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id o184so76315vsc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vx1r2CNa1rBAm3wMcMuYtNO0QstZgyCPzPi8kkUlIz4=;
        b=KZ3pczexEVfIWGV0IPWdQYQBqYBChCLEGtApRH3QfnlBWqlOq7DlgnonpQmEeHUr9Q
         CcDjp+GBQCLuy08q0QefeFt/oMhUiuz7IYGYn7y53OmbbjhagUOyhSljtDmaGrh+QCYk
         IBApJr1K/C8AUJcz5Qn0It9c7W46C0PZP4bo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vx1r2CNa1rBAm3wMcMuYtNO0QstZgyCPzPi8kkUlIz4=;
        b=ZXZU1t3l/NbeEkulfosMHnhinPc1aTuxho3UpRx0bu9wk0Xm/bxdwDNZ7PQp+0MSOu
         l4VognpgZrp82tvAU5NFZlMusEtY+lKQW85ftgdB2hId0Lrj6NiYMCn6LGTjKWIzhpbi
         vtKauzQXls61iNxDqiGj1/KdRy7Qap4+UWhnsV5f921CjBkfyKpYdaKOyexx0cHYIVUX
         hDDQmUaqlGHRGki7ZfpTNbgBJC24bhgreu6uFwuWaLaMZMvMSTTZck8NKxj0t9p/tSEt
         chWpWp8ScdiYeJROHUnG5vcR/+AqVoDGL+juq+5ZY8xhJTewBoaL91ydfQU4EfsepuxV
         bp8g==
X-Gm-Message-State: AOAM531cfARfoEe9XFxTBVIXuUHr5ezyyI8eyXUqntj/aZy5NPKiviJL
        89DddvdGSi2mx+Nybl0me03TcNAAT0wvOA==
X-Google-Smtp-Source: ABdhPJzejzo5ptNWJPnDJAqhNunzs1+1GuUUoahODwqgx4BYKlz4jt9X32cfsboKQI/6IjyDF9jBtw==
X-Received: by 2002:a67:1001:: with SMTP id 1mr7115979vsq.23.1598385617975;
        Tue, 25 Aug 2020 13:00:17 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id m23sm4726vsa.19.2020.08.25.13.00.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 13:00:16 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id o2so15808vke.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 13:00:16 -0700 (PDT)
X-Received: by 2002:a1f:9b8f:: with SMTP id d137mr7014781vke.97.1598385615556;
 Tue, 25 Aug 2020 13:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 13:00:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBidZvVit+P-HmQpxdi0XwD7uwkawJMCjPAp715Cg=4g@mail.gmail.com>
Message-ID: <CAD=FV=XBidZvVit+P-HmQpxdi0XwD7uwkawJMCjPAp715Cg=4g@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] irqchip: qcom-pdc: Reset PDC interrupts during init
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
> Kexec can directly boot into a new kernel without going to complete
> reboot. This can leave the previous kernel's configuration for PDC
> interrupts as is.
>
> Clear previous kernel's configuration during init by setting interrupts
> in enable bank to zero. The IRQs specified in qcom,pdc-ranges property
> are the only ones that can be used by the new kernel so clear only those
> IRQs. The remaining ones may be in use by a different kernel and should
> not be set by new kernel.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
