Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07ADE2D81C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 23:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406751AbgLKWQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 17:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406756AbgLKWPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 17:15:43 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076A5C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:15:03 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id q10so5615791vsr.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExGz06IR8/hB/D8hM56dkt4Qx9p2agSJq7Q9YhAN+ak=;
        b=Z04TVtbgzIullsksOZRNt0DmPoFu6jbJ+sb7drKB1zWLcjmds75NbYBY4H8THii4/A
         auEKR4IqVvIUKtK4NweZWS1RmDsGhf3mMA/7Q9m61NVRqUe6cBTqq2t0IdEDDkUYHcwB
         YG9bBRp0eq0/PCv6uexHGOliEUU7DQF0NQrwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExGz06IR8/hB/D8hM56dkt4Qx9p2agSJq7Q9YhAN+ak=;
        b=fHzIIbgxy4jCTtX6p8QWlZ2ZhlUqaarcrxuBgFOYPTDJ4QcB5t0vY+jKE9Fh3m4/8W
         iVk/IF1WGzYMr4yiruAZiLl8qH50mfESwHOQTVP3MSKVXNGJ8oMaicQJ+zqMBp7BqI73
         UL4LWyjCR2TRWMIUv+Qd8zct2F416SROd+cDtOvnONvO0V5t+sKQXjw4WfJNLuVtMeaF
         falAVdAZp3xGpX60hDATHUgpSP3nNbzDOyaj+1ps02QOxnaSr9/7HCRq5se2QQF/AL9L
         4NtXYaApr/YxHy/OYaHGFYn8TkQrosDxxX4KTsigq1Wf2SZt6tQBmrm3QNqunTjZsfrd
         ii9Q==
X-Gm-Message-State: AOAM533MiwoRo3b5pItLWH8EXDYgOGr+He7QpOKE5QQGKawp6yd48Bef
        d6MXG9QWU+bP6x8BYPGoGurAs0U7AZd8Ig==
X-Google-Smtp-Source: ABdhPJzhFm2hjdaKOlPE9GVKezKTKeEb6FOPm93Ra+qlOxjXsLn4b3ogpC4/JBqIvfICDJQ24XGikg==
X-Received: by 2002:a67:cd8e:: with SMTP id r14mr3158556vsl.8.1607724902088;
        Fri, 11 Dec 2020 14:15:02 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id o18sm1200568vka.7.2020.12.11.14.15.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 14:15:00 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id v8so5645083vso.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:15:00 -0800 (PST)
X-Received: by 2002:a67:bd01:: with SMTP id y1mr8708522vsq.49.1607724899973;
 Fri, 11 Dec 2020 14:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201209163818.v3.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid> <160763738065.1580929.11062492180508041591@swboyd.mtv.corp.google.com>
In-Reply-To: <160763738065.1580929.11062492180508041591@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Dec 2020 14:14:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WfpX4DFT731u91RdD4TtJothmO4-oguL=r4pdjfhbobQ@mail.gmail.com>
Message-ID: <CAD=FV=WfpX4DFT731u91RdD4TtJothmO4-oguL=r4pdjfhbobQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 1:56 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-12-09 16:41:03)
> > Conceptually, we can envision the input on Qualcomm SoCs to pass
> > through a bunch of blocks between coming into the chip and becoming a
> > GPIO interrupt.  From guessing and running a handful of tests, I
> > believe that we can represent the state of the world with a drawing
> > that looks something like this:
> >
> >  +-----------------+       +-----------------+       +-----------------+
> >  |      INPUT      |  -->  |      PINMUX     |       |    IS_INPUT     |
> >  +-----------------+       |                 |  -->  |                 |
> >                            | output bogus (?)|       | output bogus (?)|
> >                            | if not muxed    |       | if input disab. |
> >                            +-----------------+       +-----------------+
> >                                                               |
> >           +---------------------------------------------------+--> to PDC
> >           |
> >           V
> >  +-----------------+       +-----------------+       +-----------------+
> >  | INTR RAW ENABLE |       | DETECTION LOGIC |       | STATUS REGISTER |
> >  |                 |       |                 |       |                 |
> >  | output bogus (?)|  -->  | maybe handles   |       | latches inputs  |
> >  | if disabled     |       | polarity diffs  |  -->  | that are high   |
> >  +-----------------+       |                 |       |                 |
> >                            | maybe debounces |       | write 1 to clr  |
> >                            | level irqs      |       +-----------------+
> >                            +-----------------+                |
> >                                                               |
> >           +---------------------------------------------------+
> >           |
> >           V
> >  +-----------------+
> >  |      ENABLE     |
> >  |                 |       +-----------------+
> >  | nothing passes  |  -->  |   SUMMARY IRQ   |
> >  | through if      |       +-----------------+
> >  | disabled        |
> >  +-----------------+
>
> This diagram doesn't make sense to me.

I've gutted most of this code for v4 after Maulik pointed out why my
testing was flawed.  Hopefully v4 looks saner...

-Doug
