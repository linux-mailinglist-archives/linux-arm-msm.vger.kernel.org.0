Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F082375955
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236230AbhEFRci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:32:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45813 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236228AbhEFRch (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:32:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620322299; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Kij3ShauDPQySGvvAZ5aCm6m+aGcT0wETnIQLv33ZHs=;
 b=VYX2+wUmXvTI1D5hqcrwB6L/Z/UuBvLWGzw3lMm/a67qaq7qps3j6Kh+ZUUJn69LkTrg6K79
 F+eSisAE8nFY9leZ/4c5BGw3JkbRqDdvYjtHYBamj5P4h+5384t84jWTmV9RkljiehTo/IAk
 8YWgwoo0bYm+X2oBFCikwTT9pIA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 609427b8853c0a2c4688e11a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 17:30:32
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48655C43145; Thu,  6 May 2021 17:30:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79CB9C4338A;
        Thu,  6 May 2021 17:30:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 23:00:31 +0530
From:   gubbaven@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v2 3/3] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn6750
In-Reply-To: <20210421171209.GA1307554@robh.at.kernel.org>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
 <1618936010-16579-4-git-send-email-gubbaven@codeaurora.org>
 <20210421171209.GA1307554@robh.at.kernel.org>
Message-ID: <c7cbf944557e246e9319daaf81e1505f@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob Herring,
On 2021-04-21 22:42, Rob Herring wrote:
> On Tue, Apr 20, 2021 at 09:56:50PM +0530, Venkata Lakshmi Narayana 
> Gubba wrote:
>> This patch enables regulators and gpios for the Qualcomm Bluetooth 
>> wcn6750
>> controller.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  .../bindings/net/qualcomm-bluetooth.yaml           | 54 
>> +++++++++++++++++++++-
>>  1 file changed, 53 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml 
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> index 55cd995..1ceb02b 100644
>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>> @@ -21,11 +21,17 @@ properties:
>>        - qcom,wcn3990-bt
>>        - qcom,wcn3991-bt
>>        - qcom,wcn3998-bt
>> -      - qcom,qca6390-bt
>> +      - qcom,qca6390-bt
>> +      - qcom,wcn6750-bt
>> 
>>    enable-gpios:
>>      maxItems: 1
>>      description: gpio specifier used to enable chip
>> +
>> +  swctrl-gpios:
>> +    maxItems: 1
>> +    description: gpio specifier is used to find status
>> +                 of clock supply to SoC
>> 
>>    clocks:
>>      maxItems: 1
>> @@ -43,6 +49,30 @@ properties:
>>    vddch0-supply:
>>      description: VDD_CH0 supply regulator handle
>> 
>> +  vddaon-supply:
>> +    description: VDD_AON supply regulator handle
>> +
>> +  vddbtcxmx-supply:
>> +    description: VDD_BT_CXMX supply regualtor handle
> 
> typo
> 
[Venkata]:
I will update in next patchset.
>> +
>> +  vddrfacmn-supply:
>> +    description: VDD_RFA_CMN supply regulator handle
>> +
>> +  vddrfa0p8-supply:
>> +    description: VDD_RFA_0P8 suppply regulator handle
>> +
>> +  vddrfa1p7-supply:
>> +    description: VDD_RFA_1P7 supply regulator handle
>> +
>> +  vddrfa1p2-supply:
>> +    description: VDD_RFA_1P2 supply regulator handle
>> +
>> +  vddrfa2p2-supply:
>> +    description: VDD_RFA_2P2 supply regulator handle
>> +
>> +  vddasd-supply:
>> +    description: VDD_ASD supply regulator handle
>> +
>>    max-speed:
>>      description: see 
>> Documentation/devicetree/bindings/serial/serial.yaml
>> 
>> @@ -85,3 +115,25 @@ examples:
>>              firmware-name = "crnv21.bin";
>>          };
>>      };
>> +  - |
>> +    uart {
> 
> serial {
> 
[Venkata]:
Sure, I will update in next patchset.
>> +
>> +        bluetooth {
>> +            compatible = "qcom,wcn6750-bt";
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&bt_en_default>;
>> +            enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +            swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
>> +            vddio-supply = <&vreg_l19b_1p8>;
>> +            vddaon-supply = <&vreg_s7b_0p9>;
>> +            vddbtcxmx-supply = <&vreg_s7b_0p9>;
>> +            vddrfacmn-supply = <&vreg_s7b_0p9>;
>> +            vddrfa0p8-supply = <&vreg_s7b_0p9>;
>> +            vddrfa1p7-supply = <&vreg_s1b_1p8>;
>> +            vddrfa1p2-supply = <&vreg_s8b_1p2>;
>> +            vddrfa2p2-supply = <&vreg_s1c_2p2>;
>> +            vddasd-supply = <&vreg_l11c_2p8>;
>> +            max-speed = <3200000>;
>> +            firmware-name = "msnv11.bin";
>> +        };
>> +    };
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Regards,
Venkata.
