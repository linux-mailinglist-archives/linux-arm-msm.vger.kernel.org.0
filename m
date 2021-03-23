Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56200345818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 08:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWHCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 03:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhCWHBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 03:01:42 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FA7C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 00:01:41 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id n11so10737221pgm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 00:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fKnECfkV+SG90cvN0DOvRc0qoLw7OOrrpIiUr3W81zg=;
        b=SCZVM46+SoWCELmYc4l9vtMe4ZSBI6fIZdXAQfVwM2Le4DLRaw/CbL7jgIv/iV+D96
         ax1GjjUATepTB/S+NmJTGe9cdKV5i8lNpB+/veymz4oOAPTneQ4Oyrn3ZyScwyiUW64/
         hFSfHK8s/CU8AtuLgX8RWnpLnWDlaFGkOXAOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fKnECfkV+SG90cvN0DOvRc0qoLw7OOrrpIiUr3W81zg=;
        b=ZoIlks46Xigpj1XrwF9H5a8A9RxGvIu3YfyaoaFQ+++lNHsk/xgI9UnsrDvPQ9FDZA
         x7bV8T9L4qo4657Ru51cIFGEtLN0hm9ni+0UgJZqIq+Bd2mB//9/SaOhdR12280+ZYJ3
         vOpGOauyh8O3kPMoylFtOujysUOGBPCtg7UuZf3G2LwRGSQ/PUGpdJyZfOJaL9xFluRf
         cIanEkTzLMPszcdW9uvY1RmWYVNtAH94RY6tXjqjNkaA8bvqyyLTNf9A/pDYN6Q97xHL
         /uQRf0gTe0O+dWHg78iRqtYIu0J3vtnjABfdKSy6dd+K1h0HPdHClXNoTEtaGWmXoIxa
         DpbQ==
X-Gm-Message-State: AOAM530dTB585xi1IeVNwzwJCzmCYbqUJyl3dYcmJsdi8HAtl2HjpsuS
        /BWZjvI0OU9Zat9kJnFM8UBrqA==
X-Google-Smtp-Source: ABdhPJy2qDd9Se7BqIP+wL4emg4fHBvfz5kk2mpVmnYx7YsGoVef1eXEKdkl0Xl1rquhxYQYl2oavw==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id x4-20020a170902ec84b02900e5bd054a98mr4020274plg.76.1616482901435;
        Tue, 23 Mar 2021 00:01:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id l10sm14927941pfc.125.2021.03.23.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:01:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, robh+dt@kernel.org, ulf.hansson@linaro.org
Date:   Tue, 23 Mar 2021 00:01:39 -0700
Message-ID: <161648289959.3012082.11356063123403968180@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shaik Sajida Bhanu (2021-03-20 11:17:00)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7280-idp.dts
> index 54d2cb3..4105263 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
> =20
>  #include "sc7280.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

Please include this before sc7280.dtsi

> =20
>  / {
>         model =3D "Qualcomm Technologies, Inc. sc7280 IDP platform";
> @@ -242,6 +243,30 @@
>         status =3D "okay";
>  };
> =20
> +&sdhc_1 {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default", "sleep";
> +       pinctrl-0 =3D <&sdc1_on>;
> +       pinctrl-1 =3D <&sdc1_off>;
> +
> +       vmmc-supply =3D <&vreg_l7b_2p9>;
> +       vqmmc-supply =3D <&vreg_l19b_1p8>;
> +};
> +
> +&sdhc_2 {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default","sleep";

Please add a space after the comma ^

> +       pinctrl-0 =3D <&sdc2_on>;
> +       pinctrl-1 =3D <&sdc2_off>;
> +
> +       vmmc-supply =3D <&vreg_l9c_2p9>;
> +       vqmmc-supply =3D <&vreg_l6c_2p9>;
> +
> +       cd-gpios =3D <&tlmm 91 GPIO_ACTIVE_LOW>;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> =20
>  &qup_uart5_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 8f6b569..69eb064 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -20,6 +20,11 @@
> =20
>         chosen { };
> =20
> +       aliases {
> +               mmc1 =3D &sdhc_1;
> +               mmc2 =3D &sdhc_2;
> +       };
> +
>         clocks {
>                 xo_board: xo-board {
>                         compatible =3D "fixed-clock";
> @@ -305,6 +310,64 @@
>                         #power-domain-cells =3D <1>;
>                 };
> =20
> +               sdhc_1: sdhci@7c4000 {
> +                       compatible =3D "qcom,sdhci-msm-v5";
> +                       reg =3D <0 0x7c4000 0 0x1000>,

Please add leading zeroes to the physical address, i.e. 0x007c4000

> +                                       <0 0x7c5000 0 0x1000>;
> +                       reg-names =3D "hc", "cqhci";
> +
> +                       iommus =3D <&apps_smmu 0xC0 0x0>;

Lowercase hex please.

> +                       interrupts =3D <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "hc_irq", "pwr_irq";
> +
> +                       clocks =3D <&gcc GCC_SDCC1_APPS_CLK>,
> +                                       <&gcc GCC_SDCC1_AHB_CLK>,
> +                                       <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names =3D "core", "iface", "xo";
> +                       interconnects =3D <&aggre1_noc MASTER_SDCC_1 0 &m=
c_virt SLAVE_EBI1 0>,
> +                                       <&gem_noc MASTER_APPSS_PROC 0 &cn=
oc2 SLAVE_SDCC_1 0>;
> +                       interconnect-names =3D "sdhc-ddr","cpu-sdhc";
> +                       power-domains =3D <&rpmhpd SC7280_CX>;
> +                       operating-points-v2 =3D <&sdhc1_opp_table>;
> +
> +                       bus-width =3D <8>;
> +                       non-removable;
> +                       supports-cqe;
> +                       no-sd;
> +                       no-sdio;
> +
> +                       max-frequency =3D <192000000>;

Is this necessary?

> +
> +                       qcom,dll-config =3D <0x0007642c>;
> +                       qcom,ddr-config =3D <0x80040868>;
> +
> +                       mmc-ddr-1_8v;
> +                       mmc-hs200-1_8v;
> +                       mmc-hs400-1_8v;
> +                       mmc-hs400-enhanced-strobe;
> +
> +                       status =3D "disabled";

Can this be near the compatible string?

> +
> +                       sdhc1_opp_table: sdhc1-opp-table {
> +                               compatible =3D "operating-points-v2";
> +
> +                               opp-100000000 {
> +                                       opp-hz =3D /bits/ 64 <100000000>;
> +                                       required-opps =3D <&rpmhpd_opp_lo=
w_svs>;
> +                                       opp-peak-kBps =3D <1200000 76000>;
> +                                       opp-avg-kBps =3D <1200000 50000>;
> +                               };
> +
> +                               opp-384000000 {
> +                                       opp-hz =3D /bits/ 64 <384000000>;
> +                                       required-opps =3D <&rpmhpd_opp_no=
m>;
> +                                       opp-peak-kBps =3D <5400000 160000=
0>;
> +                                       opp-avg-kBps =3D <6000000 300000>;
> +                               };
> +                       };
> +               };
> +
>                 qupv3_id_0: geniqup@9c0000 {
>                         compatible =3D "qcom,geni-se-qup";
>                         reg =3D <0 0x009c0000 0 0x2000>;
> @@ -328,6 +391,54 @@
>                         };
>                 };
> =20
> +               sdhc_2: sdhci@8804000 {
> +                       compatible =3D "qcom,sdhci-msm-v5";
> +                       reg =3D <0 0x08804000 0 0x1000>;

This has leading zeroes, great!

> +
> +                       iommus =3D <&apps_smmu 0x100 0x0>;
> +                       interrupts =3D <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "hc_irq", "pwr_irq";
> +
> +                       clocks =3D <&gcc GCC_SDCC2_APPS_CLK>,
> +                                       <&gcc GCC_SDCC2_AHB_CLK>,
> +                                       <&rpmhcc RPMH_CXO_CLK>;

Is this aligned properly?

> +                       clock-names =3D "core", "iface", "xo";
> +                       interconnects =3D <&aggre1_noc MASTER_SDCC_2 0 &m=
c_virt SLAVE_EBI1 0>,
> +                                       <&gem_noc MASTER_APPSS_PROC 0 &cn=
oc2 SLAVE_SDCC_2 0>;
> +                       interconnect-names =3D "sdhc-ddr","cpu-sdhc";
> +                       power-domains =3D <&rpmhpd SC7280_CX>;
> +                       operating-points-v2 =3D <&sdhc2_opp_table>;
> +
> +                       bus-width =3D <4>;
> +
> +                       no-mmc;
> +                       no-sdio;
> +
> +                       max-frequency =3D <202000000>;

Is this necessary?

> +
> +                       qcom,dll-config =3D <0x0007642c>;
> +
> +                       status =3D "disabled";

Move up near compatible?

> +
> +                       sdhc2_opp_table: sdhc2-opp-table {
> +                                       compatible =3D "operating-points-=
v2";
> +
> +                                       opp-100000000 {
> +                                               opp-hz =3D/bits/ 64 <1000=
00000>;
> +                                               required-opps =3D <&rpmhp=
d_opp_low_svs>;
> +                                               opp-peak-kBps =3D <120000=
0 76000>;
> +                                               opp-avg-kBps =3D <1200000=
 50000>;
> +                                       };
> +                                       opp-202000000 {
> +                                               opp-hz =3D /bits/ 64 <202=
000000>;
> +                                               required-opps =3D <&rpmhp=
d_opp_nom>;
> +                                               opp-peak-kBps =3D <350000=
0 1200000>;
> +                                               opp-avg-kBps =3D <5000000=
 100000>;
> +                                       };
> +                               };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible =3D "qcom,sc7280-pdc", "qcom,pdc";
>                         reg =3D <0 0x0b220000 0 0x30000>;
