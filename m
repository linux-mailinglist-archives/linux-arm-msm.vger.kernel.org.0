Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8A77018FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 20:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbjEMSJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 14:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjEMSJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 14:09:00 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738FF2D4D
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 11:08:59 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-61b2f654b54so54304676d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684001338; x=1686593338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OIN3a4LpgDCegv3PcCmYVvpR9npUL4UTgr30ykimJVA=;
        b=YeLx0HXS6A7dxXHk+kZ+V+fs9uNMfibjI6Eq8LT5ZbDFMZNspjzItIhM7wVHgvNa9b
         V4ucMuAUHhpQB9ml+3ubgns3+V4VrU+eDBsbAFwLSX9qWwGb9qLBfHeSO2RxeVZjYNzO
         reulB6VQt9aeTsE9Z3NVZBjULm/vkuesOSdGO7sYWN0UYxA1kOadlzAhWoRf7BG0Oxwh
         dxfM0mFAzUgzONwy+LngwaBp2P6Z0FVUJ7l4mEys+iByeCPyI3rjIs5n5fkUQX+hT4aQ
         Mzbfrxfv1dc6a9qPwuw9UHp+I15NkeNl5haijm/eGntKFSRjuDIDy+tkwEcQkymQzAfp
         6uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001338; x=1686593338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIN3a4LpgDCegv3PcCmYVvpR9npUL4UTgr30ykimJVA=;
        b=e3ZwktvFVdHY6xiZzt7hwtm8cyMbwG8Lyj2NRDuvDgOqSjEyS8BQ3mIK46SuxtaK52
         jaqOxwYHUhEvMKuHX0sq1h6QtlWiBT2n6/vMoYZxzKN2IlPD1F55tiRHN4WltpThyDBe
         retJ8n5CQ57iwYwJi0fpX4gddaE8qLnNHWV+KorXai23N0tWQ4RnZzDMVp7I7A6UHj6S
         HUqsouCpmpeeYeAg04h2D64cqhH2e06rL1HEg0IOVjXOqxJcayyKLgYMpsoZMciHAYfB
         7EAImSjCOsPOYd2ERIJ7EhlnRDdy6Odqy28EuT/+V+eApfLsrCIrhLWy8Yuv/8DbeGSk
         t9VA==
X-Gm-Message-State: AC+VfDySO8/0ZAa8Az5LWB7UrHJPfIEzKFkLHiqBb6IEJShuWJuQ00eg
        V3kz6Ysw4dfzbwUeGF2GT97lqDAXKp1jDnP9fGGrYG/foa2aWRUUvcE=
X-Google-Smtp-Source: ACHHUZ6WLr3zE3w4hIgCHeVvy3HlBv0z6z2feCGpcRwN997nEVgfWmRoMQdi251duvLVKxan1E4K6VQKaenveA8lTB8=
X-Received: by 2002:a05:6214:5083:b0:61b:6a44:5f03 with SMTP id
 kk3-20020a056214508300b0061b6a445f03mr43302403qvb.33.1684001338579; Sat, 13
 May 2023 11:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
In-Reply-To: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Sat, 13 May 2023 23:38:22 +0530
Message-ID: <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 19:05, Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit 58973046c1bf ("regulator: qcom-rpmh: Use
> PROBE_FORCE_SYNCHRONOUS"). Further digging into the problems that
> prompted the us to switch to synchronous probe showed that the root
> cause was a missing "rootwait" in the kernel command line
> arguments. Let's reinstate asynchronous probe.

Hi, the asynchronous probe is broken on Dragonboard 845c (SDM845)
running AOSP (Android Open Source Project) with v6.4-rc1
https://bugs.linaro.org/show_bug.cgi?id=5975.
Can we please go back to synchronous probe.

AOSP do not make use of rootwait, IIRC, but it is added by the
bootloader anyway. And the device fails to boot AOSP regardless of
"rootwait" bootarg being present or not.

FWIW I do not see this regression on RB5 (QRB5165/SM8250) running the
same set of AOSP images.

Regards,
Amit Pundir




>
> Fixes: 58973046c1bf ("regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS")
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 903032b2875f..4826d60e5d95 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1462,7 +1462,7 @@ MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
>  static struct platform_driver rpmh_regulator_driver = {
>         .driver = {
>                 .name = "qcom-rpmh-regulator",
> -               .probe_type = PROBE_FORCE_SYNCHRONOUS,
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>                 .of_match_table = of_match_ptr(rpmh_regulator_match_table),
>         },
>         .probe = rpmh_regulator_probe,
> --
> 2.40.0.348.gf938b09366-goog
>
