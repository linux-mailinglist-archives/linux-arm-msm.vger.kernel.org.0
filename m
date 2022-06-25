Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C6655AD24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 00:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbiFYWzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 18:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbiFYWzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 18:55:11 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E41913F4E
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 15:55:10 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31772f8495fso54816137b3.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kza4iCK5n/6nRyHCyuCBCP2aYiHxgKwrMFt8Ta+E1+Q=;
        b=Hfao2+W8P5pwO/BzpJtGXjHcwCjNIc7/ZNWwt11izHKVG9C6jwO3AoW8jTr4tTHzli
         tn9Qe5yWYvUYNxY34ERCSWFvx9n43A8RF0zd20ldJFRHMBaBiRCekMfk3UzVz5US3UOw
         kQsqkWbypY1R6qiMC0SVHAT9W7iweTYYdO8s0SPv0gIBMX+DnQUteIPOZ+t9mJkiWXEt
         HqBD6corLFas0HIKxAal7EeL2jmxp+vFkLstQr4yJkUzimjqPNhRGWKyesmczvvZqNUs
         ukqBHDQKM6pEPezXQIsTv/jLuElgDfKMe/tiz/2b4QwQgmWLBAqkAFvhxsjXB08zVcex
         BMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kza4iCK5n/6nRyHCyuCBCP2aYiHxgKwrMFt8Ta+E1+Q=;
        b=E3EkTRcSXAay2B15jMN+yBCGwiISQkJCzTaLCOM8xrCKv7ihC7MmA0W0r0R/2PVl+V
         m8/jTfw3UY23ZCg1kHk5n5zl4w2JOwT/NB1CZ6ERdz8F+evHW5TQkgV+PFC3v3D6phaG
         MSKg4VnqAxKmwtn88+1ApjLrF4m9sD8f7z6RezhltZr1/Z7t/l+hP0EeV7ksckTC2V9X
         hpZIR+CbNozzHZvnNOFnuBokuyMR2Tnje4FbMDdqwYL9xDVJ9bqv15ktKTKfu5lqqyBI
         QloU8kMlIbF94Mvpj35iCrKfSq2RfmIwRbA3WJ9V5gLpDJAPgoAuMZco6KP3wq088DXX
         mFQA==
X-Gm-Message-State: AJIora/jl01HtC6PtAMe+lmCKfOGSJGA1hrMUjapDGNC4Vm7uTrzPQp7
        fW0AFNfHcymSG3Gg5ZgJkuw01gJC0lqP8xVCzCBRRA==
X-Google-Smtp-Source: AGRyM1tE0n1MLKqKamVo/6nJvSZ22T0wylCIz0/meNPRZjScyYQitzswvzWUOSVM62tJu43fYwWWH90cXtEEGEhMg6w=
X-Received: by 2002:a81:71c6:0:b0:318:38d5:37f3 with SMTP id
 m189-20020a8171c6000000b0031838d537f3mr6907650ywc.268.1656197709368; Sat, 25
 Jun 2022 15:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220612145955.385787-1-nikita@trvn.ru> <20220612145955.385787-4-nikita@trvn.ru>
In-Reply-To: <20220612145955.385787-4-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 00:54:58 +0200
Message-ID: <CACRpkdZN14UMM+CJszPXr4x72ngN2cHjTXnqwu3pbjNfOMz5BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: msm8916: Allow CAMSS GP clocks to
 be muxed
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org, tdas@codeaurora.org,
        joonwoop@codeaurora.org, svarbanov@mm-sol.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
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

On Sun, Jun 12, 2022 at 5:00 PM Nikita Travkin <nikita@trvn.ru> wrote:

> GPIO 31, 32 can be muxed to GCC_CAMSS_GP(1,2)_CLK respectively but the
> function was never assigned to the pingroup (even though the function
> exists already).
>
> Add this mode to the related pins.
>
> Fixes: 5373a2c5abb6 ("pinctrl: qcom: Add msm8916 pinctrl driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

This patch 3/4 applied to the pinctrl tree so you have one less thing
to iterate (and one less person to involve).

Yours,
Linus Walleij
