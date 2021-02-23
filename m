Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A36532268D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhBWHny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhBWHns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:43:48 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B6BC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:43:08 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id k22so9320601pll.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jgYUunnEsSTMGTnO2lLoEyfi+pNVZM1uOBDpNfC0CuU=;
        b=dNC3TexIvk5/T+rxfc9bpWDzDFoPfU2wJCcHSPmX2pw8lg84+4Pbq/5zOBzWqtzs94
         T3itGJSjEKp49eZJHwguL5Cp2vciAGg+eN9k3Rn0v+/3jAwUmQDFwdDBExoeE4uZP1F/
         P81D3CL+/C2oc05G2nCo+vFUuHANI6zcROA3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jgYUunnEsSTMGTnO2lLoEyfi+pNVZM1uOBDpNfC0CuU=;
        b=HKKN9FLcCnXmAZ/bRwNZt/y9Qn+SyYWJC/ktrM0WUKYOCu8mqkSN37Y8bdB3zOXOzR
         gUla0EVX4TIfZ88kAZQIvpd5k9Joak03TGQ7NziyxkITI0hoTV1fVw8Mq6VjYMPvupwp
         OlFqwqaocY3XUEVbVRHiW71xBum6dv3Kn620dzVOrLsrUHfYuJ6tdY7UKl/MSLIH0dkd
         sHSVfxiq1qieJLiqGbC9DwbinWHh8u5P8z0m+LevnvxiG7/axxXzTr+PhcBwFvenVbq4
         cZtEMsFfx7pSMIUtgtaFVEdd6uccvcimTMX18gtwlo7kU2rRk3HNWWvzZxrtgYwzKWZ9
         Wq7A==
X-Gm-Message-State: AOAM532nbddPJ7V1d6uhpLoH4kiLxt/bvsOjj56jxGJZQhnflkZG03/j
        QdeNKkGe98cUFucYL+EFZAdSBf7ZogVzBw==
X-Google-Smtp-Source: ABdhPJzfxC8VhnwCuDifpAYQIT/zUkjSKcjFglJatdwVJ+uOh1S/Ot3wAP+75n76KMAjSM7z0bMdVQ==
X-Received: by 2002:a17:902:ec85:b029:e3:bde4:e06e with SMTP id x5-20020a170902ec85b02900e3bde4e06emr1391849plg.30.1614066187321;
        Mon, 22 Feb 2021 23:43:07 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id p11sm2006564pjb.31.2021.02.22.23.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:43:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-7-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-7-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 06/13] arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:43:05 -0800
Message-ID: <161406618557.1254594.15985584772106947706@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:43)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 7848e88..10851e7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> =20
> @@ -29,6 +30,42 @@
>                         clock-frequency =3D <32000>;
>                         #clock-cells =3D <0>;
>                 };
> +
> +               pcie_0_pipe_clk: pcie-0-pipe-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               pcie_1_pipe_clk: pcie-1-pipe-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               ufs_phy_rx_symbol_0_clk: ufs-phy-rx-symbol-0-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               ufs_phy_rx_symbol_1_clk: ufs-phy-rx-symbol-1-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               ufs_phy_tx_symbol_0_clk: ufs-phy-tx-symbol-0-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };
> +
> +               usb3_phy_wrapper_gcc_usb30_pipe_clk: usb3-phy-wrapper-gcc=
-usb30-pipe-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <1000>;
> +                       #clock-cells =3D <0>;
> +               };

Shouldn't these come from the phys? Why are they being added here?

>         };
> =20
>         reserved_memory: reserved-memory {
> @@ -174,6 +211,17 @@
>                 gcc: clock-controller@100000 {
>                         compatible =3D "qcom,gcc-sc7280";
>                         reg =3D <0 0x00100000 0 0x1f0000>;
> +                       clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
> +                                <&pcie_0_pipe_clk>, <&pcie_1_pipe_clk>,
> +                                <&ufs_phy_rx_symbol_0_clk>, <&ufs_phy_rx=
_symbol_1_clk>,
> +                                <&ufs_phy_tx_symbol_0_clk>,
> +                                <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;

If the phys aren't ready then <0> should work. Unless something goes
wrong?

> +                       clock-names =3D "bi_tcxo", "bi_tcxo_ao", "sleep_c=
lk",
> +                                     "pcie_0_pipe_clk", "pcie_1_pipe-clk=
",
> +                                     "ufs_phy_rx_symbol_0_clk", "ufs_phy=
_rx_symbol_1_clk",
> +                                     "ufs_phy_tx_symbol_0_clk",
> +                                     "usb3_phy_wrapper_gcc_usb30_pipe_cl=
k";
>                         #clock-cells =3D <1>;
>                         #reset-cells =3D <1>;
>                         #power-domain-cells =3D <1>;
> @@ -325,6 +373,13 @@
>                                           <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>,
>                                           <CONTROL_TCS 1>;
> +
> +                       rpmhcc: qcom,rpmhcc {

rpmhcc: clock-controller {

> +                               compatible =3D "qcom,sc7280-rpmh-clk";
> +                               clocks =3D <&xo_board>;
> +                               clock-names =3D "xo";
> +                               #clock-cells =3D <1>;
> +                       };
>                 };
>         };
>
