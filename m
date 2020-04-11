Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6291A4D12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 02:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgDKAzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 20:55:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45433 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgDKAzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 20:55:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586566504; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=6GxKDt8rXIm87uwOKzKHn2zKcdK2FIWPD83/YKeC4Mg=; b=Ahl2iZnBG9rKrfgFv8Z5D4usJwMc6Gah5j3hoiS23fqwneGplqvmHvsMC9sGpUhjX1Fycgsi
 12GMlbnMnlS4NZ2KjxOCp/Uk0kv3QlpFIVuHp94crVFY0RBAFJshcjkUoANsW3e9GgSMx8Hu
 98ab4tEd6tW8xQvkYOQCr1y4GsM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e911566.7fe342e6f7a0-smtp-out-n02;
 Sat, 11 Apr 2020 00:55:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0BBBC433CB; Sat, 11 Apr 2020 00:55:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.206.125.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AEB70C433CB;
        Sat, 11 Apr 2020 00:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEB70C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 3/3] arm64: dts: ipq8074: enable USB support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
References: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
 <1586543372-13969-4-git-send-email-sivaprak@codeaurora.org>
 <20200410221748.GD20625@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <be034a0b-7b3c-8b17-c3f7-776ad1839f55@codeaurora.org>
Date:   Sat, 11 Apr 2020 06:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410221748.GD20625@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 4/11/2020 3:47 AM, Bjorn Andersson wrote:
> On Fri 10 Apr 11:29 PDT 2020, Sivaprakash Murugesan wrote:
>
>> IPQ8074 has two super speed usb ports, add phy and dwc3 nodes
>> to enable them.
>>
> Thanks Sivaprakash, your patch looks good, just some comments on the
> style below.
>
>> Co-developed-by: Balaji Prakash J <bjagadee@codeaurora.org>
>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  24 +++++
>>   arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 168 ++++++++++++++++++++++++++++++
>>   2 files changed, 192 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
>> index 70be3f9..dd27d84 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
>> @@ -26,6 +26,22 @@
>>   	};
>>   
>>   	soc {
>> +		ssphy@58000 {
> Please reference these by label, like we do in e.g. sdm845-mtp.dts.
ok.
>
>> +			status = "ok";
>> +		};
>> +
>> +		qusb@59000 {
>> +			status = "ok";
>> +		};
>> +
>> +		ssphy@78000 {
>> +			status = "ok";
>> +		};
>> +
>> +		qusb@79000 {
>> +			status = "ok";
>> +		};
>> +
>>   		serial@78b3000 {
>>   			status = "ok";
>>   		};
>> @@ -65,6 +81,14 @@
>>   			};
>>   		};
>>   
>> +		usb3@8A00000 {
>> +			status = "ok";
>> +		};
>> +
>> +		usb3@8C00000 {
>> +			status = "ok";
>> +		};
>> +
>>   		phy@86000 {
>>   			status = "ok";
>>   		};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index 2b31823..47bb9ad 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -16,6 +16,92 @@
>>   		ranges = <0 0 0 0xffffffff>;
>>   		compatible = "simple-bus";
>>   
>> +		ssphy_1: ssphy@58000 {
> Please use the generic name of "phy" here (i.e. ssphy_1: phy@58000 {)
ok.
>
>> +			compatible = "qcom,ipq8074-qmp-usb3-phy";
>> +			reg = <0x00058000 0x1c4>;
>> +			status = "disabled";
>> +			#clock-cells = <1>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_USB1_AUX_CLK>,
>> +				 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
>> +				 <&xo>;
>> +			clock-names = "aux", "cfg_ahb", "ref";
>> +
>> +			resets =  <&gcc GCC_USB1_PHY_BCR>,
>> +				 <&gcc GCC_USB3PHY_1_PHY_BCR>;
>> +			reset-names = "phy","common";
>> +
>> +			usb1_ssphy: lane@58200 {
>> +				reg = <0x00058200 0x130>,	/* Tx */
>> +				      <0x00058400 0x200>,	/* Rx */
>> +				      <0x00058800 0x1F8>,	/* PCS  */
>> +				      <0x00058600 0x044>;	/* PCS misc */
>> +				#phy-cells = <0>;
>> +				clocks = <&gcc GCC_USB1_PIPE_CLK>;
>> +				clock-names = "pipe0";
>> +				clock-output-names = "gcc_usb1_pipe_clk_src";
>> +			};
>> +		};
>> +
>> +		qusb_phy_1: qusb@59000 {
> phy@
ok.
>
>> +		    compatible = "qcom,msm8996-qusb2-phy";
> Please add and use a ipq8074 compatible to the driver (.data can point
> to msm8996_phy_cfg still).
sure, will do.
>
>> +		    reg = <0x00059000 0x180>;
>> +		    status = "disabled";
>> +		    #phy-cells = <0>;
>> +
>> +		    clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
>> +			     <&xo>;
>> +		    clock-names = "cfg_ahb", "ref";
>> +
>> +		    resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
>> +		};
>> +
>> +		ssphy_0: ssphy@78000 {
> phy@
ok.
>> +			compatible = "qcom,ipq8074-qmp-usb3-phy";
>> +			reg = <0x00078000 0x1c4>;
>> +			status = "disabled";
>> +			#clock-cells = <1>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_USB0_AUX_CLK>,
>> +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
>> +				 <&xo>;
>> +			clock-names = "aux", "cfg_ahb", "ref";
>> +
>> +			resets =  <&gcc GCC_USB0_PHY_BCR>,
>> +				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
>> +			reset-names = "phy","common";
>> +
>> +			usb0_ssphy: lane@78200 {
>> +				reg = <0x00078200 0x130>,	/* Tx */
>> +				      <0x00078400 0x200>,	/* Rx */
>> +				      <0x00078800 0x1F8>,	/* PCS  */
>> +				      <0x00078600 0x044>;	/* PCS misc */
>> +				#phy-cells = <0>;
>> +				clocks = <&gcc GCC_USB0_PIPE_CLK>;
>> +				clock-names = "pipe0";
>> +				clock-output-names = "gcc_usb0_pipe_clk_src";
>> +			};
>> +		};
>> +
>> +		qusb_phy_0: qusb@79000 {
> phy@
ok.
>
>> +		    compatible = "qcom,msm8996-qusb2-phy";
>> +		    reg = <0x00079000 0x180>;
>> +		    status = "disabled";
>> +		    #phy-cells = <0>;
>> +
>> +		    clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
>> +			     <&xo>;
>> +		    clock-names = "cfg_ahb", "ref";
>> +
>> +		    resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
>> +		};
>> +
>>   		tlmm: pinctrl@1000000 {
>>   			compatible = "qcom,ipq8074-pinctrl";
>>   			reg = <0x1000000 0x300000>;
>> @@ -272,6 +358,88 @@
>>   			status = "disabled";
>>   		};
>>   
>> +		usb3_0: usb3@8A00000 {
> usb@ and please lower case and make sure the unit address matches the
> reg.
ok.
>
>> +			compatible = "qcom,dwc3";
>> +			reg = <0x08af8800 0x400>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>> +				<&gcc GCC_USB0_MASTER_CLK>,
>> +				<&gcc GCC_USB0_SLEEP_CLK>,
>> +				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
>> +			clock-names = "sys_noc_axi",
>> +				"master",
>> +				"sleep",
>> +				"mock_utmi";
>> +
>> +			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>> +					  <&gcc GCC_USB0_MASTER_CLK>,
>> +					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>> +			assigned-clock-rates = <133330000>,
>> +					       <133330000>,
>> +					       <19200000>;
>> +
>> +			resets = <&gcc GCC_USB0_BCR>;
>> +			status = "disabled";
>> +
>> +			dwc_0: dwc3@8A00000 {
> Please lowercase the address
ok.
>
>> +				compatible = "snps,dwc3";
>> +				reg = <0x8A00000 0xcd00>;
> Ditto.
ok.
>
>> +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> +				phys = <&qusb_phy_0>, <&usb0_ssphy>;
>> +				phy-names = "usb2-phy", "usb3-phy";
>> +				tx-fifo-resize;
>> +				snps,is-utmi-l1-suspend;
>> +				snps,hird-threshold = /bits/ 8 <0x0>;
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_u3_susphy_quirk;
>> +				dr_mode = "host";
>> +			};
>> +		};
>> +
>> +		usb3_1: usb3@8C00000 {
> usb@, lowercase and match reg.
ok
>
>> +			compatible = "qcom,dwc3";
>> +			reg = <0x08cf8800 0x400>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
>> +				<&gcc GCC_USB1_MASTER_CLK>,
>> +				<&gcc GCC_USB1_SLEEP_CLK>,
>> +				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
>> +			clock-names = "sys_noc_axi",
>> +				"master",
>> +				"sleep",
>> +				"mock_utmi";
>> +
>> +			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
>> +					  <&gcc GCC_USB1_MASTER_CLK>,
>> +					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>> +			assigned-clock-rates = <133330000>,
>> +					       <133330000>,
>> +					       <19200000>;
>> +
>> +			resets = <&gcc GCC_USB1_BCR>;
>> +			status = "disabled";
>> +
>> +			dwc_1: dwc3@8C00000 {
> Please lowercase
ok
>
>> +				compatible = "snps,dwc3";
>> +				reg = <0x8C00000 0xcd00>;
> Ditto.
ok
>
>> +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>> +				phys = <&qusb_phy_1>, <&usb1_ssphy>;
>> +				phy-names = "usb2-phy", "usb3-phy";
>> +				tx-fifo-resize;
>> +				snps,is-utmi-l1-suspend;
>> +				snps,hird-threshold = /bits/ 8 <0x0>;
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_u3_susphy_quirk;
>> +				dr_mode = "host";
>> +			};
>> +		};
>> +
>>   		pcie_phy0: phy@86000 {
>>   			compatible = "qcom,ipq8074-qmp-pcie-phy";
>>   			reg = <0x86000 0x1000>;
> If you could send a separate patch (after this is merged is okay) that
> sort the nodes in this file by address, it would be much appreciated.
sure. Based on the comments above the dts needs clean. will send a 
separate patch for it.
>
> Regards,
> Bjorn

Thanks,

Siva

>> -- 
>> 2.7.4
>>
