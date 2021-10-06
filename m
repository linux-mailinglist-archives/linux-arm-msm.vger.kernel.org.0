Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7441423CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 13:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238001AbhJFLdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 07:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238091AbhJFLdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 07:33:07 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76EFC061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 04:31:13 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n11so1055513plf.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gia1QQnXEqZ0IHaAay2qz6311LHsI6yQ4uNChEXC7f4=;
        b=CASN7zGbYBrcm6AFxeUl+DJMKUCrNV6rsw2g7MQn6B9NjMA4LklFLFCnLSwpVOPZKy
         TZWvyRxlPGEnuDbbQpKWeloeFED8y+riIxhC3LRZ4PJNLVU0nceF+/kDLg6GQnBd6ShT
         IygamWxr4l8Fz3gCJdfb3rDs7ipvsCj2D93NUMbEnTTCiMfplikJRJ7jClgALV4HhbHj
         2KrMbZJs1qEtkNLj3fLJgp98gHrlNZFB2k6iedXQJT9rKDEqjW5xwua1dctvMBr3huCF
         zwYBC4Y3tKQFxXyPfZOzT4k2oPWlyjUwS8RG1aXAw8Qhq5eeW8IGC6LBpuDRsrtjTDJY
         t4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gia1QQnXEqZ0IHaAay2qz6311LHsI6yQ4uNChEXC7f4=;
        b=CuOitA+B2EPu0vysqp8f2eip5E+i381Wopt3Qy1JJ0RAim3OsnLUMCrs+eZzIihcZM
         Lz3O3mzZvRXQWZrOk8GVCApSFItP+HSBTwQkxTcFH+UdRSfecmjYZs07SGWAA1aSDy4N
         P9nPi8YFBdYR70DMQUuEI0SqwajaQL4lNTic1uEp4+kx1QvmARgvjTrGwmHQZvF9eh44
         9zjKVtUE5EH2X7IQtiKfJ8FRkYQhhqVtYw1rgBLsqXpcS8ba12iw/O4qKQOnqH+8dXtN
         8kSHC8PLe3ISd5ihvXkQBBRuMaPMtmd3xeDRb0obL1eiGdaIlxA/PLeBRCKX+ivFd2gE
         RpFw==
X-Gm-Message-State: AOAM532sC60ONrYDmE6KM5FSxR1iviAQnTK6tkiw2YbjkL9LdBuW9IUo
        UOFAUVJYBkdr0QmNwtw+2IMw24XHn+0OKB3U6BB7dQ==
X-Google-Smtp-Source: ABdhPJye4H+jVkrQ0+lywQ/EqobK++QdIlFGiqZBddWzZiyhFTtNpA8cM9eFAvdsGPhr3DvgmuELR2ahyy1pMmQcx2w=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr10510639pjb.232.1633519873150;
 Wed, 06 Oct 2021 04:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210825221600.1498939-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210825221600.1498939-1-bjorn.andersson@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 Oct 2021 13:31:02 +0200
Message-ID: <CAG3jFysa9ou9qbXi7dmz9k0GguAFOtgQdmXKwX3QcyULWrequQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: Add CPU topology and idle-states
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Aug 2021 at 00:14, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Add CPU topology and define the idle states for the silver and gold
> cores as well as the cluster.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 141 +++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index c6e1febaee46..35e8935bc1fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -48,6 +48,8 @@ CPU0: cpu@0 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
> +                       power-domains = <&CPU_PD0>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_0: l2-cache {
>                               compatible = "cache";
> @@ -65,6 +67,8 @@ CPU1: cpu@100 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_100>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
> +                       power-domains = <&CPU_PD1>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_100: l2-cache {
>                               compatible = "cache";
> @@ -79,6 +83,8 @@ CPU2: cpu@200 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_200>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
> +                       power-domains = <&CPU_PD2>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_200: l2-cache {
>                               compatible = "cache";
> @@ -93,6 +99,8 @@ CPU3: cpu@300 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_300>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
> +                       power-domains = <&CPU_PD3>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_300: l2-cache {
>                               compatible = "cache";
> @@ -107,6 +115,8 @@ CPU4: cpu@400 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_400>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
> +                       power-domains = <&CPU_PD4>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_400: l2-cache {
>                               compatible = "cache";
> @@ -121,6 +131,8 @@ CPU5: cpu@500 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_500>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
> +                       power-domains = <&CPU_PD5>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_500: l2-cache {
>                               compatible = "cache";
> @@ -136,6 +148,8 @@ CPU6: cpu@600 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_600>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
> +                       power-domains = <&CPU_PD6>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_600: l2-cache {
>                               compatible = "cache";
> @@ -150,12 +164,86 @@ CPU7: cpu@700 {
>                         enable-method = "psci";
>                         next-level-cache = <&L2_700>;
>                         qcom,freq-domain = <&cpufreq_hw 2>;
> +                       power-domains = <&CPU_PD7>;
> +                       power-domain-names = "psci";
>                         #cooling-cells = <2>;
>                         L2_700: l2-cache {
>                               compatible = "cache";
>                               next-level-cache = <&L3_0>;
>                         };
>                 };
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&CPU0>;
> +                               };
> +
> +                               core1 {
> +                                       cpu = <&CPU1>;
> +                               };
> +
> +                               core2 {
> +                                       cpu = <&CPU2>;
> +                               };
> +
> +                               core3 {
> +                                       cpu = <&CPU3>;
> +                               };
> +
> +                               core4 {
> +                                       cpu = <&CPU4>;
> +                               };
> +
> +                               core5 {
> +                                       cpu = <&CPU5>;
> +                               };
> +
> +                               core6 {
> +                                       cpu = <&CPU6>;
> +                               };
> +
> +                               core7 {
> +                                       cpu = <&CPU7>;
> +                               };
> +                       };
> +               };
> +
> +               idle-states {
> +                       entry-method = "psci";
> +
> +                       LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "silver-rail-power-collapse";
> +                               arm,psci-suspend-param = <0x40000004>;
> +                               entry-latency-us = <355>;
> +                               exit-latency-us = <909>;
> +                               min-residency-us = <3934>;
> +                               local-timer-stop;
> +                       };
> +
> +                       BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "gold-rail-power-collapse";
> +                               arm,psci-suspend-param = <0x40000004>;
> +                               entry-latency-us = <241>;
> +                               exit-latency-us = <1461>;
> +                               min-residency-us = <4488>;
> +                               local-timer-stop;
> +                       };
> +               };
> +
> +               domain-idle-states {
> +                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> +                               compatible = "domain-idle-state";
> +                               idle-state-name = "cluster-power-collapse";
> +                               arm,psci-suspend-param = <0x4100c344>;
> +                               entry-latency-us = <3263>;
> +                               exit-latency-us = <6562>;
> +                               min-residency-us = <9987>;
> +                               local-timer-stop;
> +                       };
> +               };
>         };
>
>         firmware {
> @@ -179,6 +267,59 @@ pmu {
>         psci {
>                 compatible = "arm,psci-1.0";
>                 method = "smc";
> +
> +               CPU_PD0: cpu0 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD1: cpu1 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD2: cpu2 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD3: cpu3 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD4: cpu4 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD5: cpu5 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD6: cpu6 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +               };
> +
> +               CPU_PD7: cpu7 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +               };
> +
> +               CLUSTER_PD: cpu-cluster0 {
> +                       #power-domain-cells = <0>;
> +                       domain-idle-states = <&CLUSTER_SLEEP_0>;
> +               };
>         };
>
>         reserved_memory: reserved-memory {

This looks good to me, and introduces no new issues to dtbs_check.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
