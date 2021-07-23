Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBED3D3810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 11:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhGWJLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 05:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhGWJLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 05:11:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE21CC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 02:51:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h2so1150795lfu.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uK3wgWwB7oME66KxdzxqOyPwgOuafHqk7ulonhjzsV4=;
        b=aCXlYaLlPwQp7KSPiAa9ZrNslenigTq38Emjv8koGRZOGSzkAQQBGsakcT24kDp93E
         JcP0Ou8WdBOOMMqkBRiyR7trqUCPdj57Wp1F+boRPAnpqBKOYoiyNhFUkYQSNIpJExaC
         uecKCRAUN8+1OG30Y1hb8p8xZpRaPWd0342BOBVopkxvcmCkzIlEaZEfk1ro7oZ9tK7W
         G2FlNOurgLcgP9nE4PcBw6YZotwWU0MXQ2kAi2DZCCpmWYjGCj9THK1/qinNt7n5Anj0
         XqPn3OZgoz2u1pKGQcD+6jYA36BBDP7PqTC+5qYMdcknYpKBb9IgZqsWw+2JaVuNtcUV
         NWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uK3wgWwB7oME66KxdzxqOyPwgOuafHqk7ulonhjzsV4=;
        b=TqEyT9oJYp07DfhYeDpEW21ubgV62rcI5Jnm+fh6o+QHxBIhOYipiPD4hm3ftHVRic
         hkfiGR7NSN/pDja4ciyz9gTyxhmpVnOT1J7QgQn9ZX4Mqho7oi/+Ml5XVfpXpt0FgY8M
         vwi57L6fOxmxaXYCD/zAliuQ5Jr/pqUON7P2aDWx/6xuTr2Q7w5EIe5Ze7yg/lx33RFJ
         Z+Btd5Gmt8Jk7jHKWHVLZMqt/C0xjEf84jWobo0I9KLMAuZCTB+tTx7RgbhVrQa9vPfY
         hWVqBO67sKFh+mwbXjhRx1vFWSl8saDA2y0ZxMRXzzr2T1GaWZCuwGs3x3bha8BjtTT8
         tLCQ==
X-Gm-Message-State: AOAM533oy+azZewKC2WAIE3I8XPr/hxEbQq4ncpXGn1JxUjwJvKdHVeF
        Qxuks6VrMoYHrsG0pa+OGi6Z+7231Ah8eve0aF+hlw==
X-Google-Smtp-Source: ABdhPJye/Zl8GuellXxn7xIA8Qf+7z3ql8+JjfG/s1dFaiLfJm2FS+nbcLGXXl8NROEhhdFk+W/EJjNnaTVT8KU82TI=
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr2534038lfb.529.1627033899144;
 Fri, 23 Jul 2021 02:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091400.1669716-1-arnd@kernel.org>
In-Reply-To: <20210723091400.1669716-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 11:51:27 +0200
Message-ID: <CACRpkdYw5WUbExhGArO=inGQV=4j4SmMhCPa7=qBSePkELB+wg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix GPIOLIB dependencies
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Julian Braha <julianbraha@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 23, 2021 at 11:14 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Enabling the PINCTRL_SM8350 symbol without GPIOLIB or SCM causes a build
> failure:
>
> WARNING: unmet direct dependencies detected for PINCTRL_MSM
>   Depends on [m]: PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=y]) && GPIOLIB [=y] && (QCOM_SCM [=m] || !QCOM_SCM [=m])
>   Selected by [y]:
>   - PINCTRL_SM8350 [=y] && PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=y]) && GPIOLIB [=y] && OF [=y]
> aarch64-linux-ld: drivers/pinctrl/qcom/pinctrl-msm.o: in function `msm_gpio_irq_set_type':
> pinctrl-msm.c:(.text.msm_gpio_irq_set_type+0x1c8): undefined reference to `qcom_scm_io_readl'
>
> The main problem here is the 'select PINCTRL_MSM', which needs to be a
> 'depends on' as it is for all the other front-ends. As the GPIOLIB
> dependency is now implied by that, symbol, remove the duplicate
> dependencies in the process.
>
> Fixes: d5d348a3271f ("pinctrl: qcom: Add SM8350 pinctrl driver")
> Fixes: 376f9e34c10f ("drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nice catch!

Applied for fixes.

Yours,
Linus Walleij
