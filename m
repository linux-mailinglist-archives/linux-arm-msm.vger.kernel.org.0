Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132AA4A55F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 05:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbiBAEof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 23:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbiBAEof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 23:44:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7D7C061714;
        Mon, 31 Jan 2022 20:44:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E59E8B80A7C;
        Tue,  1 Feb 2022 04:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23D7C340EB;
        Tue,  1 Feb 2022 04:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643690670;
        bh=nrMXWuujMeQBDV3WKZ86xto16v8xlNe9fQ6nEAIm2VM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gnna0Mb8c4E+SEqqZL8RoUSDY8zegDOLlcK7bDKuN3vDBAmMBShJbnLdN9ffXIMVm
         KKUuuXY6isCxvip+r3+rRkmErgBGOcbu5VfpPNe2anjVFUmKDmCExrcECPEUOmwVu3
         piBW26I2/J1DgkLzaVp03tFyCZmf7vW4QTZS6RxDqecwzGmLDaJ4Y42wNdz7AUwZBF
         7RaKeLDcjYMqnSQos72vTjGcisLn+rl3ayf46lHEVuOgK2UQ/fd6vcLLpUrMbST3Ba
         g2Z/WtkKBnhAkLN7syjAv5U0MuA65joX/y1z4cQ9JMyvE/9YvSXKSmx2CseJqbXuqp
         wv2ns7ZkygTxQ==
Date:   Tue, 1 Feb 2022 10:14:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFD]: Solving qcom unique unit address warnings
Message-ID: <Yfi6qiPBvURTeKEW@matsya>
References: <YerolYU7Ih3GW/zP@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YerolYU7Ih3GW/zP@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-01-22, 22:38, Vinod Koul wrote:
> Hi Rob,

Any guidance on how to resolve this...?

> 
> On all Qualcomm SoCs there exists QUP serial engine. These engines are
> loaded with a firmware by bootloader and can support a specific protocol
> like I2C/SPI/uart etc.
> 
> Since the serial engine can support different protocols we end up
> describing all the supported ones for this, as illustrated below from
> sdm845 dts upstream:
> 
> 		qupv3_id_0: geniqup@8c0000 {
> 			compatible = "qcom,geni-se-qup";
> 			reg = <0 0x008c0000 0 0x6000>;
> 			clock-names = "m-ahb", "s-ahb";
> 			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> 			iommus = <&apps_smmu 0x3 0x0>;
> 			#address-cells = <2>;
> 			#size-cells = <2>;
> 			ranges;
> 			interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>;
> 			interconnect-names = "qup-core";
> 			status = "disabled";
> 
> 			i2c0: i2c@880000 {
> 				compatible = "qcom,geni-i2c";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_i2c0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				power-domains = <&rpmhpd SDM845_CX>;
> 				operating-points-v2 = <&qup_opp_table>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&aggre1_noc MASTER_QUP_1 0 &mem_noc SLAVE_EBI1 0>;
> 				interconnect-names = "qup-core", "qup-config", "qup-memory";
> 				status = "disabled";
> 			};
> 
> 			spi0: spi@880000 {
> 				compatible = "qcom,geni-spi";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_spi0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>;
> 				interconnect-names = "qup-core", "qup-config";
> 				status = "disabled";
> 			};
> 
> 			uart0: serial@880000 {
> 				compatible = "qcom,geni-uart";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_uart0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				power-domains = <&rpmhpd SDM845_CX>;
> 				operating-points-v2 = <&qup_opp_table>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>;
> 				interconnect-names = "qup-core", "qup-config";
> 				status = "disabled";
> 			};
> 
> 
> The problem comes with all these nodes having same unit addresses. This
> is adding to ~2K warning for unique_unit_address upstream.
> 
> So to solve this we thought of creating a qup se node and then query the
> protocol supported from the firmware on boot and create a child
> auxillary_device. The problem with that approach is another warning
> "node name for SPI buses should be 'spi'"! So that would not help
> 
> Now, I cant think of any better idea here, except maybe move these to
> respective board dts and perhaps keep them commented here for
> documentation.
> 
> Do we have any better idea to solve this problem?
> 
> Thanks
> -- 
> ~Vinod

-- 
~Vinod
