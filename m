Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD15016532A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 00:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgBSXr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 18:47:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:49844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbgBSXr4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 18:47:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BD5D24686;
        Wed, 19 Feb 2020 23:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582156075;
        bh=Lx0JvjH6kK2Mtkb2wpHR3KF41KC6alibmrjenySNb+o=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=xNyiO0FuY5nmioZrkBZUAv4IYD+K7/FrQQQ7hYyIirBZddKaIZAu9MATKU/JIUqzS
         ntO7j4aQlQP+AHQ8mIq5prx3PlCT14CNrABQDvTcQZZSuGQr68ev3iRlzBBUyb8h3O
         rEVSJV4PChrcOP8yRlUhU3kegj3vFx03T7tYccjw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582093655-9673-1-git-send-email-sivaprak@codeaurora.org>
References: <1582093655-9673-1-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: ipq6018: Add a few device nodes
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, sivaprak@codeaurora.org
Date:   Wed, 19 Feb 2020 15:47:54 -0800
Message-ID: <158215607451.184098.15649983727508296275@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-02-18 22:27:35)
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq6018.dtsi
> index 0fb44e5..5d4dfb8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -98,6 +121,36 @@
>                 dma-ranges;
>                 compatible =3D "simple-bus";
> =20
> +               rng: qrng@e1000 {

prng@e3000?

> +                       compatible =3D "qcom,prng-ee";
> +                       reg =3D <0xe3000 0x1000>;
> +                       clocks =3D <&gcc GCC_PRNG_AHB_CLK>;
> +                       clock-names =3D "core";
> +               };
> +
> +               cryptobam: dma@704000 {
> +                       compatible =3D "qcom,bam-v1.7.0";
> +                       reg =3D <0x00704000 0x20000>;
> +                       interrupts =3D <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&gcc GCC_CRYPTO_AHB_CLK>;
> +                       clock-names =3D "bam_clk";
> +                       #dma-cells =3D <1>;
> +                       qcom,ee =3D <1>;
> +                       qcom,controlled-remotely =3D <1>;
> +                       qcom,config-pipe-trust-reg =3D <0>;
> +               };
> @@ -146,6 +279,21 @@
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>                 };
> =20
> +               watchdog@b017000 {
> +                       compatible =3D "qcom,kpss-wdt";
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;

This isn't a rising edge interrupt?

> +                       reg =3D <0x0b017000 0x40>;
> +                       clocks =3D <&sleep_clk>;
> +                       timeout-sec =3D <10>;
> +               };
> +
> +               apcs_glb: mailbox@b111000 {
> +                       compatible =3D "qcom,ipq8074-apcs-apps-global";
> +                       reg =3D <0x0b111000 0xc>;
> +
> +                       #mbox-cells =3D <1>;
> +               };
> +
>                 timer {
>                         compatible =3D "arm,armv8-timer";
>                         interrupts =3D <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4)=
 | IRQ_TYPE_LEVEL_LOW)>,
> @@ -213,5 +361,85 @@
>                         };
>                 };
> =20
> +               q6v5_wcss: q6v5_wcss@cd00000 {

remoteproc@cd00000?

> +                       compatible =3D "qcom,ipq8074-wcss-pil";
> +                       reg =3D <0x0cd00000 0x4040>,
> +                               <0x004ab000 0x20>;
> +                       reg-names =3D "qdsp6",
> +                                   "rmb";
[...]
> +                       glink-edge {
> +                               interrupts =3D <GIC_SPI 321 IRQ_TYPE_EDGE=
_RISING>;
> +                               qcom,remote-pid =3D <1>;
> +                               mboxes =3D <&apcs_glb 8>;
> +
> +                               rpm_requests {
> +                                       qcom,glink-channels =3D "IPCRTR";
> +                               };
> +                       };
> +               };
> +
> +       };
> +
> +       tcsr_mutex: tcsr-mutex {

hwlock?

> +               compatible =3D "qcom,tcsr-mutex";
> +               syscon =3D <&tcsr_mutex_regs 0 0x80>;
> +               #hwlock-cells =3D <1>;
> +       };
> +
