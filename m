Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B157E3AC2F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 07:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFRFzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 01:55:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19564 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhFRFzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 01:55:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623995578; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9WIqUSuKCeA4a7nGZlVezbJMr5o9Xyi76lV6kdDhfPM=;
 b=R11PRy0kZnrJxU9TKBBLUGNQg88wYpTb87z2uS7wj17be2ftZok9xEYyHls07tY1ewWhxlso
 ihDPIV0xr/sjV8nGPWepgMMQ8f1Ttb6hHWZXbG3Z/0oIq+YpoIeqp6rRqMrqCMBfsydGYKcZ
 UfNrqzp+QvObCQ5XfC71EtwYwy8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60cc34a1ed59bf69cc3e2e02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 05:52:33
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1AC8C4360C; Fri, 18 Jun 2021 05:52:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 627E5C433D3;
        Fri, 18 Jun 2021 05:52:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Jun 2021 11:22:32 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related
 nodes
In-Reply-To: <YLwyVh4xyEyvXKDU@builder.lan>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
 <1622904059-21244-3-git-send-email-pmaliset@codeaurora.org>
 <YLwyVh4xyEyvXKDU@builder.lan>
Message-ID: <b9beccabc8ba88e889d6f6317afecd05@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-06 07:56, Bjorn Andersson wrote:
> On Sat 05 Jun 09:40 CDT 2021, Prasad Malisetty wrote:
> 
>> Add PCIe controller and PHY nodes for sc7280 SOC.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 138 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 138 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 0b6f119..9e8414d 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -15,6 +15,7 @@
>>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>  #include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> 
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -484,6 +485,117 @@
>>  			#power-domain-cells = <1>;
>>  		};
>> 
>> +		pcie1: pci@1c08000 {
> 
> Does this name imply that you have a pcie0 as well? Please introduce it
> while you're at it.
> 
>> We are not using pcie0 for HLOS.

>> +			compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", 
>> "snps,dw-pcie";
>> +			reg = <0 0x01c08000 0 0x3000>,
>> +			      <0 0x40000000 0 0xf1d>,
>> +			      <0 0x40000f20 0 0xa8>,
>> +			      <0 0x40001000 0 0x1000>,
>> +			      <0 0x40100000 0 0x100000>;
>> +
>> +			reg-names = "parf", "dbi", "elbi", "atu", "config";
>> +			device_type = "pci";
>> +			linux,pci-domain = <1>;
>> +			bus-range = <0x00 0xff>;
>> +			num-lanes = <2>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
>> +
>> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* 
>> int_a */
>> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
>> +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
>> +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>> +
>> +			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
>> +				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
>> +				 <&pcie1_lane 0>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
>> +
>> +			clock-names = "pipe",
>> +				      "pipe_src",
>> +				      "pipe_ext",
>> +				      "ref",
>> +				      "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "tbu",
>> +				      "ddrss_sf_tbu";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
>> +			assigned-clock-rates = <19200000>;
>> +
>> +			resets = <&gcc GCC_PCIE_1_BCR>;
>> +			reset-names = "pci";
>> +
>> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>> +
>> +			phys = <&pcie1_lane>;
>> +			phy-names = "pciephy";
>> +
>> +			perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pcie1_default_state>;
>> +
>> +			iommus = <&apps_smmu 0x1c80 0x1>;
>> +
>> +			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>> +				    <0x100 &apps_smmu 0x1c81 0x1>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		pcie1_phy: phy@1c0e000 {
>> +			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
> 
> No, you don't have a sm8250-qmp-gen3x2-pcie-phy in your sc7280.
> 
>> Both are having same PHY sequence.

>> +			status = "disabled";
>> +			reg = <0 0x01c0e000 0 0x1c0>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_CLKREF_EN>,
>> +				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
>> +			clock-names = "aux", "cfg_ahb", "ref", "refgen";
>> +
>> +			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
>> +			reset-names = "phy";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
>> +			assigned-clock-rates = <100000000>;
>> +
>> +			pcie1_lane: lanes@1c0e200 {
>> +				reg = <0 0x01c0e200 0 0x170>,
>> +				      <0 0x01c0e400 0 0x200>,
>> +				      <0 0x01c0ea00 0 0x1f0>,
>> +				      <0 0x01c0e600 0 0x170>,
>> +				      <0 0x01c0e800 0 0x200>,
>> +				      <0 0x01c0ee00 0 0xf4>;
>> +				clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +				clock-names = "pipe0";
>> +
>> +				#phy-cells = <0>;
>> +				#clock-cells = <1>;
>> +				clock-output-names = "pcie_1_pipe_clk";
>> +			};
>> +		};
>> +
>>  		stm@6002000 {
>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>  			reg = <0 0x06002000 0 0x1000>,
>> @@ -1102,6 +1214,32 @@
>>  				pins = "gpio46", "gpio47";
>>  				function = "qup13";
>>  			};
>> +
>> +			pcie1_default_state: pcie1-default {
> 
> Per the binding the name has to end with "-pins", although I would like
> us to change that to "-state". Either way, this is not correct.
> 
>> +				clkreq {
>> +					pins = "gpio79";
>> +					function = "pcie1_clkreqn";
>> +				};
>> +
>> +				reset-n {
>> +					pins = "gpio2";
>> +					function = "gpio";
>> +
>> +					drive-strength = <16>;
>> +					output-low;
>> +					bias-disable;
>> +				};
>> +
>> +				wake-n {
>> +					pins = "gpio3";
>> +					function = "gpio";
>> +				};
>> +
>> +				nvme-n {
> 
> This doesn't look like a standard PCIe pin, is it perhaps the enable 
> pin
> for the regulator powering your NVME, or something along those lines?
> 
> If so you should describe it as a fixed-regulator...and either way I
> suspect it should be moved to the device specific file.
> 
> Regards,
> Bjorn
> 
> Agree, will move into board specific file.

>> +					pins = "gpio19";
>> +					function = "gpio";
>> +				};
>> +			};
>>  		};
>> 
>>  		apps_smmu: iommu@15000000 {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
