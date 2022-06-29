Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4A5601FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 16:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbiF2ODk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 10:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiF2ODU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 10:03:20 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AE424BFE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:03:20 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id w1-20020a17090a6b8100b001ef26ab992bso1101257pjj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wUdJGFFVlAa/5h96T7Dca7RxEjviGiQF/SXSNff6OLY=;
        b=hW6DR2c9kKezRBMq40sp5APKYkLznXmh0OB+hxzUbt0kI/VYzOq8N4bCpzf9/tSP4t
         +nN6syselZjvb0FKMlegvcvXiCGzw+jb1IdUjxV5dakDYAcwpVDiswqz9tz6GbjWyeb5
         k8QMSwM9FxnXu2zE4uFKGbuTnHKeXmpriWWik1a4je64JZSF0L8TUZNOfiSDZdkTjIYY
         Pkvhu5BxGeGLC27Txt1iBfJKulQNzk0wQhAWsPkYZgq5iiYus0skaOCvmQAZS709RFIn
         y5w4GBNS9SnMg9nVtRSEndjZ8IXo8S0sHH+y+FKUtBea12my97vq3X5kP6RzOSNYtH2j
         wGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wUdJGFFVlAa/5h96T7Dca7RxEjviGiQF/SXSNff6OLY=;
        b=cUYzWgv0qbh52BsLCniXXyq6SLjPIWoIJID+GTJFcNbzSA5NHKD+qGfiDHI+tGeKDp
         X1fv+0nfZT9W9Wjunhy6v3+BjoOJ3M54bG2/NpBQB2YubL9SFCI8gSI4GD7alPJq5198
         T1+o+9l6WIDJodTgWgShBRtQb9MWSOFYX8fU8CYvPTH1VzS7WNWuVXzShbWNSNVC3bgZ
         BCcP0CCDhqxpv5I64IYMzapUZWef5z3IpMDizOjVUdjziiLCrLGIsG4/xTvJ005vFeEy
         pC+lSPC2HyGji5LuLs6eiMk62drXb/JtFPnVihGwrOqDgGpci38qseUxHu5dPR/Ee8NR
         T3Hg==
X-Gm-Message-State: AJIora/moWALUwBlTAdOeELadVFAIZIZvuxB/XommNgYmXszsA+wnlAq
        jExkkAqWMzsA7sItKbbkWUNsoWo7enmXA24h8m6kcQ==
X-Google-Smtp-Source: AGRyM1tqMWn5frCYyWd148Fa8LvqnzLMpxu5jKi3yMOQ16Yt2HmJoGiHTqANfTH7ozxqwv1PhwtLGtxcptdoQG0dl3A=
X-Received: by 2002:a17:902:d50b:b0:16a:2cb3:74f7 with SMTP id
 b11-20020a170902d50b00b0016a2cb374f7mr9546718plg.6.1656511399681; Wed, 29 Jun
 2022 07:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com> <20220629084816.125515-2-stephan.gerhold@kernkonzept.com>
In-Reply-To: <20220629084816.125515-2-stephan.gerhold@kernkonzept.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 29 Jun 2022 16:02:43 +0200
Message-ID: <CAMZdPi9X=MELm8OJ=tKi3J6BMrxawgeXZwQy4O6Sp1XWrhEZuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] watchdog: pm8916_wdt: Avoid read of write-only PET register
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Jun 2022 at 10:48, Stephan Gerhold
<stephan.gerhold@kernkonzept.com> wrote:
>
> PMIC_WD_RESET_PET is a write-only register that is used to ping
> the watchdog. It does not make sense to use read-modify-write
> for it: a register read will never return anything but zero.
> (And actually even if it did we would still want to write again
> to ensure the watchdog is pinged.)
>
> Reduce the overhead for the watchdog ping slightly by using
> regmap_write() directly instead.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
> Changes in v2: Add Guenter's Reviewed-by
> ---
>  drivers/watchdog/pm8916_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 0937b8d33104..670cd79f4cf9 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -58,9 +58,8 @@ static int pm8916_wdt_ping(struct watchdog_device *wdev)
>  {
>         struct pm8916_wdt *wdt = watchdog_get_drvdata(wdev);
>
> -       return regmap_update_bits(wdt->regmap,
> -                                 wdt->baseaddr + PON_PMIC_WD_RESET_PET,
> -                                 WATCHDOG_PET_BIT, WATCHDOG_PET_BIT);
> +       return regmap_write(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_PET,
> +                           WATCHDOG_PET_BIT);
>  }
>
>  static int pm8916_wdt_configure_timers(struct watchdog_device *wdev)
> --
> 2.30.2
>
