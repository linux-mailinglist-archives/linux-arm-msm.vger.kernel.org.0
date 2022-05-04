Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4038051B061
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 23:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbiEDVZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 17:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237058AbiEDVZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 17:25:41 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7784E38C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 14:22:03 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f863469afbso30129457b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tx3mYhVLEABySlfxpbH37Ic7LnqQbPKrBTTlaZOMkPc=;
        b=G1OpEkn1BESEXlXxdMXC13Qnm60u5Uwth9X0JfnzP05QCviFzpL2dEIAwOPhBFTBGu
         QzH9jtW1H4xyIwtfrt+wLLOsaDg3pqvDmwwpBD99h4VYqO91HS+yYY1UJl2A7zV6QAxE
         D3RHXAsBqChJHeyJEcmKERWZDs7UemA1RqJnt0Hvs49iPa2sQlMXNOPI2Ws0UAemENIC
         pFyCE20wljRiW1UBlpYCXcuN3qV3BK9EQjwtHVC+rko2X42WfBhbDbIlt5OwYZyf7sIG
         t5Nf16FEFI+Vgwr50JZFUFOFib15101a2sfcCF4oqpseiej3c3Ty5DzIUbdGgRWRBwWX
         QUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tx3mYhVLEABySlfxpbH37Ic7LnqQbPKrBTTlaZOMkPc=;
        b=nfB3d5gIpxfrciNlIrxHgd2So93cgc+M5DQhqbv78o9936S9e0CIsLpDps0IDsZ5VP
         SkHmapu018Ti+nuT+uyMQZItVCd10MGHS2tlCrhjF7M0DLxhPVk11lkXhuX9/ZmyOEin
         sR8D1H5LeO9b0Iy7Vuq42B08WgZWki/p8cyhUahl3N5lEsiF4fC+iIiemV/lwR0sFbh5
         ZG/MnYQ+uNwYwvxKzvABD3h1Md0bgdUK2hSjcjpfvL6/QIsMR61aLW8EW39BVX2DtpSV
         jBJr7auBvZjqesDsLQaMly88RBZL1BOy2yCfECXDNYMQ9sUrP2zvGLrsGBniAbC6w5gX
         4W5Q==
X-Gm-Message-State: AOAM530g4GMAHOgDkXQkiM+/Mev95MOtQsp5bi6Zi0kL7kAI1OXatMOp
        UeH++gaf7XC4snJO7QdrHPjwVE9MHhf3d0OCnxt6vQ==
X-Google-Smtp-Source: ABdhPJy9GQmBn09i2jD7Kpuz51ZHerGYLe0ZaUG6+YCgtLjqcq581mHgtYfCJS9Ait9lKNH808GM1rsVRxkBaX0KK/U=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr21645142ywe.268.1651699322764; Wed, 04
 May 2022 14:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org>
In-Reply-To: <874k2kccse.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:21:51 +0200
Message-ID: <CACRpkdb32NuJ8jdsk6ox7ViVjK=9WWWavS=aYcoWTCbaO3WkTg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org,
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
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:

> > Bartosz: if you're happy with this can you apply it to an immutable branch
> > from v5.18-rc1 and merge that into the GPIO for-next and then I can also
> > pull that into pinctrl?
>
> For what it is worth, I've pushed this branch into irqchip-next.
>
> You can pick it up from:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable

Bartosz are you pulling this? Most of the changes are in GPIO.
Patches have started to arrive that go on top of these changes
so would be nice to have it in both GPIO and pin control as a
baseline.

Yours,
Linus Walleij
