Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A00505E99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 21:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238158AbiDRTlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 15:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238012AbiDRTlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 15:41:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4872422B18
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:38:27 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id s18so28765618ejr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0voP44fyY7XGXFGcJkasfgBTf6x1VqclP4C49VR3XuM=;
        b=QKLUw+3071xERftQyKvPl2WNNRY6O+4SZPC6715pcJO5SigVoGnGoWm61a1ET3u+20
         uUW1QJ5rxlmh8o5Eb4EDED1D4tQG0GF0iGxvCCpHIzWXRgO+aH0uvsAdNFVAsWAcwna6
         yr154rP1eJ47akx9Ri1IJV76X+Zkgyc8I3MvVBj4CKWTHjpeXch9JyCtb+heoqPaw7DI
         j754EFIMjXuDQz9QQh99f/7kc4MunCF5uGT4uSIAf7TqQcCrq8Uu2Ft+vxEhdwty2uCG
         i7YGf+ZxGRymBPZtuwpdRDy59gjUVnN2VyTRi4YloCP7bgC5jw2L5wfjhgY39BAfo+rG
         rFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0voP44fyY7XGXFGcJkasfgBTf6x1VqclP4C49VR3XuM=;
        b=gx02sWoPCxtvA0uAKXza47c4+l0kqNzBnKvcy1XuprwHJr7bbl+HwojiPx4dduLeff
         hME00hVg1YEgNz6/zlB7Rq0wcYFZWbOj2wwz0yb+HpE0ZwH7htz+IoJ3VtmLLc6liamR
         3vAecF4Es9G4QqFMzSQkrZ35p1GaaUMlCM/zSoNlIRkear6afzdxCYGVxC5eNeFqKM5h
         H4vRNC3Xw17F52yQ+G0JILW3gOulhnnLAukzjCd7PhVPcwB5HNZ2KYLt/FdEK3kF+IeU
         JTxql5Tf1VmcVu0kpUBoqR3qYdxmYKvxeD5IbYcf25tF6pgTxcI/fDsH9p8dgXUxmajW
         AzgA==
X-Gm-Message-State: AOAM531Rj3vK+HJUkgj/myr6XjuPyW65opfl2Xq//eOtmxpqzkfgbC4Y
        j2VepyS6GMPUPLMTHEhOqJX/GR9sxvGZ3Q97O/OWsQ==
X-Google-Smtp-Source: ABdhPJzJFyOQr+32fWgDUc7K4tqLymuKG4FRwWqKBsFUMkY8P1sAYrl3abF8tYGoymgSkD4+g8CsO+ZJy+UfvKicuYs=
X-Received: by 2002:a17:906:360d:b0:6e8:7f57:2d4d with SMTP id
 q13-20020a170906360d00b006e87f572d4dmr10750809ejb.736.1650310705836; Mon, 18
 Apr 2022 12:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220405135444.199295-1-maz@kernel.org>
In-Reply-To: <20220405135444.199295-1-maz@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Apr 2022 21:38:15 +0200
Message-ID: <CAMRc=MfbpLPtx46pYSOt3X+EobHnwj-8aQzmyw+srVChkxbr7g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 5, 2022 at 3:55 PM Marc Zyngier <maz@kernel.org> wrote:
>
> This is a followup from [1].
>
> I recently realised that the gpiolib play ugly tricks on the
> unsuspecting irq_chip structures by patching the callbacks.
>
> Not only this breaks when an irq_chip structure is made const (which
> really should be the default case), but it also forces this structure
> to be copied at nauseam for each instance of the GPIO block, which is
> a waste of memory.
>
> My current approach is to add a new irq_chip flag (IRQCHIP_IMMUTABLE)
> which does what it says on the tin: don't you dare writing to them.
> Gpiolib is further updated not to install its own callbacks, and it
> becomes the responsibility of the driver to call into the gpiolib when
> required. This is similar to what we do for other subsystems such as
> PCI-MSI.
>
> 5 drivers are updated to this new model: M1, QC, Tegra, pl061 and AMD
> (as I actively use them) keeping a single irq_chip structure, marking
> it const, and exposing the new flag.
>
> Nothing breaks, the volume of change is small, the memory usage goes
> down and we have fewer callbacks that can be used as attack vectors.
> What's not to love?
>
> * From v1 [1]:
>   - pl061 and AMD drivers converted
>   - New helpers to keep the changes small
>   - New warning for non-converted drivers
>   - Documentation and TODO updates
>
> [1] https://lore.kernel.org/r/20220223154405.54912-1-maz@kernel.org
>
> Marc Zyngier (10):
>   gpio: Don't fiddle with irqchips marked as immutable
>   gpio: Expose the gpiochip_irq_re[ql]res helpers
>   gpio: Add helpers to ease the transition towards immutable irq_chip
>   gpio: tegra186: Make the irqchip immutable
>   gpio: pl061: Make the irqchip immutable
>   pinctrl: apple-gpio: Make the irqchip immutable
>   pinctrl: msmgpio: Make the irqchip immutable
>   pinctrl: amd: Make the irqchip immutable
>   gpio: Update TODO to mention immutable irq_chip structures
>   Documentation: Update the recommended pattern for GPIO irqchips
>
>  Documentation/driver-api/gpio/driver.rst | 175 ++++++++++++++++++-----
>  drivers/gpio/TODO                        |  19 +++
>  drivers/gpio/gpio-pl061.c                |  32 +++--
>  drivers/gpio/gpio-tegra186.c             |  32 +++--
>  drivers/gpio/gpiolib.c                   |  13 +-
>  drivers/pinctrl/pinctrl-amd.c            |  11 +-
>  drivers/pinctrl/pinctrl-apple-gpio.c     |  29 ++--
>  drivers/pinctrl/qcom/pinctrl-msm.c       |  53 ++++---
>  include/linux/gpio/driver.h              |  16 +++
>  include/linux/irq.h                      |   2 +
>  kernel/irq/debugfs.c                     |   1 +
>  11 files changed, 293 insertions(+), 90 deletions(-)
>
> --
> 2.34.1
>

This may be coming too late but for the GPIO part:

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
