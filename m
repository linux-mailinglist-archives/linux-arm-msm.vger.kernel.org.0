Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B35508501
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377199AbiDTJeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 05:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377216AbiDTJeg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 05:34:36 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031B2DFCE
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 02:31:49 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 88-20020a9d0ee1000000b005d0ae4e126fso724805otj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mez1E+3vZGiFIj7Q7dpHP5nAN6NB5oyOwu47bkX4eJY=;
        b=tfy5CfEoJ4cJqsMyu5J95G/4G8Nc7kcwgF9tX3F7ldLQgnwVwBwDNbPO89P3Ezubk1
         qSVUnWabZODISW+3BIOAFNBc59pIR7rW8KvDIjkHAWqHpQX3QCmFd2FmOV5f9mJz9sMr
         nvvjPvDxCnRyTUbAYhFs/UzaqLyQ+7bH6Y/9EwRVlcFcTaBRMW3zjQWXersA/QHoS5du
         Htr/+MfdQmEol8YG7AIWJdMNDFn4c2aDWP+XvOqt1DepQI6JsK/bhtcW2bpjH8B6/p4v
         SlmNgEoY7/dh3oSnznbUCU2kMv6MJymHEZEyWP1lBRo+W1CAtebKnymKQG+mRKfJPcHW
         05bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mez1E+3vZGiFIj7Q7dpHP5nAN6NB5oyOwu47bkX4eJY=;
        b=qi6OtewpaIr0J1pTRK+rKBxNZ/Jhn6EYbVs/Hf+NV1SDzUXuJK9kg3wF27Cg0u3eaH
         /wxDNoNhA8RuqytMR96oqHuJTqGGD5SqJvCYLVweLeu+AQ+DMDjOVegX/c3Fva8kRtUa
         Dzcw7YdLb7FziLjJIux4ZC2miMl0WucT806pUQYg7UOn+ZVQ0wqUiImquWs3tKzpcPfS
         VIJK4eVhJhiN3rCFnj38qMPa/TE4YzsKLTe4oGRrhJu8GpqtG3brvZEqikRp5759SOCa
         vY/J7wporpyU+Q+OVnN+4xGM/5SI3zhkGapLc7ccRI6y8vWdqW5SymqLya+TBm+FL/2x
         rY0A==
X-Gm-Message-State: AOAM533Y4hFgz6HP6R3s9T2X7GYXPrD4Hiz4JK0Pm5/8vkw/GoNYlBoA
        vKANaBinSI0w3IuewKKAiiRulXczVyIsuSz1FEZKXw==
X-Google-Smtp-Source: ABdhPJywALdW5QgXeJIM5KGWDtXA7cBwwOhD3g9653p4nyJ3ayP+Ei+4nupGqUkAyQE/Ys3M3AH04aYG1RiB8REvLFg=
X-Received: by 2002:a9d:5a19:0:b0:5cd:9ca0:898b with SMTP id
 v25-20020a9d5a19000000b005cd9ca0898bmr7327504oth.318.1650447107931; Wed, 20
 Apr 2022 02:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org> <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
In-Reply-To: <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 20 Apr 2022 17:31:11 +0800
Message-ID: <CABymUCOAKvZXZKYtvunjn=K9mpZmAd4x3WTXH571k5BsBH6CEA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com,
        Leo Yan <leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E2022=E5=B9=B4=
4=E6=9C=8819=E6=97=A5=E5=91=A8=E4=BA=8C 15:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On 19/04/2022 03:09, Bryan O'Donoghue wrote:
> > Add msm8939 a derivative SoC of msm8916. This SoC contains a number of =
key
> > differences to msm8916.
> >
> > - big.LITTLE Octa Core - quad 1.5GHz + quad 1.0GHz
> > - DRAM 1x800 LPDDR3
> > - Camera 4+4 lane CSI
> > - Venus @ 1080p60 HEVC
> > - DSI x 2
> > - Adreno A405
> > - WiFi wcn3660/wcn3680b 802.11ac
> >
> > Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Co-developed-by: Jun Nie <jun.nie@linaro.org>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Co-developed-by: Benjamin Li <benl@squareup.com>
> > Signed-off-by: Benjamin Li <benl@squareup.com>
> > Co-developed-by: James Willcox <jwillcox@squareup.com>
> > Signed-off-by: James Willcox <jwillcox@squareup.com>
> > Co-developed-by: Leo Yan <leo.yan@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > Co-developed-by: Joseph Gates <jgates@squareup.com>
> > Signed-off-by: Joseph Gates <jgates@squareup.com>
> > Co-developed-by: Max Chen <mchen@squareup.com>
> > Signed-off-by: Max Chen <mchen@squareup.com>
> > Co-developed-by: Zac Crosby <zac@squareup.com>
> > Signed-off-by: Zac Crosby <zac@squareup.com>
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8939.dtsi | 2017 +++++++++++++++++++++++++
> >  1 file changed, 2017 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8939.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dt=
s/qcom/msm8939.dtsi
> > new file mode 100644
> > index 000000000000..f1aa79b7d0e9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > @@ -0,0 +1,2017 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2020-2022, Linaro Limited
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License version 2 and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <dt-bindings/interconnect/qcom,msm8939.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/qcom,gcc-msm8939.h>
> > +#include <dt-bindings/reset/qcom,gcc-msm8939.h>
> > +#include <dt-bindings/clock/qcom,rpmcc.h>
> > +#include <dt-bindings/power/qcom-rpmpd.h>
> > +#include <dt-bindings/thermal/thermal.h>
> > +
> > +/ {
> > +     model =3D "Qualcomm Technologies, Inc. MSM8939";
> > +     compatible =3D "qcom,msm8939";
> > +     qcom,msm-id =3D <239 0>, <239 0x30000>, <241 0x30000>, <263 0x300=
00>;
> > +
> > +     interrupt-parent =3D <&intc>;
> > +
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <2>;
> > +
> > +     memory {
> > +             device_type =3D "memory";
> > +             /* We expect the bootloader to fill in the reg */
> > +             reg =3D <0 0 0 0>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             tz-apps@86000000 {
> > +                     reg =3D <0x0 0x86000000 0x0 0x300000>;
> > +                     no-map;
> > +             };
> > +
> > +             smem_mem: smem_region@86300000 {
>
> No underscores in node names. Why this is region (in node name) and
> others are not?
>
> > +                     reg =3D <0x0 0x86300000 0x0 0x100000>;
> > +                     no-map;
> > +             };
> > +
> > +             hypervisor@86400000 {
> > +                     reg =3D <0x0 0x86400000 0x0 0x100000>;
> > +                     no-map;
> > +             };
> > +
> > +             tz@86500000 {
> > +                     reg =3D <0x0 0x86500000 0x0 0x180000>;
> > +                     no-map;
> > +             };
> > +
> > +             reserved@8668000 {
> > +                     reg =3D <0x0 0x86680000 0x0 0x80000>;
> > +                     no-map;
> > +             };
> > +
> > +             rmtfs@86700000 {
> > +                     compatible =3D "qcom,rmtfs-mem";
> > +                     reg =3D <0x0 0x86700000 0x0 0xe0000>;
> > +                     no-map;
> > +
> > +                     qcom,client-id =3D <1>;
> > +             };
> > +
> > +             rfsa@867e00000 {
> > +                     reg =3D <0x0 0x867e0000 0x0 0x20000>;
> > +                     no-map;
> > +             };
> > +
> > +             mpss_mem: mpss@86800000 {
> > +                     reg =3D <0x0 0x86800000 0x0 0x2b00000>;
> > +                     no-map;
> > +             };
> > +
> > +             wcnss_mem: wcnss@89300000 {
> > +                     reg =3D <0x0 0x89300000 0x0 0x600000>;
> > +                     no-map;
> > +             };
> > +
> > +             venus_mem: venus@89900000 {
> > +                     reg =3D <0x0 0x89900000 0x0 0x500000>;
> > +                     no-map;
> > +             };
> > +
> > +             mba_mem: mba@8ea00000 {
> > +                     no-map;
> > +                     reg =3D <0 0x8ea00000 0 0x100000>;
> > +             };
> > +     };
> > +
> > +     /*
> > +      * MSM8939 has a big.LITTLE hetrogeneous computing architecture,
>
> s/hetrogeneous/heterogeneous/
>
> > +      * consisting of two clusters of four ARM Cortex-A53s each. The
> > +      * LITTLE cluster runs at 1.0-1.2GHz, and the big cluster runs
> > +      * at 1.5-1.7GHz.
> > +      *
> > +      * The enable method used here is spin-table which pre-supposes u=
se
>
> s/pre-supposes/presupposes/?
>
> > +      * of a 2nd stage boot shim such as lk2nd to have installed a
> > +      * spin-table, the downstream non-psci/non-spin-table method that
> > +      * default msm8916/msm8936/msm8939 will not be supported upstream=
.
> > +      */
> > +     cpu-map {
> > +             /* LITTLE (efficiency) cluster */
> > +             cluster0 {
> > +                     core0 {
> > +                             cpu =3D <&CPU4>;
> > +                     };
> > +
> > +                     core1 {
> > +                             cpu =3D <&CPU5>;
> > +                     };
> > +
> > +                     core2 {
> > +                             cpu =3D <&CPU6>;
> > +                     };
> > +
> > +                     core3 {
> > +                             cpu =3D <&CPU7>;
> > +                     };
> > +             };
> > +
> > +             /* big (performance) cluster */
> > +             /* Boot CPU is cluster 1 core 0 */
> > +             cluster1 {
> > +                     core0 {
> > +                             cpu =3D <&CPU0>;
> > +                     };
> > +
> > +                     core1 {
> > +                             cpu =3D <&CPU1>;
> > +                     };
> > +
> > +                     core2 {
> > +                             cpu =3D <&CPU2>;
> > +                     };
> > +
> > +                     core3 {
> > +                             cpu =3D <&CPU3>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     cpus {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             CPU0: cpu@100 {
>
> lowercalse labels
>
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x100>;
> > +                     next-level-cache =3D <&L2_1>;
> > +                     qcom,acc =3D <&acc0>;
> > +                     qcom,saw =3D <&saw0>;
> > +                     cpu-idle-states =3D <&CPU_SPC>;
> > +                     clocks =3D <&apcs1_mbox>;
> > +                     /* operating-points-v2 =3D <&cluster1_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +                     L2_1: l2-cache-cluster1 {
>
> lowercase labels, the same applies further.
>
> > +                             compatible =3D "cache";
> > +                             cache-level =3D <2>;
> > +                     };
> > +             };
> > +
> > +             CPU1: cpu@101 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x101>;
> > +                     next-level-cache =3D <&L2_1>;
> > +                     qcom,acc =3D <&acc1>;
> > +                     qcom,saw =3D <&saw1>;
> > +                     clocks =3D <&apcs1_mbox>;
> > +                     /* operating-points-v2 =3D <&cluster1_opp_table>;
>
> No dead code in the kernel. If you need it here, please document.  The
> same applies further.
>
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             CPU2: cpu@102 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x102>;
> > +                     next-level-cache =3D <&L2_1>;
> > +                     qcom,acc =3D <&acc2>;
> > +                     qcom,saw =3D <&saw2>;
> > +                     clocks =3D <&apcs1_mbox>;
> > +                     /* operating-points-v2 =3D <&cluster1_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             CPU3: cpu@103 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x103>;
> > +                     next-level-cache =3D <&L2_1>;
> > +                     qcom,acc =3D <&acc3>;
> > +                     qcom,saw =3D <&saw3>;
> > +                     clocks =3D <&apcs1_mbox>;
> > +                     /* operating-points-v2 =3D <&cluster1_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             CPU4: cpu@0 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x0>;
> > +                     qcom,acc =3D <&acc4>;
> > +                     qcom,saw =3D <&saw4>;
> > +                     clocks =3D <&apcs0>;
> > +                     /* operating-points-v2 =3D <&cluster0_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +                     next-level-cache =3D <&L2_0>;
> > +                     L2_0: l2-cache-cluster0 {
> > +                             compatible =3D "cache";
> > +                             cache-level =3D <2>;
> > +                     };
> > +             };
> > +
> > +             CPU5: cpu@1 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x1>;
> > +                     next-level-cache =3D <&L2_0>;
> > +                     qcom,acc =3D <&acc5>;
> > +                     qcom,saw =3D <&saw5>;
> > +                     clocks =3D <&apcs0>;
> > +                     /* operating-points-v2 =3D <&cluster0_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             CPU6: cpu@2 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x2>;
> > +                     next-level-cache =3D <&L2_0>;
> > +                     qcom,acc =3D <&acc6>;
> > +                     qcom,saw =3D <&saw6>;
> > +                     clocks =3D <&apcs0>;
> > +                     /* operating-points-v2 =3D <&cluster0_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             CPU7: cpu@3 {
> > +                     device_type =3D "cpu";
> > +                     compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                     enable-method =3D "spin-table";
> > +                     reg =3D <0x3>;
> > +                     next-level-cache =3D <&L2_0>;
> > +                     qcom,acc =3D <&acc7>;
> > +                     qcom,saw =3D <&saw7>;
> > +                     clocks =3D <&apcs0>;
> > +                     /* operating-points-v2 =3D <&cluster0_opp_table>;
> > +                      * power-domains =3D <&cpr>;
> > +                      * power-domain-names =3D "cpr";
> > +                      */
> > +                     #cooling-cells =3D <2>;
> > +             };
> > +
> > +             idle-states {
> > +                     CPU_SPC: spc {
> > +                             compatible =3D "arm,idle-state";
> > +                             arm,psci-suspend-param =3D <0x40000002>;
> > +                             entry-latency-us =3D <130>;
> > +                             exit-latency-us =3D <150>;
> > +                             min-residency-us =3D <2000>;
> > +                             local-timer-stop;
> > +                     };
> > +             };
> > +     };
> > +
> > +     cluster0_opp_table: cluster0-opp-table {
> > +             compatible =3D "operating-points-v2-kryo-cpu";
> > +             opp-shared;
> > +
> > +             opp-249600000 {
> > +                     opp-hz =3D /bits/ 64 <249600000>;
> > +                     required-opps =3D <&cpr_opp1>;
> > +             };
> > +
> > +             opp-499200000 {
> > +                     opp-hz =3D /bits/ 64 <499200000>;
> > +                     required-opps =3D <&cpr_opp3>;
> > +             };
> > +
> > +             opp-800000000 {
> > +                     opp-hz =3D /bits/ 64 <800000000>;
> > +                     required-opps =3D <&cpr_opp6>;
> > +             };
> > +
> > +             opp-1113600000 {
> > +                     opp-hz =3D /bits/ 64 <1113600000>;
> > +                     required-opps =3D <&cpr_opp9>;
> > +             };
> > +     };
> > +
> > +     cluster1_opp_table: cluster1-opp-table {
> > +             compatible =3D "operating-points-v2-kryo-cpu";
> > +             opp-shared;
> > +
> > +             opp-200000000 {
> > +                     opp-hz =3D /bits/ 64 <200000000>;
> > +                     required-opps =3D <&cpr_opp1>;
> > +             };
> > +
> > +             opp-400000000 {
> > +                     opp-hz =3D /bits/ 64 <400000000>;
> > +                     required-opps =3D <&cpr_opp2>;
> > +             };
> > +
> > +             opp-533330000 {
> > +                     opp-hz =3D /bits/ 64 <533330000>;
> > +                     required-opps =3D <&cpr_opp4>;
> > +             };
> > +
> > +             opp-800000000 {
> > +                     opp-hz =3D /bits/ 64 <800000000>;
> > +                     required-opps =3D <&cpr_opp5>;
> > +             };
> > +
> > +             opp-1113600000 {
> > +                     opp-hz =3D /bits/ 64 <1113600000>;
> > +                     required-opps =3D <&cpr_opp7>;
> > +             };
> > +
> > +             opp-1497600000 {
> > +                     opp-hz =3D /bits/ 64 <1497600000>;
> > +                     required-opps =3D <&cpr_opp8>;
> > +             };
> > +     };
> > +
> > +     /* Frequencies in below opp is for cpr_opp virtual corner calcula=
tion,
>
> Generic Linux coding style comments, so:
>         /*
>          * Frequencies....
>          * ...
>          */
>
> > +      * not strictly coupled with frquencies in CPU opp for CPUs may r=
equire
> > +      * different cpr_opp for specific frquency.
>
> Multiple typos. Please run spell check.
>
> > +      */
> > +     cpr_opp_table: cpr-opp-table {
> > +             compatible =3D "operating-points-v2-qcom-level";
> > +
> > +             cpr_opp1: opp1 {
>
> Why these opps are named with numerical suffix but other with frequency
> suffix?

Hi Krzysztof,

Because the 200MHz in cpr is just used as a parameter to calculate the
voltage adjustment.
The frequency in cpr_opp is not directly related to CPU frequency.
Such as cpr_opp1 is for
200MHz on cluster1 while it is for 249MHz on cluster0. Do you still
suggest to use
cpr_opp_200 or so in this case?

>
> > +                     opp-hz =3D /bits/ 64 <200000000>;
> > +                     opp-level =3D <1>;
> > +                     qcom,opp-fuse-level =3D <1>;
> > +             };
> > +             cpr_opp2: opp2 {
> > +                     opp-hz =3D /bits/ 64 <400000000>;
> > +                     opp-level =3D <2>;
> > +                     qcom,opp-fuse-level =3D <1>;
> > +             };
> > +             cpr_opp3: opp3 {
> > +                     opp-hz =3D /bits/ 64 <499200000>;
> > +                     opp-level =3D <3>;
> > +                     qcom,opp-fuse-level =3D <2>;
> > +             };
> > +             cpr_opp4: opp4 {
> > +                     opp-hz =3D /bits/ 64 <533330000>;
> > +                     opp-level =3D <4>;
> > +                     qcom,opp-fuse-level =3D <2>;
> > +             };
> > +             cpr_opp5: opp5 {
> > +                     opp-hz =3D /bits/ 64 <800000000>;
> > +                     opp-level =3D <5>;
> > +                     qcom,opp-fuse-level =3D <2>;
> > +             };
> > +             cpr_opp6: opp6 {
> > +                     opp-hz =3D /bits/ 64 <960000000>;
> > +                     opp-level =3D <6>;
> > +                     qcom,opp-fuse-level =3D <2>;
> > +             };
> > +             cpr_opp7: opp7 {
> > +                     opp-hz =3D /bits/ 64 <1113600000>;
> > +                     opp-level =3D <7>;
> > +                     qcom,opp-fuse-level =3D <2>;
> > +             };
> > +             cpr_opp8: opp8 {
> > +                     opp-hz =3D /bits/ 64 <1497600000>;
> > +                     opp-level =3D <8>;
> > +                     qcom,opp-fuse-level =3D <3>;
> > +             };
> > +             cpr_opp9: opp9 {
> > +                     opp-hz =3D /bits/ 64 <1497500000>;
> > +                     opp-level =3D <9>;
> > +                     qcom,opp-fuse-level =3D <3>;
> > +             };
> > +     };
> > +
> > +     cci_opp_table: cci-opp-table {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-200000000 {
> > +                     opp-hz =3D /bits/ 64 <200000000>;
> > +             };
> > +
> > +             opp-297600000 {
> > +                     opp-hz =3D /bits/ 64 <297600000>;
> > +             };
> > +
> > +             opp-400000000 {
> > +                     opp-hz =3D /bits/ 64 <400000000>;
> > +             };
> > +
> > +             opp-595200000 {
> > +                     opp-hz =3D /bits/ 64 <595200000>;
> > +             };
> > +     };
> > +
> > +     gpu_opp_table: gpu-opp-table {
>
> If table is used by only one device, define it inside that device node.
>
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-550000000 {
> > +                     opp-hz =3D /bits/ 64 <550000000>;
> > +             };
> > +
> > +             opp-465000000 {
> > +                     opp-hz =3D /bits/ 64 <465000000>;
> > +             };
> > +
> > +             opp-400000000 {
> > +                     opp-hz =3D /bits/ 64 <400000000>;
> > +             };
> > +
> > +             opp-220000000 {
> > +                     opp-hz =3D /bits/ 64 <220000000>;
> > +             };
> > +
> > +             opp-19200000 {
> > +                     opp-hz =3D /bits/ 64 <19200000>;
> > +             };
> > +     };
> > +
> > +     pmu {
> > +             compatible =3D "arm,cortex-a53-pmu";
> > +             interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TY=
PE_LEVEL_HIGH)>;
>
> No PMU nodes for other cores?
>
> > +     };
> > +
> > +     thermal_zones: thermal-zones {
> > +             cpu0-thermal {
> > +                     polling-delay-passive =3D <250>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsens 5>;
> > +
> > +                     trips {
> > +                             cpu0_alert: trip0 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu0_crit: trip1 {
> > +                                     temperature =3D <115000>;
> > +                                     hysteresis =3D <0>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu0_alert>;
> > +                                     cooling-device =3D <&CPU0 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU1 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU2 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU3 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu1-thermal {
> > +                     polling-delay-passive =3D <250>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsens 6>;
> > +
> > +                     trips {
> > +                             cpu1_alert: trip0 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu1_crit: trip1 {
> > +                                     temperature =3D <110000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu1_alert>;
> > +                                     cooling-device =3D <&CPU0 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU1 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU2 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU3 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu2-thermal {
> > +                     polling-delay-passive =3D <250>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsens 7>;
> > +
> > +                     trips {
> > +                             cpu2_alert: trip0 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu2_crit: trip1 {
> > +                                     temperature =3D <110000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu2_alert>;
> > +                                     cooling-device =3D <&CPU0 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU1 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU2 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU3 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu3-thermal {
> > +                     polling-delay-passive =3D <250>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsens 8>;
> > +
> > +                     trips {
> > +                             cpu3_alert: trip0 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu3_crit: trip1 {
> > +                                     temperature =3D <110000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu3_alert>;
> > +                                     cooling-device =3D <&CPU0 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU1 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU2 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU3 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu4567-thermal {
> > +                     polling-delay-passive =3D <250>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsens 9>;
> > +
> > +                     trips {
> > +                             cpu4567_alert: trip0 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu4567_crit: trip1 {
> > +                                     temperature =3D <110000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu4567_alert>;
> > +                                     cooling-device =3D <&CPU4 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU5 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU6 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> > +                                                      <&CPU7 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             gpu-thermal {
> > +                     polling-delay-passive =3D <0>;
> > +                     polling-delay =3D <0>;
> > +
> > +                     thermal-sensors =3D <&tsens 3>;
> > +             };
> > +
> > +             modem1-thermal {
> > +                     polling-delay-passive =3D <0>;
> > +                     polling-delay =3D <0>;
> > +
> > +                     thermal-sensors =3D <&tsens 0>;
> > +             };
> > +
> > +             modem2-thermal {
> > +                     polling-delay-passive =3D <0>;
> > +                     polling-delay =3D <0>;
> > +
> > +                     thermal-sensors =3D <&tsens 2>;
> > +             };
> > +
> > +             venus_camera-thermal {
> > +                     polling-delay-passive =3D <0>;
> > +                     polling-delay =3D <0>;
> > +
> > +                     thermal-sensors =3D <&tsens 1>;
> > +             };
> > +     };
> > +
> > +     timer {
> > +             compatible =3D "arm,armv8-timer";
> > +             interrupts =3D <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_T=
YPE_LEVEL_LOW)>,
> > +                          <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYP=
E_LEVEL_LOW)>,
> > +                          <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYP=
E_LEVEL_LOW)>,
> > +                          <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYP=
E_LEVEL_LOW)>;
> > +     };
> > +
> > +     clocks {
> > +             xo_board: xo_board {
>
> Generic node names, no underscores in node names. This applies everywhere=
.
>
> > +                     compatible =3D "fixed-clock";
> > +                     #clock-cells =3D <0>;
> > +                     clock-frequency =3D <19200000>;
> > +             };
> > +
> > +             sleep_clk: sleep_clk {
> > +                     compatible =3D "fixed-clock";
> > +                     #clock-cells =3D <0>;
> > +                     clock-frequency =3D <32768>;
> > +             };
> > +     };
> > +
> > +     smem {
> > +             compatible =3D "qcom,smem";
> > +
> > +             memory-region =3D <&smem_mem>;
> > +             qcom,rpm-msg-ram =3D <&rpm_msg_ram>;
> > +
> > +             hwlocks =3D <&tcsr_mutex 3>;
> > +     };
> > +
> > +     firmware {
> > +             scm: scm {
> > +                     compatible =3D "qcom,scm";
> > +                     clocks =3D <&gcc GCC_CRYPTO_CLK>,
> > +                              <&gcc GCC_CRYPTO_AXI_CLK>,
> > +                              <&gcc GCC_CRYPTO_AHB_CLK>;
> > +                     clock-names =3D "core", "bus", "iface";
> > +                     #reset-cells =3D <1>;
> > +
> > +                     qcom,dload-mode =3D <&tcsr 0x6100>;
> > +             };
> > +     };
> > +
> > +     soc: soc {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges =3D <0 0 0 0xffffffff>;
> > +             compatible =3D "simple-bus";
> > +
> > +             qfprom_cpr: qfprom_cpr@58000 {
>
> Generic node names, no underscores in node names. This applies everywhere=
.
>
> > +                     compatible =3D "qcom,qfprom";
> > +                     reg =3D <0x00058000 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     cpr_efuse_init_voltage1: ivoltage1@dc {
>
> s/ivoltageX/voltage/

How about cpr_efuse_init_voltage_dc? There are 3
cpr_efuse_init_voltage* node here.

>
> > +                             reg =3D <0xdc 0x4>;
> > +                             bits =3D <4 6>;
> > +                     };
> > +                     cpr_efuse_init_voltage2: ivoltage2@da {
> > +                             reg =3D <0xda 0x4>;
> > +                             bits =3D <2 6>;
> > +                     };
> > +                     cpr_efuse_init_voltage3: ivoltage3@d8 {
> > +                             reg =3D <0xd8 0x4>;
> > +                             bits =3D <0 6>;
> > +                     };
> > +                     cpr_efuse_quot1: quot1@dc {
>
> Similar. Why do you need suffix number?
>
> > +                             reg =3D <0xdd 0x8>;
> > +                             bits =3D <2 12>;
> > +                     };
> > +                     cpr_efuse_quot2: quot2@da {
> > +                             reg =3D <0xdb 0x8>;
> > +                             bits =3D <0x0 12>;
> > +                     };
> > +                     cpr_efuse_quot3: quot3@d8 {
> > +                             reg =3D <0xd8 0x8>;
> > +                             bits =3D <6 12>;
> > +                     };
> > +                     cpr_efuse_ring1: ring1@de {
> > +                             reg =3D <0xde 0x4>;
> > +                             bits =3D <6 3>;
> > +                     };
> > +                     cpr_efuse_ring2: ring2@de {
> > +                             reg =3D <0xde 0x4>;
> > +                             bits =3D <6 3>;
> > +                     };
> > +                     cpr_efuse_ring3: ring3@de {
> > +                             reg =3D <0xde 0x4>;
> > +                             bits =3D <6 3>;
> > +                     };
> > +                     cpr_efuse_revision: revision@4 {
> > +                             reg =3D <0x5 0x1>;
> > +                             bits =3D <5 1>;
> > +                     };
> > +                     cpr_efuse_revision_high: revision_high@4 {
> > +                             reg =3D <0x7 0x1>;
> > +                             bits =3D <0 1>;
> > +                     };
> > +                     cpr_efuse_pvs_version: pvs@4 {
> > +                             reg =3D <0x3 0x1>;
> > +                             bits =3D <5 1>;
> > +                     };
> > +                     cpr_efuse_pvs_version_high: pvs_high@4 {
> > +                             reg =3D <0x6 0x1>;
> > +                             bits =3D <2 2>;
> > +                     };
> > +                     cpr_efuse_speedbin: speedbin@c {
> > +                             reg =3D <0xc 0x1>;
> > +                             bits =3D <2 3>;
> > +                     };
> > +
> > +             };
> > +
> > +             acc0: clock-controller@b088000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb088000 0x1000>;
> > +             };
> > +
> > +             saw0: power-controller@b089000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb089000 0x1000>;
> > +             };
> > +
> > +             acc1: clock-controller@b098000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb098000 0x1000>;
> > +             };
> > +
> > +             saw1: power-controller@b099000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb099000 0x1000>;
> > +             };
> > +
> > +             acc2: clock-controller@b0a8000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb0a8000 0x1000>;
> > +             };
> > +
> > +             saw2: power-controller@b0a9000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb0a9000 0x1000>;
> > +             };
> > +
> > +             acc3: clock-controller@b0b8000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb0b8000 0x1000>;
> > +             };
> > +
> > +             saw3: power-domain@b0b9000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb0b9000 0x1000>;
> > +             };
> > +
> > +             acc4: clock-controller@b188000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb188000 0x1000>;
> > +             };
> > +
> > +             saw4: power-controller@b189000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb189000 0x1000>;
> > +             };
> > +
> > +             acc5: clock-controller@b198000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb198000 0x1000>;
> > +             };
> > +
> > +             saw5: power-controller@b199000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb199000 0x1000>;
> > +             };
> > +
> > +             acc6: clock-controller@b1a8000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb1a8000 0x1000>;
> > +             };
> > +
> > +             saw6: power-controller@b1a9000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb1a9000 0x1000>;
> > +             };
> > +
> > +             acc7: clock-controller@b1b8000 {
> > +                     compatible =3D "qcom,kpss-acc-v2";
> > +                     reg =3D <0xb1b8000 0x1000>;
> > +             };
> > +
> > +             saw7: power-controller@b1b9000 {
> > +                     compatible =3D "qcom,msm8916-saw2-v3.0-cpu", "qco=
m,saw2";
> > +                     reg =3D <0xb1b9000 0x1000>;
> > +             };
> > +
> > +             restart@4ab000 {
> > +                     compatible =3D "qcom,pshold";
> > +                     reg =3D <0x4ab000 0x4>;
> > +             };
> > +
> > +             msmgpio: pinctrl@1000000 {
> > +                     compatible =3D "qcom,msm8916-pinctrl";
> > +                     reg =3D <0x1000000 0x300000>;
> > +                     interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells =3D <2>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +             };
> > +
> > +             gcc: clock-controller@1800000 {
> > +                     compatible =3D "qcom,gcc-msm8939";
> > +                     #clock-cells =3D <1>;
> > +                     #reset-cells =3D <1>;
> > +                     #power-domain-cells =3D <1>;
> > +                     reg =3D <0x1800000 0x80000>;
> > +                     clocks =3D <&xo_board>, <&sleep_clk>;
> > +                     clock-names =3D "xo", "sleep_clk";
> > +             };
> > +
> > +             tcsr_mutex_regs: syscon@1905000 {
> > +                     compatible =3D "syscon";
> > +                     reg =3D <0x1905000 0x20000>;
> > +             };
> > +
> > +             tcsr: syscon@1937000 {
> > +                     compatible =3D "qcom,tcsr-msm8916", "syscon";
> > +                     reg =3D <0x1937000 0x30000>;
> > +             };
> > +
> > +             tcsr_mutex: hwlock {
> > +                     compatible =3D "qcom,tcsr-mutex";
> > +                     syscon =3D <&tcsr_mutex_regs 0 0x1000>;
> > +                     #hwlock-cells =3D <1>;
> > +             };
> > +
> > +             rpm_msg_ram: memory@60000 {
> > +                     compatible =3D "qcom,rpm-msg-ram";
> > +                     reg =3D <0x60000 0x8000>;
> > +             };
> > +
> > +             blsp1_uart1: serial@78af000 {
> > +                     compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-=
uartdm";
> > +                     reg =3D <0x78af000 0x200>;
> > +                     interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc=
 GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 1>, <&blsp_dma 0>;
> > +                     dma-names =3D "rx", "tx";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             a53pll_c1: clock@b016000 {
> > +                     compatible =3D "qcom,msm8939-a53pll";
> > +                     reg =3D <0xb016000 0x40>;
> > +                     #clock-cells =3D <0>;
> > +             };
> > +
> > +             a53pll_c0: clock@b116000 {
> > +                     compatible =3D "qcom,msm8939-a53pll";
> > +                     reg =3D <0xb116000 0x40>;
> > +                     #clock-cells =3D <0>;
> > +             };
> > +
> > +             a53pll_cci: clock@b1d0000 {
> > +                     compatible =3D "qcom,msm8939-a53pll";
> > +                     reg =3D <0xb1d0000 0x40>;
> > +                     #clock-cells =3D <0>;
> > +             };
> > +
> > +             apcs2: mailbox@b1d1000 {
> > +                     compatible =3D "qcom,msm8916-apcs-kpss-global", "=
syscon";
> > +                     reg =3D <0xb1d1000 0x1000>;
> > +                     #mbox-cells =3D <1>;
> > +                     clocks =3D <&a53pll_cci>, <&gcc GPLL0_VOTE>, <&xo=
_board>;
> > +                     clock-names =3D "pll", "aux", "ref";
> > +                     #clock-cells =3D <0>;
> > +                     clock-output-names =3D "a53mux_cci";
> > +             };
> > +
> > +             apcs1_mbox: mailbox@b011000 {
> > +                     compatible =3D "qcom,msm8916-apcs-kpss-global";
> > +                     reg =3D <0xb011000 0x1000>;
> > +                     #mbox-cells =3D <1>;
> > +                     clocks =3D <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&xo_=
board>;
> > +                     clock-names =3D "pll", "aux", "ref";
> > +                     #clock-cells =3D <0>;
> > +                     clock-output-names =3D "a53mux_c1";
> > +                     /* Set a nominal frequency on a53mux_cci */
> > +                     assigned-clocks =3D <&apcs2>;
> > +                     assigned-clock-rates =3D <297600000>;
> > +             };
> > +
> > +             apcs1: syscon@b111000 {
> > +                     compatible =3D "syscon";
> > +                     reg =3D <0xb011000 0x1000>;
> > +             };
> > +
> > +             apcs0: mailbox@b111000 {
> > +                     compatible =3D "qcom,msm8916-apcs-kpss-global", "=
syscon";
> > +                     reg =3D <0xb111000 0x1000>;
> > +                     #mbox-cells =3D <1>;
> > +                     clocks =3D <&a53pll_c0>, <&gcc GPLL0_VOTE>, <&xo_=
board>;
> > +                     clock-names =3D "pll", "aux", "ref";
> > +                     #clock-cells =3D <0>;
> > +                     clock-output-names =3D "a53mux_c0";
> > +             };
> > +
> > +             blsp1_uart2: serial@78b0000 {
> > +                     compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-=
uartdm";
> > +                     reg =3D <0x78b0000 0x200>;
> > +                     interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc=
 GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 3>, <&blsp_dma 2>;
> > +                     dma-names =3D "rx", "tx";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_dma: dma@7884000 {
> > +                     compatible =3D "qcom,bam-v1.7.0";
> > +                     reg =3D <0x07884000 0x23000>;
> > +                     interrupts =3D <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "bam_clk";
> > +                     #dma-cells =3D <1>;
> > +                     qcom,ee =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi1: spi@78b5000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078b5000 0x500>;
> > +                     interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 5>, <&blsp_dma 4>;
> > +                     dma-names =3D "rx", "tx";
>
> tx/rx. Please rebase on recent linux-next and run `make dtbs_check` and
> fix all the errors.
>
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi1_default>;
> > +                     pinctrl-1 =3D <&spi1_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi2: spi@78b6000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078b6000 0x500>;
> > +                     interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 7>, <&blsp_dma 6>;
> > +                     dma-names =3D "rx", "tx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi2_default>;
> > +                     pinctrl-1 =3D <&spi2_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi3: spi@78b7000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078b7000 0x500>;
> > +                     interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 9>, <&blsp_dma 8>;
> > +                     dma-names =3D "rx", "tx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi3_default>;
> > +                     pinctrl-1 =3D <&spi3_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi4: spi@78b8000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078b8000 0x500>;
> > +                     interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 11>, <&blsp_dma 10>;
> > +                     dma-names =3D "rx", "tx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi4_default>;
> > +                     pinctrl-1 =3D <&spi4_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi5: spi@78b9000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078b9000 0x500>;
> > +                     interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP5_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 13>, <&blsp_dma 12>;
> > +                     dma-names =3D "rx", "tx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi5_default>;
> > +                     pinctrl-1 =3D <&spi5_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_spi6: spi@78ba000 {
> > +                     compatible =3D "qcom,spi-qup-v2.2.1";
> > +                     reg =3D <0x078ba000 0x500>;
> > +                     interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_QUP6_SPI_APPS_CLK>,
> > +                              <&gcc GCC_BLSP1_AHB_CLK>;
> > +                     clock-names =3D "core", "iface";
> > +                     dmas =3D <&blsp_dma 15>, <&blsp_dma 14>;
> > +                     dma-names =3D "rx", "tx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&spi6_default>;
> > +                     pinctrl-1 =3D <&spi6_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c1: i2c@78b5000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078b5000 0x500>;
> > +                     interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 4>, <&blsp_dma 5>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c1_default>;
> > +                     pinctrl-1 =3D <&i2c1_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c2: i2c@78b6000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078b6000 0x500>;
> > +                     interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 6>, <&blsp_dma 7>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c2_default>;
> > +                     pinctrl-1 =3D <&i2c2_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c3: i2c@78b7000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078b7000 0x500>;
> > +                     interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 8>, <&blsp_dma 9>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c3_default>;
> > +                     pinctrl-1 =3D <&i2c3_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c4: i2c@78b8000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078b8000 0x500>;
> > +                     interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 10>, <&blsp_dma 11>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c4_default>;
> > +                     pinctrl-1 =3D <&i2c4_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c5: i2c@78b9000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078b9000 0x500>;
> > +                     interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 12>, <&blsp_dma 13>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c5_default>;
> > +                     pinctrl-1 =3D <&i2c5_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             blsp_i2c6: i2c@78ba000 {
> > +                     compatible =3D "qcom,i2c-qup-v2.2.1";
> > +                     reg =3D <0x078ba000 0x500>;
> > +                     interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_BLSP1_AHB_CLK>,
> > +                              <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     dmas =3D <&blsp_dma 14>, <&blsp_dma 15>;
> > +                     dma-names =3D "tx", "rx";
> > +                     pinctrl-names =3D "default", "sleep";
> > +                     pinctrl-0 =3D <&i2c6_default>;
> > +                     pinctrl-1 =3D <&i2c6_sleep>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             lpass: lpass@7708000 {
> > +                     status =3D "disabled";
> > +                     compatible =3D "qcom,apq8016-lpass-cpu";
> > +                     clocks =3D <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_=
CLK>,
> > +                              <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
> > +                              <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
> > +                              <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
> > +                              <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> > +                              <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
> > +                              <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
> > +
> > +                     clock-names =3D "ahbix-clk",
> > +                                     "pcnoc-mport-clk",
> > +                                     "pcnoc-sway-clk",
> > +                                     "mi2s-bit-clk0",
> > +                                     "mi2s-bit-clk1",
> > +                                     "mi2s-bit-clk2",
> > +                                     "mi2s-bit-clk3";
> > +                     #sound-dai-cells =3D <1>;
> > +
> > +                     interrupts =3D <0 160 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "lpass-irq-lpaif";
> > +                     reg =3D <0x07708000 0x10000>;
> > +                     reg-names =3D "lpass-lpaif";
> > +
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             lpass_codec: codec{
>
> Missing space
>
> > +                     compatible =3D "qcom,msm8916-wcd-digital-codec";
> > +                     reg =3D <0x0771c000 0x400>;
> > +                     clocks =3D <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_=
CLK>,
> > +                              <&gcc GCC_CODEC_DIGCODEC_CLK>;
> > +                     clock-names =3D "ahbix-clk", "mclk";
> > +                     #sound-dai-cells =3D <1>;
> > +             };
> > +
> > +             sdhc_1: sdhci@7824000 {
> > +                     compatible =3D "qcom,sdhci-msm-v4";
> > +                     reg =3D <0x07824900 0x11c>, <0x07824000 0x800>;
> > +                     reg-names =3D "hc_mem", "core_mem";
> > +
> > +                     interrupts =3D <0 123 IRQ_TYPE_LEVEL_HIGH>, <0 13=
8 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "hc_irq", "pwr_irq";
> > +                     clocks =3D <&gcc GCC_SDCC1_APPS_CLK>,
> > +                              <&gcc GCC_SDCC1_AHB_CLK>,
> > +                              <&xo_board>;
> > +                     clock-names =3D "core", "iface", "xo";
> > +                     mmc-ddr-1_8v;
> > +                     bus-width =3D <8>;
> > +                     non-removable;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             sdhc_2: sdhci@7864000 {
> > +                     compatible =3D "qcom,sdhci-msm-v4";
> > +                     reg =3D <0x07864900 0x11c>, <0x07864000 0x800>;
> > +                     reg-names =3D "hc_mem", "core_mem";
> > +
> > +                     interrupts =3D <0 125 IRQ_TYPE_LEVEL_HIGH>, <0 22=
1 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "hc_irq", "pwr_irq";
> > +                     clocks =3D <&gcc GCC_SDCC2_APPS_CLK>,
> > +                              <&gcc GCC_SDCC2_AHB_CLK>,
> > +                              <&xo_board>;
> > +                     clock-names =3D "core", "iface", "xo";
> > +                     bus-width =3D <4>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             otg: usb@78d9000 {
> > +                     compatible =3D "qcom,ci-hdrc";
> > +                     reg =3D <0x78d9000 0x200>,
> > +                           <0x78d9200 0x200>;
> > +                     interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&gcc GCC_USB_HS_AHB_CLK>,
> > +                              <&gcc GCC_USB_HS_SYSTEM_CLK>;
> > +                     clock-names =3D "iface", "core";
> > +                     assigned-clocks =3D <&gcc GCC_USB_HS_SYSTEM_CLK>;
> > +                     assigned-clock-rates =3D <80000000>;
> > +                     resets =3D <&gcc GCC_USB_HS_BCR>;
> > +                     reset-names =3D "core";
> > +                     phy_type =3D "ulpi";
> > +                     dr_mode =3D "otg";
> > +                     ahb-burst-config =3D <0>;
> > +                     phy-names =3D "usb-phy";
> > +                     phys =3D <&usb_hs_phy>;
> > +                     status =3D "disabled";
> > +                     #reset-cells =3D <1>;
> > +
> > +                     ulpi {
> > +                             usb_hs_phy: phy {
> > +                                     compatible =3D "qcom,usb-hs-phy-m=
sm8916",
> > +                                                  "qcom,usb-hs-phy";
> > +                                     #phy-cells =3D <0>;
> > +                                     clocks =3D <&xo_board>, <&gcc GCC=
_USB2A_PHY_SLEEP_CLK>;
> > +                                     clock-names =3D "ref", "sleep";
> > +                                     resets =3D <&gcc GCC_USB2A_PHY_BC=
R>, <&otg 0>;
> > +                                     reset-names =3D "phy", "por";
> > +                                     qcom,init-seq =3D /bits/ 8 <0x0 0=
x44
> > +                                             0x1 0x6b 0x2 0x24 0x3 0x1=
3>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             intc: interrupt-controller@b000000 {
> > +                     compatible =3D "qcom,msm-qgic2";
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <3>;
> > +                     reg =3D <0x0b000000 0x1000>, <0x0b002000 0x1000>;
> > +             };
> > +
> > +             timer@b020000 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges;
> > +                     compatible =3D "arm,armv7-timer-mem";
> > +                     reg =3D <0xb020000 0x1000>;
> > +                     clock-frequency =3D <19200000>;
> > +
> > +                     frame@b021000 {
> > +                             frame-number =3D <0>;
> > +                             interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_=
HIGH>,
> > +                                          <GIC_SPI 7 IRQ_TYPE_LEVEL_HI=
GH>;
> > +                             reg =3D <0xb021000 0x1000>,
> > +                                   <0xb022000 0x1000>;
> > +                     };
> > +
> > +                     frame@b023000 {
> > +                             frame-number =3D <1>;
> > +                             interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_=
HIGH>;
> > +                             reg =3D <0xb023000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     frame@b024000 {
> > +                             frame-number =3D <2>;
> > +                             interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                             reg =3D <0xb024000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     frame@b025000 {
> > +                             frame-number =3D <3>;
> > +                             interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                             reg =3D <0xb025000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     frame@b026000 {
> > +                             frame-number =3D <4>;
> > +                             interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                             reg =3D <0xb026000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     frame@b027000 {
> > +                             frame-number =3D <5>;
> > +                             interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                             reg =3D <0xb027000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     frame@b028000 {
> > +                             frame-number =3D <6>;
> > +                             interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                             reg =3D <0xb028000 0x1000>;
> > +                             status =3D "disabled";
> > +                     };
> > +             };
> > +
> > +             spmi_bus: spmi@200f000 {
> > +                     compatible =3D "qcom,spmi-pmic-arb";
> > +                     reg =3D <0x200f000 0x001000>,
> > +                           <0x2400000 0x400000>,
> > +                           <0x2c00000 0x400000>,
> > +                           <0x3800000 0x200000>,
> > +                           <0x200a000 0x002100>;
> > +                     reg-names =3D "core", "chnls", "obsrvr", "intr", =
"cnfg";
> > +                     interrupt-names =3D "periph_irq";
> > +                     interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> > +                     qcom,ee =3D <0>;
> > +                     qcom,channel =3D <0>;
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <0>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <4>;
> > +             };
> > +
> > +             rng@22000 {
> > +                     compatible =3D "qcom,prng";
> > +                     reg =3D <0x00022000 0x200>;
> > +                     clocks =3D <&gcc GCC_PRNG_AHB_CLK>;
> > +                     clock-names =3D "core";
> > +             };
> > +
> > +             qfprom: qfprom@5c000 {
> > +                     compatible =3D "qcom,qfprom";
> > +                     reg =3D <0x5c000 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     tsens_caldata: caldata@a0 {
> > +                             reg =3D <0xa0 0x5c>;
> > +                     };
> > +             };
> > +
> > +             tsens: thermal-sensor@4a9000 {
> > +                     compatible =3D "qcom,msm8939-tsens";
> > +                     reg =3D <0x4a9000 0x1000>, /* TM */
> > +                           <0x4a8000 0x1000>; /* SROT */
> > +                     nvmem-cells =3D <&tsens_caldata>;
> > +                     nvmem-cell-names =3D "calib";
> > +                     interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "uplow";
> > +                     #thermal-sensor-cells =3D <1>;
> > +             };
> > +
> > +             apps_iommu: iommu@1ef0000 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     #iommu-cells =3D <1>;
>
> compatible, reg and ranges should be the first nodes. This applies
> everywehere.
>
> > +                     compatible =3D "qcom,msm8916-iommu", "qcom,msm-io=
mmu-v1";
> > +                     ranges =3D <0 0x1e20000 0x40000>;
> > +                     reg =3D <0x1ef0000 0x3000>;
> > +                     clocks =3D <&gcc GCC_SMMU_CFG_CLK>,
> > +                              <&gcc GCC_APSS_TCU_CLK>;
> > +                     clock-names =3D "iface", "bus";
> > +                     qcom,iommu-secure-id =3D <17>;
> > +
> > +                     /* mdp_0: */
> > +                     iommu-ctx@4000 {
> > +                             compatible =3D "qcom,msm-iommu-v1-ns";
> > +                             reg =3D <0x4000 0x1000>;
> > +                             interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                     };
> > +
> > +                     /* venus_ns: */
> > +                     iommu-ctx@5000 {
> > +                             compatible =3D "qcom,msm-iommu-v1-sec";
> > +                             reg =3D <0x5000 0x1000>;
> > +                             interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL=
_HIGH>;
> > +                     };
> > +             };
> > +
> > +             gpu_iommu: iommu@1f08000 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     #iommu-cells =3D <1>;
> > +                     compatible =3D "qcom,msm8916-iommu", "qcom,msm-io=
mmu-v1";
> > +                     ranges =3D <0 0x1f08000 0x10000>;
> > +                     clocks =3D <&gcc GCC_SMMU_CFG_CLK>,
> > +                              <&gcc GCC_GFX_TCU_CLK>,
> > +                              <&gcc GCC_GFX_TBU_CLK>;
> > +                     clock-names =3D "iface", "bus", "tlb";
> > +                     qcom,iommu-secure-id =3D <18>;
> > +
> > +                     /* gfx3d_user: */
> > +                     iommu-ctx@1000 {
> > +                             compatible =3D "qcom,msm-iommu-v1-ns";
> > +                             reg =3D <0x1000 0x1000>;
> > +                             interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                     };
> > +
> > +                     /* gfx3d_priv: */
> > +                     iommu-ctx@2000 {
> > +                             compatible =3D "qcom,msm-iommu-v1-ns";
> > +                             reg =3D <0x2000 0x1000>;
> > +                             interrupts =3D <GIC_SPI 242 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                     };
> > +             };
> > +
> > +             gpu@1c00000 {
> > +                     compatible =3D "qcom,adreno-405.0", "qcom,adreno"=
;
> > +                     reg =3D <0x01c00000 0x10000>;
> > +                     reg-names =3D "kgsl_3d0_reg_memory";
> > +                     interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "kgsl_3d0_irq";
> > +                     clock-names =3D
> > +                         "core",
> > +                         "iface",
> > +                         "mem",
> > +                         "mem_iface",
> > +                         "alt_mem_iface",
> > +                         "gfx3d",
> > +                         "rbbmtimer";
> > +                     clocks =3D
> > +                         <&gcc GCC_OXILI_GFX3D_CLK>,
> > +                         <&gcc GCC_OXILI_AHB_CLK>,
> > +                         <&gcc GCC_OXILI_GMEM_CLK>,
> > +                         <&gcc GCC_BIMC_GFX_CLK>,
> > +                         <&gcc GCC_BIMC_GPU_CLK>,
> > +                         <&gcc GFX3D_CLK_SRC>,
> > +                         <&gcc GCC_OXILI_TIMER_CLK>;
> > +                     power-domains =3D <&gcc OXILI_GDSC>;
> > +                     operating-points-v2 =3D <&gpu_opp_table>;
> > +                     iommus =3D <&gpu_iommu 1>, <&gpu_iommu 2>;
> > +             };
> > +
> > +             mdss: mdss@1a00000 {
> > +                     compatible =3D "qcom,mdss";
> > +                     reg =3D <0x1a00000 0x1000>,
> > +                           <0x1ac8000 0x3000>;
> > +                     reg-names =3D "mdss_phys", "vbif_phys";
> > +
> > +                     power-domains =3D <&gcc MDSS_GDSC>;
> > +
> > +                     clocks =3D <&gcc GCC_MDSS_AHB_CLK>,
> > +                              <&gcc GCC_MDSS_AXI_CLK>,
> > +                              <&gcc GCC_MDSS_VSYNC_CLK>;
> > +                     clock-names =3D "iface",
> > +                                   "bus",
> > +                                   "vsync";
> > +
> > +                     interrupts =3D <0 72 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <1>;
> > +
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges;
> > +
> > +                     mdp: mdp@1a01000 {
> > +                             compatible =3D "qcom,mdp5";
> > +                             reg =3D <0x1a01000 0x89000>;
> > +                             reg-names =3D "mdp_phys";
> > +
> > +                             interrupt-parent =3D <&mdss>;
> > +                             interrupts =3D <0 0>;
> > +
> > +                             clocks =3D <&gcc GCC_MDSS_AHB_CLK>,
> > +                                      <&gcc GCC_MDSS_AXI_CLK>,
> > +                                      <&gcc GCC_MDSS_MDP_CLK>,
> > +                                      <&gcc GCC_MDSS_VSYNC_CLK>,
> > +                                      <&gcc GCC_MDP_TBU_CLK>,
> > +                                      <&gcc GCC_MDP_RT_TBU_CLK>;
> > +                             clock-names =3D "iface",
> > +                                           "bus",
> > +                                           "core",
> > +                                           "vsync",
> > +                                           "tbu",
> > +                                           "tbu_rt";
> > +
> > +                             iommus =3D <&apps_iommu 4>;
> > +
> > +                             interconnects =3D <&snoc_mm MASTER_MDP_PO=
RT0 &bimc SLAVE_EBI_CH0>,
> > +                                             <&snoc_mm MASTER_MDP_PORT=
1 &bimc SLAVE_EBI_CH0>;
> > +                             interconnect-names =3D "mdp0-mem", "mdp1-=
mem";
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@0 {
> > +                                             reg =3D <0>;
> > +                                             mdp5_intf1_out: endpoint =
{
> > +                                                     remote-endpoint =
=3D <&dsi0_in>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +                                             mdp5_intf2_out: endpoint =
{
> > +                                                     remote-endpoint =
=3D <&dsi1_in>;
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0: dsi@1a98000 {
> > +                             compatible =3D "qcom,mdss-dsi-ctrl";
> > +                             reg =3D <0x1a98000 0x25c>;
> > +                             reg-names =3D "dsi_ctrl";
> > +
> > +                             interrupt-parent =3D <&mdss>;
> > +                             interrupts =3D <4 0>;
> > +
> > +                             assigned-clocks =3D <&gcc BYTE0_CLK_SRC>,
> > +                                               <&gcc PCLK0_CLK_SRC>;
> > +                             assigned-clock-parents =3D <&dsi0_phy 0>,
> > +                                                      <&dsi0_phy 1>;
> > +
> > +                             clocks =3D <&gcc GCC_MDSS_MDP_CLK>,
> > +                                      <&gcc GCC_MDSS_AHB_CLK>,
> > +                                      <&gcc GCC_MDSS_AXI_CLK>,
> > +                                      <&gcc GCC_MDSS_BYTE0_CLK>,
> > +                                      <&gcc GCC_MDSS_PCLK0_CLK>,
> > +                                      <&gcc GCC_MDSS_ESC0_CLK>;
> > +                             clock-names =3D "mdp_core",
> > +                                           "iface",
> > +                                           "bus",
> > +                                           "byte",
> > +                                           "pixel",
> > +                                           "core";
> > +                             phys =3D <&dsi0_phy>;
> > +                             phy-names =3D "dsi-phy";
> > +                             status =3D "disabled";
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@0 {
> > +                                             reg =3D <0>;
> > +                                             dsi0_in: endpoint {
> > +                                                     remote-endpoint =
=3D <&mdp5_intf1_out>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +                                             dsi0_out: endpoint {
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi1: dsi@1aa0000 {
> > +                             compatible =3D "qcom,mdss-dsi-ctrl";
> > +                             reg =3D <0x1aa0000 0x25c>;
> > +                             reg-names =3D "dsi_ctrl";
> > +
> > +                             interrupt-parent =3D <&mdss>;
> > +                             interrupts =3D <5 0>;
> > +
> > +                             assigned-clocks =3D <&gcc BYTE1_CLK_SRC>,
> > +                                               <&gcc PCLK1_CLK_SRC>;
> > +                             assigned-clock-parents =3D <&dsi1_phy 0>,
> > +                                                      <&dsi1_phy 1>;
> > +
> > +                             clocks =3D <&gcc GCC_MDSS_MDP_CLK>,
> > +                                      <&gcc GCC_MDSS_AHB_CLK>,
> > +                                      <&gcc GCC_MDSS_AXI_CLK>,
> > +                                      <&gcc GCC_MDSS_BYTE1_CLK>,
> > +                                      <&gcc GCC_MDSS_PCLK1_CLK>,
> > +                                      <&gcc GCC_MDSS_ESC1_CLK>;
> > +                             clock-names =3D "mdp_core",
> > +                                           "iface",
> > +                                           "bus",
> > +                                           "byte",
> > +                                           "pixel",
> > +                                           "core";
> > +                             phys =3D <&dsi1_phy>;
> > +                             phy-names =3D "dsi-phy";
> > +                             status =3D "disabled";
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@0 {
> > +                                             reg =3D <0>;
> > +                                             dsi1_in: endpoint {
> > +                                                     remote-endpoint =
=3D <&mdp5_intf2_out>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +                                             dsi1_out: endpoint {
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0_phy: dsi-phy@1a98300 {
>
> Generic node name, so just "phy"
>
> > +                             compatible =3D "qcom,dsi-phy-28nm-lp";
> > +                             reg =3D <0x1a98300 0xd4>,
> > +                                   <0x1a98500 0x280>,
> > +                                   <0x1a98780 0x30>;
> > +                             reg-names =3D "dsi_pll",
> > +                                         "dsi_phy",
> > +                                         "dsi_phy_regulator";
> > +
> > +                             #clock-cells =3D <1>;
> > +                             #phy-cells =3D <0>;
> > +
> > +                             clocks =3D <&gcc GCC_MDSS_AHB_CLK>;
> > +                             clock-names =3D "iface";
> > +                             qcom,dsi-phy-regulator-ldo-mode;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     dsi1_phy: dsi-phy@1aa0300 {
> > +                             compatible =3D "qcom,dsi-phy-28nm-lp";
> > +                             reg =3D <0x1aa0300 0xd4>,
> > +                                   <0x1aa0500 0x280>,
> > +                                   <0x1aa0780 0x30>;
> > +                             reg-names =3D "dsi_pll",
> > +                                         "dsi_phy",
> > +                                         "dsi_phy_regulator";
> > +
> > +                             #clock-cells =3D <1>;
> > +                             #phy-cells =3D <0>;
> > +
> > +                             clocks =3D <&gcc GCC_MDSS_AHB_CLK>;
> > +                             clock-names =3D "iface";
> > +                             qcom,dsi-phy-regulator-ldo-mode;
> > +                             status =3D "disabled";
> > +                     };
> > +             };
> > +
> > +             hexagon@4080000 {
> > +                     compatible =3D "qcom,q6v5-pil";
> > +                     reg =3D <0x04080000 0x100>,
> > +                           <0x04020000 0x040>;
> > +
> > +                     reg-names =3D "qdsp6", "rmb";
> > +
> > +                     interrupts-extended =3D <&intc 0 24 1>,
> > +                                           <&hexagon_smp2p_in 0 0>,
> > +                                           <&hexagon_smp2p_in 1 0>,
> > +                                           <&hexagon_smp2p_in 2 0>,
> > +                                           <&hexagon_smp2p_in 3 0>;
> > +                     interrupt-names =3D "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack";
> > +
> > +                     clocks =3D <&gcc GCC_MSS_CFG_AHB_CLK>,
> > +                              <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > +                              <&xo_board>;
> > +                     clock-names =3D "iface", "bus", "mem", "xo";
> > +
> > +                     qcom,smem-states =3D <&hexagon_smp2p_out 0>;
> > +                     qcom,smem-state-names =3D "stop";
> > +
> > +                     resets =3D <&scm 0>;
> > +                     reset-names =3D "mss_restart";
> > +
> > +                     power-domains =3D <&rpmpd MSM8939_VDDMDCX_AO>,
> > +                                     <&rpmpd MSM8939_VDDMX>;
> > +                     power-domain-names =3D "cx", "mx";
> > +                     pll-supply =3D <&pm8916_l7>;
> > +
> > +                     qcom,halt-regs =3D <&tcsr 0x18000 0x19000 0x1a000=
>;
> > +
> > +                     status =3D "disabled";
> > +
> > +                     mba {
> > +                             memory-region =3D <&mba_mem>;
> > +                     };
> > +
> > +                     mpss {
> > +                             memory-region =3D <&mpss_mem>;
> > +                     };
> > +
> > +                     smd-edge {
> > +                             interrupts =3D <0 25 IRQ_TYPE_EDGE_RISING=
>;
> > +
> > +                             qcom,smd-edge =3D <0>;
> > +                             mboxes =3D <&apcs1_mbox 12>;
> > +                             qcom,remote-pid =3D <1>;
> > +
> > +                             label =3D "hexagon";
> > +                     };
> > +             };
> > +
> > +             pronto: wcnss@a204000 {
> > +                     compatible =3D "qcom,pronto-v2-pil", "qcom,pronto=
";
> > +                     reg =3D <0x0a204000 0x2000>, <0x0a202000 0x1000>,=
 <0x0a21b000 0x3000>;
> > +                     reg-names =3D "ccu", "dxe", "pmu";
> > +
> > +                     memory-region =3D <&wcnss_mem>;
> > +
> > +                     interrupts-extended =3D <&intc 0 149 IRQ_TYPE_EDG=
E_RISING>,
> > +                                           <&wcnss_smp2p_in 0 IRQ_TYPE=
_EDGE_RISING>,
> > +                                           <&wcnss_smp2p_in 1 IRQ_TYPE=
_EDGE_RISING>,
> > +                                           <&wcnss_smp2p_in 2 IRQ_TYPE=
_EDGE_RISING>,
> > +                                           <&wcnss_smp2p_in 3 IRQ_TYPE=
_EDGE_RISING>;
> > +                     interrupt-names =3D "wdog", "fatal", "ready", "ha=
ndover", "stop-ack";
> > +
> > +                     power-domains =3D <&rpmpd MSM8939_VDDCX>,
> > +                                     <&rpmpd MSM8939_VDDMX_AO>;
> > +                     power-domain-names =3D "cx", "mx";
> > +                     vddpx-supply =3D <&pm8916_l7>;
> > +
> > +                     qcom,state =3D <&wcnss_smp2p_out 0>;
> > +                     qcom,state-names =3D "stop";
> > +
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&wcnss_pin_a>;
> > +
> > +                     status =3D "disabled";
> > +
> > +                     iris {
> > +                             compatible =3D "qcom,wcn3660";
> > +
> > +                             clocks =3D <&rpmcc RPM_SMD_RF_CLK2>;
> > +                             clock-names =3D "xo";
> > +
> > +                             vddxo-supply =3D <&pm8916_l7>;
> > +                             vddrfa-supply =3D <&pm8916_s3>;
> > +                             vddpa-supply =3D <&pm8916_l9>;
> > +                             vdddig-supply =3D <&pm8916_l5>;
> > +                     };
> > +
> > +                     smd-edge {
> > +                             interrupts =3D <0 142 1>;
> > +
> > +                             qcom,ipc =3D <&apcs1 8 17>;
> > +                             qcom,smd-edge =3D <6>;
> > +                             qcom,remote-pid =3D <4>;
> > +
> > +                             label =3D "pronto";
> > +
> > +                             wcnss {
> > +                                     compatible =3D "qcom,wcnss";
> > +                                     qcom,smd-channels =3D "WCNSS_CTRL=
";
> > +
> > +                                     qcom,mmio =3D <&pronto>;
> > +
> > +                                     bt {
> > +                                             compatible =3D "qcom,wcns=
s-bt";
> > +                                     };
> > +
> > +                                     wifi {
> > +                                             compatible =3D "qcom,wcns=
s-wlan";
> > +
> > +                                             interrupts =3D <0 145 IRQ=
_TYPE_LEVEL_HIGH>,
> > +                                                          <0 146 IRQ_T=
YPE_LEVEL_HIGH>;
> > +                                             interrupt-names =3D "tx",=
 "rx";
> > +
> > +                                             qcom,smem-states =3D <&ap=
ps_smsm 10>,
> > +                                                                <&apps=
_smsm 9>;
> > +                                             qcom,smem-state-names =3D=
 "tx-enable",
> > +                                                                     "=
tx-rings-empty";
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             venus: video-codec@1d00000 {
> > +                     compatible =3D "qcom,msm8916-venus";
> > +                     reg =3D <0x01d00000 0xff000>;
> > +                     interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +                     power-domains =3D <&gcc VENUS_GDSC>;
> > +                     clocks =3D <&gcc GCC_VENUS0_VCODEC0_CLK>,
> > +                              <&gcc GCC_VENUS0_AHB_CLK>,
> > +                              <&gcc GCC_VENUS0_AXI_CLK>;
> > +                     clock-names =3D "core", "iface", "bus";
> > +                     iommus =3D <&apps_iommu 5>;
> > +                     memory-region =3D <&venus_mem>;
> > +                     status =3D "okay";
> > +
> > +                     video-decoder {
> > +                             compatible =3D "venus-decoder";
> > +                     };
> > +
> > +                     video-encoder {
> > +                             compatible =3D "venus-encoder";
> > +                     };
> > +             };
> > +
> > +             bimc: interconnect@400000 {
> > +                     compatible =3D "qcom,msm8939-bimc";
> > +                     #interconnect-cells =3D <1>;
> > +                     reg =3D <0x400000 0x62000>;
> > +                     clock-names =3D "bus", "bus_a";
> > +                     clocks =3D <&rpmcc RPM_SMD_BIMC_CLK>,
> > +                              <&rpmcc RPM_SMD_BIMC_A_CLK>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             pcnoc: interconnect@500000 {
> > +                     compatible =3D "qcom,msm8939-pcnoc";
> > +                     #interconnect-cells =3D <1>;
> > +                     reg =3D <0x500000 0x11000>;
> > +                     clock-names =3D "bus", "bus_a";
> > +                     clocks =3D <&rpmcc RPM_SMD_PCNOC_CLK>,
> > +                              <&rpmcc RPM_SMD_PCNOC_A_CLK>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             snoc: interconnect@580000 {
> > +                     compatible =3D "qcom,msm8939-snoc";
> > +                     #interconnect-cells =3D <1>;
> > +                     reg =3D <0x580000 0x14080>;
> > +                     clock-names =3D "bus", "bus_a";
> > +                     clocks =3D <&rpmcc RPM_SMD_SNOC_CLK>,
> > +                              <&rpmcc RPM_SMD_SNOC_A_CLK>;
> > +                     status =3D "okay";
> > +
> > +                     snoc_mm: interconnect-snoc-mm {
> > +                             compatible =3D "qcom,msm8939-snoc-mm";
> > +                             #interconnect-cells =3D <1>;
> > +                             clock-names =3D "bus", "bus_a";
> > +                             clocks =3D <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
> > +                                      <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
> > +                             status =3D "okay";
> > +                     };
> > +
> > +             };
> > +     };
> > +
> > +     smd {
> > +             compatible =3D "qcom,smd";
> > +
> > +             rpm {
> > +                     interrupts =3D <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>=
;
> > +                     qcom,ipc =3D <&apcs1 8 0>;
> > +                     qcom,smd-edge =3D <15>;
> > +
> > +                     rpm_requests: rpm_requests {
>
> No underscores.
>
> > +                             compatible =3D "qcom,rpm-msm8936";
> > +                             qcom,smd-channels =3D "rpm_requests";
> > +
> > +                             rpmcc: qcom,rpmcc {
> > +                                     compatible =3D "qcom,rpmcc-msm893=
6";
> > +                                     #clock-cells =3D <1>;
> > +                             };
> > +
> > +                             rpmpd: power-controller {
> > +                                     compatible =3D "qcom,msm8939-rpmp=
d";
> > +                                     #power-domain-cells =3D <1>;
> > +                                     operating-points-v2 =3D <&rpmpd_o=
pp_table>;
> > +
> > +                                     rpmpd_opp_table: opp-table {
> > +                                             compatible =3D "operating=
-points-v2";
> > +
> > +                                             rpmpd_opp_ret: opp1 {
> > +                                                     opp-level =3D <1>=
;
> > +                                             };
> > +
> > +                                             rpmpd_opp_svs_krait: opp2=
 {
> > +                                                     opp-level =3D <2>=
;
> > +                                             };
> > +
> > +                                             rpmpd_opp_svs_soc: opp3 {
> > +                                                     opp-level =3D <3>=
;
> > +                                             };
> > +
> > +                                             rpmpd_opp_nom: opp4 {
> > +                                                     opp-level =3D <4>=
;
> > +                                             };
> > +
> > +                                             rpmpd_opp_turbo: opp5 {
> > +                                                     opp-level =3D <5>=
;
> > +                                             };
> > +
> > +                                             rpmpd_opp_super_turbo: op=
p6 {
> > +                                                     opp-level =3D <6>=
;
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     hexagon-smp2p {
> > +             compatible =3D "qcom,smp2p";
> > +             qcom,smem =3D <435>, <428>;
> > +
> > +             interrupts =3D <0 27 IRQ_TYPE_EDGE_RISING>;
> > +
> > +             mboxes =3D <&apcs1_mbox 14>;
> > +
> > +             qcom,local-pid =3D <0>;
> > +             qcom,remote-pid =3D <1>;
> > +
> > +             hexagon_smp2p_out: master-kernel {
> > +                     qcom,entry-name =3D "master-kernel";
> > +
> > +                     #qcom,smem-state-cells =3D <1>;
> > +             };
> > +
> > +             hexagon_smp2p_in: slave-kernel {
> > +                     qcom,entry-name =3D "slave-kernel";
> > +
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +             };
> > +     };
> > +
> > +     wcnss-smp2p {
> > +             compatible =3D "qcom,smp2p";
> > +             qcom,smem =3D <451>, <431>;
> > +
> > +             interrupts =3D <0 143 IRQ_TYPE_EDGE_RISING>;
>
> Isn't this some GIC interrupt? If so, then use flags for PPI and SPI
> interrupts.
>
>
> Best regards,
> Krzysztof
