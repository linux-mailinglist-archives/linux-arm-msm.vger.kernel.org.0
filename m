Return-Path: <linux-arm-msm+bounces-1342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A47F2BA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81201B21866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F094878D;
	Tue, 21 Nov 2023 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3DMybgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5929C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:24:21 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso4969667276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700565860; x=1701170660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijf58E7iAE3NuGvBGhcIQUSSPhWuApr4/8yFkriicow=;
        b=K3DMybgLHmkDV/wByPX/XLJmHLC8aFIwY18wrda0pOUFgodemAmEGaNMDZuebHlMqS
         KPYrqj1dTr/5iGejVSdPHPyj9BGrfrZCVQkC+U8OlQH7x9NBA7GEto7EOXjHardF91aJ
         24adZNATyHbNKjcsPQ2gfZbqTRQhLOwAz4DOs//iOzMAUlB2ah543oxTWcPJ6ZLrNZr+
         ay7Ybv+bQwTgAqrjDxqE0fT9eOqt0ul6qfwL9orOyDYMvKojE5+voWur+xHtBzi4AvWA
         Urwvg3v9NThXEC6RoTzX2jOIgOJdfQiEwsrk89wO0d8R0iSQO9WpICmXEnXogRF15INq
         m0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700565860; x=1701170660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ijf58E7iAE3NuGvBGhcIQUSSPhWuApr4/8yFkriicow=;
        b=QGwndry6whtAGhXi23yvX8B92K2QSIFWjIgD2tnkMsQgaZDHoL3NIIC14TM+InYeiC
         FKrCc2falzwZtl9eEjVCdAjUrB1pGzkC4N1nYjHoL8Da1pBeBJn0woFpWhWjv7pL2RYM
         oQ2yq+ILJBs9gq6EKO/GjtdnZtWV/z8gLRi/pTUW8MZeAROpQRcWLdbVe2AqFgLikgdx
         Offeyh9PSRWElJ/1UeqiykcapE1aiuWaluCL6sFu+9zD8/t1zqrLWA96YVbvHGdG9Win
         KBjwQrRMG6rASgu6j3w110/BF3ebOSws2I7GXVcYKkqSo0yDgMpEYdifClN7FpbIMlD3
         MOlA==
X-Gm-Message-State: AOJu0YycqKyuVsacFVQvHPQjWI9Bxx/ePc7qXdkmvGNhNi2TZkDlkbcn
	5c3zlghkdwgAMEw+/myBvqsN5RpLcZWin7THFUtOGSTB56pX7Dxf
X-Google-Smtp-Source: AGHT+IGOwof7OO5WQueFrHeqVO0qT70zD7EJlyv6rFTuNGZGryXKH/+vCDuiPtedFeIVUU+5C/aX47Zv2CyHMoXl+CY=
X-Received: by 2002:a25:d745:0:b0:da0:6a55:b4d5 with SMTP id
 o66-20020a25d745000000b00da06a55b4d5mr9567171ybg.46.1700565860085; Tue, 21
 Nov 2023 03:24:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org> <20231121-topic-sm8650-upstream-dt-v3-6-db9d0507ffd3@linaro.org>
In-Reply-To: <20231121-topic-sm8650-upstream-dt-v3-6-db9d0507ffd3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Nov 2023 13:24:06 +0200
Message-ID: <CAA8EJppbGpY5-zeVg6Rn+-AOArC=zGDfVvjvat6A4wLht9BWvw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sm8650: add interconnect
 dependent device nodes
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Nov 2023 at 13:00, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add Hardware nodes that depends on an interconnect property to
> be valid.
>
> The includes:
> - all QUP i2s/spi nodes
> - PCIe
> - UFS
> - SDHCI
> - Display
> - HWMON
>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3467 +++++++++++++++++++++++++++++++---
>  1 file changed, 3206 insertions(+), 261 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index e6a862230c30..8e21335073bc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -11,6 +11,8 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -57,6 +59,11 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>                         clock-mult = <1>;
>                         clock-div = <2>;
>                 };
> +
> +               pcie_1_phy_aux_clk: pcie-1-phy-aux-clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +               };

I think this clock is provided by the PHY. Let's attribute it this way.

>         };
>
>         cpus {
> @@ -363,9 +370,23 @@ CLUSTER_SLEEP_1: cluster-sleep-1 {
>         firmware {
>                 scm: scm {
>                         compatible = "qcom,scm-sm8650", "qcom,scm";
> +                       interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>                 };
>         };
>
> +       clk_virt: interconnect-0 {
> +               compatible = "qcom,sm8650-clk-virt";
> +               #interconnect-cells = <2>;
> +               qcom,bcm-voters = <&apps_bcm_voter>;
> +       };
> +
> +       mc_virt: interconnect-1 {
> +               compatible = "qcom,sm8650-mc-virt";
> +               #interconnect-cells = <2>;
> +               qcom,bcm-voters = <&apps_bcm_voter>;
> +       };
> +
>         memory@a0000000 {
>                 device_type = "memory";
>                 /* We expect the bootloader to fill in the size */
> @@ -626,6 +647,95 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>                 };
>         };
>
> +       smp2p-adsp {
> +               compatible = "qcom,smp2p";
> +
> +               interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +
> +               mboxes = <&ipcc IPCC_CLIENT_LPASS
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,smem = <443>, <429>;
> +               qcom,local-pid = <0>;
> +               qcom,remote-pid = <2>;
> +
> +               smp2p_adsp_out: master-kernel {
> +                       qcom,entry-name = "master-kernel";
> +                       #qcom,smem-state-cells = <1>;
> +               };
> +
> +               smp2p_adsp_in: slave-kernel {
> +                       qcom,entry-name = "slave-kernel";
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +       };
> +
> +       smp2p-cdsp {
> +               compatible = "qcom,smp2p";
> +
> +               interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +
> +               mboxes = <&ipcc IPCC_CLIENT_CDSP
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,smem = <94>, <432>;
> +               qcom,local-pid = <0>;
> +               qcom,remote-pid = <5>;
> +
> +               smp2p_cdsp_out: master-kernel {
> +                       qcom,entry-name = "master-kernel";
> +                       #qcom,smem-state-cells = <1>;
> +               };
> +
> +               smp2p_cdsp_in: slave-kernel {
> +                       qcom,entry-name = "slave-kernel";
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +       };
> +
> +       smp2p-modem {
> +               compatible = "qcom,smp2p";
> +
> +               interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +
> +               mboxes = <&ipcc IPCC_CLIENT_MPSS
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,smem = <435>, <428>;
> +               qcom,local-pid = <0>;
> +               qcom,remote-pid = <1>;
> +
> +               smp2p_modem_out: master-kernel {
> +                       qcom,entry-name = "master-kernel";
> +                       #qcom,smem-state-cells = <1>;
> +               };
> +
> +               smp2p_modem_in: slave-kernel {
> +                       qcom,entry-name = "slave-kernel";
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +
> +               ipa_smp2p_out: ipa-ap-to-modem {
> +                       qcom,entry-name = "ipa";
> +                       #qcom,smem-state-cells = <1>;
> +               };
> +
> +               ipa_smp2p_in: ipa-modem-to-ap {
> +                       qcom,entry-name = "ipa";
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +       };
> +
>         soc: soc@0 {
>                 compatible = "simple-bus";
>
> @@ -641,13 +751,13 @@ gcc: clock-controller@100000 {
>                         clocks = <&bi_tcxo_div2>,
>                                  <&bi_tcxo_ao_div2>,
>                                  <&sleep_clk>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>;
> +                                <&pcie0_phy>,
> +                                <&pcie1_phy>,
> +                                <&pcie_1_phy_aux_clk>,
> +                                <&ufs_mem_phy 0>,
> +                                <&ufs_mem_phy 1>,
> +                                <&ufs_mem_phy 2>,
> +                                <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
> @@ -712,234 +822,2310 @@ qupv3_id_1: geniqup@8c0000 {
>
>                         status = "disabled";
>
> -                       uart15: serial@89c000 {
> -                               compatible = "qcom,geni-debug-uart";
> -                               reg = <0 0x0089c000 0 0x4000>;

I think, git diff got it wrong here. Is there any chance we can help it?

> +                       i2c8: i2c@880000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00880000 0 0x4000>;
>
> -                               interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>
> -                               clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
>                                 clock-names = "se";
>
> -                               pinctrl-0 = <&qup_uart15_default>;
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 0 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c8_data_clk>;
>                                 pinctrl-names = "default";
>
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
>                                 status = "disabled";
>                         };
> -               };
>
> -               gpi_dma1: dma-controller@a00000 {
> -                       compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
> -                       reg = <0 0x00a00000 0 0x60000>;
> +                       spi8: spi@880000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00880000 0 0x4000>;
>
> -                       interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +                               interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>
> -                       dma-channels = <12>;
> -                       dma-channel-mask = <0xc>;
> -                       #dma-cells = <3>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +                               clock-names = "se";
>
> -                       iommus = <&apps_smmu 0xb6 0>;
> -                       dma-coherent;
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 0 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
> +                               pinctrl-names = "default";
>
> -                       status = "disabled";
> -               };
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -               rng: rng@10c3000 {
> -                       compatible = "qcom,sm8650-trng", "qcom,trng";
> -                       reg = <0 0x010c3000 0 0x1000>;
> -               };
> +                               status = "disabled";
> +                       };
>
> -               ice: crypto@1d88000 {
> -                       compatible = "qcom,sm8650-inline-crypto-engine",
> -                                    "qcom,inline-crypto-engine";
> -                       reg = <0 0x01d88000 0 0x8000>;
> +                       i2c9: i2c@884000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00884000 0 0x4000>;
>
> -                       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> -               };
> +                               interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
>
> -               tcsr_mutex: hwlock@1f40000 {
> -                       compatible = "qcom,tcsr-mutex";
> -                       reg = <0 0x01f40000 0 0x20000>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +                               clock-names = "se";
>
> -                       #hwlock-cells = <1>;
> -               };
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 1 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c9_data_clk>;
> +                               pinctrl-names = "default";
>
> -               tcsr: clock-controller@1fc0000 {
> -                       compatible = "qcom,sm8650-tcsr", "syscon";
> -                       reg = <0 0x01fc0000 0 0xa0000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                               status = "disabled";
> +                       };
>
> -                       #clock-cells = <1>;
> -                       #reset-cells = <1>;
> -               };
> +                       spi9: spi@884000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00884000 0 0x4000>;
>
> -               gpucc: clock-controller@3d90000 {
> -                       compatible = "qcom,sm8650-gpucc";
> -                       reg = <0 0x03d90000 0 0xa000>;
> +                               interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
>
> -                       clocks = <&bi_tcxo_div2>,
> -                                <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> -                                <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +                               clock-names = "se";
>
> -                       #clock-cells = <1>;
> -                       #reset-cells = <1>;
> -                       #power-domain-cells = <1>;
> -               };
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 1 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
> +                               pinctrl-names = "default";
>
> -               dispcc: clock-controller@af00000 {
> -                       compatible = "qcom,sm8650-dispcc";
> -                       reg = <0 0x0af00000 0 0x20000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                       clocks = <&bi_tcxo_div2>,
> -                                <&bi_tcxo_ao_div2>,
> -                                <&gcc GCC_DISP_AHB_CLK>,
> -                                <&sleep_clk>,
> -                                <0>, /* dsi0 */
> -                                <0>,
> -                                <0>, /* dsi1 */
> -                                <0>,
> -                                <0>, /* dp0 */
> -                                <0>,
> -                                <0>, /* dp1 */
> -                                <0>,
> -                                <0>, /* dp2 */
> -                                <0>,
> -                                <0>, /* dp3 */
> -                                <0>;
> +                               status = "disabled";
> +                       };
>
> -                       power-domains = <&rpmhpd RPMHPD_MMCX>;
> -                       required-opps = <&rpmhpd_opp_low_svs>;
> +                       i2c10: i2c@888000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00888000 0 0x4000>;
>
> -                       #clock-cells = <1>;
> -                       #reset-cells = <1>;
> -                       #power-domain-cells = <1>;
> +                               interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
>
> -                       status = "disabled";
> -               };
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +                               clock-names = "se";
>
> -               usb_1_hsphy: phy@88e3000 {
> -                       compatible = "qcom,sm8650-snps-eusb2-phy",
> -                                    "qcom,sm8550-snps-eusb2-phy";
> -                       reg = <0 0x088e3000 0 0x154>;
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 2 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c10_data_clk>;
> +                               pinctrl-names = "default";
>
> -                       clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> -                       clock-names = "ref";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +                               status = "disabled";
> +                       };
>
> -                       #phy-cells = <0>;
> +                       spi10: spi@888000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00888000 0 0x4000>;
>
> -                       status = "disabled";
> -               };
> +                               interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
>
> -               usb_dp_qmpphy: phy@88e8000 {
> -                       compatible = "qcom,sm8650-qmp-usb3-dp-phy";
> -                       reg = <0 0x088e8000 0 0x3000>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +                               clock-names = "se";
>
> -                       clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> -                                <&rpmhcc RPMH_CXO_CLK>,
> -                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> -                                <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -                       clock-names = "aux",
> -                                     "ref",
> -                                     "com_aux",
> -                                     "usb3_pipe";
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 2 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
> +                               pinctrl-names = "default";
>
> -                       resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> -                                <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> -                       reset-names = "phy",
> -                                     "common";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                       power-domains = <&gcc USB3_PHY_GDSC>;
> +                               status = "disabled";
> +                       };
>
> -                       #clock-cells = <1>;
> -                       #phy-cells = <1>;
> +                       i2c11: i2c@88c000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x0088c000 0 0x4000>;
>
> -                       status = "disabled";
> -               };
> +                               interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
>
> -               usb_1: usb@a6f8800 {
> -                       compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
> -                       reg = <0 0x0a6f8800 0 0x400>;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +                               clock-names = "se";
>
> -                       interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> -                                             <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
> -                                             <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> -                                             <&pdc 14 IRQ_TYPE_EDGE_RISING>;
> -                       interrupt-names = "hs_phy_irq",
> -                                         "ss_phy_irq",
> -                                         "dm_hs_phy_irq",
> -                                         "dp_hs_phy_irq";
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 3 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c11_data_clk>;
> +                               pinctrl-names = "default";
>
> -                       clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> -                                <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> -                                <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> -                                <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> -                                <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -                                <&tcsr TCSR_USB3_CLKREF_EN>;
> -                       clock-names = "cfg_noc",
> -                                     "core",
> -                                     "iface",
> -                                     "sleep",
> -                                     "mock_utmi",
> -                                     "xo";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                       assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -                                         <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> -                       assigned-clock-rates = <19200000>, <200000000>;
> +                               status = "disabled";
> +                       };
>
> -                       resets = <&gcc GCC_USB30_PRIM_BCR>;
> +                       spi11: spi@88c000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x0088c000 0 0x4000>;
>
> -                       power-domains = <&gcc USB30_PRIM_GDSC>;
> -                       required-opps = <&rpmhpd_opp_nom>;
> +                               interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
>
> -                       #address-cells = <2>;
> -                       #size-cells = <2>;
> -                       ranges;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +                               clock-names = "se";
>
> -                       status = "disabled";
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 3 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
> +                               pinctrl-names = "default";
>
> -                       usb_1_dwc3: usb@a600000 {
> -                               compatible = "snps,dwc3";
> -                               reg = <0 0x0a600000 0 0xcd00>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
>
> -                               interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +                               status = "disabled";
> +                       };
>
> -                               iommus = <&apps_smmu 0x40 0>;
> +                       i2c12: i2c@890000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00890000 0 0x4000>;
>
> -                               phys = <&usb_1_hsphy>,
> -                                      <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> -                               phy-names = "usb2-phy",
> -                                           "usb3-phy";
> +                               interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
>
> -                               snps,hird-threshold = /bits/ 8 <0x0>;
> -                               snps,usb2-gadget-lpm-disable;
> -                               snps,dis_u2_susphy_quirk;
> -                               snps,dis_enblslpm_quirk;
> -                               snps,dis-u1-entry-quirk;
> -                               snps,dis-u2-entry-quirk;
> -                               snps,is-utmi-l1-suspend;
> -                               snps,usb3_lpm_capable;
> -                               snps,usb2-lpm-disable;
> -                               snps,has-lpm-erratum;
> -                               tx-fifo-resize;
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +                               clock-names = "se";
>
> -                               dma-coherent;
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 4 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c12_data_clk>;
> +                               pinctrl-names = "default";
>
> -                               ports {
> -                                       #address-cells = <1>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi12: spi@890000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00890000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 4 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c13: i2c@894000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00894000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
> +                                      <&gpi_dma2 1 5 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c13_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi13: spi@894000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00894000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
> +                                      <&gpi_dma2 1 5 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       uart14: serial@898000 {
> +                               compatible = "qcom,geni-uart";
> +                               reg = <0 0x00898000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
> +                               pinctrl-names = "default";
> +
> +                               status = "disabled";
> +                       };
> +
> +                       uart15: serial@89c000 {
> +                               compatible = "qcom,geni-debug-uart";
> +                               reg = <0 0x0089c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&qup_uart15_default>;
> +                               pinctrl-names = "default";
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               i2c_master_hub_0: geniqup@9c0000 {
> +                       compatible = "qcom,geni-se-i2c-master-hub";
> +                       reg = <0 0x009c0000 0 0x2000>;
> +
> +                       clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
> +                       clock-names = "s-ahb";
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       i2c_hub_0: i2c@980000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00980000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c0_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_1: i2c@984000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00984000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c1_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_2: i2c@988000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00988000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c2_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_3: i2c@98c000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x0098c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c3_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_4: i2c@990000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00990000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c4_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_5: i2c@994000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00994000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c5_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_6: i2c@998000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x00998000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c6_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_7: i2c@99c000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x0099c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c7_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_8: i2c@9a0000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x009a0000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c8_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c_hub_9: i2c@9a4000 {
> +                               compatible = "qcom,geni-i2c-master-hub";
> +                               reg = <0 0x009a4000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
> +                                        <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> +                               clock-names = "se",
> +                                             "core";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config";
> +
> +                               pinctrl-0 = <&hub_i2c9_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               gpi_dma1: dma-controller@a00000 {
> +                       compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
> +                       reg = <0 0x00a00000 0 0x60000>;
> +
> +                       interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       dma-channels = <12>;
> +                       dma-channel-mask = <0xc>;
> +                       #dma-cells = <3>;
> +
> +                       iommus = <&apps_smmu 0xb6 0>;
> +                       dma-coherent;
> +
> +                       status = "disabled";
> +               };
> +
> +               qupv3_id_0: geniqup@ac0000 {
> +                       compatible = "qcom,geni-se-qup";
> +                       reg = <0 0x00ac0000 0 0x2000>;
> +
> +                       clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       clock-names = "m-ahb",
> +                                     "s-ahb";
> +
> +                       interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                        &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "qup-core";
> +
> +                       iommus = <&apps_smmu 0xa3 0>;
> +
> +                       dma-coherent;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       i2c0: i2c@a80000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a80000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 0 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c0_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi0: spi@a80000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a80000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 0 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c1: i2c@a84000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a84000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 1 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c1_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi1: spi@a84000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a84000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 1 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c2: i2c@a88000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a88000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 2 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c2_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi2: spi@a88000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a88000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 2 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c3: i2c@a8c000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a8c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 3 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c3_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi3: spi@a8c000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a8c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 3 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c4: i2c@a90000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a90000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 4 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c4_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi4: spi@a90000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a90000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 4 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c5: i2c@a94000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a94000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 5 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c5_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi5: spi@a94000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a94000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 5 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c6: i2c@a98000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a98000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 6 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c6_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi6: spi@a98000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a98000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 6 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c7: i2c@a9c000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a9c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
> +                                      <&gpi_dma1 1 7 QCOM_GPI_I2C>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_i2c7_data_clk>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       spi7: spi@a9c000 {
> +                               compatible = "qcom,geni-spi";
> +                               reg = <0 0x00a9c000 0 0x4000>;
> +
> +                               interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
> +                               clock-names = "se";
> +
> +                               interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
> +                                                &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                                &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
> +                                               <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
> +                                                &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                               interconnect-names = "qup-core",
> +                                                    "qup-config",
> +                                                    "qup-memory";
> +
> +                               dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
> +                                      <&gpi_dma1 1 7 QCOM_GPI_SPI>;
> +                               dma-names = "tx",
> +                                           "rx";
> +
> +                               pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
> +                               pinctrl-names = "default";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               cnoc_main: interconnect@1500000 {
> +                       compatible = "qcom,sm8650-cnoc-main";
> +                       reg = <0 0x01500000 0 0x14080>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               config_noc: interconnect@1600000 {
> +                       compatible = "qcom,sm8650-config-noc";
> +                       reg = <0 0x01600000 0 0x6200>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               system_noc: interconnect@1680000 {
> +                       compatible = "qcom,sm8650-system-noc";
> +                       reg = <0 0x01680000 0 0x1d080>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               pcie_noc: interconnect@16c0000 {
> +                       compatible = "qcom,sm8650-pcie-anoc";
> +                       reg = <0 0x016c0000 0 0x12200>;
> +
> +                       clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +                                <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               aggre1_noc: interconnect@16e0000 {
> +                       compatible = "qcom,sm8650-aggre1-noc";
> +                       reg = <0 0x016e0000 0 0x16400>;
> +
> +                       clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +                                <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               aggre2_noc: interconnect@1700000 {
> +                       compatible = "qcom,sm8650-aggre2-noc";
> +                       reg = <0 0x01700000 0 0x1e400>;
> +
> +                       clocks = <&rpmhcc RPMH_IPA_CLK>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               mmss_noc: interconnect@1780000 {
> +                       compatible = "qcom,sm8650-mmss-noc";
> +                       reg = <0 0x01780000 0 0x5b800>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               rng: rng@10c3000 {
> +                       compatible = "qcom,sm8650-trng", "qcom,trng";
> +                       reg = <0 0x010c3000 0 0x1000>;
> +               };
> +
> +               pcie0: pci@1c00000 {
> +                       device_type = "pci";
> +                       compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
> +                       reg = <0 0x01c00000 0 0x3000>,
> +                             <0 0x60000000 0 0xf1d>,
> +                             <0 0x60000f20 0 0xa8>,
> +                             <0 0x60001000 0 0x1000>,
> +                             <0 0x60100000 0 0x100000>;
> +                       reg-names = "parf", "dbi", "elbi", "atu", "config";
> +
> +                       interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "msi";
> +
> +                       clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +                                <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +                                <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +                                <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +                                <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +                                <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +                                <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +                                <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +                       clock-names = "aux",
> +                                     "cfg",
> +                                     "bus_master",
> +                                     "bus_slave",
> +                                     "slave_q2a",
> +                                     "ddrss_sf_tbu",
> +                                     "noc_aggr",
> +                                     "cnoc_sf_axi";
> +
> +                       resets = <&gcc GCC_PCIE_0_BCR>;
> +                       reset-names = "pci";
> +
> +                       interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                                       <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "pcie-mem",
> +                                            "cpu-pcie";
> +
> +                       power-domains = <&gcc PCIE_0_GDSC>;
> +
> +                       iommu-map = <0     &apps_smmu 0x1400 0x1>,
> +                                   <0x100 &apps_smmu 0x1401 0x1>;
> +
> +                       interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-map-mask = <0 0 0 0x7>;
> +                       #interrupt-cells = <1>;
> +
> +                       linux,pci-domain = <0>;
> +                       num-lanes = <2>;
> +                       bus-range = <0 0xff>;
> +
> +                       phys = <&pcie0_phy>;
> +                       phy-names = "pciephy";
> +
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
> +                                <0x02000000 0 0x60300000 0 0x60300000 0 0x3d00000>;
> +
> +                       dma-coherent;
> +
> +                       status = "disabled";
> +               };
> +
> +               pcie0_phy: phy@1c06000 {
> +                       compatible = "qcom,sm8650-qmp-gen3x2-pcie-phy";
> +                       reg = <0 0x01c06000 0 0x2000>;
> +
> +                       clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +                                <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +                                <&tcsr TCSR_PCIE_0_CLKREF_EN>,
> +                                <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
> +                                <&gcc GCC_PCIE_0_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "cfg_ahb",
> +                                     "ref",
> +                                     "rchng",
> +                                     "pipe";
> +
> +                       assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
> +                       assigned-clock-rates = <100000000>;
> +
> +                       resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> +                       reset-names = "phy";
> +
> +                       power-domains = <&gcc PCIE_0_PHY_GDSC>;
> +
> +                       #clock-cells = <0>;
> +                       clock-output-names = "pcie0_pipe_clk";
> +
> +                       #phy-cells = <0>;
> +
> +                       status = "disabled";
> +               };
> +
> +               pcie1: pci@1c08000 {
> +                       device_type = "pci";
> +                       compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
> +                       reg = <0 0x01c08000 0 0x3000>,
> +                             <0 0x40000000 0 0xf1d>,
> +                             <0 0x40000f20 0 0xa8>,
> +                             <0 0x40001000 0 0x1000>,
> +                             <0 0x40100000 0 0x100000>;
> +                       reg-names = "parf",
> +                                   "dbi",
> +                                   "elbi",
> +                                   "atu",
> +                                   "config";
> +
> +                       interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "msi";
> +
> +                       clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +                                <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +                                <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +                                <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +                                <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +                                <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +                                <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +                                <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +                       clock-names = "aux",
> +                                     "cfg",
> +                                     "bus_master",
> +                                     "bus_slave",
> +                                     "slave_q2a",
> +                                     "ddrss_sf_tbu",
> +                                     "noc_aggr",
> +                                     "cnoc_sf_axi";
> +
> +                       assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> +                       assigned-clock-rates = <19200000>;
> +
> +                       resets = <&gcc GCC_PCIE_1_BCR>,
> +                                <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> +                       reset-names = "pci",
> +                                     "link_down";
> +
> +                       interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                                       <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "pcie-mem",
> +                                            "cpu-pcie";
> +
> +                       power-domains = <&gcc PCIE_1_GDSC>;
> +
> +                       iommu-map = <0     &apps_smmu 0x1480 0x1>,
> +                                   <0x100 &apps_smmu 0x1481 0x1>;
> +
> +                       interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-map-mask = <0 0 0 0x7>;
> +                       #interrupt-cells = <1>;
> +
> +                       linux,pci-domain = <1>;
> +                       num-lanes = <2>;
> +                       bus-range = <0 0xff>;
> +
> +                       phys = <&pcie1_phy>;
> +                       phy-names = "pciephy";
> +
> +                       dma-coherent;
> +
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> +                                <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
> +
> +                       status = "disabled";
> +               };
> +
> +               pcie1_phy: phy@1c0e000 {
> +                       compatible = "qcom,sm8650-qmp-gen4x2-pcie-phy";
> +                       reg = <0 0x01c0e000 0 0x2000>;
> +
> +                       clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
> +                                <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +                                <&tcsr TCSR_PCIE_1_CLKREF_EN>,
> +                                <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
> +                                <&gcc GCC_PCIE_1_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "cfg_ahb",
> +                                     "ref",
> +                                     "rchng",
> +                                     "pipe";
> +
> +                       assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
> +                       assigned-clock-rates = <100000000>;
> +
> +                       resets = <&gcc GCC_PCIE_1_PHY_BCR>,
> +                                <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
> +                       reset-names = "phy",
> +                                     "phy_nocsr";
> +
> +                       power-domains = <&gcc PCIE_1_PHY_GDSC>;
> +
> +                       #clock-cells = <0>;
> +                       clock-output-names = "pcie1_pipe_clk";
> +
> +                       #phy-cells = <0>;
> +
> +                       status = "disabled";
> +               };
> +
> +               cryptobam: dma-controller@1dc4000 {
> +                       compatible = "qcom,bam-v1.7.0";
> +                       reg = <0 0x01dc4000 0 0x28000>;
> +
> +                       interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       #dma-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x480 0>,
> +                                <&apps_smmu 0x481 0>;
> +
> +                       qcom,ee = <0>;
> +                       qcom,controlled-remotely;
> +               };
> +
> +               crypto: crypto@1dfa000 {
> +                       compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
> +                       reg = <0 0x01dfa000 0 0x6000>;
> +
> +                       interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "memory";
> +
> +                       dmas = <&cryptobam 4>, <&cryptobam 5>;
> +                       dma-names = "rx", "tx";
> +
> +                       iommus = <&apps_smmu 0x480 0>,
> +                                <&apps_smmu 0x481 0>;
> +               };
> +
> +               ufs_mem_phy: phy@1d80000 {
> +                       compatible = "qcom,sm8650-qmp-ufs-phy";
> +                       reg = <0 0x01d80000 0 0x2000>;
> +
> +                       clocks = <&tcsr TCSR_UFS_CLKREF_EN>,
> +                                <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +                       clock-names = "ref",
> +                                     "ref_aux";
> +
> +                       resets = <&ufs_mem_hc 0>;
> +                       reset-names = "ufsphy";
> +
> +                       power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> +
> +                       #clock-cells = <1>;
> +                       #phy-cells = <0>;
> +
> +                       status = "disabled";
> +               };
> +
> +               ufs_mem_hc: ufs@1d84000 {
> +                       compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +                       reg = <0 0x01d84000 0 0x3000>;
> +
> +                       interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +                                <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +                                <&gcc GCC_UFS_PHY_AHB_CLK>,
> +                                <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +                                <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> +                                <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +                                <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +                                <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +                       clock-names = "core_clk",
> +                                     "bus_aggr_clk",
> +                                     "iface_clk",
> +                                     "core_clk_unipro",
> +                                     "ref_clk",
> +                                     "tx_lane0_sync_clk",
> +                                     "rx_lane0_sync_clk",
> +                                     "rx_lane1_sync_clk";
> +                       freq-table-hz = <100000000 403000000>,
> +                                       <0 0>,
> +                                       <0 0>,
> +                                       <100000000 403000000>,
> +                                       <100000000 403000000>,
> +                                       <0 0>,
> +                                       <0 0>,
> +                                       <0 0>;
> +
> +                       resets = <&gcc GCC_UFS_PHY_BCR>;
> +                       reset-names = "rst";
> +
> +                       interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                                       <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "ufs-ddr",
> +                                            "cpu-ufs";
> +
> +                       power-domains = <&gcc UFS_PHY_GDSC>;
> +                       required-opps = <&rpmhpd_opp_nom>;
> +
> +                       iommus = <&apps_smmu 0x60 0>;
> +
> +                       lanes-per-direction = <2>;
> +                       qcom,ice = <&ice>;
> +
> +                       phys = <&ufs_mem_phy>;
> +                       phy-names = "ufsphy";
> +
> +                       #reset-cells = <1>;
> +
> +                       status = "disabled";
> +               };
> +
> +               ice: crypto@1d88000 {
> +                       compatible = "qcom,sm8650-inline-crypto-engine",
> +                                    "qcom,inline-crypto-engine";
> +                       reg = <0 0x01d88000 0 0x8000>;
> +
> +                       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +               };
> +
> +               tcsr_mutex: hwlock@1f40000 {
> +                       compatible = "qcom,tcsr-mutex";
> +                       reg = <0 0x01f40000 0 0x20000>;
> +
> +                       #hwlock-cells = <1>;
> +               };
> +
> +               tcsr: clock-controller@1fc0000 {
> +                       compatible = "qcom,sm8650-tcsr", "syscon";
> +                       reg = <0 0x01fc0000 0 0xa0000>;
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +               };
> +
> +               gpucc: clock-controller@3d90000 {
> +                       compatible = "qcom,sm8650-gpucc";
> +                       reg = <0 0x03d90000 0 0xa000>;
> +
> +                       clocks = <&bi_tcxo_div2>,
> +                                <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +                                <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               remoteproc_mpss: remoteproc@4080000 {
> +                       compatible = "qcom,sm8650-mpss-pas";
> +                       reg = <0 0x04080000 0 0x4040>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "wdog",
> +                                         "fatal",
> +                                         "ready",
> +                                         "handover",
> +                                         "stop-ack",
> +                                         "shutdown-ack";
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "xo";
> +
> +                       interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +                       power-domains = <&rpmhpd RPMHPD_CX>,
> +                                       <&rpmhpd RPMHPD_MSS>;
> +                       power-domain-names = "cx",
> +                                            "mss";
> +
> +                       memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
> +                                       <&mpss_dsm_mem>, <&mpss_dsm_mem_2>;
> +
> +                       qcom,qmp = <&aoss_qmp>;
> +
> +                       qcom,smem-states = <&smp2p_modem_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       status = "disabled";
> +
> +                       glink-edge {
> +                               interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
> +                                                            IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                                            IRQ_TYPE_EDGE_RISING>;
> +
> +                               mboxes = <&ipcc IPCC_CLIENT_MPSS
> +                                               IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +                               qcom,remote-pid = <1>;
> +
> +                               label = "mpss";
> +                       };
> +               };
> +
> +               lpass_lpiaon_noc: interconnect@7400000 {
> +                       compatible = "qcom,sm8650-lpass-lpiaon-noc";
> +                       reg = <0 0x07400000 0 0x19080>;
> +
> +                       #interconnect-cells = <2>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               lpass_lpicx_noc: interconnect@7430000 {
> +                       compatible = "qcom,sm8650-lpass-lpicx-noc";
> +                       reg = <0 0x07430000 0 0x3a200>;
> +
> +                       #interconnect-cells = <2>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               lpass_ag_noc: interconnect@7e40000 {
> +                       compatible = "qcom,sm8650-lpass-ag-noc";
> +                       reg = <0 0x07e40000 0 0xe080>;
> +
> +                       #interconnect-cells = <2>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               sdhc_2: mmc@8804000 {
> +                       compatible = "qcom,sm8650-sdhci", "qcom,sdhci-msm-v5";
> +                       reg = <0 0x08804000 0 0x1000>;
> +
> +                       interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hc_irq",
> +                                         "pwr_irq";
> +
> +                       clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +                                <&gcc GCC_SDCC2_APPS_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface",
> +                                     "core",
> +                                     "xo";
> +
> +                       interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                                       <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "sdhc-ddr",
> +                                            "cpu-sdhc";
> +
> +                       power-domains = <&rpmhpd RPMHPD_CX>;
> +                       operating-points-v2 = <&sdhc2_opp_table>;
> +
> +                       iommus = <&apps_smmu 0x540 0>;
> +
> +                       bus-width = <4>;
> +
> +                       /* Forbid SDR104/SDR50 - broken hw! */
> +                       sdhci-caps-mask = <0x3 0>;
> +
> +                       qcom,dll-config = <0x0007642c>;
> +                       qcom,ddr-config = <0x80040868>;
> +
> +                       dma-coherent;
> +
> +                       status = "disabled";
> +
> +                       sdhc2_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-19200000 {
> +                                       opp-hz = /bits/ 64 <19200000>;
> +                                       required-opps = <&rpmhpd_opp_min_svs>;
> +                               };
> +
> +                               opp-50000000 {
> +                                       opp-hz = /bits/ 64 <50000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-100000000 {
> +                                       opp-hz = /bits/ 64 <100000000>;
> +                                       required-opps = <&rpmhpd_opp_svs>;
> +                               };
> +
> +                               opp-202000000 {
> +                                       opp-hz = /bits/ 64 <202000000>;
> +                                       required-opps = <&rpmhpd_opp_svs_l1>;
> +                               };
> +                       };
> +               };
> +
> +               mdss: display-subsystem@ae00000 {
> +                       compatible = "qcom,sm8650-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +                       resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +                       interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> +                                        &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
> +                                       <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +                       interconnect-names = "mdp0-mem",
> +                                            "mdp1-mem";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;
> +
> +                       iommus = <&apps_smmu 0x1c00 0x2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       mdss_mdp: display-controller@ae01000 {
> +                               compatible = "qcom,sm8650-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>;
> +                               reg-names = "mdp",
> +                                           "vbif";
> +
> +                               interrupts-extended = <&mdss 0>;
> +
> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "nrt_bus",
> +                                             "iface",
> +                                             "lut",
> +                                             "core",
> +                                             "vsync";
> +
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <19200000>;
> +
> +                               operating-points-v2 = <&mdp_opp_table>;
> +
> +                               power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint = <&mdss_dsi0_in>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +
> +                                               dpu_intf2_out: endpoint {
> +                                                       remote-endpoint = <&mdss_dsi1_in>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               mdp_opp_table: opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-200000000 {
> +                                               opp-hz = /bits/ 64 <200000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-325000000 {
> +                                               opp-hz = /bits/ 64 <325000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-375000000 {
> +                                               opp-hz = /bits/ 64 <375000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-514000000 {
> +                                               opp-hz = /bits/ 64 <514000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +
> +                       mdss_dsi0: dsi@ae94000 {
> +                               compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupts-extended = <&mdss 4>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +                               assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +                                                        <&mdss_dsi0_phy 1>;
> +
> +                               operating-points-v2 = <&mdss_dsi_opp_table>;
> +
> +                               power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +                               phys = <&mdss_dsi0_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +
> +                                               mdss_dsi0_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +
> +                                               mdss_dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +
> +                               mdss_dsi_opp_table: opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-187500000 {
> +                                               opp-hz = /bits/ 64 <187500000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-300000000 {
> +                                               opp-hz = /bits/ 64 <300000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-358000000 {
> +                                               opp-hz = /bits/ 64 <358000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       mdss_dsi0_phy: phy@ae95000 {
> +                               compatible = "qcom,sm8650-dsi-phy-4nm";
> +                               reg = <0 0x0ae95000 0 0x200>,
> +                                     <0 0x0ae95200 0 0x280>,
> +                                     <0 0x0ae95500 0 0x400>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface",
> +                                             "ref";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       mdss_dsi1: dsi@ae96000 {
> +                               compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae96000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupts-extended = <&mdss 5>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +                               assigned-clock-parents = <&mdss_dsi1_phy 0>,
> +                                                        <&mdss_dsi1_phy 1>;
> +
> +                               operating-points-v2 = <&mdss_dsi_opp_table>;
> +
> +                               power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +                               phys = <&mdss_dsi1_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +
> +                                               mdss_dsi1_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf2_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +
> +                                               mdss_dsi1_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       mdss_dsi1_phy: phy@ae97000 {
> +                               compatible = "qcom,sm8650-dsi-phy-4nm";
> +                               reg = <0 0x0ae97000 0 0x200>,
> +                                     <0 0x0ae97200 0 0x280>,
> +                                     <0 0x0ae97500 0 0x400>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface",
> +                                             "ref";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               dispcc: clock-controller@af00000 {
> +                       compatible = "qcom,sm8650-dispcc";
> +                       reg = <0 0x0af00000 0 0x20000>;
> +
> +                       clocks = <&bi_tcxo_div2>,
> +                                <&bi_tcxo_ao_div2>,
> +                                <&gcc GCC_DISP_AHB_CLK>,
> +                                <&sleep_clk>,
> +                                <&mdss_dsi0_phy 0>,
> +                                <&mdss_dsi0_phy 1>,
> +                                <&mdss_dsi1_phy 0>,
> +                                <&mdss_dsi1_phy 1>,
> +                                <0>, /* dp0 */
> +                                <0>,
> +                                <0>, /* dp1 */
> +                                <0>,
> +                                <0>, /* dp2 */
> +                                <0>,
> +                                <0>, /* dp3 */
> +                                <0>;
> +
> +                       power-domains = <&rpmhpd RPMHPD_MMCX>;
> +                       required-opps = <&rpmhpd_opp_low_svs>;
> +
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +
> +                       status = "disabled";
> +               };
> +
> +               usb_1_hsphy: phy@88e3000 {
> +                       compatible = "qcom,sm8650-snps-eusb2-phy",
> +                                    "qcom,sm8550-snps-eusb2-phy";
> +                       reg = <0 0x088e3000 0 0x154>;
> +
> +                       clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> +                       clock-names = "ref";
> +
> +                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +                       #phy-cells = <0>;
> +
> +                       status = "disabled";
> +               };
> +
> +               usb_dp_qmpphy: phy@88e8000 {
> +                       compatible = "qcom,sm8650-qmp-usb3-dp-phy";
> +                       reg = <0 0x088e8000 0 0x3000>;
> +
> +                       clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>,
> +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +                                <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "ref",
> +                                     "com_aux",
> +                                     "usb3_pipe";
> +
> +                       resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +                                <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +                       reset-names = "phy",
> +                                     "common";
> +
> +                       power-domains = <&gcc USB3_PHY_GDSC>;
> +
> +                       #clock-cells = <1>;
> +                       #phy-cells = <1>;
> +
> +                       status = "disabled";
> +               };
> +
> +               usb_1: usb@a6f8800 {
> +                       compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
> +                       reg = <0 0x0a6f8800 0 0x400>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 15 IRQ_TYPE_EDGE_RISING>,
> +                                             <&pdc 14 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "hs_phy_irq",
> +                                         "ss_phy_irq",
> +                                         "dm_hs_phy_irq",
> +                                         "dp_hs_phy_irq";
> +
> +                       clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +                                <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +                                <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +                                <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +                                <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                                <&tcsr TCSR_USB3_CLKREF_EN>;
> +                       clock-names = "cfg_noc",
> +                                     "core",
> +                                     "iface",
> +                                     "sleep",
> +                                     "mock_utmi",
> +                                     "xo";
> +
> +                       assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +                                         <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +                       assigned-clock-rates = <19200000>, <200000000>;
> +
> +                       resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +                       power-domains = <&gcc USB30_PRIM_GDSC>;
> +                       required-opps = <&rpmhpd_opp_nom>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       usb_1_dwc3: usb@a600000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0 0x0a600000 0 0xcd00>;
> +
> +                               interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               iommus = <&apps_smmu 0x40 0>;
> +
> +                               phys = <&usb_1_hsphy>,
> +                                      <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +                               phy-names = "usb2-phy",
> +                                           "usb3-phy";
> +
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,usb2-gadget-lpm-disable;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_enblslpm_quirk;
> +                               snps,dis-u1-entry-quirk;
> +                               snps,dis-u2-entry-quirk;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,usb3_lpm_capable;
> +                               snps,usb2-lpm-disable;
> +                               snps,has-lpm-erratum;
> +                               tx-fifo-resize;
> +
> +                               dma-coherent;
> +
> +                               ports {
> +                                       #address-cells = <1>;
>                                         #size-cells = <0>;
>
>                                         port@0 {
> @@ -969,115 +3155,602 @@ pdc: interrupt-controller@b220000 {
>                                           <125 63 1>, <126 716 12>,
>                                           <138 251 5>, <143 244 4>;
>
> -                       #interrupt-cells = <2>;
> -                       interrupt-controller;
> -               };
> +                       #interrupt-cells = <2>;
> +                       interrupt-controller;
> +               };
> +
> +               tsens0: thermal-sensor@c228000 {
> +                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> +                       reg = <0 0x0c228000 0 0x1000>, /* TM */
> +                             <0 0x0c222000 0 0x1000>; /* SROT */
> +
> +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow",
> +                                         "critical";
> +
> +                       #qcom,sensors = <15>;
> +
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
> +               tsens1: thermal-sensor@c229000 {
> +                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> +                       reg = <0 0x0c229000 0 0x1000>, /* TM */
> +                             <0 0x0c223000 0 0x1000>; /* SROT */
> +
> +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow",
> +                                         "critical";
> +
> +                       #qcom,sensors = <16>;
> +
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
> +               tsens2: thermal-sensor@c22a000 {
> +                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> +                       reg = <0 0x0c22a000 0 0x1000>, /* TM */
> +                             <0 0x0c224000 0 0x1000>; /* SROT */
> +
> +                       interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow",
> +                                         "critical";
> +
> +                       #qcom,sensors = <13>;
> +
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
> +               aoss_qmp: power-management@c300000 {
> +                       compatible = "qcom,sm8650-aoss-qmp", "qcom,aoss-qmp";
> +                       reg = <0 0x0c300000 0 0x400>;
> +
> +                       interrupt-parent = <&ipcc>;
> +                       interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                                    IRQ_TYPE_EDGE_RISING>;
> +
> +                       mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +                       #clock-cells = <0>;
> +               };
> +
> +               sram@c3f0000 {
> +                       compatible = "qcom,rpmh-stats";
> +                       reg = <0 0x0c3f0000 0 0x400>;
> +               };
> +
> +               spmi_bus: spmi@c400000 {
> +                       compatible = "qcom,spmi-pmic-arb";
> +                       reg = <0 0x0c400000 0 0x3000>,
> +                             <0 0x0c500000 0 0x4000000>,
> +                             <0 0x0c440000 0 0x80000>,
> +                             <0 0x0c4c0000 0 0x20000>,
> +                             <0 0x0c42d000 0 0x4000>;
> +                       reg-names = "core",
> +                                   "chnls",
> +                                   "obsrvr",
> +                                   "intr",
> +                                   "cnfg";
> +
> +                       interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "periph_irq";
> +
> +                       qcom,ee = <0>;
> +                       qcom,channel = <0>;
> +                       qcom,bus-id = <0>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <4>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <0>;
> +               };
> +
> +               tlmm: pinctrl@f100000 {
> +                       compatible = "qcom,sm8650-tlmm";
> +                       reg = <0 0x0f100000 0 0x300000>;
> +
> +                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +
> +                       gpio-ranges = <&tlmm 0 0 211>;
> +
> +                       wakeup-parent = <&pdc>;
> +
> +                       hub_i2c0_data_clk: hub-i2c0-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio64", "gpio65";
> +                               function = "i2chub0_se0";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c1_data_clk: hub-i2c1-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio66", "gpio67";
> +                               function = "i2chub0_se1";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c2_data_clk: hub-i2c2-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio68", "gpio69";
> +                               function = "i2chub0_se2";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c3_data_clk: hub-i2c3-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio70", "gpio71";
> +                               function = "i2chub0_se3";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c4_data_clk: hub-i2c4-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio72", "gpio73";
> +                               function = "i2chub0_se4";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c5_data_clk: hub-i2c5-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio74", "gpio75";
> +                               function = "i2chub0_se5";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c6_data_clk: hub-i2c6-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio76", "gpio77";
> +                               function = "i2chub0_se6";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c7_data_clk: hub-i2c7-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio78", "gpio79";
> +                               function = "i2chub0_se7";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c8_data_clk: hub-i2c8-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio206", "gpio207";
> +                               function = "i2chub0_se8";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hub_i2c9_data_clk: hub-i2c9-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio80", "gpio81";
> +                               function = "i2chub0_se9";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       pcie0_default_state: pcie0-default-state {
> +                               perst-pins {
> +                                       pins = "gpio94";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               clkreq-pins {
> +                                       pins = "gpio95";
> +                                       function = "pcie0_clk_req_n";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               wake-pins {
> +                                       pins = "gpio96";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       pcie1_default_state: pcie1-default-state {
> +                               perst-pins {
> +                                       pins = "gpio97";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               clkreq-pins {
> +                                       pins = "gpio98";
> +                                       function = "pcie1_clk_req_n";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               wake-pins {
> +                                       pins = "gpio99";
> +                                       function = "gpio";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       qup_i2c0_data_clk: qup-i2c0-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio32", "gpio33";
> +                               function = "qup1_se0";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c1_data_clk: qup-i2c1-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio36", "gpio37";
> +                               function = "qup1_se1";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c2_data_clk: qup-i2c2-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio40", "gpio41";
> +                               function = "qup1_se2";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c3_data_clk: qup-i2c3-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio44", "gpio45";
> +                               function = "qup1_se3";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c4_data_clk: qup-i2c4-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio48", "gpio49";
> +                               function = "qup1_se4";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c5_data_clk: qup-i2c5-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio52", "gpio53";
> +                               function = "qup1_se5";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c6_data_clk: qup-i2c6-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio56", "gpio57";
> +                               function = "qup1_se6";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c7_data_clk: qup-i2c7-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio60", "gpio61";
> +                               function = "qup1_se7";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c8_data_clk: qup-i2c8-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio0", "gpio1";
> +                               function = "qup2_se0";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c9_data_clk: qup-i2c9-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio4", "gpio5";
> +                               function = "qup2_se1";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c10_data_clk: qup-i2c10-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio8", "gpio9";
> +                               function = "qup2_se2";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c11_data_clk: qup-i2c11-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio12", "gpio13";
> +                               function = "qup2_se3";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c12_data_clk: qup-i2c12-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio16", "gpio17";
> +                               function = "qup2_se4";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c13_data_clk: qup-i2c13-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio20", "gpio21";
> +                               function = "qup2_se5";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_i2c14_data_clk: qup-i2c14-data-clk-state {
> +                               /* SDA, SCL */
> +                               pins = "gpio24", "gpio25";
> +                               function = "qup2_se6";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       qup_spi0_cs: qup-spi0-cs-state {
> +                               pins = "gpio35";
> +                               function = "qup1_se0";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
> +
> +                       qup_spi0_data_clk: qup-spi0-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio32", "gpio33", "gpio34";
> +                               function = "qup1_se0";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
> +
> +                       qup_spi1_cs: qup-spi1-cs-state {
> +                               pins = "gpio39";
> +                               function = "qup1_se1";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
> +
> +                       qup_spi1_data_clk: qup-spi1-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio36", "gpio37", "gpio38";
> +                               function = "qup1_se1";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               tsens0: thermal-sensor@c228000 {
> -                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> -                       reg = <0 0x0c228000 0 0x1000>, /* TM */
> -                             <0 0x0c222000 0 0x1000>; /* SROT */
> +                       qup_spi2_cs: qup-spi2-cs-state {
> +                               pins = "gpio43";
> +                               function = "qup1_se2";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "uplow",
> -                                         "critical";
> +                       qup_spi2_data_clk: qup-spi2-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio40", "gpio41", "gpio42";
> +                               function = "qup1_se2";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #qcom,sensors = <15>;
> +                       qup_spi3_cs: qup-spi3-cs-state {
> +                               pins = "gpio47";
> +                               function = "qup1_se3";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #thermal-sensor-cells = <1>;
> -               };
> +                       qup_spi3_data_clk: qup-spi3-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio44", "gpio45", "gpio46";
> +                               function = "qup1_se3";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               tsens1: thermal-sensor@c229000 {
> -                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> -                       reg = <0 0x0c229000 0 0x1000>, /* TM */
> -                             <0 0x0c223000 0 0x1000>; /* SROT */
> +                       qup_spi4_cs: qup-spi4-cs-state {
> +                               pins = "gpio51";
> +                               function = "qup1_se4";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "uplow",
> -                                         "critical";
> +                       qup_spi4_data_clk: qup-spi4-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio48", "gpio49", "gpio50";
> +                               function = "qup1_se4";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #qcom,sensors = <16>;
> +                       qup_spi5_cs: qup-spi5-cs-state {
> +                               pins = "gpio55";
> +                               function = "qup1_se5";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #thermal-sensor-cells = <1>;
> -               };
> +                       qup_spi5_data_clk: qup-spi5-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio52", "gpio53", "gpio54";
> +                               function = "qup1_se5";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               tsens2: thermal-sensor@c22a000 {
> -                       compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
> -                       reg = <0 0x0c22a000 0 0x1000>, /* TM */
> -                             <0 0x0c224000 0 0x1000>; /* SROT */
> +                       qup_spi6_cs: qup-spi6-cs-state {
> +                               pins = "gpio59";
> +                               function = "qup1_se6";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "uplow",
> -                                         "critical";
> +                       qup_spi6_data_clk: qup-spi6-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio56", "gpio57", "gpio58";
> +                               function = "qup1_se6";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #qcom,sensors = <13>;
> +                       qup_spi7_cs: qup-spi7-cs-state {
> +                               pins = "gpio63";
> +                               function = "qup1_se7";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #thermal-sensor-cells = <1>;
> -               };
> +                       qup_spi7_data_clk: qup-spi7-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio60", "gpio61", "gpio62";
> +                               function = "qup1_se7";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               aoss_qmp: power-management@c300000 {
> -                       compatible = "qcom,sm8650-aoss-qmp", "qcom,aoss-qmp";
> -                       reg = <0 0x0c300000 0 0x400>;
> +                       qup_spi8_cs: qup-spi8-cs-state {
> +                               pins = "gpio3";
> +                               function = "qup2_se0";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupt-parent = <&ipcc>;
> -                       interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
> -                                                    IRQ_TYPE_EDGE_RISING>;
> +                       qup_spi8_data_clk: qup-spi8-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio0", "gpio1", "gpio2";
> +                               function = "qup2_se0";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +                       qup_spi9_cs: qup-spi9-cs-state {
> +                               pins = "gpio7";
> +                               function = "qup2_se1";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #clock-cells = <0>;
> -               };
> +                       qup_spi9_data_clk: qup-spi9-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio4", "gpio5", "gpio6";
> +                               function = "qup2_se1";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               sram@c3f0000 {
> -                       compatible = "qcom,rpmh-stats";
> -                       reg = <0 0x0c3f0000 0 0x400>;
> -               };
> +                       qup_spi10_cs: qup-spi10-cs-state {
> +                               pins = "gpio11";
> +                               function = "qup2_se2";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               spmi_bus: spmi@c400000 {
> -                       compatible = "qcom,spmi-pmic-arb";
> -                       reg = <0 0x0c400000 0 0x3000>,
> -                             <0 0x0c500000 0 0x4000000>,
> -                             <0 0x0c440000 0 0x80000>,
> -                             <0 0x0c4c0000 0 0x20000>,
> -                             <0 0x0c42d000 0 0x4000>;
> -                       reg-names = "core",
> -                                   "chnls",
> -                                   "obsrvr",
> -                                   "intr",
> -                                   "cnfg";
> +                       qup_spi10_data_clk: qup-spi10-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio8", "gpio9", "gpio10";
> +                               function = "qup2_se2";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "periph_irq";
> +                       qup_spi11_cs: qup-spi11-cs-state {
> +                               pins = "gpio15";
> +                               function = "qup2_se3";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       qcom,ee = <0>;
> -                       qcom,channel = <0>;
> -                       qcom,bus-id = <0>;
> +                       qup_spi11_data_clk: qup-spi11-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio12", "gpio13", "gpio14";
> +                               function = "qup2_se3";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupt-controller;
> -                       #interrupt-cells = <4>;
> +                       qup_spi12_cs: qup-spi12-cs-state {
> +                               pins = "gpio19";
> +                               function = "qup2_se4";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       #address-cells = <2>;
> -                       #size-cells = <0>;
> -               };
> +                       qup_spi12_data_clk: qup-spi12-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio16", "gpio17", "gpio18";
> +                               function = "qup2_se4";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -               tlmm: pinctrl@f100000 {
> -                       compatible = "qcom,sm8650-tlmm";
> -                       reg = <0 0x0f100000 0 0x300000>;
> +                       qup_spi13_cs: qup-spi13-cs-state {
> +                               pins = "gpio23";
> +                               function = "qup2_se5";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       qup_spi13_data_clk: qup-spi13-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio20", "gpio21", "gpio22";
> +                               function = "qup2_se5";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       gpio-controller;
> -                       #gpio-cells = <2>;
> +                       qup_spi14_cs: qup-spi14-cs-state {
> +                               pins = "gpio27";
> +                               function = "qup2_se6";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       interrupt-controller;
> -                       #interrupt-cells = <2>;
> +                       qup_spi14_data_clk: qup-spi14-data-clk-state {
> +                               /* MISO, MOSI, CLK */
> +                               pins = "gpio24", "gpio25", "gpio26";
> +                               function = "qup2_se6";
> +                               drive-strength = <6>;
> +                               bias-disable;
> +                       };
>
> -                       gpio-ranges = <&tlmm 0 0 211>;
> +                       qup_uart14_default: qup-uart14-default-state {
> +                               /* TX, RX */
> +                               pins = "gpio26", "gpio27";
> +                               function = "qup2_se6";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
>
> -                       wakeup-parent = <&pdc>;
> +                       qup_uart14_cts_rts: qup-uart14-cts-rts-state {
> +                               /* CTS, RTS */
> +                               pins = "gpio24", "gpio25";
> +                               function = "qup2_se6";
> +                               drive-strength = <2>;
> +                               bias-pull-down;
> +                       };
>
>                         qup_uart15_default: qup-uart15-default-state {
>                                 /* TX, RX */
> @@ -1086,6 +3759,46 @@ qup_uart15_default: qup-uart15-default-state {
>                                 drive-strength = <2>;
>                                 bias-disable;
>                         };
> +
> +                       sdc2_sleep: sdc2-sleep-state {
> +                               clk-pins {
> +                                       pins = "sdc2_clk";
> +                                       drive-strength = <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               cmd-pins {
> +                                       pins = "sdc2_cmd";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               data-pins {
> +                                       pins = "sdc2_data";
> +                                       drive-strength = <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       sdc2_default: sdc2-default-state {
> +                               clk-pins {
> +                                       pins = "sdc2_clk";
> +                                       drive-strength = <16>;
> +                                       bias-disable;
> +                               };
> +
> +                               cmd-pins {
> +                                       pins = "sdc2_cmd";
> +                                       drive-strength = <10>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               data-pins {
> +                                       pins = "sdc2_data";
> +                                       drive-strength = <10>;
> +                                       bias-pull-up;
> +                               };
> +                       };
>                 };
>
>                 apps_smmu: iommu@15000000 {
> @@ -1437,6 +4150,107 @@ cpufreq_hw: cpufreq@17d91000 {
>                         #clock-cells = <1>;
>                 };
>
> +               pmu@24091000 {
> +                       compatible = "qcom,sm8650-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> +                       reg = <0 0x24091000 0 0x1000>;
> +
> +                       interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +
> +                       operating-points-v2 = <&llcc_bwmon_opp_table>;
> +
> +                       llcc_bwmon_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-0 {
> +                                       opp-peak-kBps = <2086000>;
> +                               };
> +
> +                               opp-1 {
> +                                       opp-peak-kBps = <2929000>;
> +                               };
> +
> +                               opp-2 {
> +                                       opp-peak-kBps = <5931000>;
> +                               };
> +
> +                               opp-3 {
> +                                       opp-peak-kBps = <6515000>;
> +                               };
> +
> +                               opp-4 {
> +                                       opp-peak-kBps = <7980000>;
> +                               };
> +
> +                               opp-5 {
> +                                       opp-peak-kBps = <10437000>;
> +                               };
> +
> +                               opp-6 {
> +                                       opp-peak-kBps = <12157000>;
> +                               };
> +
> +                               opp-7 {
> +                                       opp-peak-kBps = <14060000>;
> +                               };
> +
> +                               opp-8 {
> +                                       opp-peak-kBps = <16113000>;
> +                               };
> +                       };
> +               };
> +
> +               pmu@240b7400 {
> +                       compatible = "qcom,sm8650-cpu-bwmon", "qcom,sdm845-bwmon";
> +                       reg = <0 0x240b7400 0 0x600>;
> +
> +                       interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                                        &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
> +
> +                       operating-points-v2 = <&cpu_bwmon_opp_table>;
> +
> +                       cpu_bwmon_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-0 {
> +                                       opp-peak-kBps = <4577000>;
> +                               };
> +
> +                               opp-1 {
> +                                       opp-peak-kBps = <7110000>;
> +                               };
> +
> +                               opp-2 {
> +                                       opp-peak-kBps = <9155000>;
> +                               };
> +
> +                               opp-3 {
> +                                       opp-peak-kBps = <12298000>;
> +                               };
> +
> +                               opp-4 {
> +                                       opp-peak-kBps = <14236000>;
> +                               };
> +
> +                               opp-5 {
> +                                       opp-peak-kBps = <16265000>;
> +                               };
> +                       };
> +               };
> +
> +               gem_noc: interconnect@24100000 {
> +                       compatible = "qcom,sm8650-gem-noc";
> +                       reg = <0 0x24100000 0 0xc5080>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
>                 system-cache-controller@25000000 {
>                         compatible = "qcom,sm8650-llcc";
>                         reg = <0 0x25000000 0 0x200000>,
> @@ -1452,6 +4266,137 @@ system-cache-controller@25000000 {
>
>                         interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>                 };
> +
> +               remoteproc_adsp: remoteproc@30000000 {
> +                       compatible = "qcom,sm8650-adsp-pas";
> +                       reg = <0 0x30000000 0 0x100>;
> +
> +                       interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "wdog",
> +                                         "fatal",
> +                                         "ready",
> +                                         "handover",
> +                                         "stop-ack";
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "xo";
> +
> +                       interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +                       power-domains = <&rpmhpd RPMHPD_LCX>,
> +                                       <&rpmhpd RPMHPD_LMX>;
> +                       power-domain-names = "lcx",
> +                                            "lmx";
> +
> +                       memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
> +
> +                       qcom,qmp = <&aoss_qmp>;
> +
> +                       qcom,smem-states = <&smp2p_adsp_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       status = "disabled";
> +
> +                       remoteproc_adsp_glink: glink-edge {
> +                               interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +                                                            IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                                            IRQ_TYPE_EDGE_RISING>;
> +
> +                               mboxes = <&ipcc IPCC_CLIENT_LPASS
> +                                               IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +                               qcom,remote-pid = <2>;
> +
> +                               label = "lpass";
> +
> +                               fastrpc {
> +                                       compatible = "qcom,fastrpc";
> +
> +                                       qcom,glink-channels = "fastrpcglink-apps-dsp";
> +
> +                                       label = "adsp";
> +
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                               };
> +                       };
> +               };
> +
> +               nsp_noc: interconnect@320c0000 {
> +                       compatible = "qcom,sm8650-nsp-noc";
> +                       reg = <0 0x320c0000 0 0xf080>;
> +
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +
> +                       #interconnect-cells = <2>;
> +               };
> +
> +               remoteproc_cdsp: remoteproc@32300000 {
> +                       compatible = "qcom,sm8650-cdsp-pas";
> +                       reg = <0 0x32300000 0 0x1400000>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +                                             <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "wdog",
> +                                         "fatal",
> +                                         "ready",
> +                                         "handover",
> +                                         "stop-ack";
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "xo";
> +
> +                       interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +                       power-domains = <&rpmhpd RPMHPD_CX>,
> +                                       <&rpmhpd RPMHPD_MXC>,
> +                                       <&rpmhpd RPMHPD_NSP>;
> +                       power-domain-names = "cx",
> +                                            "mxc",
> +                                            "nsp";
> +
> +                       memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
> +
> +                       qcom,qmp = <&aoss_qmp>;
> +
> +                       qcom,smem-states = <&smp2p_cdsp_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       status = "disabled";
> +
> +                       glink-edge {
> +                               interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +                                                            IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                                            IRQ_TYPE_EDGE_RISING>;
> +
> +                               mboxes = <&ipcc IPCC_CLIENT_CDSP
> +                                               IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +                               qcom,remote-pid = <5>;
> +
> +                               label = "cdsp";
> +
> +                               fastrpc {
> +                                       compatible = "qcom,fastrpc";
> +
> +                                       qcom,glink-channels = "fastrpcglink-apps-dsp";
> +
> +                                       label = "cdsp";
> +
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                               };
> +                       };
> +               };
>         };
>
>         thermal-zones {
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

