Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58CF6D0002
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 11:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjC3Jo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 05:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjC3Joz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 05:44:55 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2512703
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:44:52 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5445009c26bso343855837b3.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680169491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D5QhRmDJcF4XcN+YN/wMUr5xeRsIP0q2NHf6Lg2WSCU=;
        b=rTytkproI4ZeYbf79ItQhzklZhvcyt1yC5XYKgZe0dIhEll6PC2xTx9HgbbCm3IRnq
         YiBC0+N8Zg79EaS2SBKB+Lq6+DM/mBctgOMjgwHh8272j3J22OQOYpDviYU29Zwl3LJT
         PdRhL7pLas02bTYcYPoxLpRG0lQ8rg+4baZ6KuaejUe+F4E4oxuTsHJFhVP/9ROHPsV3
         Du+GTrKY9ungEXaKXuWcb8Q/qjRsnW/GaM+lJ/L8SZOTIYkf2ovvTQtzu4c3tH5cBgHI
         AU/J320dB0t1i65FoXcyELdrMaF8W8XssqADPM3o3DCXMyW26MRVe/4vhaKpx8hRpL8J
         XZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5QhRmDJcF4XcN+YN/wMUr5xeRsIP0q2NHf6Lg2WSCU=;
        b=T1SpIywxNPQilSoi92Hc/BTuN1yDp1A1XyorXjg7THiuUYzwMoFDpASYL0oWeGwFxF
         HueHHpzMZ67wf1Qj5Ebn+wTp8oABoe7YnJWK8jhf5xC5Jtcb0eXYzzl0/zdj568kgfOX
         KcqKm19FPr/P2xhVFPGOILHJnAnv8PxCnfBL1dMNoMK1jgUv+zFCrr0Ox/gBngCpELZx
         pCjl2UtZHYXsquytD3AxCfsUv6OpaBJ9RdO6o5sMqXSiQlbsNTyTekULg4mtlOxwqtga
         qeYOoUQ7sptlFbGYCdM1P+7Yl0qzQNYWaZrcFAfAtVet/2eeyvRs9BcRwlzLTo9yf7D2
         b2jw==
X-Gm-Message-State: AAQBX9dR4zbXXxKG/g5Rh5b79fqwje+Y4nYn9Al3YT65E40R9jnh9l5A
        tU3f+kshyherXkTcTvE0zSrlQt75QJFHGK1td7OT1A==
X-Google-Smtp-Source: AKy350ZT55VVqmvU2dy3SDJwH+Sxn92AQif8rp45ZViwv5FDX92TYrmgN4KcoHsSxDwuItx9VzmbCUYV/wiH71Th1UU=
X-Received: by 2002:a81:441e:0:b0:546:3252:385d with SMTP id
 r30-20020a81441e000000b005463252385dmr2256127ywa.5.1680169491491; Thu, 30 Mar
 2023 02:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680162377.git.quic_varada@quicinc.com> <c46b542b112b59002ab965be1d3fcae8c372d545.1680162377.git.quic_varada@quicinc.com>
In-Reply-To: <c46b542b112b59002ab965be1d3fcae8c372d545.1680162377.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:44:40 +0300
Message-ID: <CAA8EJpo_ckJtYV4aU613X5L6+wj-1i9vZkud5p72PLdCSnj5ng@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: ipq9574: Add USB related nodes
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 11:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add USB phy and controller related nodes
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v5:
>         - Fix additional comments
>         - Edit nodes to match with qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>         - 'make dtbs_check' giving the following messages since
>           ipq9574 doesn't have power domains. Hope this is ok
>
>                 /local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: phy@7d000: 'power-domains' is a required property
>                 From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>                 /local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: usb@8a00000: 'power-domains' is a required property
>                 From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

No, I think it is not.

>
>
>  Changes in v4:
>         - Use newer bindings without subnodes
>         - Fix coding style issues
>
>  Changes in v3:
>         - Insert the nodes at proper location
>
>  Changes in v2:
>         - Fixed issues flagged by Krzysztof
>         - Fix issues reported by make dtbs_check
>         - Remove NOC related clocks (to be added with proper
>           interconnect support)
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 120 ++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 2bb4053..8fa9e1a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -186,6 +186,33 @@
>                 method = "smc";
>         };
>
> +       reg_usb_3p3: s3300 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "usb-phy-vdd-dummy";
> +       };
> +
> +       reg_usb_1p8: s1800 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "usb-phy-pll-dummy";
> +       };
> +
> +       reg_usb_0p925: s0925 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <925000>;
> +               regulator-max-microvolt = <925000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "usb-phy-dummy";
> +       };
> +
>         reserved-memory {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
> @@ -215,6 +242,52 @@
>                 #size-cells = <1>;
>                 ranges = <0 0 0 0xffffffff>;
>
> +               qusb_phy_0: phy@7b000 {
> +                       compatible = "qcom,ipq9574-qusb2-phy";
> +                       reg = <0x0007b000 0x180>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&xo_board_clk>;
> +                       clock-names = "cfg_ahb",
> +                                     "ref";
> +
> +                       vdd-supply = <&reg_usb_0p925>;
> +                       vdda-pll-supply = <&reg_usb_1p8>;
> +                       vdda-phy-dpdm-supply = <&reg_usb_3p3>;
> +
> +                       resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +                       status = "disabled";
> +               };
> +
> +               ssphy_0: phy@7d000 {

Nit: usually the label usb_0_qmpphy

> +                       compatible = "qcom,ipq9574-qmp-usb3-phy";
> +                       reg = <0x0007d000 0xa00>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_AUX_CLK>,
> +                                <&xo_board_clk>,
> +                                <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&gcc GCC_USB0_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "ref",
> +                                     "com_aux",
> +                                     "pipe";
> +
> +                       resets = <&gcc GCC_USB0_PHY_BCR>,
> +                                <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +                       reset-names = "phy",
> +                                     "phy_phy";
> +
> +                       vdda-pll-supply = <&reg_usb_1p8>;
> +                       vdda-phy-supply = <&reg_usb_0p925>;
> +
> +                       status = "disabled";
> +
> +                       #clock-cells = <0>;
> +                       clock-output-names = "usb0_pipe_clk";
> +               };
> +
>                 pcie0_phy: phy@84000 {
>                         compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
>                         reg = <0x00084000 0x1bc>; /* Serdes PLL */
> @@ -436,6 +509,53 @@
>                         status = "disabled";
>                 };
>
> +               usb3: usb@8a00000 {
> +                       compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
> +                       reg = <0x08af8800 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       clocks = <&gcc GCC_SNOC_USB_CLK>,
> +                                <&gcc GCC_ANOC_USB_AXI_CLK>,
> +                                <&gcc GCC_USB0_MASTER_CLK>,
> +                                <&gcc GCC_USB0_SLEEP_CLK>,
> +                                <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +
> +                       clock-names = "sys_noc_axi",
> +                                     "anoc_axi",
> +                                     "master",
> +                                     "sleep",
> +                                     "mock_utmi";
> +
> +                       assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +                                         <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                       assigned-clock-rates = <200000000>,
> +                                              <24000000>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pwr_event";
> +
> +                       resets = <&gcc GCC_USB_BCR>;
> +                       status = "disabled";
> +
> +                       dwc_0: usb@8a00000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x8a00000 0xcd00>;
> +                               clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                               clock-names = "ref";
> +                               interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&qusb_phy_0>, <&ssphy_0>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               tx-fifo-resize;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_u3_susphy_quirk;
> +                               dr_mode = "host";
> +                       };
> +               };
> +
>                 intc: interrupt-controller@b000000 {
>                         compatible = "qcom,msm-qgic2";
>                         reg = <0x0b000000 0x1000>,  /* GICD */
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
