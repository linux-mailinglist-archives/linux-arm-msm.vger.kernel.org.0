Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FBB4FE19F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 15:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355281AbiDLNGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 09:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357136AbiDLNES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 09:04:18 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE534889E;
        Tue, 12 Apr 2022 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649767722; x=1681303722;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cm3PPGsEggVzdfAIEGNXgkOFvvQIheAXiWAEGXuoj/U=;
  b=AOedOl4ctC2tgjQLlLpVWhDnfOXaQVa4FbkqdJd0Ovl/OKSdg43LWJEH
   ETHhRnk28H4zJO6fVm8adbEh1wMRd/FWOPCelFCKY9QpE5ket6E1y7/+X
   IdRCajgFv/8s19mRH84uwQcHl5kZ4BwYfT6bXeVh6mJiFU8lnCjW9TcSp
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Apr 2022 05:48:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 05:48:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 05:48:40 -0700
Received: from [10.216.28.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 12 Apr
 2022 05:48:36 -0700
Message-ID: <9bacee6d-ab44-2975-c523-38164d016af5@quicinc.com>
Date:   Tue, 12 Apr 2022 18:18:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
References: <1649685184-8448-1-git-send-email-quic_srivasam@quicinc.com>
 <1649685184-8448-3-git-send-email-quic_srivasam@quicinc.com>
 <YlSCWC47tITuW/BZ@google.com>
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YlSCWC47tITuW/BZ@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/12/2022 1:02 AM, Matthias Kaehlcke wrote:
Thanks for your time Matthias!!!
> On Mon, Apr 11, 2022 at 07:23:04PM +0530, Srinivasa Rao Mandadapu wrote:
>> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
>> based platforms.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  84 ++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi     | 107 +++++++++++++++++++++++++++++++
>>   2 files changed, 191 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 4ba2274..ea751dc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -238,6 +238,90 @@
>>   	modem-init;
>>   };
>>   
>> +&dmic01 {
> Shouldn't these nodes be in the PINCTRL section at their respective
> positions in alphabetical order?

These are not part of tlmm pin control section. These are part of 
lpass_tlmm section.

In your previous comment you asked to remove &lpass_tlmm. Hence brought out.

>
> nit: since you are keeping the groups the group names are a bit generic IMO.
> e.g. it is fairly obvious that 'dmic01_clk' refers to a clock pin, however
> just 'dmic01' is a bit vague. You could consider adding the prefix 'lpass_'
> to the group names for more clarity.
as dmic01 has both clk and data section, I don't think keeping clk is 
appropriate here.
>
>> +	clk {
>> +		drive-strength = <8>;
>> +	};
>> +};
>> +
>> +&dmic01_sleep {
>> +	clk {
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	data {
>> +		pull-down;
>> +	};
>> +};
>> +
>> +&dmic23 {
>> +	clk {
>> +		drive-strength = <8>;
>> +	};
>> +};
>> +
>> +&dmic23_sleep {
>> +	clk {
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	data {
>> +		pull-down;
>> +	};
>> +};
>> +
>> +&rx_swr {
>> +	clk {
>> +		drive-strength = <2>;
>> +		slew-rate = <1>;
>> +		bias-disable;
>> +	};
>> +
>> +	data {
>> +		drive-strength = <2>;
>> +		slew-rate = <1>;
>> +		bias-bus-hold;
>> +	};
>> +};
>> +
>> +&rx_swr_sleep {
>> +	clk {
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	data {
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +};
>> +
>> +&tx_swr {
>> +	clk {
>> +		drive-strength = <2>;
>> +		slew-rate = <1>;
>> +		bias-disable;
>> +	};
>> +
>> +	data {
>> +		slew-rate = <1>;
>> +		bias-bus-hold;
>> +	};
>> +};
>> +
>> +&tx_swr_sleep {
>> +	clk {
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	data {
>> +		bias-bus-hold;
>> +	};
>> +};
>> +
>>   &pcie1 {
>>   	status = "okay";
>>   	perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 8099c80..c692420 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -1987,6 +1987,113 @@
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>   
>> +		lpass_tlmm: pinctrl@33c0000 {
>> +			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
>> +			reg = <0 0x033c0000 0x0 0x20000>,
>> +				<0 0x03550000 0x0 0x10000>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
>> +
>> +			#clock-cells = <1>;
>> +
>> +			dmic01: dmic01 {
>> +				clk {
>> +					pins = "gpio6";
>  From the schematics I interpret that the LPASS GPIOs 0-9 are mapped to the
> SC7280 GPIOs 144-153. Is that correct?
Yes. But we refer with GPIOs 0-9 in driver.
>
>> +					function = "dmic1_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio7";
>> +					function = "dmic1_data";
>> +				};
>> +			};
>> +
>> +			dmic01_sleep: dmic01-sleep {
>> +				clk {
>> +					pins = "gpio6";
>> +					function = "dmic1_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio7";
>> +					function = "dmic1_data";
>> +				};
>> +			};
>> +
>> +			dmic23: dmic23 {
>> +				clk {
>> +					pins = "gpio8";
>> +					function = "dmic2_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio9";
>> +					function = "dmic2_data";
>> +				};
>> +			};
>> +
>> +			dmic23_sleep: dmic23_sleep {
> s/dmic23_sleep/dmic23-sleep/ for the node name.
Okay.
>
>> +				clk {
>> +					pins = "gpio8";
>> +					function = "dmic2_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio9";
>> +					function = "dmic2_data";
>> +				};
>> +			};
>> +
>> +			rx_swr: rx-swr {
>> +				clk {
>> +					pins = "gpio3";
>> +					function = "swr_rx_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio4", "gpio5";
>> +					function = "swr_rx_data";
>> +				};
>> +			};
>> +
>> +			rx_swr_sleep: rx-swr-sleep {
>> +				clk {
>> +					pins = "gpio3";
>> +					function = "swr_rx_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio4", "gpio5";
>> +					function = "swr_rx_data";
>> +				};
>> +			};
>> +
>> +			tx_swr: tx-swr {
>> +				clk {
>> +					pins = "gpio0";
>> +					function = "swr_tx_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio1", "gpio2", "gpio14";
>> +					function = "swr_tx_data";
>> +				};
>> +			};
>> +
>> +			tx_swr_sleep: tx-swr-sleep {
>> +				clk {
>> +					pins = "gpio0";
>> +					function = "swr_tx_clk";
>> +				};
>> +
>> +				data {
>> +					pins = "gpio1", "gpio2", "gpio14";
>> +					function = "swr_tx_data";
>> +				};
>> +			};
>> +		};
>> +
>>   		gpu: gpu@3d00000 {
>>   			compatible = "qcom,adreno-635.0", "qcom,adreno";
>>   			reg = <0 0x03d00000 0 0x40000>,
>> -- 
>> 2.7.4
>>
