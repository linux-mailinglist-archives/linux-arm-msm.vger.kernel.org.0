Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786303FB726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 15:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbhH3NpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 09:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236771AbhH3NpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 09:45:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3440CC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 06:44:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q21so25958428ljj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOYXhGaqQ6MRJEfF+E0ER+xBLRcBgZV7cWZXRVeFtj4=;
        b=oSzgQNH2PwxCqBTmQ00Scj9XVNl4PjTfZ++xtN2IEitrBIFKHRNOL0Nw67BOqqLDXc
         ActdqjZTwLU+LZHafZglw2/Ka0Otxu1mSTzy+f7Iy3+t336Rl1FhjMz2TVigE0AiEfMe
         sJwAOqAQwp9MrtcdCua2tE/O2fbPeJIJfuZ5yIh6gTpYFU8ZYLHM96NUBCjy6ffwMpVb
         uT2td0pEGA0MAXd9lc/rMbDlvrPemi+GAcO1VH4u67DOlWf4posmy4rjN9xZEewHg12T
         9cfnXrYjqrFceBAQli3kRcG6SJrpB64dhbVykWoa0BUH1uuNw3Xod+WsHj2D6vQZ4dTs
         W+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOYXhGaqQ6MRJEfF+E0ER+xBLRcBgZV7cWZXRVeFtj4=;
        b=sAXWB8yHmB9JGVygfOKSrtQ4hs5l4vzWEbKrMO8JOXCfx7cnSDxX3h4eQUQoprIb2V
         oVBqA+Uttb/6hP4D1xKACRNpHbr1PHbSN5Q1tly5SaeS13G6jep1/VX3wDxhOy2WdM1m
         THWzctoxsXvMEPrUF1h2ROvzhjNEr4uQw1RecB2RsfTEzKU4MRWD8CmPCax3Hg3CYnEg
         g+IMkqeHFtwCb7ZOCPdt4s+VOjgNBsEDdbQ2Q3J8u9eTdfvEtqZbwR99R1ogI7lwJNK/
         WmbxDCx8TSj5WIn3uyPAS5G24wJwGuY7+hYZRAvlhLemfPEiNqxIpGME70/GUZYBJs0G
         tWNQ==
X-Gm-Message-State: AOAM530ZaPCx9AKdu4cQiY56Lib/q7O8g83XMaRLylp81dwSMK/YIcxc
        lO0toWcYhZlAIhGCawnfB62GgVJTqOoleZb1q4u3Ww==
X-Google-Smtp-Source: ABdhPJzSbjrfR6nWoj1MvF5PjDjLKW0SfuR+5h1BG6O5DQ4hi8nvSRGwK/6dSx4oy0x4iF+t9nGT3L28hehyyLhGsjQ=
X-Received: by 2002:a2e:bd09:: with SMTP id n9mr20595594ljq.76.1630331054549;
 Mon, 30 Aug 2021 06:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
In-Reply-To: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 30 Aug 2021 15:43:38 +0200
Message-ID: <CAPDyKFqMJmJRLNYF=gWvAEH8wtJzrxrZ9KLz62t4XNsD84vr=Q@mail.gmail.com>
Subject: Re: Question about MMC_PM_KEEP_POWER in MMCI driver
To:     Yann Gautier <yann.gautier@foss.st.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Aug 2021 at 16:34, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> Hi,
>
> In drivers/mmc/host/mmci.c, MMC_PM_KEEP_POWER is unconditionally enabled.
> This prevents correct low-power sequence on STM32MP157C-DK2 board which
> embeds a Wifi chip brcm,bcm4329-fmac (this wifi part has not yet been
> sent upstream).

Exactly why doesn't this work with the STM32MP157C-DK2 board?

>
> This MMC_PM_KEEP_POWER can be taken from DT with the property
> keep-power-in-suspend. This is what is done for other MMC drivers.

The DT property is what should have been used for mmci as well.

>
> I wonder what should be the best solution for this.
>
> 1) Remove MMC_PM_KEEP_POWER from the driver, and modify all SoC device
> tree files embedding a arm,pl18x with adding keep-power-in-suspend;
> property (except stm32mp151.dtsi file).
> This can be easy to do (~10 files to modify). But that could be more
> board dependent, if an SDIO chip is plugged on this MMC IP.
> And the name keep-power-in-suspend can be misleading as it only applies
> to SDIO.
>
> 2) Remove MMC_PM_KEEP_POWER from the driver, and modify board DT files
> with the property. This could be a difficult task to find all those
> boards. And this should be applied only for SDIO configs.
>
> 3) Just modify the driver to apply this capability for all MMCI chips
> but STM32. This could be done in the dedicated file, in
> sdmmc_variant_init() function. But some boards based on STM32MP15 chip
> might want to keep this capability.

I would suggest option 3).

As a matter of fact, we also allow MMC_PM_KEEP_POWER to become set
when parsing the DTB via calling mmc_of_parse(). So just changing the
default value (don't set MMC_PM_KEEP_POWER) for the stm32 variant,
would do the trick I think.

Kind regards
Uffe
