Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09B07500782
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240590AbiDNHtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241394AbiDNHsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:48:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D9940930
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:45:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so7635863lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VsJZVv9Fp+w5mZRNrHqB2RrnmbQjqZaqJf7SJY1IHwU=;
        b=bNKLdmwWS2mP4BOZRWUzvsAhXX3XkrXP86Tl4m8VpVW/RIhT56+TknjVkqAbPtHSQp
         gE9jXJdg+iruufoXKRU9wqoSbvso/HqEMBJnnS66KQjTb+eOE2Qi1HvgmxFRnlaqEUjL
         ppRzQQFMWrzByuekrk9Q30mlXm1OFt8ZADqsoFqDtrV6IkQQPMN5i+4jjPn1kWZNw/8k
         Njm8W532m5SvrVtjcYjswpb6jhQ2hdIlPx2K1vgV57JjtdMuul8JM2EefmoWBH3BmIoi
         NhAl83pFCAyM7UN9VV30XYI8Cijl9rnxr5KMxMLHrZ1TVHYKunws8D7eqEIzcpwICdo5
         yChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VsJZVv9Fp+w5mZRNrHqB2RrnmbQjqZaqJf7SJY1IHwU=;
        b=uM5GZX2fcPIOpKr1GzRVOG3l3S/wtV2CqrXyNQNmG7Cl0qSdr3j2kKtw5p+puXyCVL
         TXVLtBKriuyqpl1gEhW7dMz10D43Gc+1pEh1ukBsj/5YyOYd6BnAex9hXG5fOt3M8IVX
         JprzAoTRNC4mwmQArhhv3u9BMUz6mfohbu6WQTTX6T8W1ZRIkA8JfcfJNZwyf7esahs7
         xgqCCri+Wmxo9hptfj2sfwxg1Qe21Qa2HMrD0Kb6NFPdOya/dWuJnrPry2v7sVGXmJcr
         Jo2hOPMpQihA6YP18OiWaqfvH/ynhX1U2XxNu7R9KObfs/++l2myWe8lcjC3b72OlONl
         oI6A==
X-Gm-Message-State: AOAM532qDKGmK+DjjyGyuOaSJQoROpuX2VgHVwIG0MVxv0z62LSoa1CY
        O9AZzurDy3txw2E1PqqObfRwaQ==
X-Google-Smtp-Source: ABdhPJx1gONvZ7scsNJIkPnaxXsh8o2ETyU9I4MImuFKUDZqaP1VsA9C1q+oK3TVcrt5iN5JC13pfw==
X-Received: by 2002:a05:6512:2829:b0:46d:2b1:e85d with SMTP id cf41-20020a056512282900b0046d02b1e85dmr1093350lfb.303.1649922312456;
        Thu, 14 Apr 2022 00:45:12 -0700 (PDT)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id p20-20020a056512329400b0046ba6832cf6sm152797lfe.155.2022.04.14.00.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:45:12 -0700 (PDT)
Message-ID: <13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org>
Date:   Thu, 14 Apr 2022 10:45:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250: camss: Add CAMSS block
 definition
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
 <20220413231736.991368-3-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220413231736.991368-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On 4/14/22 02:17, Bryan O'Donoghue wrote:
> Adds a CAMSS definition block.
> 
> Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 153 +++++++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 906bc8ed25b7..c69a8a88657a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3150,6 +3150,159 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: camss@ac6a000 {
> +			compatible = "qcom,sm8250-camss";
> +			status = "disabled";
> +
> +			reg = <0 0xac6a000 0 0x2000>,
> +			      <0 0xac6c000 0 0x2000>,
> +			      <0 0xac6e000 0 0x1000>,
> +			      <0 0xac70000 0 0x1000>,
> +			      <0 0xac72000 0 0x1000>,
> +			      <0 0xac74000 0 0x1000>,
> +			      <0 0xacb4000 0 0xd000>,
> +			      <0 0xacc3000 0 0xd000>,
> +			      <0 0xacd9000 0 0x2200>,
> +			      <0 0xacdb200 0 0x2200>;
> +			reg-names = "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "csiphy5",
> +					  "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid3",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>;
> +

do you need to add 'power-domain-names' property here as well?

> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_0_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AREG_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AREG_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "cam_ahb_clk",
> +				      "cam_hf_axi",
> +				      "cam_sf_axi",
> +				      "camnoc_axi",
> +				      "camnoc_axi_src",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "csiphy5",
> +				      "csiphy5_timer",
> +				      "slow_ahb_src",
> +				      "vfe0_ahb",
> +				      "vfe0_axi",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe0_csid",
> +				      "vfe0_areg",
> +				      "vfe1_ahb",
> +				      "vfe1_axi",
> +				      "vfe1",
> +				      "vfe1_cphy_rx",
> +				      "vfe1_csid",
> +				      "vfe1_areg",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_axi",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			iommus = <&apps_smmu 0x800 0x400>,
> +				 <&apps_smmu 0x801 0x400>,
> +				 <&apps_smmu 0x840 0x400>,
> +				 <&apps_smmu 0x841 0x400>,
> +				 <&apps_smmu 0xc00 0x400>,
> +				 <&apps_smmu 0xc01 0x400>,
> +				 <&apps_smmu 0xc40 0x400>,
> +				 <&apps_smmu 0xc41 0x400>;
> +
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_CAMERA_CFG>,
> +					<&mmss_noc MASTER_CAMNOC_HF &mc_virt SLAVE_EBI_CH0>,
> +					<&mmss_noc MASTER_CAMNOC_SF &mc_virt SLAVE_EBI_CH0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP &mc_virt SLAVE_EBI_CH0>;

Recently there was a discussion on the list that interconnects are 2-cells,
if so, the array above should be updated accordingly.

> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_0_mnoc",
> +					     "cam_sf_0_mnoc",
> +					     "cam_sf_icp_mnoc";
> +		};
> +
>   		camcc: clock-controller@ad00000 {
>   			compatible = "qcom,sm8250-camcc";
>   			reg = <0 0x0ad00000 0 0x10000>;

--
Best wishes,
Vladimir
