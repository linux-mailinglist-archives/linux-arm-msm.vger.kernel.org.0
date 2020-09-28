Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB8327B6DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 23:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgI1VNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 17:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgI1VND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 17:13:03 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEF4C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 14:13:02 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id e2so1665761vsr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Atw6tlilgo9PIrWGO9ZwsIYlXI3Umohxy7sKhaDAMxM=;
        b=TV9amf1jSDj/q0zk2+YZ06YRaT4r/ztQksbRXH4VE2Ei0ZNblIhDRJdW5oI66xgqbK
         HZ9HR42RKge6Jr2OIBuQIzgx3dLw6RJuVKBUvHDBNW4o4Cxr69cZ9yjDLFPcuMqKKw3H
         cO3UUNlSeBTrZCMRZ+GhIb0oXVHPKu3IlK5gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Atw6tlilgo9PIrWGO9ZwsIYlXI3Umohxy7sKhaDAMxM=;
        b=oKCIdxNjVIBw1/IVnxO19t6H0kQtGtHLy9Y5i/aczqQdK4fnMQCzEkXrjtHtcDaHXb
         JXDumj8ozA7IhyuRMGn0wi3vxkbKv/fi8u0i+GQpMuWqFT3PczM4n2TqvXTqOZMwOBUe
         ZbdOynNzzOXtsM5/OIia/+tcuuscnf3wcvsEQDOXgbhR4DMR+H10m8CJ0y32NGKIKN0c
         Yx0/vVPmM7qH7H9ZHAKgB5SJJcQueLMlLCJrUWBqqfI/kUPZRU26dbaDvvH0OLdLtQOE
         evfPPr1hiWtTMwje2Mza6OyFTYdSAt6DEuw2MyBt7q9/YXLgm23PNB6dgzcUDAsXUorJ
         wpSA==
X-Gm-Message-State: AOAM5310afL4S87FO2SWXZWHgfzJfXH6xqlRq11AhLdQ13nwaoLhOZ2S
        Ckbs20cmspRGPYVeuHtg+S8YR8s7demt5g==
X-Google-Smtp-Source: ABdhPJxxtGfF4/26vimGpOsr9k6p5KCbyd/tK5ODUP2lXOpzUIxBM7z4VGu4o9OuT7SAfIhjXMhxCQ==
X-Received: by 2002:a67:77c8:: with SMTP id s191mr1189389vsc.38.1601327580352;
        Mon, 28 Sep 2020 14:13:00 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 89sm196934uaq.9.2020.09.28.14.12.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 14:12:58 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id a16so1651792vsp.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 14:12:58 -0700 (PDT)
X-Received: by 2002:a67:8bc2:: with SMTP id n185mr1119720vsd.49.1601327577585;
 Mon, 28 Sep 2020 14:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org> <1601267524-20199-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1601267524-20199-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Sep 2020 14:12:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqkgWTrGLrUMdBWGD8_wd4yMr+e6U-xCxFg4B2LfhTRw@mail.gmail.com>
Message-ID: <CAD=FV=VqkgWTrGLrUMdBWGD8_wd4yMr+e6U-xCxFg4B2LfhTRw@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
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
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Sep 27, 2020 at 9:32 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> An interrupt that is disabled/masked but set for wakeup still needs to
> be able to wake up the system from sleep states like "suspend to RAM".
>
> This change introduces IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag. If irqchip
> have this flag set then irq PM will enable/unmask irqs that are marked
> for wakeup but are in disabled state.
>
> On resume such irqs will be restored back to disabled state.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  include/linux/irq.h  | 49 ++++++++++++++++++++++++++++++-------------------
>  kernel/irq/debugfs.c |  3 +++
>  kernel/irq/pm.c      | 34 ++++++++++++++++++++++++++++++----
>  3 files changed, 63 insertions(+), 23 deletions(-)

I will freely admit not being an expert on this code / knowing all the
subtle edge conditions, but this seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
