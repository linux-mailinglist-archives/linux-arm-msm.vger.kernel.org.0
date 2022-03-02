Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827934C9AC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiCBByy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238868AbiCBByx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:54:53 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798405F4C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:54:08 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 8so454850qvf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ApDLIoJxNouLroL6EOm89WdHiQ9hXyQe3LURUVLH4M=;
        b=ERE7lEbvP4lF5OxKzmO/B8AFmMepiaDYf58cafFT5dvPzfAyYBNYwhcJuL6s6mpiP0
         V4+Q7w2tTh+1GBqQRWEDM7GgYa72AH8i/h+waFyVP4ZWWtLD57UExIitUc+yPZh7bxn7
         zXL7Y/wPknx9BLU6sNZbdGg9EWsXuMRzaoSgVGbsbKJj0bsHnfHAj9gnLWN2Rr/MWyHI
         h4O9M2e9DOQlxY064eGyfdoNDzgxevmND8czYu0F9+TVr3iP9jcOrBsT/Bd9XXh5CDok
         p99ZrLJuf2W8UJvS4HDahfE6yLR3i0Jz8cSBPHyaJR+Q615HpAJn2Zk/yAX5SNXfOfej
         SNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ApDLIoJxNouLroL6EOm89WdHiQ9hXyQe3LURUVLH4M=;
        b=i8UZUgsQvMQlSBgdj9GaP9q6PyXZ95aZ2Yy4be3Ka6Q7lXM91s4SCXCvY5tsYWYZBx
         XI5GDxFxm+bZf4InZgwdyxxzD2ijHZeEk3ylguxqv9DcUbCWudPtwLUcSNE05QjQYP6W
         o5iK5wDWzX2JRCXdsUxizQV4EZCp1OtgKG1t/wWi0Q8cTyRUL1DP1qJlYs0KRc/sg2QH
         IDBCsBvOap6Mi5XciEtO+w0prZq3EHd5Me04K19Ic3gqRXcFU4pNvLrvPk6Ny1EBA1Ha
         B221aWEuLYZKj4WvH/ll9WRXBXLn+/L22P0vE+wdNFVL3Z8XUuoLxIK/qWhU9gKio4kZ
         VeWg==
X-Gm-Message-State: AOAM530mp4x3nioCrJ/I3Dv4y/xOhpcZVG9dVlrAyQYct7YX8pGcq6vI
        AslUATs16V3+lJ1EMNo8y7fXhvKrDrVfMFVQ3RewqQ==
X-Google-Smtp-Source: ABdhPJyqpAFWKzv4fWn1e6rGIJGNAhD1agtmglBNCf438GmtwSezcLQdNiKIFI8jKYaCHvtl+gUgULQu6oIzblSdzXk=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr19364568qvj.119.1646186047536; Tue, 01
 Mar 2022 17:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20220302013339.2354076-1-robh@kernel.org>
In-Reply-To: <20220302013339.2354076-1-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 04:53:56 +0300
Message-ID: <CAA8EJpowE0VfnA1QhU1LfXobFYjGPirWb52QW6HT5kCpcX0NBQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/arm: dts: qcom: Drop bogus interrupt flags cell
 on MDSS nodes
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Mar 2022 at 04:33, Rob Herring <robh@kernel.org> wrote:
>
> The MDSS interrupt provider is a single cell, so specifying interrupt flags
> on the consumers is incorrect.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
>  - Add a bunch of missed cases
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi  | 5 ++---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi  | 6 +++---
>  6 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 412d94736c35..3b9af5e24907 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1495,7 +1495,7 @@ mdp: mdp@fd900000 {
>                                 reg-names = "mdp_phys";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <0 0>;
> +                               interrupts = <0>;
>
>                                 clocks = <&mmcc MDSS_AHB_CLK>,
>                                          <&mmcc MDSS_AXI_CLK>,
> @@ -1530,7 +1530,7 @@ dsi0: dsi@fd922800 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <4>;
>
>                                 assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
>                                                   <&mmcc PCLK0_CLK_SRC>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index f0f81c23c16f..0597d865a4a6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -788,7 +788,7 @@ mdp: mdp@901000 {
>                                 reg-names = "mdp_phys";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <0>;
>
>                                 clocks = <&mmcc MDSS_AHB_CLK>,
>                                          <&mmcc MDSS_AXI_CLK>,
> @@ -834,7 +834,7 @@ dsi0: dsi@994000 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <4>;
>
>                                 clocks = <&mmcc MDSS_MDP_CLK>,
>                                          <&mmcc MDSS_BYTE0_CLK>,
> @@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
>                                             "hdcp_physical";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <8>;
>
>                                 clocks = <&mmcc MDSS_MDP_CLK>,
>                                          <&mmcc MDSS_AHB_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 240293592ef9..f646fb80924f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1453,7 +1453,7 @@ mdp: mdp@c901000 {
>                                 reg-names = "mdp_phys";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <0>;
>
>                                 assigned-clocks = <&mmcc MDSS_MDP_CLK>,
>                                                   <&mmcc MDSS_VSYNC_CLK>;
> @@ -1530,7 +1530,7 @@ dsi0: dsi@c994000 {
>                                 power-domains = <&rpmpd SDM660_VDDCX>;
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <4>;
>
>                                 assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
>                                                   <&mmcc PCLK0_CLK_SRC>;
> @@ -2487,4 +2487,3 @@ timer {
>                                  <GIC_PPI 0 0xf08>;
>         };
>  };
> -
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index eccf6fde16b4..1d748c5305f4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -163,7 +163,7 @@ dsi1: dsi@c996000 {
>                 power-domains = <&rpmpd SDM660_VDDCX>;
>
>                 interrupt-parent = <&mdss>;
> -               interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts = <5>;
>
>                 assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
>                                         <&mmcc PCLK1_CLK_SRC>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 41f4e46e1f85..95e6a97c2170 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4281,7 +4281,7 @@ mdss_mdp: mdp@ae01000 {
>                                 power-domains = <&rpmhpd SDM845_CX>;
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <0>;
>
>                                 ports {
>                                         #address-cells = <1>;
> @@ -4333,7 +4333,7 @@ dsi0: dsi@ae94000 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <4>;
>
>                                 clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>                                          <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> @@ -4405,7 +4405,7 @@ dsi1: dsi@ae96000 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <5>;
>
>                                 clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
>                                          <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303ba047..956848068871 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
>                                 power-domains = <&rpmhpd SM8250_MMCX>;
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <0>;
>
>                                 ports {
>                                         #address-cells = <1>;
> @@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <4>;
>
>                                 clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>                                          <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> @@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
>                                 reg-names = "dsi_ctrl";
>
>                                 interrupt-parent = <&mdss>;
> -                               interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <5>;
>
>                                 clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
>                                          <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> --
> 2.32.0
>


-- 
With best wishes
Dmitry
