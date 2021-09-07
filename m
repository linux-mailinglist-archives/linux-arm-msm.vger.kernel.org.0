Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A371402AB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 16:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238747AbhIGOZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 10:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236798AbhIGOZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 10:25:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B38BC061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 07:23:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f18so19829148lfk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFCxGn0IF4AoJVnGAKaZsPANR8M/uCuj3J5s/k5jJ5k=;
        b=W4kyhvGhKv0s7CoXXKWfVa319AJCNK1YeW59TZmKl5LBsJE/d1YrfRwqf5bJ4wiqbq
         xUb+gWvETW79EOM/ZWaEB4MB20N4KKjbsCqzNtYurbCPbYfIw/gYHAde8DxGvbt/lfGM
         Uvxzn9IU6L8N2VFhL7v17jy5vHeSXg/DWsUcFC2NG+rgX5cj1oAuBYsqHrWNflFU2sDa
         t4C/7X2c8Pse6np8Cfb5EU1llPHFV8H3dMKsHPPjP0mYPfumuOSym/LOhuWVK3oNqOH+
         L4ZETrvy6NstIjPqCCrAidHOlRMLENtO8QisVXX+/dVgFRpq/71A27XIpIDwP9AI+r4C
         kFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFCxGn0IF4AoJVnGAKaZsPANR8M/uCuj3J5s/k5jJ5k=;
        b=RrY3UK5mJ4th2Gi7DOXdXo2IRxAxpigoK4F0DMYZBDmUp3GhHUc5U/TnyWZBcqyxc7
         Ml8c/82YLT1XQGsJtRCcJ3w19BeEfdw2mkjiUBR01O9x/etmRwgjnZi9D0ema89qja4W
         7qhMCJvDjXPLcDp0CVHEbGdf24PuWaUjFqKk7/OTPbK7N8V5eop3PCXBmELExSYtvB5y
         7e7TjETUiDe5isTBfzxqaV7bNq8a0g7gAoqLayArOzqFZ8hijwgFJRq/TQIsPkR8a/gn
         vmJOl77zxm0sk00W6crb9LEBpAemXni18GF9o9BOfHzJbtMsp5rxbeioRXyCItk0jEwA
         FcrQ==
X-Gm-Message-State: AOAM531NQqqaNZFN1K3ACqPnVDf/VdLASCo4inyWPf+THfAvpG4q21JG
        tHlfc04sAQ71DEx/Hv4R25KTe+xk3XNSkMGWo2ew6Q==
X-Google-Smtp-Source: ABdhPJymighNWjHLySn/cNW9Yyc9V0XVooYUTPkt1MTj+ulv0iT3WBW4aVPQgfkoSPrz3cVfpkOecZXO0Fds1u9Flyc=
X-Received: by 2002:a05:6512:1528:: with SMTP id bq40mr2449999lfb.71.1631024635641;
 Tue, 07 Sep 2021 07:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Sep 2021 16:23:19 +0200
Message-ID: <CAPDyKFoH_dPz-YV6Gzw1Lp+07Z+zsL4EQ34vXb=XAtx2Ez_N=g@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] clk: qcom: use power-domain for sm8250's clock controllers
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 29 Aug 2021 at 17:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On SM8250 both the display and video clock controllers are powered up by
> the MMCX power domain. Handle this by linking clock controllers to the
> proper power domain, and using runtime power management to enable and
> disable the MMCX power domain.
>
> Dependencies:
> https://lore.kernel.org/linux-pm/1628767642-4008-1-git-send-email-rnayak@codeaurora.org/
> (pending inclusion into 5.15)

I think I already reviewed v6, but perhaps you made some bigger
changes. Anyway, feel free to add, for the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> Changes since v6:
>  - Dropped dependency on Bjorn's patches
>  - Restored required-opps properties
>  - Held pm device state while gdsc is powered on, removing dependency on
>    genpd's power_on() powering the domain into required state.
>
> Changes since v5:
>  - Dropped devm_pm_runtime_enable callback to remove extra dependency
>
> Changes since v4:
>  - Dropped pm_runtime handling from drivers/clk/qcom/common.c Moved the
>    code into dispcc-sm8250.c and videocc-sm8250.c
>
> Changes since v3:
>  - Wrap gdsc_enable/gdsc_disable into pm_runtime_get/put calls rather
>    than calling pm_runtime_get in gdsc_enabled and _put in gdsc_disable
>  - Squash gdsc patches together to remove possible dependencies between
>    two patches.
>
> Changes since v2:
>  - Move pm_runtime calls from generic genpd code to the gdsc code for
>    now (as suggested by Ulf & Bjorn)
>
> Changes since v1:
>  - Rebase on top of Bjorn's patches, removing the need for setting
>    performance state directly.
>  - Move runtime PM calls from GDSC code to generic genpd code.
>  - Always call pm_runtime_enable in the Qualcomm generic clock
>    controller code.
>  - Register GDSC power domains as subdomains of the domain powering the
>    clock controller if there is one.
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (8):
>       dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
>       dt-bindings: clock: qcom,videocc: add mmcx power domain
>       clk: qcom: dispcc-sm8250: use runtime PM for the clock controller
>       clk: qcom: videocc-sm8250: use runtime PM for the clock controller
>       clk: qcom: gdsc: enable optional power domain support
>       arm64: dts: qcom: sm8250: remove mmcx regulator
>       clk: qcom: dispcc-sm8250: stop using mmcx regulator
>       clk: qcom: videocc-sm8250: stop using mmcx regulator
>
>  .../bindings/clock/qcom,dispcc-sm8x50.yaml         | 13 ++++++
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 13 ++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 13 ++----
>  drivers/clk/qcom/dispcc-sm8250.c                   | 28 ++++++++++--
>  drivers/clk/qcom/gdsc.c                            | 51 ++++++++++++++++++++--
>  drivers/clk/qcom/gdsc.h                            |  2 +
>  drivers/clk/qcom/videocc-sm8250.c                  | 31 ++++++++++---
>  7 files changed, 130 insertions(+), 21 deletions(-)
>
>
>
