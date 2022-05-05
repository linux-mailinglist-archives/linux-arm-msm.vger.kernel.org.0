Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7279151C009
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 14:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378339AbiEENC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378330AbiEENC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:02:27 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76BD5419C
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 05:58:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id n10so8571373ejk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22a0aEe/UHOud0IxgtpbxI9XkgviWAY8z8RMp+dcuwQ=;
        b=1XRpN+uo+kP9aG9wT4n4cKnAZn7JO6V4622+J8wG4BXRaqAGxbs5Dd/NSV2hfai1nm
         JIp4TtzEX6agoxnoZmsxVJlw+O75peinbaq5ddt4q6oYYwi3vfUA1mxPmu3FgGQ7drrO
         E4BSHtDOF6F8bHQZSWIWQaqmrlmUbOVQ1Wfkedc2AzzdP2jwo007Yui7Uns5qUEqY3rf
         WlfiyqSgCpLLAJEwbGn5DWUM0UlydXH7IFdl+g/RyoaJZYyhKJb2OZxDztCeOtJqDTif
         2huGVEanDK0Zjiv18nCNYDQQC59OaujFBzOmxafpwYZjTniReZh7M9vCYAX3zyR88fe3
         s+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22a0aEe/UHOud0IxgtpbxI9XkgviWAY8z8RMp+dcuwQ=;
        b=dEWTJTWTMhmogpI+zwu5aFRh2mifq9JZ+nca+DcZyoPT/NnwZ0WlXWUAXnrSgJhRLH
         +VP66Ld4UsaSLXf5G8x7jnAp+U8JdLVBLa0zXyzSCYd6hih7v8B3RotWm9e/yXHunojk
         /i+tnM2YGi/Kv4ThlrKI1KwS1qGW7iswXUvLUDn8bHozdZRQVzMfDRLDlIfSqhXdQnPJ
         qrwp/E4e2zIcwKBuiLhMTbRXubLY7VEGPV3Sah6Jduu8q4uA39QFkcyW974iFAmTKa+5
         sxnykeYIRQAn8caSk95agkhHShRTNxPQma6bgYG26npqSkK1ppK6YHsNOwrpXVdrODTX
         sKEQ==
X-Gm-Message-State: AOAM530s9OmgUtBwY7MKPcCUn6lM0iMmR6iw2zcxWwOwexvhk4QWRAon
        0ubOa2knRUe5aEKNkwK3r1kYjrX0C8UV/FTYp+86AQ==
X-Google-Smtp-Source: ABdhPJy9F/3TMLwB/gxgUg1zQckteUkdzDetKT5ae+EhzlpwYypnDRimt8G0RZmsnzLZkknum7KcgQukcAOiLvOSRzQ=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr22968073ejc.101.1651755525314; Thu, 05
 May 2022 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org> <CACRpkdb32NuJ8jdsk6ox7ViVjK=9WWWavS=aYcoWTCbaO3WkTg@mail.gmail.com>
In-Reply-To: <CACRpkdb32NuJ8jdsk6ox7ViVjK=9WWWavS=aYcoWTCbaO3WkTg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:58:34 +0200
Message-ID: <CAMRc=MdwbzkpL5Vm2aEXVPKzj78GsFStk+3uZexyrJMB468U4g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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

On Wed, May 4, 2022 at 11:22 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:
>
> > > Bartosz: if you're happy with this can you apply it to an immutable branch
> > > from v5.18-rc1 and merge that into the GPIO for-next and then I can also
> > > pull that into pinctrl?
> >
> > For what it is worth, I've pushed this branch into irqchip-next.
> >
> > You can pick it up from:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable
>
> Bartosz are you pulling this? Most of the changes are in GPIO.
> Patches have started to arrive that go on top of these changes
> so would be nice to have it in both GPIO and pin control as a
> baseline.
>
> Yours,
> Linus Walleij

Yes! Sorry for the delay. Pulling now.

Bart
