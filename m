Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72952D81C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 23:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406731AbgLKWPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 17:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406729AbgLKWO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 17:14:56 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECFBC0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:14:16 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id r24so5618822vsg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+v8QnAZfVmqdM00Egj83ptDN3hTPJz74BI1U+QyDFM=;
        b=g7q7BwyabpGEt1cdczJmqxzv2S6iTyT9mkFah7BKR4FKU5Dr3lxJHEJC0Rr50ihcQE
         x1mkixFbjWFPbE0IiX/M08n2k7Qd6Hc7d6scCrDuqsa0QM/mQUpTbrYJPT9xoIGnPfRQ
         ULTkk4v6bW1+d6xwlNbplePkS2/QY4dSfBP1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+v8QnAZfVmqdM00Egj83ptDN3hTPJz74BI1U+QyDFM=;
        b=NA+qkEKLlpb0B7ie2P/viVJbSSBuIqqRCdEQNfaBsDxhPAaHqID3fFUCPAy8mxRCd9
         e2vNOZmAjDC4hvhudAG9Ba9VP+FqSGYt/FhlhNS3R9cPYiT4yeLYeAB+mnOngotkpBYr
         qTkUGouHAAPDMKHYnolMIUrO7zLSRJfM+g9JUQvlmIet1DPQkybkIKjkwc0h7otTQXAt
         BnqmWkN2Bmfx1zHuXytlqCS0x7St3aSFs9y2t+erg0VtOM0xJ6hBBeLlYrpiLpHhM/CP
         EMDELS7z79wQLlG9OLED3KK84FHM8CnStSFYerLupdxmQoiRsad8an7tKvPZ1mxcdYYv
         dVEQ==
X-Gm-Message-State: AOAM530L1q1EgHINIJnJcDkcDB2YizNxEOBVb0pYprzIIBj+/duUhfVU
        uy/VFlddkNEIJ61svS2gLcFY2+MCmV8Wuw==
X-Google-Smtp-Source: ABdhPJxF0INwwtUyZjpCQSNgWqADMARiFzmonAIJaW3nwsWwTnaXf5mSgKk7nInFbH8OP9DEteT6gQ==
X-Received: by 2002:a05:6102:31a3:: with SMTP id d3mr14081723vsh.20.1607724855142;
        Fri, 11 Dec 2020 14:14:15 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id s6sm1220155vkk.20.2020.12.11.14.14.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 14:14:13 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id t19so3369539uaq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:14:13 -0800 (PST)
X-Received: by 2002:ab0:6285:: with SMTP id z5mr14895918uao.0.1607724852718;
 Fri, 11 Dec 2020 14:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org> <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org> <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
 <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org> <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
 <92c61a18-0a1d-099e-4a11-b33a052b4ec2@codeaurora.org>
In-Reply-To: <92c61a18-0a1d-099e-4a11-b33a052b4ec2@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Dec 2020 14:14:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XvWFd84OxHmYgO8McV-ixe+ucMxhOdAWzHu4nLnnCtbQ@mail.gmail.com>
Message-ID: <CAD=FV=XvWFd84OxHmYgO8McV-ixe+ucMxhOdAWzHu4nLnnCtbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 11:07 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> I have slightly modified your test case (see at
> https://crrev.com/c/2584729) which is as per what i used in my testing.
>
> Here is what i am doing, setting GPIO to a fixed function (function 2 here)
> Note that function 0 is the GPIO (interrupt mode).
>
> 1) Pull up the GPIO in function 2
> 2) Pull down the GPIO in function 2
>
> Repeat above steps, and you will see fake interrupt every time pull down/up.
> This proves that if you mux away from GPIO then still PDC sees the line
> and can latch the interrupt at GIC.

Ah, super useful example!  Thanks!  Yes, I can replicate your results.

...but this seems to contradict my other test.  Ah, dang, I think I
see the problem with my original test.  The important difference is
that in your test you used the alternate function "mi2s_2" and in mine
I used "qspi_data".  When I selected "qspi_data" it must have been
actively driving the pin and _that's_ why I couldn't affect it.

When I change my test to use "mi2s_2" then my toggles via "wp enable"
and "wp disable" cause phantom interrupts.  That confirms what you're
saying: the PDC _can_ see the twiddles even when muxed away.
Presumably the active driving my "qspi_data" is also what caused my
phantom glitches.

So, as you said, that means my mental model is totally wrong here.
Wow, if I had known that earlier I would have saved a lot of time.
That'll learn me...

OK, v4 being posted and you can see if that handles all the cases?

-Doug
