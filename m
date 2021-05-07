Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F264376B06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 22:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhEGUHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 16:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhEGUHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 16:07:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC801C061761
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 13:06:32 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso8897038otb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3WDj5ByVzdBRKZ0K+GqLVQS/4o6OnrEylJSHdlEZ+hM=;
        b=mp4xUFLSixbyfl+Qu1nsppkLvWWnJ7zGe/JkzCWNj7B4l+wzPO6GlbBXQPEIUugYAq
         7AFiF2v83Iv4sxboZBOaxsA3AuCTFQwXP2+2jUEgqnGXqAqlJ5BEDusKsWKtZeIBIKLb
         UPgwaYD/JnaDCbieW2t14TnSL0lOPRSaYIrVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3WDj5ByVzdBRKZ0K+GqLVQS/4o6OnrEylJSHdlEZ+hM=;
        b=MlkWCnRTaNtxDjr/DeggM4YmDuYT650xALY9Om2o0LK+a5wUMF7PSb+lUpeb/z7RAg
         3NOEg3I4aMz/c4fJGX2eOB+J5LPYuZQ/ri9S7V4z6pZHSLTA1nHjJuJ5qQks4utVI2Si
         Yk3GD8UsM4RhwZMm9zi3cQc6oWLY0NISj6N8hhq2oOqzja92RqDGsoTv9H2HynUyOEAz
         D/baP7fYMju0O1urnmneAT6DsKZU1PSOC545yTwOWF2v9fbgfoWvVgPgLKAaHzNMSolL
         imc61NJsNTmjBg5i9Bmr4KQlPwLhHXmgpeQdm6BcbFoKV/3CvwjicKZD4VWZj550lBgu
         9YTg==
X-Gm-Message-State: AOAM532TfyCeSEBXyI46wmisDBwxTvXMiYIoadhYoCE5kHrgG9Ot2pA7
        ZXSkGh+RwZjeGFYdS6bti4r9r+O+gIcaReIir1ISXQ==
X-Google-Smtp-Source: ABdhPJzBoH4ZO59EfoG2eOJx+S58pk5bWUbPkAYehwWXAFkrILAtchBdOqaZJDQMbz4Lxtbw4xEwQHFXlTAY+ZOqXT8=
X-Received: by 2002:a9d:425:: with SMTP id 34mr9741568otc.25.1620417992319;
 Fri, 07 May 2021 13:06:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 May 2021 13:06:31 -0700
MIME-Version: 1.0
In-Reply-To: <1620382648-17395-3-git-send-email-pmaliset@codeaurora.org>
References: <1620382648-17395-1-git-send-email-pmaliset@codeaurora.org> <1620382648-17395-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 7 May 2021 13:06:31 -0700
Message-ID: <CAE-0n530bSPupOHVDzwpd_JVVN0tOfrAOm9dAt1ZGj7zaXOZ6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-05-07 03:17:27)
> Add PCIe controller and PHY nodes for sc7280 SOC.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 138 +++++++++++++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 2cc4785..a9f25fc1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         interrupt-parent = <&intc>;
> @@ -316,6 +317,118 @@
>                         };
>                 };
>
[...]
> +
> +               pcie1_phy: phy@1c0e000 {
> +                       compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
> +                       reg = <0 0x01c0e000 0 0x1c0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +                       clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +                                <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +                                <&gcc GCC_PCIE_CLKREF_EN>,
> +                                <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +                       clock-names = "aux", "cfg_ahb", "ref", "refgen";
> +
> +                       resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> +                       reset-names = "phy";
> +
> +                       assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +                       assigned-clock-rates = <100000000>;
> +
> +                       status = "disabled";

I think the style is to put status disabled close to the compatible?

> +
> +                       pcie1_lane: lanes@1c0e200 {
> +                               reg = <0 0x1c0e200 0 0x170>, /* tx0 */

Please pad reg addresses to 8 characters.

> +                                     <0 0x1c0e400 0 0x200>, /* rx0 */
> +                                     <0 0x1c0ea00 0 0x1f0>, /* pcs */
> +                                     <0 0x1c0e600 0 0x170>, /* tx1 */
> +                                     <0 0x1c0e800 0 0x200>, /* rx1 */
> +                                     <0 0x1c0ee00 0 0xf4>; /* "pcs_com" same as pcs_misc? */

Is this a TODO? I'd prefer all the comments on the reg properties to be
removed.

> +                               clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "pipe0";
> +
> +                               #phy-cells = <0>;
> +                               #clock-cells = <1>;
> +                               clock-output-names = "pcie_1_pipe_clk";
> +                       };
> +               };
> +
>                 stm@6002000 {
>                         compatible = "arm,coresight-stm", "arm,primecell";
>                         reg = <0 0x06002000 0 0x1000>,
> @@ -871,6 +984,31 @@
>                                 pins = "gpio46", "gpio47";
>                                 function = "qup13";
>                         };
> +
> +                       pcie1_default_state: pcie1-default {
> +                               clkreq {
> +                                       pins = "gpio79";
> +                                       function = "pcie1_clkreqn";
> +                                       bias-pull-up;

Move this bias-pull-up to the idp file?

> +                               };
> +
> +                               reset-n {
> +                                       pins = "gpio2";
> +                                       function = "gpio";
> +
> +                                       drive-strength = <16>;
> +                                       output-low;
> +                                       bias-disable;
> +                               };
> +
> +                               wake-n {
> +                                       pins = "gpio3";
> +                                       function = "gpio";
> +
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };

These last two nodes with the pull-up and drive-strength settings should
be in the board files, like the idp one, instead of here in the SoC
file. That way board designers can take the SoC and connect the pcie to
an external device using these pins and set the configuration they want
on these pins, or choose not to connect them to the SoC at all and use
those pins for something else.

In addition, it looks like the reset could be a reset-gpios property
instead of an output-low config.

> +                       };
>                 };
>
