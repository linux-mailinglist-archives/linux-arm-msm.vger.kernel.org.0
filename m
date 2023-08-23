Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362D7785F78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 20:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238094AbjHWSUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 14:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbjHWSUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 14:20:17 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2291CD1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 11:20:15 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d77c5414433so905710276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692814815; x=1693419615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fSDj1dXcAD8NlSepMgGO1DihK5nCgCrHfiJNMHtpO4o=;
        b=y/Nh6TI7FN/zIk4Uswx3lPHydEZUeQUWuCl6L/QQmnwVWVOZB03bZ9df6hNOs1UrIX
         eWtPUX7H5S6pNwFae4n+a6f2oYZLGMVM3Jyvp3QkMkvvYqw6o2HOE1ra5y99F2b2dg4j
         4xxfqfX4pfprGUnd8Id4acEtjPc92JEehlZpRL38VzLtDS3vfj44Oj9msAHCdo8uSkUX
         vJd0ASWBAnubJDlGLAzh8NM6Q6o1S6JZ2ZmXn5KYHcxpz9zQN0fqVtG6IT84iok22n5H
         fyYiwvuBNfWn+u6P3GVM/GLLDPmqwny2iHKws5QKDhHOvWWymaZk7Is/P5MjCDQ/X0KD
         QL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692814815; x=1693419615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSDj1dXcAD8NlSepMgGO1DihK5nCgCrHfiJNMHtpO4o=;
        b=U87SmOJVTaZiyaxhrr50ZSTncJ1qePeyt8XSYjttsVR4dc19v0wY65FNYiPnVt7tSD
         7OrTrrsXMMhmgAIsaw+4L64+jWb8+x+mpp3+ejVDXJl2ITOPp9bfnyeApSB3gZMjQ8Zb
         ilPvEuw7uhjta7Xs1f4RGnPAGBksehI4lMyOehQw8PxmUl7TzAAYI9Dzifdp+CScD0yK
         x+K97KQjCCL4aWAT3p7Rj3qiiIijN5NXTazYwevPCu3qzPVKyix8OoPcV0LLbG6tsJVZ
         h9jhfz0FuMEjSpFp4DdZ7TeJoi8ktpceOC/IF6Qnj+oc8/QysfKuaBCcFNf+O3Aopl4u
         zZvw==
X-Gm-Message-State: AOJu0YwNoxgy6ZI7ah/FezVj5CctyrqnwlNq2Yq/mvTTcXb9PftGlQ47
        UEc6x4lwQ9V75Fpy5ooOEKUEImmPfL0Ikpo/6IZZpg==
X-Google-Smtp-Source: AGHT+IFaNs8L0YcwtNuUSzU9bXzuwmBviw+K4v5a4jMYE5vKOLGD8ED8NJrUcHT78j9BlM4OD2Y2mq9OKPShh7mhv5E=
X-Received: by 2002:a5b:151:0:b0:d0f:972b:637 with SMTP id c17-20020a5b0151000000b00d0f972b0637mr12946686ybp.20.1692814815082;
 Wed, 23 Aug 2023 11:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230821002535.585660-1-dmitry.baryshkov@linaro.org> <20230821002535.585660-11-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230821002535.585660-11-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 23 Aug 2023 21:20:04 +0300
Message-ID: <CAA8EJpor90i93PA7=urLh0EPZLk5o5QcBW7p+xyUxu8cGH9oKg@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] arm64: dts: qcom: msm8998: switch USB QMP PHY to
 new style of bindings
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Aug 2023 at 03:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change the USB QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 39 +++++++++++----------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 30d8730fa4de..46a6ef0e454b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -979,12 +979,12 @@ pcie_phy: phy@1c06000 {
>                         status = "disabled";
>
>                         clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> -                                <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>                                  <&gcc GCC_PCIE_CLKREF_CLK>,
> +                                <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>                                  <&gcc GCC_PCIE_0_PIPE_CLK>;
>                         clock-names = "aux",
> -                                     "cfg_ahb",
>                                       "ref",
> +                                     "cfg_ahb",
>                                       "pipe";

This chunk changes the PCIe PHY and as such doesn't belong to this patch.

>
>                         clock-output-names = "pcie_0_pipe_clk_src";
> @@ -2138,7 +2138,7 @@ usb3_dwc3: usb@a800000 {
>                                 interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>                                 snps,dis_u2_susphy_quirk;
>                                 snps,dis_enblslpm_quirk;
> -                               phys = <&qusb2phy>, <&usb1_ssphy>;
> +                               phys = <&qusb2phy>, <&usb3phy>;
>                                 phy-names = "usb2-phy", "usb3-phy";
>                                 snps,has-lpm-erratum;
>                                 snps,hird-threshold = /bits/ 8 <0x10>;
> @@ -2147,33 +2147,26 @@ usb3_dwc3: usb@a800000 {
>
>                 usb3phy: phy@c010000 {
>                         compatible = "qcom,msm8998-qmp-usb3-phy";
> -                       reg = <0x0c010000 0x18c>;
> -                       status = "disabled";
> -                       #address-cells = <1>;
> -                       #size-cells = <1>;
> -                       ranges;
> +                       reg = <0x0c010000 0x1000>;
>
>                         clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
> +                                <&gcc GCC_USB3_CLKREF_CLK>,
>                                  <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> -                                <&gcc GCC_USB3_CLKREF_CLK>;
> -                       clock-names = "aux", "cfg_ahb", "ref";
> +                                <&gcc GCC_USB3_PHY_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "ref",
> +                                     "cfg_ahb",
> +                                     "pipe";
> +                       clock-output-names = "usb3_phy_pipe_clk_src";
> +                       #clock-cells = <0>;
> +                       #phy-cells = <0>;
>
>                         resets = <&gcc GCC_USB3_PHY_BCR>,
>                                  <&gcc GCC_USB3PHY_PHY_BCR>;
> -                       reset-names = "phy", "common";
> +                       reset-names = "phy",
> +                                     "phy_phy";
>
> -                       usb1_ssphy: phy@c010200 {
> -                               reg = <0xc010200 0x128>,
> -                                     <0xc010400 0x200>,
> -                                     <0xc010c00 0x20c>,
> -                                     <0xc010600 0x128>,
> -                                     <0xc010800 0x200>;
> -                               #phy-cells = <0>;
> -                               #clock-cells = <0>;
> -                               clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
> -                               clock-names = "pipe0";
> -                               clock-output-names = "usb3_phy_pipe_clk_src";
> -                       };
> +                       status = "disabled";
>                 };
>
>                 qusb2phy: phy@c012000 {
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
