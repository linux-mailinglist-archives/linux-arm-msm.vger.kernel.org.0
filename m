Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20C4328810
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 18:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbhCARcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 12:32:35 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:64892 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238449AbhCAR2F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 12:28:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614619665; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=N0yPR1LTqutQsyaII3SXK9Z8MBYFKevcJKndMzoVQCk=; b=LxxScubkBwwSNZHOUVXGcgeR2JmqysJ4WybZAXS1ZWs2T0rMiKpcXu5VwK5SKggt66rfPeJV
 2yLrh2QaBEpIWusDnVTAVVhps7/yJTvBmXQQTpxRzowan11ZSRYzuYShi/JqkhjWQ2wSCdCF
 5sj1QRErITbwCbpXK2j7fuNnVzI=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 603d23f1fee96fcaf40c19d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 17:27:13
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48381C433C6; Mon,  1 Mar 2021 17:27:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.110] (unknown [49.204.182.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8090C433C6;
        Mon,  1 Mar 2021 17:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8090C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 06/13] arm64: dts: qcom: SC7280: Add rpmhcc clock
 controller node
To:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <1613114930-1661-7-git-send-email-rnayak@codeaurora.org>
 <161406618557.1254594.15985584772106947706@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <f58070ee-ff00-f8c5-6459-782562e903e5@codeaurora.org>
Date:   Mon, 1 Mar 2021 22:57:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161406618557.1254594.15985584772106947706@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for the review.

On 2/23/2021 1:13 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-02-11 23:28:43)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 7848e88..10851e7 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -6,6 +6,7 @@
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   
>> @@ -29,6 +30,42 @@
>>                          clock-frequency = <32000>;
>>                          #clock-cells = <0>;
>>                  };
>> +
>> +               pcie_0_pipe_clk: pcie-0-pipe-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               pcie_1_pipe_clk: pcie-1-pipe-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               ufs_phy_rx_symbol_0_clk: ufs-phy-rx-symbol-0-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               ufs_phy_rx_symbol_1_clk: ufs-phy-rx-symbol-1-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               ufs_phy_tx_symbol_0_clk: ufs-phy-tx-symbol-0-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               usb3_phy_wrapper_gcc_usb30_pipe_clk: usb3-phy-wrapper-gcc-usb30-pipe-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <1000>;
>> +                       #clock-cells = <0>;
>> +               };
> 
> Shouldn't these come from the phys? Why are they being added here?
> 

Once the phys are added, these could be replaced, that was the reason to 
add them.

>>          };
>>   
>>          reserved_memory: reserved-memory {
>> @@ -174,6 +211,17 @@
>>                  gcc: clock-controller@100000 {
>>                          compatible = "qcom,gcc-sc7280";
>>                          reg = <0 0x00100000 0 0x1f0000>;
>> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
>> +                                <&pcie_0_pipe_clk>, <&pcie_1_pipe_clk>,
>> +                                <&ufs_phy_rx_symbol_0_clk>, <&ufs_phy_rx_symbol_1_clk>,
>> +                                <&ufs_phy_tx_symbol_0_clk>,
>> +                                <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
> 
> If the phys aren't ready then <0> should work. Unless something goes
> wrong?
>

Nothing would go wrong if we add <0>, but wanted them to be replaced 
once the support is added.


>> +                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
>> +                                     "pcie_0_pipe_clk", "pcie_1_pipe-clk",
>> +                                     "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
>> +                                     "ufs_phy_tx_symbol_0_clk",
>> +                                     "usb3_phy_wrapper_gcc_usb30_pipe_clk";
>>                          #clock-cells = <1>;
>>                          #reset-cells = <1>;
>>                          #power-domain-cells = <1>;
>> @@ -325,6 +373,13 @@
>>                                            <SLEEP_TCS   3>,
>>                                            <WAKE_TCS    3>,
>>                                            <CONTROL_TCS 1>;
>> +
>> +                       rpmhcc: qcom,rpmhcc {
> 
> rpmhcc: clock-controller {
> 

Will update in the next patch.

>> +                               compatible = "qcom,sc7280-rpmh-clk";
>> +                               clocks = <&xo_board>;
>> +                               clock-names = "xo";
>> +                               #clock-cells = <1>;
>> +                       };
>>                  };
>>          };
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
