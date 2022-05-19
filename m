Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8DF52D3FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 15:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbiESNa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 09:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbiESNa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 09:30:26 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DF9CEBA0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:30:19 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id d137so8991925ybc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ea9SWDA6wvriBFyiWmSM/cUBDRlPeKx6B/XCiADE6Cg=;
        b=ks6F3fTckOrmjWS0ClW006McxhjxXzbDAmClZ85Ndf/WMrVkPSfxPwMkCJ5+JB/Zly
         zqD5LIxa+lWehhvWN4Mf2NAHwpS/L4Y90P7fnLH5GPIKVSen0ZQFicNPS4BO/kxG2Hi7
         9+VqUpx3JpcDW4Kk2EBUINsel5EOpG7wvvFrLGI/79QAayI4cP63wE/0zgtW6uCGI/46
         NbjttW4tN3/OkWR6s6nrDwk1Vto3pC3uUL5jEpueyGDrGhBIRRoelrsklzxX3c65f6dY
         nVGShTwmklzNOXcRrUN7VvADdrC/n6x9IsBvYl4aTfA7ntFmcUWmig7WU3bTqN+epHWp
         Pvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ea9SWDA6wvriBFyiWmSM/cUBDRlPeKx6B/XCiADE6Cg=;
        b=w6o7GzbY1NYlGyTMTqMApY75HXtSRNlpEq2keXJ+5EiUb978spO8DSXDnpwhwNTkFl
         XRzvD9Lqu2J/hpGIMH302zBGgDbiwG2yRVJCuRrnZ2koKLWSwlRisqisW6btmku7RwUL
         MwHZGvVeDrpqMWzahPA6o8JauXPkJ1uGHuYLZuWPS5rolQWPcodb9ptPxVxzMZqxH41y
         uWDZIr7cfDGZak0xsmXP0aea33DMca6a9Q0NYKy5r8Wp961Dgmy/Ac/vAi4issIFmWXh
         BKNYtQF0evUjIVArIB7ja5+NfG7GnqEwAGpQ6bbww1dTJ2DXWT7W1ZbnnB5+FDqk6LlF
         2i9g==
X-Gm-Message-State: AOAM5315DJeBBQGwR71s6eC2hqcMv5w6Hfaq7H/y1+7R3BHlDjIh77VN
        HKLwWNUY71GnUm4KFb3B718G40LQMQNBDvf4bH/WYQ==
X-Google-Smtp-Source: ABdhPJx5ABKP9iZZdCdL37HDpt4btHGxSXXOR0fGwkumd4vTxNoxrgrIZ9EOp8UTgSt1tW+U2kK3C15aGRatb6Ii7AA=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr4304244ybq.533.1652967018884; Thu, 19
 May 2022 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220518192924.20948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220518192924.20948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:30:07 +0200
Message-ID: <CACRpkdYt-doG_i2T9jjDCb8=oJFR_7Z8RCwW+S05qd90E3FgLg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] gpio: gpiolib: Dont assume child_offset_to_irq
 callback always succeeds
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, May 18, 2022 at 9:30 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> On Renesas RZ/G2L SoC not all the GPIO pins can be simultaneously used as
> interrupts. The SoC allows 32 interrupts which is first come first serve
> basis and is dynamic i.e. if there is a free slot (after rmmod) this can
> be used by other GPIO pins being used as an interrupt.
>
> To handle such cases change child_offset_to_irq() callback to return error
> codes in case of failure. All the users of child_offset_to_irq() callback
> are also updated with this API change.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This looks very useful!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
