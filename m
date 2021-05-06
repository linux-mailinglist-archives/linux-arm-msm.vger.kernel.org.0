Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD2B37594C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbhEFRaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:30:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15153 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236251AbhEFRaN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:30:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620322155; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9aKpXLNVi2h/Y2ScxKTleO7QLbbkZw7iOv1NcdNpkNQ=;
 b=HDL/zJzBmuVhKpDAr/UQTrr2CMZAufeB/QCcWwShEnAIjp0mf2P2pk/HkNK7CedRK+eQ4+o1
 SRW7/qVeAp+ksjua2Pp2bgWRu0teZTzxW9t3fIULJWgd4n7GA3mGh6/zUDdEb/e3ZJwLEQLf
 JqRfKJnijD2LvQENWjzdYRJLzGI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60942751f34440a9d49fa30f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 17:28:49
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF26FC43143; Thu,  6 May 2021 17:28:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3BC7C433D3;
        Thu,  6 May 2021 17:28:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 22:58:48 +0530
From:   gubbaven@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v2 2/3] dt-bindings: net: bluetooth: Convert to DT schema
In-Reply-To: <20210421171052.GB1300559@robh.at.kernel.org>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
 <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
 <20210421171052.GB1300559@robh.at.kernel.org>
Message-ID: <7db177d3800a88c2fdc6bd8e2172fdb7@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob Herring,
On 2021-04-21 22:40, Rob Herring wrote:
> On Tue, Apr 20, 2021 at 09:56:49PM +0530, Venkata Lakshmi Narayana 
> Gubba wrote:
>> Converted Qualcomm Bluetooth binidings to DT schema.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  .../devicetree/bindings/net/qualcomm-bluetooth.txt | 69 
>> -----------------
>>  .../bindings/net/qualcomm-bluetooth.yaml           | 87 
>> ++++++++++++++++++++++
>>  2 files changed, 87 insertions(+), 69 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt 
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> deleted file mode 100644
>> index 709ca6d..0000000
>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -Qualcomm Bluetooth Chips
>> ----------------------
>> -
>> -This documents the binding structure and common properties for serial
>> -attached Qualcomm devices.
>> -
>> -Serial attached Qualcomm devices shall be a child node of the host 
>> UART
>> -device the slave device is attached to.
>> -
>> -Required properties:
>> - - compatible: should contain one of the following:
>> -   * "qcom,qca6174-bt"
>> -   * "qcom,qca9377-bt"
>> -   * "qcom,wcn3990-bt"
>> -   * "qcom,wcn3991-bt"
>> -   * "qcom,wcn3998-bt"
>> -   * "qcom,qca6390-bt"
>> -
>> -Optional properties for compatible string qcom,qca6174-bt:
>> -
>> - - enable-gpios: gpio specifier used to enable chip
>> - - clocks: clock provided to the controller (SUSCLK_32KHZ)
>> - - firmware-name: specify the name of nvm firmware to load
>> -
>> -Optional properties for compatible string qcom,qca9377-bt:
>> -
>> - - max-speed: see 
>> Documentation/devicetree/bindings/serial/serial.yaml
>> -
>> -Required properties for compatible string qcom,wcn399x-bt:
>> -
>> - - vddio-supply: VDD_IO supply regulator handle.
>> - - vddxo-supply: VDD_XO supply regulator handle.
>> - - vddrf-supply: VDD_RF supply regulator handle.
>> - - vddch0-supply: VDD_CH0 supply regulator handle.
>> -
>> -Optional properties for compatible string qcom,wcn399x-bt:
>> -
>> - - max-speed: see 
>> Documentation/devicetree/bindings/serial/serial.yaml
>> - - firmware-name: specify the name of nvm firmware to load
>> - - clocks: clock provided to the controller
>> -
>> -Examples:
>> -
>> -serial@7570000 {
>> -	label = "BT-UART";
>> -	status = "okay";
>> -
>> -	bluetooth {
>> -		compatible = "qcom,qca6174-bt";
>> -
>> -		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
>> -		clocks = <&divclk4>;
>> -		firmware-name = "nvm_00440302.bin";
>> -	};
>> -};
>> -
>> -serial@898000 {
>> -	bluetooth {
>> -		compatible = "qcom,wcn3990-bt";
>> -
>> -		vddio-supply = <&vreg_s4a_1p8>;
>> -		vddxo-supply = <&vreg_l7a_1p8>;
>> -		vddrf-supply = <&vreg_l17a_1p3>;
>> -		vddch0-supply = <&vreg_l25a_3p3>;
>> -		max-speed = <3200000>;
>> -		firmware-name = "crnv21.bin";
>> -		clocks = <&rpmhcc RPMH_RF_CLK2>;
>> -	};
>> -};
>> diff --git 
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml 
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> new file mode 100644
>> index 0000000..55cd995
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Bluetooth Chips
>> +
>> +maintainers:
>> +  - Rob Herring <robh@kernel.org>
>> +  - Marcel Holtmann <marcel@holtmann.org>
>> +
>> +description:
>> +  This binding describes Qualcomm UART-attached bluetooth chips.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qca6174-bt
>> +      - qcom,qca9377-bt
>> +      - qcom,wcn3990-bt
>> +      - qcom,wcn3991-bt
>> +      - qcom,wcn3998-bt
>> +      - qcom,qca6390-bt
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +    description: gpio specifier used to enable chip
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: clock provided to the controller (SUSCLK_32KHZ)
>> +
>> +  vddio-supply:
>> +    description: VDD_IO supply regulator handle
>> +
>> +  vddxo-supply:
>> +    description: VDD_XO supply regulator handle
>> +
>> +  vddrf-supply:
>> +    description: VDD_RF supply regulator handle
>> +
>> +  vddch0-supply:
>> +    description: VDD_CH0 supply regulator handle
>> +
>> +  max-speed:
>> +    description: see 
>> Documentation/devicetree/bindings/serial/serial.yaml
>> +
>> +  firmware-name:
>> +    description: specify the name of nvm firmware to load
>> +
>> +  local-bd-address:
>> +    description: see 
>> Documentation/devicetree/bindings/net/bluetooth.txt
>> +
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    uart {
> 
> Also, 'serial' is the proper node name.
> 
[Venkata]:
Sure, I will update in next patchset.
>> +        label = "BT-UART";
>> +        status = "okay";
>> +
>> +        bluetooth {
>> +            compatible = "qcom,qca6174-bt";
>> +            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
>> +            clocks = <&divclk4>;
>> +            firmware-name = "nvm_00440302.bin";
>> +        };
>> +    };
>> +  - |
>> +    uart {
>> +
>> +        bluetooth {
>> +            compatible = "qcom,wcn3990-bt";
>> +            vddio-supply = <&vreg_s4a_1p8>;
>> +            vddxo-supply = <&vreg_l7a_1p8>;
>> +            vddrf-supply = <&vreg_l17a_1p3>;
>> +            vddch0-supply = <&vreg_l25a_3p3>;
>> +            max-speed = <3200000>;
>> +            firmware-name = "crnv21.bin";
>> +        };
>> +    };
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Regards,
Venkata.
