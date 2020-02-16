Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF016041C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 14:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgBPNMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 08:12:03 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:61809 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728219AbgBPNMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 08:12:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581858721; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=A5ZI/g7WWcSZehWepKEyAPPOsuiaR/FmCfcQVi4vYPQ=; b=qsaY1VtPET3SAT1OkzxBC7I009ZqraJyHtLh0WFkDxwsFmdqbmSv22FAvRm9u1+l+to4fDZ9
 XvsP9gDw37WgivrIslmi/SnKctzsSHUe87BiKs5K8OXulz59RPejiJPsyszXoz+x9Rzlx2Oq
 fXBg3WfbAnvp8RIFT5NYRc51/7Y=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e493f9e.7f63ed18d5e0-smtp-out-n01;
 Sun, 16 Feb 2020 13:11:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 370FDC4479C; Sun, 16 Feb 2020 13:11:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2E0AC43383;
        Sun, 16 Feb 2020 13:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2E0AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Documentation for qcom,eud
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, rnayak@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-2-git-send-email-akdwived@codeaurora.org>
 <9483dfa0-15ea-e9ed-79ee-3dcf97e98136@nexus-software.ie>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <4f19fe93-3af2-1050-4d80-ed568865d825@codeaurora.org>
Date:   Sun, 16 Feb 2020 18:41:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <9483dfa0-15ea-e9ed-79ee-3dcf97e98136@nexus-software.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you very much Bryan for your review comments, will be working on 
your and other maintainers comment on this patchset and will be posting 
new patchset soon.

On 2/4/2020 8:21 AM, Bryan O'Donoghue wrote:
> On 31/01/2020 04:43, Avaneesh Kumar Dwivedi wrote:
>> Documentation for Embedded USB Debugger (EUD) device tree bindings.
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 43 
>> ++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt 
>> b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> new file mode 100644
>> index 0000000..57476ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> @@ -0,0 +1,43 @@
>> +* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
>> +
>> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
>> +on chip to support the USB-based debug and trace capabilities.
>
> on chip to support USB-based debug and trace capabilities.
OK
>
>> +
>> +Required properties:
>> +
>> + - compatible:  Should be "qcom,msm-eud"
>> + - interrupts:  Interrupt number
>> + - reg: Should be address and size of EUD register space
>> +
>> +EUD notifies clients for VBUS attach/detach and charger enable/disable
>> +events. The link between event consumer(i.e.USB controller for vbus
> missing space
> consumer (i.e.
Ok
>
>> +attach/detach event) and EUD is established via a directed graph. EUD
>> +act 
> The EUD acts
OK
>
>> as an output link and clients of EUD as input link of this directed
>> +graph. Events flows through the directed graph only during debug mode.
>
> Probably this is a very obvious question but, you mean debug and trace 
> events or do you mean VBUS/charger events?
Directed graph is to show VBUS and charger events flow.
>
>> +
>> +An example for EUD device node:
>> +
>> +    eud: qcom,msm-eud@88e0000 {
>> +        compatible = "qcom,msm-eud";
>> +        interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
>> +        reg = <0x88e0000 0x4000>;
>> +        usb_con: connector {
>> +            compatible = "usb-c-connector";
>> +            label = "USB-C";
>> +            port {
>> +                eud_usb_output: endpoint {
>> +                    remote-endpoint = <&eud_usb3_input>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +An example for EUD client:
>> +
>> +    usb3 {
>> +        port {
>> +            eud_usb3_input: endpoint {
>> +                remote-endpoint = <&eud_usb_output>;
>> +            };
>> +        };
>> +    };
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
