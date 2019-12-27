Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DB712B4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 14:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfL0NAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 08:00:39 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:55934 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727074AbfL0NAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 08:00:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577451637; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=elAZDYyWpHh1dEeZKdpEIhlxZZccEhpE0oQywbjr8TQ=; b=e9OG2kv43vEvAJLBxEiiADsarodMTzJt7jfn0Lhw5VpJ0/hhaWL01YaxoTkGVlRvWgxqIX7c
 mQv7O+LaVSZvDWolVC1AmVFYV5AB1iWWtIpjcY1Bk9ZgXSm5pbxmTwlq3BWUynmK5kpxxAHR
 TNA+iGaBBKpwjKSo5Z9YeX4fv9g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e060072.7f7729b19420-smtp-out-n01;
 Fri, 27 Dec 2019 13:00:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BF47C447AF; Fri, 27 Dec 2019 13:00:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.204.79.138] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36A09C447AD;
        Fri, 27 Dec 2019 13:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36A09C447AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Documentation for qcom,eud
To:     Rob Herring <robh@kernel.org>,
        Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        rnayak@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org,
        Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-2-git-send-email-pheragu@codeaurora.org>
 <20180925192507.GA19360@bogus>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <03949a1b-ee93-ee71-ff6e-e1f045b15129@codeaurora.org>
Date:   Fri, 27 Dec 2019 18:30:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20180925192507.GA19360@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

We would like to revive this thread, We also would like to address your 
comments on this patch set.

Please consider our reply against your comments so that we can proceed.

On 9/26/2018 12:55 AM, Rob Herring wrote:
> On Tue, Sep 04, 2018 at 02:34:12PM -0700, Prakruthi Deepak Heragu wrote:
>> Documentation for Embedded USB Debugger (EUD) device tree bindings.
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 41 ++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> new file mode 100644
>> index 0000000..a03021a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
>> @@ -0,0 +1,41 @@
>> +* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
>> +
>> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
>> +on chip to support the USB-based debug and trace capabilities.
> Is it just for debug and normally bypassed?
Yes, In normal mode EUD is bypassed.
>> +
>> +Required properties:
>> +
>> + - compatible:  Should be "qcom,msm-eud"
> Needs to be SoC specific (though a fallback is fine).

This IP will be present in all qcom SoC's that is why this is specific 
to qcom, let us know if this is anyway problematic?

>> + - interrupts:  Interrupt number
>> + - reg: Should be address and size of EUD register space
>> +
>> +Driver notifies clients for VBUS attach/detach and charger enable/disable
> Bindings are for h/w blocks, not drivers.
This has been addressed in patch set v3 which is pending for your review.
>
>> +events. The link between client and EUD is established via a directed
>> +graph. EUD driver has one endpoint of the graph link mentioning EUD as an
>> +output link and clients registered for these notifications from the EUD
>> +should have the other endpoint of the graph link as an input link.
> OF graph is for describing data flows (i.e. h/w connections), not
> clients wanting some event.

Will rephrasing above description as below would work?

"The link between event receiver and EUD is established via a directed 
graph. Where EUD act as output link and event receiver(ex. usb 
controller or charger h/w)  as input link"

>> Each of
>> +these endpoints should contain a 'remote-endpoint' phandle property that
>> +points to the corresponding endpoint in the port of the remote device.
> You don't need to describe how the graph binding works. Just what the
> port assignments are.

patch set v3 has removed the part describing how graph binding works.

>
> I worry this is going to collide with using the graph binding for USB
> connectors.

Can you please elaborate your query little more? USB controller has 
input connection from EUD as well as USB connectors.

As mentioned earlier, usb controller receive event from EUD only in 
debug mode while in normal mode USB connector supplies the event.

does that address concern?

>
>> +
>> +An example for EUD device node:
>> +
>> +	eud: qcom,msm-eud@88e0000 {
>> +		compatible = "qcom,msm-eud";
>> +		interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg = <0x88e0000 0x4000>;
>> +		port {
>> +                	eud_output: endpoint {
>> +                        	remote-endpoint = <&usb3_input>;
>> +                        };
>> +        	};
>> +	};
>> +
>> +An example for EUD client:
> What are possible clients? Could we want to switch clients at runtime?

As of now clients are usb controller and charger hardware, and they are 
fixed.

EUD application decide events dynamically.

>
>> +
>> +	usb3 {
>> +		port {
>> +                	usb3_input: endpoint {
>> +                        	remote-endpoint = <&eud_output>;
>> +                        };
>> +        	};
>> +	};
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
