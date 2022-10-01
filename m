Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A7A5F1A95
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 09:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJAH0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 03:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJAH0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 03:26:24 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AFED58A1
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 00:26:23 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id k3so5885944ybk.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DevjoDpfP5UnShykN/LnwC7RCgHNGoNt3dRFdFAks5Y=;
        b=KAxUG2tomJwHYSXF11aSbULR3zxyKpsEmZCqKk6pwrgvSLFv6qF6r64leeR3s7Fn9W
         k4qIRcQ35RenGH2zMZwQ2x1h1gjNJI7sCA+HDX6jYT+jWKs3uz/stlDlVe1VwEaYLPly
         Sh1PE1DrLMqRr99gdj00okg/RzgWj+CqWOeNMpWKalepurvmG2INFZcex3FUqXEoe6Pg
         r354tkjJ/YByfTVmv7Y07n7II3jWaZc5R73UEqMHQB6UDy43xR6gtU9XHPstUb79/Img
         9N+a7IsKwkDck8+DPykIgfsXqCHZNXR+tAUv3KtZDbAZvPtDP6fAEBfv/YeBXKOI+6gj
         6S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DevjoDpfP5UnShykN/LnwC7RCgHNGoNt3dRFdFAks5Y=;
        b=IjKnwhAZ4ZbG3YsSJTbUiRrrOOqr1vA2pPK1QhSl88HszgP5sdDapd8GbWuUER60S1
         QvqxnCEmOEHbi7aVUwdw/rDutd/yrlR7pr4QYMe4/UEUCiOG/Xg5DaV/xj5xDVP/9IV9
         QkQ4PB8t3RQZfSmL+I57btcBnLuA+JRpKlHmV7qZSg/tpqVrg5U7MSepNi0sjfx/3EKg
         tCoN35K6gDsYZjV8YRhAGvDTJfQe+uYOkMzNZFkGBdH2YnT0TVhE+YUVHTddfUX3jyua
         U4OblIhsScYjgZvDD1Nnc8AdMuZL+iCrGI0GWF09jESlgdFiMV0WsYNZDzwLHux7Xo6c
         VBeg==
X-Gm-Message-State: ACrzQf3QRvRCN4ORcBB1M59FYYU8Ir1dEePpJsk7Uoh5a18Rkw0/xr0D
        EPoVbSgU4fO/81QmqCtIWaI7CcNn6cMmSKdH2v8v6A==
X-Google-Smtp-Source: AMsMyM6Bfl0BXWpPqGZopk1Ej5hLuSRrHBF4fapVAElipbC0XpJb9XskHaKdxc93333MmG43EB1zmW3/z2RbodjMtAA=
X-Received: by 2002:a05:6902:102f:b0:6b4:7cba:b77a with SMTP id
 x15-20020a056902102f00b006b47cbab77amr11703798ybt.516.1664609182341; Sat, 01
 Oct 2022 00:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030656.29365-1-quic_molvera@quicinc.com> <20221001030656.29365-4-quic_molvera@quicinc.com>
In-Reply-To: <20221001030656.29365-4-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 10:26:11 +0300
Message-ID: <CAA8EJpp2h3j9cPLPzCzgnYm07D5PPZg3H5_LkcXizhXt9ekkiQ@mail.gmail.com>
Subject: Re: [PATCH 03/19] arm64: dts: qcom: qdru1000: Add tlmm nodes
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 06:09, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add tlmm node for the QDU1000 and QRU1000 SoCs and the uart pin
> configuration.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdru1000.dtsi | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qdru1000.dtsi b/arch/arm64/boot/dts/qcom/qdru1000.dtsi
> index 3610f94bef35..39b9a00d3ad8 100644
> --- a/arch/arm64/boot/dts/qcom/qdru1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdru1000.dtsi
> @@ -235,6 +235,8 @@ uart7: serial@99c000 {
>                                 reg = <0x0 0x99c000 0x0 0x4000>;
>                                 clock-names = "se";
>                                 clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_uart7_default>;
>                                 interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> @@ -248,6 +250,34 @@ tcsr_mutex: hwlock@1f40000 {
>                         #hwlock-cells = <1>;
>                 };
>
> +               tlmm: pinctrl@f000000 {
> +                       compatible = "qcom,qdu1000-tlmm", "qcom,qru1000-tlmm";
> +                       reg = <0x0 0xf000000 0x0 0x1000000>;
> +                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +                       gpio-ranges = <&tlmm 0 0 151>;
> +                       wakeup-parent = <&pdc>;
> +
> +                       qup_uart7_default: qup-uart7-default {
> +                               tx {
> +                                       pins = "gpio134";
> +                                       function = "qup0_se7_l2";

This looks strange. Usually we'd have a single 'qup7' function here.
I'd go back to the interconnect driver. Maybe the functions are not
correctly defined there.

> +                                       drive-strength = <2>;
> +                                       bias-disable;

'drive-strength' and 'bias-disable' are to be patched in in the board dts file.

> +                               };
> +
> +                               rx {
> +                                       pins = "gpio135";
> +                                       function = "qup0_se7_l3";
> +                                       drive-strength = <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible = "qcom,pdc";
>                         reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
