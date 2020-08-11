Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58BA24213A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgHKUSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgHKUSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:18:51 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A54C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:18:51 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so7252851pgf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=81NTZpiDGt+DeUizhccfQdwoJcBOsmeDza4v9LRaS7Q=;
        b=T2pPGoewiPvpKJXBD5E4PN02jutwvTNLcRqdRrgP2E5cscCIODU8xre0K6Osk2++nZ
         OPTK0ZCaP13n0PvGhkr6G8u+FQ4RmvpwBowCG815DBoaD2LVFl3kbbOvb5SUosE1b30e
         t0F5H2mWqYRNhhPVAWztu1uPrp1MZ8ZGHdNpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81NTZpiDGt+DeUizhccfQdwoJcBOsmeDza4v9LRaS7Q=;
        b=o0AGHzgY1rxbEZffJ2vcVjpqo2S2aPmCDnlKbc1ky2yauSxxy6uQSDOCe8hmKnDMb9
         KC1ptMT+ABIsl4opCmdy1Ol3qMxbOse7/XFt+srLwdW9Qh4aP0+kuf3ER2GBFR6DbLdh
         2XZS1TU+/FTOi4KVXd0oiopKzmXjNlLDpVr4BxBQZ4ztSMP9qqxYGBz9kTlrd28/GipI
         /q5o9l6U9nME5MBosWLZlnZVB1SrUy+PIMN6c3x1Ev9wmHWOq2vCSu7bSIYFjWwtR3VL
         OweG6X4wND6WsMr9HMkzqh+cL/27R06Pw6wkQVzXp3gyioLVztXL6bY9lK2Mobmq/4zy
         aCXQ==
X-Gm-Message-State: AOAM530cfHztiudaBUBpEhYyyyWWin2ZYuxIr6xLWMs8qpCAtoZUzSG8
        WBJpn1WxCL1zUAQY81o2i3YWJ48BzFY=
X-Google-Smtp-Source: ABdhPJy7hObfViMsRyZWyOdyf6aCixYklCQBdrQkTxkJz2R6nBWuMsomrwdIYx3MDcn1vPPSsWyJaA==
X-Received: by 2002:a63:c252:: with SMTP id l18mr2247641pgg.349.1597177130499;
        Tue, 11 Aug 2020 13:18:50 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id kb2sm3457998pjb.34.2020.08.11.13.18.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:18:50 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id d4so2421916pjx.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:18:50 -0700 (PDT)
X-Received: by 2002:a67:d714:: with SMTP id p20mr26453646vsj.119.1597176669782;
 Tue, 11 Aug 2020 13:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:10:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uvsd3YBK0PS5X4ScAtC1q0Xfh8q=JQ1iTRKi=VVSU4Gw@mail.gmail.com>
Message-ID: <CAD=FV=Uvsd3YBK0PS5X4ScAtC1q0Xfh8q=JQ1iTRKi=VVSU4Gw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] genirq: introduce irq_suspend_parent() and irq_resume_parent()
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

On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> This goes with the new irq_suspend_one() and irq_resume_one()
> callbacks and allow us to easily pass things up to our parent.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  include/linux/irq.h |  2 ++
>  kernel/irq/chip.c   | 28 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Thanks for posting my patch.  Small nit here is that when I saw the
patches listed together I realized that I forgot to capitalize
"introduce" in ${SUBJECT}.  The two patches right next to each other
that both start with "introduce" where one has a capital and one
doesn't look weird.  Hopefully you can fix in the next version?

Thanks!

-Doug
