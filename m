Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1637BC2963
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 00:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbfI3WU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Sep 2019 18:20:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42985 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfI3WU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Sep 2019 18:20:28 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so42538771iod.9;
        Mon, 30 Sep 2019 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZx7FrxWnk9gZ+ux4zZK+PaCVpHhMuAm8pC5a4sXjxE=;
        b=BKXc0564vtSldNkfJz18QSdtma0oJcBNDLeux0zcrflLIl5rLL22s/mVj/xfu7RkYr
         Cpz4G5OoYu7qySxW/j0ZeZi+lMXVHHpwSnuKCoAguZt+fDkD5cs1f8BYqflWdryQsSjx
         zqy1FON+ZpzmeuPPEInX0xM5V5FOa21naL5jhesnZJT6nmbq4BykPd4xj8cBhApj28Hm
         9jMoepXtx1khl6h2WVy8qgQ+S5bi6reSLqiMUs9KZDchXT2mU5MJ0k7rvntO0ddR4gv8
         Vv5IaJM9PTaULVBsMhxFlGnOTiJP8zpHSRITVaPsEUW3fC8pEi3ukViHVBvZ5s85MS+x
         GbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZx7FrxWnk9gZ+ux4zZK+PaCVpHhMuAm8pC5a4sXjxE=;
        b=AeuRq/ZTR47fR+uX1qX+Q8HbyQ2ftr5dkM386OSG2xW7TzkGDTcc8tpSg98g/Munlm
         i/EkouxDZGnMDbPDZftRR9VAFFzXSQvz8imuEC4Rm2RWzRbZZirM32JKN3DOz7GD0WZF
         6pOw62zPPnJt6B0UHptviyMeS5UT5rGY73s74cw3h8V0j9TlDFgQ+SrgXYn1sDsx+tJN
         wbMotEThqri3ZdJ7SAT26fiZxtLMd17sLz6a6YPskFJcMSU8P+N8IdUJI1sVRdMNSrwf
         Dqgm+Tr2RovALVQkI15QeH9VqLVnlYexhe4pENSY6ds/d28DFAGAa8dHjq8MGErRQzx5
         2RVQ==
X-Gm-Message-State: APjAAAXcPihmYri48UZl0ezuP37mD57D6GHadj7gdUVM18bzmp39kh+b
        I9lxyghIvm5lhVJtm8jOjaTSBZ6QkB9cGc7TRpc=
X-Google-Smtp-Source: APXvYqxULtiRa/HTx9aPpOZT9V8yRuI/FyY4SP5XWd9VZ82JtRdYlIdKOqHYkC+5+ReMhF372RQ/yCwoLHTlSv8B3tU=
X-Received: by 2002:a92:5e1b:: with SMTP id s27mr22666872ilb.178.1569882026899;
 Mon, 30 Sep 2019 15:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558430617.git.amit.kucheria@linaro.org> <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 30 Sep 2019 16:20:15 -0600
Message-ID: <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sibi Sankar <sibis@codeaurora.org>, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Amit, the merged version of the below change causes a boot failure
(nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
enough, it seems to be resolved if I remove the cpu-idle-states
property from one of the cpu nodes.

I see no issues with the msm8998 MTP.

Do you have any suggestions on how we might debug this?

On Tue, May 21, 2019 at 3:38 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> Add device bindings for cpuidle states for cpu devices.
>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3fd0769fe648..54810980fcf9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -78,6 +78,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>                         efficiency = <1024>;
>                         next-level-cache = <&L2_0>;
>                         L2_0: l2-cache {
> @@ -97,6 +98,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x1>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>                         efficiency = <1024>;
>                         next-level-cache = <&L2_0>;
>                         L1_I_1: l1-icache {
> @@ -112,6 +114,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x2>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>                         efficiency = <1024>;
>                         next-level-cache = <&L2_0>;
>                         L1_I_2: l1-icache {
> @@ -127,6 +130,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x3>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>                         efficiency = <1024>;
>                         next-level-cache = <&L2_0>;
>                         L1_I_3: l1-icache {
> @@ -142,6 +146,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x100>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>                         efficiency = <1536>;
>                         next-level-cache = <&L2_1>;
>                         L2_1: l2-cache {
> @@ -161,6 +166,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x101>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>                         efficiency = <1536>;
>                         next-level-cache = <&L2_1>;
>                         L1_I_101: l1-icache {
> @@ -176,6 +182,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x102>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>                         efficiency = <1536>;
>                         next-level-cache = <&L2_1>;
>                         L1_I_102: l1-icache {
> @@ -191,6 +198,7 @@
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x103>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
>                         efficiency = <1536>;
>                         next-level-cache = <&L2_1>;
>                         L1_I_103: l1-icache {
> @@ -238,6 +246,48 @@
>                                 };
>                         };
>                 };
> +
> +               idle-states {
> +                       entry-method = "psci";
> +
> +                       LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "little-retention";
> +                               arm,psci-suspend-param = <0x00000002>;
> +                               entry-latency-us = <43>;
> +                               exit-latency-us = <86>;
> +                               min-residency-us = <200>;
> +                       };
> +
> +                       LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "little-power-collapse";
> +                               arm,psci-suspend-param = <0x00000003>;
> +                               entry-latency-us = <100>;
> +                               exit-latency-us = <612>;
> +                               min-residency-us = <1000>;
> +                               local-timer-stop;
> +                       };
> +
> +                       BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "big-retention";
> +                               arm,psci-suspend-param = <0x00000002>;
> +                               entry-latency-us = <41>;
> +                               exit-latency-us = <82>;
> +                               min-residency-us = <200>;
> +                       };
> +
> +                       BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
> +                               compatible = "arm,idle-state";
> +                               idle-state-name = "big-power-collapse";
> +                               arm,psci-suspend-param = <0x00000003>;
> +                               entry-latency-us = <100>;
> +                               exit-latency-us = <525>;
> +                               min-residency-us = <1000>;
> +                               local-timer-stop;
> +                       };
> +               };
>         };
>
>         firmware {
> --
> 2.17.1
>
