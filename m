Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF0CF17247C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 18:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgB0RFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 12:05:47 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40538 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgB0RFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 12:05:46 -0500
Received: by mail-io1-f68.google.com with SMTP id x1so227455iop.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 09:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pfg0bi+sFcPndADzUkLpjWKHkAlDvMR2dE5gD9tiHQM=;
        b=i2eDaNp+Eszd+9W1ID672YkO3fMeyDiOws+pb7XKxfMz5/yaw2FJlsK8ei3fzatqtm
         4L4L7cX2nCCqrouDM937z8zRqFPgESFhKdDeV6fhKQP9r7zk3tvNVPASH7pru1WgOIdN
         IpJHyporpGJkLSz8AiughI2xAz39cGKiwta1enlQuvMg3Ng+bXTrtfJyDBWfa4q6HcJ4
         DCwXnwY+6D+O1HBkAXYakyCs1xZcWV8Qde4g0fAx+EJlRG90lTvtVlbsOcJWsGxVJfdC
         ZNiecRyC4kXEVjvyFOZc7zkOGg5RxGkXljkHNPhkH82u7BcLJAK3OY3ITZiW4k70Qolu
         GSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pfg0bi+sFcPndADzUkLpjWKHkAlDvMR2dE5gD9tiHQM=;
        b=hyt9LcFCOaR8e0SLmFrWXeRnqxkcJgfHeAtYgOfR6DGUfu5+CPVoliyeVvdCbm81cT
         yJwSEvNzfpZeiXbEwN/M/CTR+vUn0w+kzGknQHNRzdo8j3pn90zSdaYm2GQ+Yr2IF1FW
         jPogyeoAkJb4diKrHDFaKx6y2jmmqf+Q3EXgHchBDpl+Fq8QpxLnmMD4YsUpEIsCQG+9
         Bxwdtwv7hDhNP/H7Yht6PDyGtFFSNnqQPUD4nJGTkVqgO9bkfiuYzdjyIQvpIlgqvmLx
         5+ykdOkgGGGbY3RCCdhU8+DPVRKn+Y7Un/AgXHXJrZxPgxQ3VsvMldBegI5RzE4WNYoU
         5SHw==
X-Gm-Message-State: APjAAAUC19S6rhDE3LQSBeIIKoA5pS6tl5Tu3tZ35bzGDIiMAZNUdJ8T
        H16sDN1pd0asrXTRQ35jht7IObogZPxRXn788wjeAg==
X-Google-Smtp-Source: APXvYqzShgva7+6pxk0ORMXPxyHT6xrvSZzjtnV0ZVz1cO3EyYEvWyhXwYyjFkEdjhqv39UnsG98JlbbBdnLillQiHw=
X-Received: by 2002:a5e:d616:: with SMTP id w22mr213500iom.57.1582823145050;
 Thu, 27 Feb 2020 09:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20200225234611.11067-1-mike.leach@linaro.org> <20200225234611.11067-12-mike.leach@linaro.org>
In-Reply-To: <20200225234611.11067-12-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 27 Feb 2020 10:05:34 -0700
Message-ID: <CANLsYkw81si3_cAA1QQWCTGLYS22AMnZGUh9uNgfuK6GXSTKtg@mail.gmail.com>
Subject: Re: [PATCH v10 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree
To:     Mike Leach <mike.leach@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, maxime@cerno.tech,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>, Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Feb 2020 at 16:46, Mike Leach <mike.leach@linaro.org> wrote:
>
> Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Sudeep, please consider adding to your next tree.

Thanks,
Mathieu

> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi    | 162 +++++++++++++++++++++-
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  37 ++++-
>  arch/arm64/boot/dts/arm/juno-r1.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno-r2.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno.dts          |  25 ++++
>  5 files changed, 269 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 1f3c80aafbd7..fffd75cd2fd9 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -119,7 +119,7 @@
>          * The actual size is just 4K though 64K is reserved. Access to the
>          * unmapped reserved region results in a DECERR response.
>          */
> -       etf@20010000 { /* etf0 */
> +       etf_sys0: etf@20010000 { /* etf0 */
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20010000 0 0x1000>;
>
> @@ -143,7 +143,7 @@
>                 };
>         };
>
> -       tpiu@20030000 {
> +       tpiu_sys: tpiu@20030000 {
>                 compatible = "arm,coresight-tpiu", "arm,primecell";
>                 reg = <0 0x20030000 0 0x1000>;
>
> @@ -196,7 +196,7 @@
>                 };
>         };
>
> -       etr@20070000 {
> +       etr_sys: etr@20070000 {
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20070000 0 0x1000>;
>                 iommus = <&smmu_etr 0>;
> @@ -214,7 +214,7 @@
>                 };
>         };
>
> -       stm@20100000 {
> +       stm_sys: stm@20100000 {
>                 compatible = "arm,coresight-stm", "arm,primecell";
>                 reg = <0 0x20100000 0 0x1000>,
>                       <0 0x28000000 0 0x1000000>;
> @@ -291,6 +291,18 @@
>                 };
>         };
>
> +       cti0: cti@22020000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x22020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm0>;
> +       };
> +
>         funnel@220c0000 { /* cluster0 funnel */
>                 compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                 reg = <0 0x220c0000 0 0x1000>;
> @@ -351,6 +363,18 @@
>                 };
>         };
>
> +       cti1: cti@22120000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x22120000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm1>;
> +       };
> +
>         cpu_debug2: cpu-debug@23010000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23010000 0x0 0x1000>;
> @@ -376,6 +400,18 @@
>                 };
>         };
>
> +       cti2: cti@23020000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm2>;
> +       };
> +
>         funnel@230c0000 { /* cluster1 funnel */
>                 compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                 reg = <0 0x230c0000 0 0x1000>;
> @@ -448,6 +484,18 @@
>                 };
>         };
>
> +       cti3: cti@23120000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23120000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm3>;
> +       };
> +
>         cpu_debug4: cpu-debug@23210000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23210000 0x0 0x1000>;
> @@ -473,6 +521,18 @@
>                 };
>         };
>
> +       cti4: cti@23220000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23220000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm4>;
> +       };
> +
>         cpu_debug5: cpu-debug@23310000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23310000 0x0 0x1000>;
> @@ -498,6 +558,100 @@
>                 };
>         };
>
> +       cti5: cti@23320000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23320000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm5>;
> +       };
> +
> +       cti@20020000 { /* sys_cti_0 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               trig-conns@0 {
> +                       reg = <0>;
> +                       arm,trig-in-sigs=<2 3>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<0 1>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etr_sys>;
> +               };
> +
> +               trig-conns@1 {
> +                       reg = <1>;
> +                       arm,trig-in-sigs=<0 1>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<7 6>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etf_sys0>;
> +               };
> +
> +               trig-conns@2 {
> +                       reg = <2>;
> +                       arm,trig-in-sigs=<4 5 6 7>;
> +                       arm,trig-in-types=<STM_TOUT_SPTE STM_TOUT_SW
> +                                          STM_TOUT_HETE STM_ASYNCOUT>;
> +                       arm,trig-out-sigs=<4 5>;
> +                       arm,trig-out-types=<STM_HWEVENT STM_HWEVENT>;
> +                       arm,cs-dev-assoc = <&stm_sys>;
> +               };
> +
> +               trig-conns@3 {
> +                       reg = <3>;
> +                       arm,trig-out-sigs=<2 3>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&tpiu_sys>;
> +               };
> +       };
> +
> +       cti@20110000 { /* sys_cti_1 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20110000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               trig-conns@0 {
> +                       reg = <0>;
> +                       arm,trig-in-sigs=<0>;
> +                       arm,trig-in-types=<GEN_INTREQ>;
> +                       arm,trig-out-sigs=<0>;
> +                       arm,trig-out-types=<GEN_HALTREQ>;
> +                       arm,trig-conn-name = "sys_profiler";
> +               };
> +
> +               trig-conns@1 {
> +                       reg = <1>;
> +                       arm,trig-out-sigs=<2 3>;
> +                       arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +                       arm,trig-conn-name = "watchdog";
> +               };
> +
> +               trig-conns@2 {
> +                       reg = <2>;
> +                       arm,trig-out-sigs=<1 6>;
> +                       arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +                       arm,trig-conn-name = "g_counter";
> +               };
> +       };
> +
>         gpu: gpu@2d000000 {
>                 compatible = "arm,juno-mali", "arm,mali-t624";
>                 reg = <0 0x2d000000 0 0x10000>;
> diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> index eda3d9e18af6..752b05f8bf31 100644
> --- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> @@ -23,7 +23,7 @@
>                 };
>         };
>
> -       etf@20140000 { /* etf1 */
> +       etf_sys1: etf@20140000 { /* etf1 */
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20140000 0 0x1000>;
>
> @@ -82,4 +82,39 @@
>
>                 };
>         };
> +
> +       cti@20160000 { /* sys_cti_2 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20160000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               trig-conns@0 {
> +                       reg = <0>;
> +                       arm,trig-in-sigs=<0 1>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<0 1>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etf_sys1>;
> +               };
> +
> +               trig-conns@1 {
> +                       reg = <1>;
> +                       arm,trig-in-sigs=<2 3 4>;
> +                       arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +                       arm,trig-conn-name = "ela_clus_0";
> +               };
> +
> +               trig-conns@2 {
> +                       reg = <2>;
> +                       arm,trig-in-sigs=<5 6 7>;
> +                       arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +                       arm,trig-conn-name = "ela_clus_1";
> +               };
> +       };
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> index 5f290090b0cf..02aa51eb311d 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>
> @@ -309,3 +310,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> index 305300dd521c..75bb27c2d4dc 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>
> @@ -315,3 +316,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A72_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A72_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index f00cffbd032c..dbc22e70b62c 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>
>  / {
> @@ -295,3 +296,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};
> --
> 2.17.1
>
