Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191734AE360
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386793AbiBHWVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386787AbiBHVLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 16:11:49 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3ADC0612BA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 13:11:48 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so177215ooi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 13:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IolIE8DlbmDNUe3gGgG48U1O9vWoP4C6TXSIdX5Tgvs=;
        b=AbUPMmzJT8mciX3qYbx/Wy97gl16cigP99mpGQx48PAxS+kyG4yRLTtflI4z6/QkEC
         NPV2/hIi1bb5CMFGGAiFPrYcYTMQZp3w8o2qpSc/sZypMyS7ySM4bDmZ8+4uIr4iJCMb
         LookcqAXmZ2p25+haf3s1l+u0dqp1Ozm+G878=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IolIE8DlbmDNUe3gGgG48U1O9vWoP4C6TXSIdX5Tgvs=;
        b=w83ZaTnWB8DQtYoVza5aQE/hELBL3FWyqm6csLPd/M2l8w5veCYwhludW1H3I69Lvu
         Qbg5D4Yu0HreLewJtlJGDrsodb7jc/3CqgVP89yUMv202uqKNnUB55Q382ustSZd2cle
         eywIvY9k7quhyNApIt4xuOa9GzeBbysBvFM7AJbaxvjkAsL0yFXfAKXs0cY3ctDX92aC
         ALx9Dd/RCxgEic02eOV/utYilOLKqa06Rh8ypEO3D3Ts4I+KSxw2M4m1n+qoLvx9HCNl
         gRKNnyKIBkw2Vjuc9kIVq9P5CVyTAAlS8y+lyROCUFSYZpzzvGdMhwTHp+ybUSu33KHf
         PdBg==
X-Gm-Message-State: AOAM5305mTV75u/N3g+aBmOItfnCatWOom0U4mcm3dlpThBAHhC3WGQl
        kdhM9qaXErlAAbw4IBOurI8rKiviCLq153pAR6jrXQ==
X-Google-Smtp-Source: ABdhPJwHNoxydd/t2CaA3EqBCm15INeCVbhxeoynL95/uM/C6nBW9vtMXvetlz1uGTkYLWiossI7SRfqhKSAUbviamc=
X-Received: by 2002:a4a:b001:: with SMTP id f1mr2473858oon.25.1644354708042;
 Tue, 08 Feb 2022 13:11:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Feb 2022 13:11:47 -0800
MIME-Version: 1.0
In-Reply-To: <1644334454-16719-3-git-send-email-quic_srivasam@quicinc.com>
References: <1644334454-16719-1-git-send-email-quic_srivasam@quicinc.com> <1644334454-16719-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Feb 2022 13:11:47 -0800
Message-ID: <CAE-0n52LGY2amCKo+40D4BoSsANs7JeQ0t_4QfeXNC5q64Ccwg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-08 07:34:13)
> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 150 +++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index c7d6c46..4704a93 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -638,3 +638,153 @@
>                 bias-pull-up;
>         };
>  };

Newline here.

> +&soc {
> +       lpass_tlmm: pinctrl@33c0000 {
> +               compatible = "qcom,sc7280-lpass-lpi-pinctrl";
> +               reg = <0 0x33c0000 0x0 0x20000>,
> +                       <0 0x3550000 0x0 0x10000>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +               #clock-cells = <1>;

Presumably this doesn't change so it should be moved to the sc7280.dtsi
file as part of the soc node. It can be marked status = "disabled" if
it's not commonly used, but I suspect it is commonly used on sc7280?

> +
> +               dmic01_active: dmic01-active-pins {

The '-pins' suffix is redundant. Please remove it.

> +                       clk {
> +                               pins = "gpio6";
> +                               function = "dmic1_clk";
> +                               drive-strength = <8>;
> +                               output-high;
> +                       };

Please be consistent and have a newline between nodes.

> +                       data {
> +                               pins = "gpio7";
> +                               function = "dmic1_data";
> +                               drive-strength = <8>;
> +                               input-enable;
> +                       };
> +               };
> +
> +               dmic01_sleep: dmic01-sleep-pins {
> +                       clk {
> +                               pins = "gpio6";
> +                               function = "dmic1_clk";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                               output-low;
> +                       };
> +
> +                       data {
> +                               pins = "gpio7";
> +                               function = "dmic1_data";
> +                               drive-strength = <2>;
> +                               pull-down;
> +                               input-enable;

Why does input-enable matter? It's not a gpio.

> +                       };
> +               };
> +
> +               dmic23_active: dmic02-active-pins {
> +                       clk {
> +                               pins = "gpio8";
> +                               function = "dmic2_clk";
> +                               drive-strength = <8>;
> +                               output-high;
> +                       };
> +                       data {
> +                               pins = "gpio9";
> +                               function = "dmic2_data";
> +                               drive-strength = <8>;
> +                               input-enable;
> +                       };
> +               };
> +
> +               dmic23_sleep: dmic02-sleep-pins {
> +                       clk {
> +                               pins = "gpio8";
> +                               function = "dmic2_clk";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                               output-low;
> +                       };
> +
> +                       data {
> +                               pins = "gpio9";
> +                               function = "dmic2_data";
> +                               drive-strength = <2>;
> +                               pull-down;
> +                               input-enable;
> +                       };
> +               };
> +
> +               rx_swr_active: rx_swr-active-pins {
> +                       clk {
> +                               pins = "gpio3";
> +                               function = "swr_rx_clk";
> +                               drive-strength = <2>;
> +                               slew-rate = <1>;
> +                               bias-disable;
> +                       };
> +
> +                       data {
> +                               pins = "gpio4", "gpio5";
> +                               function = "swr_rx_data";
> +                               drive-strength = <2>;
> +                               slew-rate = <1>;
> +                               bias-bus-hold;
> +                       };
> +               };
> +
> +               rx_swr_sleep: rx_swr-sleep-pins {
> +                       clk {
> +                               pins = "gpio3";
> +                               function = "swr_rx_clk";
> +                               drive-strength = <2>;
> +                               input-enable;
> +                               bias-pull-down;
> +                       };
> +
> +                       data {
> +                               pins = "gpio4", "gpio5";
> +                               function = "swr_rx_data";
> +                               drive-strength = <2>;
> +                               input-enable;
> +                               bias-pull-down;
> +                       };
> +               };
> +
> +               tx_swr_active: tx_swr-active-pins {
> +                       clk {
> +                               pins = "gpio0";
> +                               function = "swr_tx_clk";
> +                               drive-strength = <2>;
> +                               slew-rate = <1>;
> +                               bias-disable;
> +                       };
> +
> +                       data {
> +                               pins = "gpio1", "gpio2", "gpio14";
> +                               function = "swr_tx_data";
> +                               drive-strength = <2>;
> +                               slew-rate = <1>;
> +                               bias-bus-hold;
> +                       };
> +               };
> +
> +               tx_swr_sleep: tx_swr-sleep-pins {

No underscore in node names.

> +                       clk {
> +                               pins = "gpio0";
> +                               function = "swr_tx_clk";
> +                               drive-strength = <2>;
> +                               input-enable;
> +                               bias-pull-down;
> +                       };
> +
> +                       data {
> +                               pins = "gpio1", "gpio2", "gpio14";
> +                               function = "swr_tx_data";
> +                               drive-strength = <2>;
> +                               input-enable;
> +                               bias-bus-hold;
> +                       };
> +               };
> +       };
> +};
> --
> 2.7.4
>
