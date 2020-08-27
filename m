Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E69255148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 00:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgH0Wqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 18:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0Wqp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 18:46:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC96DC061232
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 15:46:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so8249968ljn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLZFWr7UywbWBWsxRfEW6zYKyjxc4efoftXjUUQ/9us=;
        b=e6eCbNjLldnqILxCRTj94Xc4gRJC98eSJCrfjAZCj2W69Q/nfby8FxpNHub+9YP/Hj
         LfN3X8MUMgt1ygome6F8J6rhRDHPD92XUM+SCj0d5xfFimZD5m3KspewkyzSVMQsv+iE
         sAP9ZpUQri3IcGrXq02EFXPPCjf1YWugCv0B6DfsDM7gt8BqRz3PFOmB+HPgViOdrnI9
         IL5DNEfnfALvtf/xWAjVkiphHwgp/Sz37EXnIBu6MiF5gVDcpHB6df1K1Ic7NZznXKk0
         cEEsC5/bLC8+HelOtYsyeuB+tXNpOLBCbeah9Wto+5Uq29WpTP/gkA5m7u7kQ2tnwjDt
         lV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLZFWr7UywbWBWsxRfEW6zYKyjxc4efoftXjUUQ/9us=;
        b=GbqazbXFIZIYasltdhPUvROnt3rmJsdqjE7/ijdadAuh7NjkVa9gTfkUTh/UR1RZu7
         tCYc0AkkrRk2x6/epas7dQ8Vy4xfumGbBJd7tQWkKb6JZT58knUWpONSs9NuyGtjXX0U
         yhQjJErsFfCd0P/i8QIGticqYwBV+eaaoCx4aoSLoFmGp+pf5YZItnWaUiYhKlR6GjHz
         2j6c2yajES0xKIoS7Z5qIO1WHjgsgATDsFNua22u/l0ZxsElc2x6XikxkVW/tq8gR+zJ
         T3qfxFI+lmREGDUqbXjjRkbWZZsuossBvOSUojFZdI+d3e4q6rtjfk2wwPcAu8owO8Ud
         fMhw==
X-Gm-Message-State: AOAM531UdIHxQ4JOHpog+TrBdlF9Raij4A2HMIpBOldupbdxsAnN1Cpx
        HQfnfeSoZp88p4n+lLl/hphZz1h75CpmqyCl0LZTmQ==
X-Google-Smtp-Source: ABdhPJxy9FmKec2qELGcZgBtiPM/q05VpfopQpSLFkQKhaSSCuEtGIrHy31iWX3JZONJRvqKrPeVuPvX0II4zmJMblQ=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr9769659ljc.338.1598568403182;
 Thu, 27 Aug 2020 15:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-3-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 00:46:32 +0200
Message-ID: <CACRpkdaRf0W2Bo6yJZd3WL6XnFRbW--TcpKzT2OGGqk30_epVg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] pinctrl: qcom: Use return value from irq_set_wake call
To:     Maulik Shah <mkshah@codeaurora.org>
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
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <dianders@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 1:21 PM Maulik Shah <mkshah@codeaurora.org> wrote:

> msmgpio irqchip is not using return value of irq_set_wake call.
> Start using it.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it needs to go in with the rest of the patches.

Yours,
Linus Walleij
