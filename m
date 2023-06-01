Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1565571F526
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 23:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbjFAV54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 17:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjFAV5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 17:57:54 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C251D180
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 14:57:52 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3985f70cf1bso923541b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685656672; x=1688248672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruzONHVQNNLn5cbL5oGqVupApwre43YqM07fYPN5vjI=;
        b=xJ3xHiRVsz8R7jMctT41qJPcKiBMuq002UN7r9mY5OoIHL4nk4TNU9bO882krVSeYl
         F+LcWIkkh8dut/CrRkIeYQNJv6Ztxuc0L2yqyg4BJkzX/oLWAjHj8uUVy2NMG38qcZHc
         gC/em/1iWrZyeWApUBNlPAkCo7rQzXVHwMr/25D/rcQHwBuJfqUlvl4MeK/Hpv3W5dRW
         70yYkXlrOJMMOozJJKV0N9A775LDDzO0Gx7E/gUu6vBu7eExVkS/OZkNP5tdatwIjnaY
         ZHjT+b0sxqybeL48s/zonqK9gyu1fGwFq+/ETOHCM407OJwxK06Qr+TFUBzsrmmQNnRj
         EfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685656672; x=1688248672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruzONHVQNNLn5cbL5oGqVupApwre43YqM07fYPN5vjI=;
        b=PqobzcVxXN7ptoru0VRZO1q+nvaJkGGv/TCI85CiwED7kBQy7sYdpaPq0XWOmL3uk9
         NhiXs8UyfszoOURMFftKdSUuMVmwbspfZTjdPwJYCaBkJmyJdeMW+wO4aFdsIhBWKSeX
         IzvHfbh/r/lkwcvGQQuFlj7sT5JMSp/4sTXWbXzDIsXjX1LorN65XfbKvrUg1k6/v2wi
         gcPymFCH2+b5zubdWxY2Tfu6DFBl2aVNXrKTd9rYiCWCFqXFxORYTJqmlMo8pHaPTSkX
         3iBObu6dfOWJ2Lpr1tda3eLU+/Ni6p+EDOZwPd6dUswc/erlOYBhadIit/UgsV4sHFXn
         gEdQ==
X-Gm-Message-State: AC+VfDz3V+QhoUQrfEmrtOd4XMYIbnP8tC9soKznHqETm2i2axOzdG42
        vMh2XdzForYy7/G6sowZUnF/fB/sdVFmdusECUAwYA==
X-Google-Smtp-Source: ACHHUZ56tRKln5Zko0KXJAcfvYlxi6GxnyaGVCrS/sW2jiWiCLzSvzQWu0NgIDvAnsayfumJnSDtE29yp2/8bVVKkD8=
X-Received: by 2002:a05:6358:3408:b0:123:896:851e with SMTP id
 h8-20020a056358340800b001230896851emr4756088rwd.12.1685656671940; Thu, 01 Jun
 2023 14:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213416.3373599-1-arnd@kernel.org>
In-Reply-To: <20230601213416.3373599-1-arnd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Jun 2023 00:57:40 +0300
Message-ID: <CAA8EJpqRUf2bp1SxyvKg9t+1AM9gqd_6JHq8LAp=6Dd32+h2rA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: remove duplicate initializers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Mantas Pucka <mantas@8devices.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, 2 Jun 2023 at 00:34, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A recent change added new initializers for .config_ctl_val and
> .config_ctl_hi_val but left the old values in place:
>
> drivers/clk/qcom/gcc-ipq6018.c:4155:27: error: initialized field overwritten [-Werror=override-init]
>  4155 |         .config_ctl_val = 0x240d4828,
>       |                           ^~~~~~~~~~
> drivers/clk/qcom/gcc-ipq6018.c:4156:30: error: initialized field overwritten [-Werror=override-init]
>  4156 |         .config_ctl_hi_val = 0x6,
>       |                              ^~~
>
> Remove the unused ones now to avoid confusion.
>
> Fixes: f4f0c8acee0e4 ("clk: qcom: gcc-ipq6018: update UBI32 PLL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
