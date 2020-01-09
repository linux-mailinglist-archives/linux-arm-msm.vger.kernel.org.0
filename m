Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D15F135C0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 16:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgAIO7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 09:59:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:30904 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730890AbgAIO7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 09:59:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578581939; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iSl+LB/3BIrP2Fa1QYnWMrI84wPYNQRIyqOJ3huP4hI=; b=i5f0LcNBz7o2xZXoq4IbKQYH5tD4+iWUDrGSNf3vdHLpnGPWuE0wgJDi/MjIRWezMoMFwfn7
 M3cFfAuneefXF7bmn4v2b9v6cyuFvtx2gzvLI1UvbjkxKnFjz0MGtUtoIzv024CC9rHp51XH
 EFgvgujlAut2wBbfp4X5hIKC7EA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e173fb1.7fa221314848-smtp-out-n02;
 Thu, 09 Jan 2020 14:58:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9DD4C4479C; Thu,  9 Jan 2020 14:58:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.138] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7A33C433CB;
        Thu,  9 Jan 2020 14:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7A33C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Documentation for qcom,eud
To:     Rob Herring <robh@kernel.org>,
        Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org,
        Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
 <1542310374-18474-2-git-send-email-pheragu@codeaurora.org>
 <20181117144705.GA18155@bogus>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <7308d80f-7d0c-62bd-5b7d-63813e420c47@codeaurora.org>
Date:   Thu, 9 Jan 2020 20:28:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20181117144705.GA18155@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/17/2018 8:17 PM, Rob Herring wrote:
> On Thu, Nov 15, 2018 at 11:32:53AM -0800, Prakruthi Deepak Heragu wrote:
>> Documentation for Embedded USB Debugger (EUD) device tree bindings.
> I asked questions on v2 which were never answered.

HI Rob,

Can you please review my replies against your comments on patchset v2?

>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 43 ++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> new file mode 100644
>> index 0000000..6d339e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> @@ -0,0 +1,43 @@
>> +* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
>> +
>> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
>> +on chip to support the USB-based debug and trace capabilities.
>> +
>> +Required properties:
>> +
>> + - compatible:  Should be "qcom,msm-eud"
>> + - interrupts:  Interrupt number
>> + - reg: Should be address and size of EUD register space
>> +
>> +EUD notifies clients for VBUS attach/detach and charger enable/disable
>> +events. The link between client and EUD is established via a directed
>> +graph. EUD has one endpoint of the graph link mentioning EUD as an
>> +output link and clients of EUD should have the other endpoint of the
>> +graph link as an input link.
>> +
>> +An example for EUD device node:
>> +
>> +	eud: qcom,msm-eud@88e0000 {
>> +		compatible = "qcom,msm-eud";
>> +		interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg = <0x88e0000 0x4000>;
>> +		usb_con: connector {
>> +                compatible = "usb-c-connector";
>> +                label = "USB-C";
>> +                port {
>> +                	    eud_usb_output: endpoint {
>> +                        	    remote-endpoint = <&eud_usb3_input>;
>> +                        };
>> +        	    };
>> +        };
>> +	};
>> +
>> +An example for EUD client:
>> +
>> +	usb3 {
>> +		port {
>> +                eud_usb3_input: endpoint {
>> +                        remote-endpoint = <&eud_usb_output>;
>> +                };
>> +        };
>> +	};
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
