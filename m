Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B8944AC4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 12:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245564AbhKILLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 06:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241787AbhKILLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 06:11:23 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AB8C061766
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 03:08:37 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso9703128otj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+G3Lrbcy0EyO7hdvkch+Sv/6pjlgWUWMyGebQReyzg=;
        b=xhHXwnxjwwSmY1SZZZ+GTy0PcDo+hQfjVaBgfbi+9YB3SH1FJvtAIu07roe/OvDeYX
         oClayepzt4EfDQzdn6RT19t4bi49JFwMWVsWz9IZ4zZY+MNfAZJFnBEDgIOoKHtx1aXP
         zlGLz5mBEpZBlHPzJmTanj3B0n7jX4w8UGxZRK2BfgIDthB3CiTEET5D7SZEXpz6SJcO
         vM1eUj8nFaeJ026QX2tUuo7HjplPA/p1qprEKR+xJSj6byKyNRu5pHmHuYoGXQhN9th1
         yjVgJiGV7nC8lA6jf+SBUQL/jKGeB7Aq4Dg+OTMNKHcISQL+rnkSp1jZ8alcMt2wVL6o
         Qx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+G3Lrbcy0EyO7hdvkch+Sv/6pjlgWUWMyGebQReyzg=;
        b=HAy0NciLxtmxhYS/AQ33joD4F2PasAwlUj6BnXE5GnggkKnqofdZMjZtrluejxI/fU
         RJR+ET9glvSegFjolWFhxLyOE0ElxATd9ChJooNa22zLDS0iY+c9rN2a2LRjjgb2zO1Q
         16ET5LgZwCsT93mcODVA0NPghARvAXlNq/EJqWtmGd73+BAXunSk9l3haWWN7jEmHlqy
         JfvbM9OFImYcoEGskhR0FeDxlIKwjkR4WZPF76EoC16Q/eaj4xY8rrEk9GEdJfMG/p/l
         4xRKXjhdpJUkzElklvdpSTkrHqursaSzB68dK1aZ+7ONPky7quARYOqRu5CXPnptYKoF
         vhsw==
X-Gm-Message-State: AOAM533m3/JJmFX0SQfB7baaVUwzhCv3AFH2+2h/3JohAzfjWAsmULxu
        rOIJKTRj6MlhHMK5Rs4VzrPMB5cGEr32P8SSv0CQ2Q==
X-Google-Smtp-Source: ABdhPJxnfHg55h3LAurq3eK4N+Gzju+eUBJuOMAZrQ9cyTGkqZ6aXrm0I+nlIynOiCWVZH9L28ayNM0pQyDUNxJARLo=
X-Received: by 2002:a05:6830:2809:: with SMTP id w9mr5139316otu.237.1636456117012;
 Tue, 09 Nov 2021 03:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:08:25 +0100
Message-ID: <CACRpkdatWHsP+b8uxj8-ekMsn9rfVPSm7muBNG09PBU-RH2oEA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 2, 2021 at 4:41 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> It has been observed that dual edge triggered wakeirq GPIOs on SDM845
> doesn't trigger interrupts on the falling edge.
>
> Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
> SDM845 suffers from the same problem described, and worked around, by
> Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
> edge IRQs on sc7180")', so enable the workaround for SDM845 as well.
>
> The specific problem seen without this is that gpio-keys does not detect
> the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
> consistently reports the LID as closed.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
