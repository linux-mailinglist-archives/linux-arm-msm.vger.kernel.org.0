Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A582C2D82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390561AbgKXQ4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390522AbgKXQ4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:56:05 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA07EC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:56:05 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id r5so11445705vsp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKhO+N54VgGJ49BJOFr6jokvHyMFWcmgDUq5BqHdsQA=;
        b=GXFhzRscqQ3tyn60aR6RDW5oQqWSU0oPbsapBBgHN1d4eubki9oMwxa5NeHeHk0gg3
         SQo2AtQBC9RKOx3D8ucQdrhAr2Pml0dNjcY7Eu/pIOV+id/1RCqgflYWAX4VAAMwklpB
         4pepvz7fYVL37894R881RDfg6GXr9DcWP2RtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKhO+N54VgGJ49BJOFr6jokvHyMFWcmgDUq5BqHdsQA=;
        b=UtJlFP+rRXk88CzhW8gMyW16wMogjsBVg/jRYWQRmel+qsNsWA21H1ar57cb/HK816
         wEIvBpshpv7Wtqp/kOtoupE39q/ILDiiczrZ5CkSZ767rLuiYGwD/QFVrCzQ3XoUewye
         Lu/slXuqdbCcrFaawnDRuFI+pLvPSfzkG6p4Gg41+kIOoKQG/SOwVl6y3vtAckhVJRuR
         +Lq2INFfyrvPjJdeqEbLbt0MBiSV2Zbnu+tanAgPaKNuV1vn5Oj7et3loTxkCCmTwD7m
         7zSoNC15TulIqTZy8T3krG0rHyqLEIvToRyjlE7LEN2W6a78ENoIhXJYz1yVIWNekLCL
         xlpQ==
X-Gm-Message-State: AOAM533j/oNozglZmjt6clYN4fHSOKEb7lx/TX6HbDl1Ge/Q43Zvya/S
        nKMf9MO3GQlLZtq3sif6ipCKWJHn/uj4fg==
X-Google-Smtp-Source: ABdhPJznjQ+FRPSOo3HXSrUdbVWnn/q0Sgfs8DTFyKRFJPlNm/EKqlvMXEmgpu3hq9/4hhGnuIBKLg==
X-Received: by 2002:a05:6102:38f:: with SMTP id m15mr4438811vsq.38.1606236964722;
        Tue, 24 Nov 2020 08:56:04 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id j16sm384140vkp.5.2020.11.24.08.56.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 08:56:03 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id f7so11440756vsh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:56:03 -0800 (PST)
X-Received: by 2002:a67:ef98:: with SMTP id r24mr4473856vsp.37.1606236963270;
 Tue, 24 Nov 2020 08:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
In-Reply-To: <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 08:55:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com>
Message-ID: <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 12:28 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 24, 2020 at 1:02 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> > We have a problem if we use gpio-keys and configure wakeups such that
> > we only want one edge to wake us up.  AKA:
> >   wakeup-event-action = <EV_ACT_DEASSERTED>;
> >   wakeup-source;
>
> I would need Marc's ACK to apply this with the other patches
> to the pinctrl tree, but I can't really see if maybe it is OK to
> apply it separately?

I'll make an explicit note after the cut in the patch, but to also
respond here: we can apply this patch on its own.  The only reason I
sent as one series is because they address similar issues, this patch
stands on its own.  Patch #3 needs #2 but patch #2/#3 don't need patch
#1.

> Also are these patches supposed to all go in as fixes or
> for v5.11?

Wherever it makes sense.

-Doug
