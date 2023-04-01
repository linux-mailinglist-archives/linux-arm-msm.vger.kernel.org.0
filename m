Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBD06D32C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 19:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjDARNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 13:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjDARNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 13:13:43 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD571B7C8
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 10:13:42 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5463fa0c2bfso143865727b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680369222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5MoMYlIStr0RH7jdrTd9Z7BEdRwyRFNXhqZTIrQXnA=;
        b=eRBKIsU1e65toFSIVYOuIlEfeDXTCBuSn6f6ee9yVfzK424ojzFK4t2O61Zkvd/2ZT
         49XdEbd2f85dMpWj32cHjEx0OkPfeZVLlxOJeDG2H59S7UhB+lg+yH3X8ifIpm2sjjry
         tZJ4XCk/gaO67qg3bkgmy3G9rHGvqaAz4iZO5iSgO1fnoVq2FzYnLgRCXNh1SLPCUIgp
         bVPeg0eCu6qIwVYz2x9VjWyfJ3dq6dSUHicOXcSMnhWDfJxd1Z22o07X/JnTPsem+MJa
         NiJGnx0th8H06fCZzIF9QQpu+wWgJVhwVbFJcd6/VJEmwgfnMP5KwGnmTk9v3E/k+r2v
         pD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680369222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5MoMYlIStr0RH7jdrTd9Z7BEdRwyRFNXhqZTIrQXnA=;
        b=CiIegxLlAigabAvNYRGv3sRvvvAE3DpAXL9GoLA5tD0ulKHQtfPi8khJmXoQUn164C
         W3dzKxJj/+wMa+LE2L8P80B6xOwpRIvDQdLIqFdhcx5jFtOp138rAQr95551q6KZgdOT
         8Vrls//SCaNJyH+P4oR8tE7LzvVsxO315S3jx44KTyCMs9CwAnDa29metVXlb61Fl2xI
         88jRrL7YGG/BVPp0nocwXUmfK7MsLfs7AHN9KuQdPqLrWdQAj0C7DyuSXDetsIPiS4oq
         J0i2G1Ppw6EmYLC9VczJK76pIhmL1vrCXqqmHSBXVyW3lcDuoMQpJq57X1qrxhnttRKV
         04mg==
X-Gm-Message-State: AAQBX9fWS2G4PnxYgF2hUmJNYSC/NR+JOIFohwwxrlqpwdOJypu+rxIG
        AU0i38x5bg4VSDOyHIudvaR/2DouGHPN53GkiKex1w==
X-Google-Smtp-Source: AKy350aOB3VyXkODj2y9RG7u90rdfjPSg0tgmNXYdYJhHLsVK/CUZmIagK4z/b5np4q7EGyTSZZcKuYjY10SENaNXR8=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr11147322ywk.5.1680369221714; Sat, 01
 Apr 2023 10:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org> <20230401154725.1059563-3-bhupesh.sharma@linaro.org>
In-Reply-To: <20230401154725.1059563-3-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Apr 2023 20:13:30 +0300
Message-ID: <CAA8EJppTRT+fDp4b6unzn60uJ1CivAEGcxzyVZ5+FE1E073Qzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Apr 2023 at 18:49, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add USB superspeed qmp phy node to dtsi.
>
> Make sure that the various board dts files (which include sm4250.dtsi file)
> continue to work as intended.
>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 36 +++++++++++++++++--
>  .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
>  3 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> index a1f0622db5a0..75951fd439df 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> @@ -242,6 +242,9 @@ &usb {
>  &usb_dwc3 {
>         maximum-speed = "high-speed";
>         dr_mode = "peripheral";
> +
> +       phys = <&usb_hsphy>;
> +       phy-names = "usb2-phy";
>  };
>
>  &usb_hsphy {
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 2a51c938bbcb..b2fa565e4816 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -650,6 +650,38 @@ usb_hsphy: phy@1613000 {
>                         status = "disabled";
>                 };
>
> +               usb_qmpphy: phy@1615000 {
> +                       compatible = "qcom,sm6115-qmp-usb3-phy";
> +                       reg = <0x0 0x01615000 0x0 0x200>;
> +                       clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
> +                                <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> +                       clock-names = "cfg_ahb",
> +                                     "ref",
> +                                     "com_aux";
> +                       resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
> +                                <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
> +                       reset-names = "phy_phy", "phy";
> +                       status = "disabled";
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       usb_ssphy: phy@1615200 {

Please update this to newer style bindings (see
qcom,sc8280xp-qmp-usb3-uni-phy.yaml).

> +                               reg = <0x0 0x01615200 0x0 0x200>,
> +                                     <0x0 0x01615400 0x0 0x200>,
> +                                     <0x0 0x01615c00 0x0 0x400>,
> +                                     <0x0 0x01615600 0x0 0x200>,
> +                                     <0x0 0x01615800 0x0 0x200>,
> +                                     <0x0 0x01615a00 0x0 0x100>;
> +                               #clock-cells = <0>;
> +                               #phy-cells = <0>;
> +                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +                               clock-names = "pipe0";
> +                               clock-output-names = "usb3_phy_pipe_clk_src";
> +                       };
> +               };
> +
>                 qfprom@1b40000 {
>                         compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
>                         reg = <0x0 0x01b40000 0x0 0x7000>;
> @@ -1100,8 +1132,8 @@ usb_dwc3: usb@4e00000 {
>                                 compatible = "snps,dwc3";
>                                 reg = <0x0 0x04e00000 0x0 0xcd00>;
>                                 interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> -                               phys = <&usb_hsphy>;
> -                               phy-names = "usb2-phy";
> +                               phys = <&usb_hsphy>, <&usb_ssphy>;
> +                               phy-names = "usb2-phy", "usb3-phy";
>                                 iommus = <&apps_smmu 0x120 0x0>;
>                                 snps,dis_u2_susphy_quirk;
>                                 snps,dis_enblslpm_quirk;
> diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> index 10c9d338446c..d60cc024749b 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> @@ -280,6 +280,9 @@ &usb {
>  &usb_dwc3 {
>         maximum-speed = "high-speed";
>         dr_mode = "peripheral";
> +
> +       phys = <&usb_hsphy>;
> +       phy-names = "usb2-phy";
>  };
>
>  &usb_hsphy {
> --
> 2.38.1
>


-- 
With best wishes
Dmitry
