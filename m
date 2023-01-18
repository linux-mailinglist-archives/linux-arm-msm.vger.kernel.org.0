Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D26B6729A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 21:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjARUtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 15:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjARUtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 15:49:11 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E05F3B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 12:49:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x40so123228lfu.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 12:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+89tqwjByMFlJh+90XLRKeR8816WhLFrnnBbHdowVik=;
        b=U1YUNL0D28nLvQgCR8Fy4GZ1L2J1U3r/URkWeo5z9ZP8T2B4mt/3rlzutsVRHXu9j8
         tc7kgJDU86gGGpFk8I/uVfpzR5xUOxXRxjZ23/CAqEnJG7Xa74zdvW4ANeaIyUAY0M6R
         Sv/a2JvPaLsTQa/UY8P5By5ftMJZp8+coa18jrcv5yNCMJB/eKxfVJ/SOipqpwBo4aqz
         T8X6SuZ0VatpeN4E+Kh63soN0mKVlmG1VSVJJK9guQGE87o1b/PeXFjWMhILTJR16uXx
         RLxkkb/G+sq+mCQxB6oiSHRmucaJkTS7su255I2VVA5uKknjcVYH5PL+xG37gZ8jkJ1y
         J1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+89tqwjByMFlJh+90XLRKeR8816WhLFrnnBbHdowVik=;
        b=AGo7g+p7GuaXTFmIGUzjCVoe7KTbqyDIH+eeFeD7hJ0exy8Q+2ONj6s3ZGVzzksllV
         pCp3RuJGbp7P/gUOLib6SfAqXg3COxNU3PVkzIlHiBwI0GaLh+FRCfSDZagHYT+OFfcB
         f/pOcGfygrTXij42rgDTRUouX/Y1T2nSARgLmiKGI1vvgvLcUV5BCHhgFeFKd8zWxrjw
         Eh1eltsGahX1pAL10t0v8nE0zM/VqtIFd/1zg4TN1ROtz07yEBxH50scUu0CgalgL3iy
         LejkhdTuWSdWMRYyYbPhC+i8CmFQKdw+MN0mpEaB3BGAHme5KIGRbFDjWX1dHFyS6YtX
         gTvw==
X-Gm-Message-State: AFqh2krDZ6Iuenh46tZkLYAGcTEHXn3WbWA9xP0hj/8Sfoh/KySiJLCz
        gBh+w8gss/LquLjs+8UN8KVSYylrxzO1Vdb184+VptwyG7VjIg==
X-Google-Smtp-Source: AMrXdXuLqfBIbdobOBxh7C5PpKfcFLwskMtjKLFdmaNSOgQ52gElbzEEAL+UqKv3gWXfHMrLyPxrgTN3ZBz9CyUFJRk=
X-Received: by 2002:a05:6512:409:b0:4cc:7876:9f35 with SMTP id
 u9-20020a056512040900b004cc78769f35mr458836lfk.125.1674074947228; Wed, 18 Jan
 2023 12:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20230118203428.910992-1-bhupesh.sharma@linaro.org> <77fbf01f-58fc-55a2-415b-c39d991e7c96@linaro.org>
In-Reply-To: <77fbf01f-58fc-55a2-415b-c39d991e7c96@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 19 Jan 2023 02:18:55 +0530
Message-ID: <CAH=2Ntw4hMyV2mqRu1t=WWG24=wKq96PB+eYFtZ4qYQz8dteog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add CPU idle-states
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On Thu, 19 Jan 2023 at 02:10, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 18.01.2023 21:34, Bhupesh Sharma wrote:
> > Add CPU idle-state nodes and power-domains in Qualcomm sm6115 SoC dtsi.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi | 104 +++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index 478c5d009272..29c05cbb5fd7 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > @@ -44,6 +44,8 @@ CPU0: cpu@0 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_0>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD0>;
> > +                     power-domain-names = "psci";
> >                       L2_0: l2-cache {
> >                               compatible = "cache";
> >                               cache-level = <2>;
> > @@ -59,6 +61,8 @@ CPU1: cpu@1 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_0>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD1>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               CPU2: cpu@2 {
> > @@ -70,6 +74,8 @@ CPU2: cpu@2 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_0>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD2>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               CPU3: cpu@3 {
> > @@ -81,6 +87,8 @@ CPU3: cpu@3 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_0>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> > +                     power-domains = <&CPU_PD3>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               CPU4: cpu@100 {
> > @@ -92,6 +100,8 @@ CPU4: cpu@100 {
> >                       dynamic-power-coefficient = <282>;
> >                       next-level-cache = <&L2_1>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD4>;
> > +                     power-domain-names = "psci";
> >                       L2_1: l2-cache {
> >                               compatible = "cache";
> >                               cache-level = <2>;
> > @@ -107,6 +117,8 @@ CPU5: cpu@101 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_1>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD5>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               CPU6: cpu@102 {
> > @@ -118,6 +130,8 @@ CPU6: cpu@102 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_1>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD6>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               CPU7: cpu@103 {
> > @@ -129,6 +143,8 @@ CPU7: cpu@103 {
> >                       enable-method = "psci";
> >                       next-level-cache = <&L2_1>;
> >                       qcom,freq-domain = <&cpufreq_hw 1>;
> > +                     power-domains = <&CPU_PD7>;
> > +                     power-domain-names = "psci";
> >               };
> >
> >               cpu-map {
> > @@ -168,6 +184,41 @@ core3 {
> >                               };
> >                       };
> >               };
> > +
> > +             idle-states {
> > +                     entry-method = "psci";
> > +
> > +                     LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "silver-rail-power-collapse";
> > +                             arm,psci-suspend-param = <0x40000003>;
> > +                             entry-latency-us = <290>;
> > +                             exit-latency-us = <376>;
> > +                             min-residency-us = <800>;
> I think this value is incorrect, see:
>
> https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.56/qcom/bengal-pm.dtsi#99
>
> > +                             local-timer-stop;
> > +                     };
> > +
> > +                     BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "gold-rail-power-collapse";
> > +                             arm,psci-suspend-param = <0x40000003>;
> > +                             entry-latency-us = <297>;
> > +                             exit-latency-us = <324>;
> > +                             min-residency-us = <1110>;
> > +                             local-timer-stop;
> > +                     };
> > +             };
> > +
> > +             domain-idle-states {
> > +                     CLUSTER_SLEEP_0: cluster-sleep-0 {
> > +                             compatible = "domain-idle-state";
> > +                             idle-state-name = "cluster-power-collapse";
> > +                             arm,psci-suspend-param = <0x41000043>;
> > +                             entry-latency-us = <800>;
> > +                             exit-latency-us = <2118>;
> > +                             min-residency-us = <7376>;
> These values vary per cluster, see qcom,pm-cluster-level@2 in the
> file linked above.. We should either split that, or at least take
> max() of each value between the two nodes to make sure the sleep
> state is exited properly on both types of cores.

Ack to both the above observations. Will send a fixed v2 shortly.

Thanks,
Bhupesh

> > +                     };
> > +             };
> >       };
> >
> >       firmware {
> > @@ -191,6 +242,59 @@ pmu {
> >       psci {
> >               compatible = "arm,psci-1.0";
> >               method = "smc";
> > +
> > +             CPU_PD0: power-domain-cpu0 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD1: power-domain-cpu1 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD2: power-domain-cpu2 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD3: power-domain-cpu3 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD4: power-domain-cpu4 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD5: power-domain-cpu5 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD6: power-domain-cpu6 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CPU_PD7: power-domain-cpu7 {
> > +                     #power-domain-cells = <0>;
> > +                     power-domains = <&CLUSTER_PD>;
> > +                     domain-idle-states = <&BIG_CPU_SLEEP_0>;
> > +             };
> > +
> > +             CLUSTER_PD: power-domain-cpu-cluster0 {
> > +                     #power-domain-cells = <0>;
> > +                     domain-idle-states = <&CLUSTER_SLEEP_0>;
> > +             };
> >       };
> >
> >       reserved_memory: reserved-memory {
