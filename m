Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F6B6B0392
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCHKAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjCHKAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:00:06 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F4036479
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:00:01 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id by8so15984850ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678269599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAgawI0oHsPvBo8an8Qipb+XIm8cKESYxRQSklKkosA=;
        b=dOZ8ylQ/LIv8D5VI341SJVbWsYL2nBBT98Mw8IK5c8M86JKBPzD3fflYnDhpoFK6Wx
         KklU+NN0yD1ZXFgA5A3ZJrglTMhKy2WSRmPfjUfkE+E2DAivdLjpPImtcc/guelRW4PH
         HWmNWDwydra2JOCYL2WDH1SLSJ/JpdSa1/vHIfFtqSsetyFanAXDiv83vzOKhfm7gTWM
         7irWSYGX7Q2MG9YBiEbauti+MqgWLaZQ/qZRaQv9O/25YboqNkvI/zwIakBZlbed/aUC
         WfEWjCYet79WHA4T65IMewYNMpauaMiXLf0oEBES8G84bkKNCBgDRQ67LRDA5cj1wsdZ
         4LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678269599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAgawI0oHsPvBo8an8Qipb+XIm8cKESYxRQSklKkosA=;
        b=aQQal6XV+4r+XWntCff3JJIscUE8AwX8DvQzWapigL/sYKjQFd7qa9Ld/xz8AKxpAt
         dSj+34jdtyDRnYs9czrWxxN5VdpaJQBTT9ycx3GgMCt2ZRj8M4gyDU8r46gGS2pwL6Ic
         Qtb1bjzF2g9WEvOi7C/L7ROLtywOo/pfUS8Cekb36aRlFm9ehz0w2TzZs1t2vRcwR5xH
         SLqZZ0jAnMgleFwScWQ0+oY51pH9wPj1hVKobFZttSaTTPDT+hvMCrScINnDfn4ytJkk
         1OKhP/UhHZZIdfguZyAFFoz5CpVMK2A4cHW+YBkC0rPCdtJni3kkrDOQuLtN7nHlcGqc
         PqAA==
X-Gm-Message-State: AO0yUKXIvK+j5QoNzyEC108JlCvzvD6I9jOeHNwzwXPREqdyWN0euiav
        YSPU9LtIJ5dxbEFUdnwtU9jJQg==
X-Google-Smtp-Source: AK7set9JD5rcNaS0z4BvR2OXNa5AI5cmQrz+DQ01KTPp+MbTJToA7mPNMyqMvZnEHdiSzFAlqPpfqQ==
X-Received: by 2002:a2e:58f:0:b0:295:a32b:9538 with SMTP id 137-20020a2e058f000000b00295a32b9538mr6292797ljf.43.1678269599450;
        Wed, 08 Mar 2023 01:59:59 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e3c16000000b00295a36fedadsm2499444lja.26.2023.03.08.01.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 01:59:59 -0800 (PST)
Message-ID: <50cc134a-eb21-3b06-0c6e-41a4a5a5fd76@linaro.org>
Date:   Wed, 8 Mar 2023 10:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: replace 0x0 to 0
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-topic-sm8550-upstream-dt-fixups-v1-0-595b02067672@linaro.org>
 <20230308-topic-sm8550-upstream-dt-fixups-v1-1-595b02067672@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-topic-sm8550-upstream-dt-fixups-v1-1-595b02067672@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 09:32, Neil Armstrong wrote:
> Unify the sm8550.dtsi style by replacing the 0x0 to 0 as it was
> required in the initial file submission.
> 
> Fixes: 377972ac743f ("arm64: dts: qcom: sm8550: add I2C Master Hub nodes")
> Fixes: 433477c3bf0b ("arm64: dts: qcom: sm8550: add QCrypto nodes")
> Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
> Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
> Fixes: 7d1158c984d3 ("arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes")
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Fixes: 6de7f9c34358 ("arm64: dts: qcom: sm8550: add GPR and LPASS pin controller")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
I think the sentiment is towards 0x0, as these are register addreses/
sizes, but nobody wants to send a big giant commit changing it everywhere
as - frankly - it's just a lot of work and noise..

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 60 ++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ff4d342c0725..fe8b92954550 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -547,7 +547,7 @@ adspslpi_mem: adspslpi-region@9ea00000 {
>  
>  		rmtfs_mem: rmtfs-region@d4a80000 {
>  			compatible = "qcom,rmtfs-mem";
> -			reg = <0x0 0xd4a80000 0x0 0x280000>;
> +			reg = <0 0xd4a80000 0 0x280000>;
>  			no-map;
>  
>  			qcom,client-id = <1>;
> @@ -1078,7 +1078,7 @@ spi15: spi@89c000 {
>  
>  		i2c_master_hub_0: geniqup@9c0000 {
>  			compatible = "qcom,geni-se-i2c-master-hub";
> -			reg = <0x0 0x009c0000 0x0 0x2000>;
> +			reg = <0 0x009c0000 0 0x2000>;
>  			clock-names = "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
>  			#address-cells = <2>;
> @@ -1088,7 +1088,7 @@ i2c_master_hub_0: geniqup@9c0000 {
>  
>  			i2c_hub_0: i2c@980000 {
>  				compatible = "qcom,geni-i2c-master-hub";
> -				reg = <0x0 0x00980000 0x0 0x4000>;
> +				reg = <0 0x00980000 0 0x4000>;
>  				clock-names = "se", "core";
>  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
>  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> @@ -1105,7 +1105,7 @@ i2c_hub_0: i2c@980000 {
>  
>  			i2c_hub_1: i2c@984000 {
>  				compatible = "qcom,geni-i2c-master-hub";
> -				reg = <0x0 0x00984000 0x0 0x4000>;
> +				reg = <0 0x00984000 0 0x4000>;
>  				clock-names = "se", "core";
>  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
>  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> @@ -1122,7 +1122,7 @@ i2c_hub_1: i2c@984000 {
>  
>  			i2c_hub_2: i2c@988000 {
>  				compatible = "qcom,geni-i2c-master-hub";
> -				reg = <0x0 0x00988000 0x0 0x4000>;
> +				reg = <0 0x00988000 0 0x4000>;
>  				clock-names = "se", "core";
>  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
>  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> @@ -1139,7 +1139,7 @@ i2c_hub_2: i2c@988000 {
>  
>  			i2c_hub_3: i2c@98c000 {
>  				compatible = "qcom,geni-i2c-master-hub";
> -				reg = <0x0 0x0098c000 0x0 0x4000>;
> +				reg = <0 0x0098c000 0 0x4000>;
>  				clock-names = "se", "core";
>  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
>  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> @@ -1156,7 +1156,7 @@ i2c_hub_3: i2c@98c000 {
>  
>  			i2c_hub_4: i2c@990000 {
>  				compatible = "qcom,geni-i2c-master-hub";
> -				reg = <0x0 0x00990000 0x0 0x4000>;
> +				reg = <0 0x00990000 0 0x4000>;
>  				clock-names = "se", "core";
>  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
>  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
> @@ -1653,8 +1653,8 @@ pcie0: pci@1c00000 {
>  			reg-names = "parf", "dbi", "elbi", "atu", "config";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
> -				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
> +			ranges = <0x01000000 0 0x60200000 0 0x60200000 0 0x100000>,
> +				 <0x02000000 0 0x60300000 0 0x60300000 0 0x3d00000>;
>  			bus-range = <0x00 0xff>;
>  
>  			dma-coherent;
> @@ -1693,7 +1693,7 @@ pcie0: pci@1c00000 {
>  			interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>;
>  
>  			iommus = <&apps_smmu 0x1400 0x7f>;
> -			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> +			iommu-map = <0     &apps_smmu 0x1400 0x1>,
>  				    <0x100 &apps_smmu 0x1401 0x1>;
>  
>  			resets = <&gcc GCC_PCIE_0_BCR>;
> @@ -1744,16 +1744,16 @@ pcie0_phy: phy@1c06000 {
>  		pcie1: pci@1c08000 {
>  			device_type = "pci";
>  			compatible = "qcom,pcie-sm8550";
> -			reg = <0x0 0x01c08000 0x0 0x3000>,
> -			      <0x0 0x40000000 0x0 0xf1d>,
> -			      <0x0 0x40000f20 0x0 0xa8>,
> -			      <0x0 0x40001000 0x0 0x1000>,
> -			      <0x0 0x40100000 0x0 0x100000>;
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>;
>  			reg-names = "parf", "dbi", "elbi", "atu", "config";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -			ranges = <0x01000000 0x0 0x40200000 0 0x40200000 0x0 0x100000>,
> -				 <0x02000000 0x0 0x40300000 0 0x40300000 0x0 0x1fd00000>;
> +			ranges = <0x01000000 0 0x40200000 0 0x40200000 0 0x100000>,
> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
>  			bus-range = <0x00 0xff>;
>  
>  			dma-coherent;
> @@ -1797,7 +1797,7 @@ pcie1: pci@1c08000 {
>  			interconnects = <&pcie_noc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>;
>  
>  			iommus = <&apps_smmu 0x1480 0x7f>;
> -			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
> +			iommu-map = <0     &apps_smmu 0x1480 0x1>,
>  				    <0x100 &apps_smmu 0x1481 0x1>;
>  
>  			resets = <&gcc GCC_PCIE_1_BCR>,
> @@ -1821,7 +1821,7 @@ pcie1: pci@1c08000 {
>  
>  		pcie1_phy: phy@1c0e000 {
>  			compatible = "qcom,sm8550-qmp-gen4x2-pcie-phy";
> -			reg = <0x0 0x01c0e000 0x0 0x2000>;
> +			reg = <0 0x01c0e000 0 0x2000>;
>  
>  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> @@ -1851,7 +1851,7 @@ pcie1_phy: phy@1c0e000 {
>  
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.0";
> -			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			reg = <0 0x01dc4000 0 0x28000>;
>  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>  			#dma-cells = <1>;
>  			qcom,ee = <0>;
> @@ -1862,7 +1862,7 @@ cryptobam: dma-controller@1dc4000 {
>  
>  		crypto: crypto@1de0000 {
>  			compatible = "qcom,sm8550-qce";
> -			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			reg = <0 0x01dfa000 0 0x6000>;
>  			dmas = <&cryptobam 4>, <&cryptobam 5>;
>  			dma-names = "rx", "tx";
>  			iommus = <&apps_smmu 0x480 0x0>,
> @@ -1873,7 +1873,7 @@ crypto: crypto@1de0000 {
>  
>  		ufs_mem_phy: phy@1d80000 {
>  			compatible = "qcom,sm8550-qmp-ufs-phy";
> -			reg = <0x0 0x01d80000 0x0 0x2000>;
> +			reg = <0 0x01d80000 0 0x2000>;
>  			clocks = <&tcsr TCSR_UFS_CLKREF_EN>,
>  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
>  			clock-names = "ref", "ref_aux";
> @@ -1892,7 +1892,7 @@ ufs_mem_phy: phy@1d80000 {
>  		ufs_mem_hc: ufs@1d84000 {
>  			compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -			reg = <0x0 0x01d84000 0x0 0x3000>;
> +			reg = <0 0x01d84000 0 0x3000>;
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>  			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
> @@ -1954,7 +1954,7 @@ tcsr: clock-controller@1fc0000 {
>  
>  		remoteproc_mpss: remoteproc@4080000 {
>  			compatible = "qcom,sm8550-mpss-pas";
> -			reg = <0x0 0x04080000 0x0 0x4040>;
> +			reg = <0 0x04080000 0 0x4040>;
>  
>  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -2383,7 +2383,7 @@ dispcc: clock-controller@af00000 {
>  
>  		usb_1_hsphy: phy@88e3000 {
>  			compatible = "qcom,sm8550-snps-eusb2-phy";
> -			reg = <0x0 0x088e3000 0x0 0x154>;
> +			reg = <0 0x088e3000 0 0x154>;
>  			#phy-cells = <0>;
>  
>  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> @@ -2396,7 +2396,7 @@ usb_1_hsphy: phy@88e3000 {
>  
>  		usb_dp_qmpphy: phy@88e8000 {
>  			compatible = "qcom,sm8550-qmp-usb3-dp-phy";
> -			reg = <0x0 0x088e8000 0x0 0x3000>;
> +			reg = <0 0x088e8000 0 0x3000>;
>  
>  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
> @@ -2418,7 +2418,7 @@ usb_dp_qmpphy: phy@88e8000 {
>  
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,sm8550-dwc3", "qcom,dwc3";
> -			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			reg = <0 0x0a6f8800 0 0x400>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -2458,7 +2458,7 @@ usb_1: usb@a6f8800 {
>  
>  			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
> -				reg = <0x0 0x0a600000 0x0 0xcd00>;
> +				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>  				iommus = <&apps_smmu 0x40 0x0>;
>  				snps,dis_u2_susphy_quirk;
> @@ -3444,7 +3444,7 @@ system-cache-controller@25000000 {
>  
>  		remoteproc_adsp: remoteproc@30000000 {
>  			compatible = "qcom,sm8550-adsp-pas";
> -			reg = <0x0 0x30000000 0x0 0x100>;
> +			reg = <0 0x30000000 0 0x100>;
>  
>  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
>  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -3576,7 +3576,7 @@ nsp_noc: interconnect@320c0000 {
>  
>  		remoteproc_cdsp: remoteproc@32300000 {
>  			compatible = "qcom,sm8550-cdsp-pas";
> -			reg = <0x0 0x32300000 0x0 0x1400000>;
> +			reg = <0 0x32300000 0 0x1400000>;
>  
>  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
>  					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> 
