Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E117F32B2EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242518AbhCCBQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448908AbhCBPnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 10:43:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D7CC061223
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 06:46:17 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d3so31630771lfg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 06:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amBRx7OsHLG8syzyhriE5lIAg0ZcKXI0PCXzAll+h1g=;
        b=okuph8tEua/vZwDWPYC/uAy6+lUKHcDrD7wDmdNTYki2O0N9YYTsjHFwEWansPyVVk
         u4MrVkSqYu7nUvEFBc505YRebXnsIlOAy/nbQRQtXnnlt206p/R6WQtAWgtxIjvxzTA4
         iJfhvoR4j2aUfQpH52Vql8KAXOuNXMYBCOJVZ2VFmzm+XrKNGpjh5jGOjGY4+ZzqAn1L
         udCmOku/J1xw+GgD9hsw8AnK31U3wGI+Tf7lQ1+3TTdOxr3NzHa2ACuhyuhEuIaWmZed
         ZhEJK/hQ062nIceopzoidmoOWZPJTMBQCAotC4oCUK2IZ8iegcp21ggzXO6qwgkAMGKK
         V1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amBRx7OsHLG8syzyhriE5lIAg0ZcKXI0PCXzAll+h1g=;
        b=NgSyjUqeARf4fRN2NrithNPrWQaz0eHf2FrqnjgM3/69P3KDXc59G3Yq9Ri1P31/yc
         GwS7v5+tqsCwxgVgsoxKBIHRknKtc+ch9iZgteU98WGqMLIfbZMsBKEdvHjTk2EE6hRi
         zqfO0rJDn2UGM/tFQlRe20G3/h7uLAXoA9eOfgbqHUkgIB7LI3R+HaQK/acSP28jaPOO
         ILHCeJr5pY/bLk6yHiMk8Eh21zUybqT4NyV6twEKxhA2U5UPobz9DSqDlX//lar9Q6tj
         m/WDxKNd2UkrYNt+6JssfPytDcV6vIBX075XGwUmYSPgm9kwr7DVcOSwPwJk50YlppkP
         tM9w==
X-Gm-Message-State: AOAM531VNEV6QezMK2rFSwS+zQLZy/K8S60BwkRDnR7xqX/D2v8jHnD5
        HFkS5DikhS/0PPyA/FbPECru5H5E4R+kqBwGGC0lwg==
X-Google-Smtp-Source: ABdhPJwuRhVtn1XcskxjNr8/9I//fnLOXGY9UhY/X+BWNFWrCvkaK1bDMA6eSC3BaXsBL7YRKRHNw25G+cGXJe1GJUY=
X-Received: by 2002:ac2:5d21:: with SMTP id i1mr11989893lfb.649.1614696375764;
 Tue, 02 Mar 2021 06:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20210225083306.25792-1-julianbraha@gmail.com>
In-Reply-To: <20210225083306.25792-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 15:46:04 +0100
Message-ID: <CACRpkda2Jbm3DmOhxFyyxDZRrUk01TtPbD+OOG=U7o2mnxEB8A@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
To:     Julian Braha <julianbraha@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 9:33 AM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
>
> This is because PINCTRL_MSM selects GPIOLIB_IRQCHIP,
> without selecting or depending on GPIOLIB, despite
> GPIOLIB_IRQCHIP depending on GPIOLIB. Having PINCTRL_MSM
> select GPIOLIB will cause a recursive dependency error.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Does it work to just:

select GPIOLIB

instead?

The driver needs the library so...

Yours,
Linus Walleij
