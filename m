Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F2D577F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 11:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbiGRJ7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 05:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbiGRJ7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 05:59:20 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EE11A3B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 02:59:19 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31e1ecea074so24614917b3.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rICEhbm6vaKvSX6eVBX7E219JQ8Wrmc4UWO7V6sg6vI=;
        b=DIRG7obP5JHRupkVmzijJoml6pRbMFU/jmlLdHu/MJyhVSCfC6raU7p3AM0B6FTmpP
         9ylf9NP8Pg7QxeZF9v5p6QYvw93S9ynm8lXhmI/NQ4EPAx/7zkOj6q4WV1EJw8QKpVS2
         Sg+BTq1Fhkg2m2GtkhqKVOGU44Guto40b2XjNfVY97yk97Pj49zckB78LNycVZu/QASK
         K+dEBhl/vQLEKy/IbBB5asfexSbBFfXFQf2hc4e/SQaY+7XNmukMUUT2AnxiLKNqE+uC
         br+JJ/u+kDAeNpKB3aljUmvDIAHpkQPlhs83Ies1b4btf4RVxcU2oQ0RvTDywQNJvHPc
         ThBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rICEhbm6vaKvSX6eVBX7E219JQ8Wrmc4UWO7V6sg6vI=;
        b=LnUQuyp221KTycpshX7QjzNt6XgyEyFxZjlN7WWuo1fK3CSocK9FgiZS4SoC1gljPQ
         IjN0pSUoZIaGAAoD9+Al25JCOqTxwl2iFzPnpIG5EMCW1MUrYe7k5jeUXJX/DuTUMN40
         nWCZtPWHtGqzC3UYyn096JBlTBvBrHskc48mAJerIKI8wc3zG9UiCFJiOYW+SjY7FBHN
         IosxkdkU+oIT4RYszZz7nCD85TWYcGb4FVDatOdJPiYGlupdR7wSh7FnbGC+wxXeFyIj
         0jUR8Igxnb21UP6CLIqbXhon8qThU4SI16O1Bicw1Qb0LaKJlbi0WF3La82MKRktgzfN
         iWuw==
X-Gm-Message-State: AJIora8qux7yYzb4FdLe+BSxGY3Dx5AjuOGl1NX8hNV7mman2as7vqlQ
        YuLl/kpvJO23bQ7zuljwymeDGclezsF4cZIPYnkBImoGgIJzVw==
X-Google-Smtp-Source: AGRyM1vYJySz7fm76vr2JcnXE5hJJ4IXObW2ZbBj7gRGMIElHgSugBzxg7vnvzpYvA08W/MBvCS57OhywHZEsW89RL0=
X-Received: by 2002:a81:4809:0:b0:31d:848:4b3b with SMTP id
 v9-20020a814809000000b0031d08484b3bmr29677783ywa.69.1658138358575; Mon, 18
 Jul 2022 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220624195112.894916-1-robimarko@gmail.com> <CACRpkdZdccrfA4yHoVjzpsJesYshuP6PjtT=KTeEQgOdXR6_5w@mail.gmail.com>
In-Reply-To: <CACRpkdZdccrfA4yHoVjzpsJesYshuP6PjtT=KTeEQgOdXR6_5w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:59:07 +0200
Message-ID: <CACRpkdZ5P-U19wTnzsOr9o_XWn1rKqVSxc+YrYnKNJLTmJyYTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: make the irqchip immutable
To:     Robert Marko <robimarko@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 10, 2022 at 1:05 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jun 24, 2022 at 9:51 PM Robert Marko <robimarko@gmail.com> wrote:
>
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.
> >
> > Following this change the following warning is now observed for the SPMI
> > PMIC pinctrl driver:
> > gpio gpiochip1: (200f000.spmi:pmic@0:gpio@c000): not an immutable chip, please consider fixing it!
> >
> > Fix this by making the irqchip in the SPMI PMIC pinctrl driver immutable.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Patch applied!

Jumping the gun too quick.

Reverted the patch following Marc's feedback.

Yours,
Linus Walleij
