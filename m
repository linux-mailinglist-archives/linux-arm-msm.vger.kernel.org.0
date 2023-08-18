Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BF9780900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 11:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359381AbjHRJyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 05:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349961AbjHRJyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 05:54:16 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C420C272B
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 02:54:14 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-58c92a2c52dso7354837b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692352454; x=1692957254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fVPjDm8HorQLjo/yGS/TQrlKCK/Hh3TZugvhtXaUnQo=;
        b=K9RQcwkSaorQV8anfnfFNjMCCeTMj8DNZgdJQfZa6fInikTTfIQuh0qhu+KRGcYGou
         kn7wd1mgqZhN5RtqodFl7oyV6FXDmcXCcSVyvskxFIny5EYq40jC64ZPidjrU61d5ArE
         vJwx3Du2V8SOJFR8GYSzNykZ7GhE8dxO35X8SP7a40CElGdR8v3M8aIh/6BEPQANiqRp
         fQy1Xlh1ZKznT2GF3B9XGfzUheYxn+KdcIYtCF0PoHxSi0YjvnWZ53tqpSG7MdrO0AQC
         EDV0KjHrdePVXdlf7vXiUPf39yMf2qUixhnuwz1d03HSF7sJ1YJ62bVWeLjRnqvQCaJH
         MGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692352454; x=1692957254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVPjDm8HorQLjo/yGS/TQrlKCK/Hh3TZugvhtXaUnQo=;
        b=Q4khe3hXniPCiNFq3Bph6HELNVlFiXux/gZThyMzLtM9lD4IK0G3gzrlf/20kbcMZm
         DPjHoO/uywrFri9KdFV3nqTfD6NqNseqaerLRrLFzwVAZIJRNoQoz8BD14zD5XhBbshI
         9iEHwJncscS2NTpoITjHOTFJ+t+R1Vdi1/n+Khk4HUpFWDDD4vZKxtSH26W6k9q33Jw+
         HHALXxtStR93FPE3kG4n2jkHpSKQk4n73Q/K+xjd6YtKsCqG/5HRa7ZglFZfUJ2NFBze
         bAMPwLd066Pr3XkRF1SDmsnIh3PAFyUmXhzitFI4EoMBmmosl+W6s0MOqydqIeAV50p6
         6fbA==
X-Gm-Message-State: AOJu0YwDoLmDf38C6q3V43jXv7D0+EVjTl+5xRnUsS+Pe5BNxR6TGYI+
        lz/5G8+JYvI4/7IiSZ4QbsEHVz3nLwpx9rh+dI91xhfKFwyj/zZ9
X-Google-Smtp-Source: AGHT+IEm6n1dM60mXSBXUI2E/PxHjdx0Fn8Kz9P0EXQ13JgUGlttBDwkyPiVbbzMldRPIyW8lREamJf3uyLEpnPJ0zQ=
X-Received: by 2002:a0d:d947:0:b0:579:f163:dc2f with SMTP id
 b68-20020a0dd947000000b00579f163dc2fmr2092357ywe.3.1692352454002; Fri, 18 Aug
 2023 02:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com> <20230703085555.30285-4-quic_mkshah@quicinc.com>
In-Reply-To: <20230703085555.30285-4-quic_mkshah@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Aug 2023 11:53:37 +0200
Message-ID: <CAPDyKFp0kLERmTecV3ryaNae0bDDwRbgiYHpYvPgL-ivrQOeTw@mail.gmail.com>
Subject: Re: [RESEND v4 3/3] arm64: dts: qcom: sc7280: Add power-domains for
 cpuidle states
To:     andersson@kernel.org, Maulik Shah <quic_mkshah@quicinc.com>
Cc:     dianders@chromium.org, swboyd@chromium.org, wingers@google.com,
        linux-arm-msm@vger.kernel.org, jwerner@chromium.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- trimmed cc list

Hi Bjorn,

On Mon, 3 Jul 2023 at 10:56, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> Add power-domains for cpuidle states to use psci os-initiated idle states.
>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>

Would it be possible to pick this up for v6.6? It's been ready to be
applied for a long time, sorry for nagging about this.

Kind regards
Uffe

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 98 +++++++++++++++++++++-------
>  1 file changed, 73 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a0e8db8270e7..84208a6c673d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -170,9 +170,8 @@
>                         reg = <0x0 0x0>;
>                         clocks = <&cpufreq_hw 0>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> -                                          &LITTLE_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD0>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_0>;
>                         operating-points-v2 = <&cpu0_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -198,9 +197,8 @@
>                         reg = <0x0 0x100>;
>                         clocks = <&cpufreq_hw 0>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> -                                          &LITTLE_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD1>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_100>;
>                         operating-points-v2 = <&cpu0_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -221,9 +219,8 @@
>                         reg = <0x0 0x200>;
>                         clocks = <&cpufreq_hw 0>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> -                                          &LITTLE_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD2>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_200>;
>                         operating-points-v2 = <&cpu0_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -244,9 +241,8 @@
>                         reg = <0x0 0x300>;
>                         clocks = <&cpufreq_hw 0>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> -                                          &LITTLE_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD3>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_300>;
>                         operating-points-v2 = <&cpu0_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -267,9 +263,8 @@
>                         reg = <0x0 0x400>;
>                         clocks = <&cpufreq_hw 1>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&BIG_CPU_SLEEP_0
> -                                          &BIG_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD4>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_400>;
>                         operating-points-v2 = <&cpu4_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -290,9 +285,8 @@
>                         reg = <0x0 0x500>;
>                         clocks = <&cpufreq_hw 1>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&BIG_CPU_SLEEP_0
> -                                          &BIG_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD5>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_500>;
>                         operating-points-v2 = <&cpu4_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -313,9 +307,8 @@
>                         reg = <0x0 0x600>;
>                         clocks = <&cpufreq_hw 1>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&BIG_CPU_SLEEP_0
> -                                          &BIG_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD6>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_600>;
>                         operating-points-v2 = <&cpu4_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -336,9 +329,8 @@
>                         reg = <0x0 0x700>;
>                         clocks = <&cpufreq_hw 2>;
>                         enable-method = "psci";
> -                       cpu-idle-states = <&BIG_CPU_SLEEP_0
> -                                          &BIG_CPU_SLEEP_1
> -                                          &CLUSTER_SLEEP_0>;
> +                       power-domains = <&CPU_PD7>;
> +                       power-domain-names = "psci";
>                         next-level-cache = <&L2_700>;
>                         operating-points-v2 = <&cpu7_opp_table>;
>                         interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -431,9 +423,11 @@
>                                 min-residency-us = <5555>;
>                                 local-timer-stop;
>                         };
> +               };
>
> +               domain-idle-states {
>                         CLUSTER_SLEEP_0: cluster-sleep-0 {
> -                               compatible = "arm,idle-state";
> +                               compatible = "domain-idle-state";
>                                 idle-state-name = "cluster-power-down";
>                                 arm,psci-suspend-param = <0x40003444>;
>                                 entry-latency-us = <3263>;
> @@ -811,6 +805,59 @@
>         psci {
>                 compatible = "arm,psci-1.0";
>                 method = "smc";
> +
> +               CPU_PD0: cpu0 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD1: cpu1 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD2: cpu2 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD3: cpu3 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD4: cpu4 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD5: cpu5 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD6: cpu6 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +               };
> +
> +               CPU_PD7: cpu7 {
> +                       #power-domain-cells = <0>;
> +                       power-domains = <&CLUSTER_PD>;
> +                       domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +               };
> +
> +               CLUSTER_PD: cpu-cluster0 {
> +                       #power-domain-cells = <0>;
> +                       domain-idle-states = <&CLUSTER_SLEEP_0>;
> +               };
>         };
>
>         qspi_opp_table: opp-table-qspi {
> @@ -5291,6 +5338,7 @@
>                                           <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>,
>                                           <CONTROL_TCS 1>;
> +                       power-domains = <&CLUSTER_PD>;
>
>                         apps_bcm_voter: bcm-voter {
>                                 compatible = "qcom,bcm-voter";
> --
> 2.17.1
>
