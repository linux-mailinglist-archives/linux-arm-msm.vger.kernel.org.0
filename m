Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E10D45B81D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 11:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhKXKPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 05:15:21 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:40458 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbhKXKPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 05:15:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637748731; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F5fahqnYpyAflep0RmdFu8+qVgtB2nLPPnOrLfo/vAw=;
 b=RWoua93AKvdKcQHgSLc5a8F3l4Txe+DJPg6QMD/cJEO1tDyp6A50pk59c6AV61eGuDgSrYC1
 fEky8Xn01IOT/q4vJQmD6aUnR/8spZFdgJzECEk7h4/UrNSXifB3jla8w7+cUe3S+1zvDpZM
 7E+xsrbm2H03Y58MWeU4Tn67yxU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 619e0ffabebfa3d4d51f207a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 10:12:10
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D4BDC4360D; Wed, 24 Nov 2021 10:12:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 811C3C4338F;
        Wed, 24 Nov 2021 10:12:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Nov 2021 15:42:09 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com
Subject: Re: [PATCH V1 1/8] dt-bindings: Add the yaml bindings for EUD
In-Reply-To: <YZ2zx4/8+yCcls/G@ripper>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
 <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
 <YZ2zx4/8+yCcls/G@ripper>
Message-ID: <c1772ad6c60dabd206be9cf91dd08c77@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-24 09:08, Bjorn Andersson wrote:
> On Mon 22 Nov 20:28 PST 2021, Souradeep Chowdhury wrote:
> 
>> Documentation for Embedded USB Debugger(EUD) device tree
>> bindings in yaml format.
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 52 
>> ++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml 
>> b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> new file mode 100644
>> index 0000000..724552c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Embedded USB Debugger
>> +
>> +maintainers:
>> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +
>> +description: |
> 
> The '|' indicates that the formatting is significant, but it's not.

Ack

> 
>> +  This binding is used to describe the Qualcomm Embedded USB 
>> Debugger, which is
>> +  mini USB-hub implemented on chip to support USB-based debug 
>> capabilities.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,sc7280-eud
>> +      - const: qcom,eud
>> +
>> +  reg:
>> +    items:
>> +      - description: EUD Base Register Region
>> +      - description: EUD Mode Manager Register
>> +
>> +  interrupts:
>> +    description:
>> +      EUD interrupt
>> +
>> +
> 
> Drop one of these two empty lines please.

Ack

> 
>> +  port:
>> +    description:
>> +      Any connector to the data bus of this controller should be 
>> modelled
>> +      using the OF graph bindings specified, if the "usb-role-switch"
>> +      property is used. See graph.txt
> 
> This description does unfortunately not help me to understand what to
> point this port to.
> 
> What's "the data bus"?
> 
> Is usb-role-switch a property to be put in this node? Doesn't it need 
> to
> be mentioned as a valid property?

The end point of this port is attached to the connector child of dwc3 
node. The dwc3 node has the "usb-role-switch"
property. So "usb-role-switch" is not a valid property of the EUD node.
Will update the description with more clarity accordingly.


> 
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    eud@88e0000 {
>> +           compatible = "qcom,sc7280-eud","qcom,eud";
>> +           reg = <0 0x88e0000 0 0x2000>,
>> +                 <0 0x88e2000 0 0x1000>;
> 
> The example is compiled with #address-cells == #size-cells == 1, so 
> drop
> the four lone 0s from the reg.

Ack

> 
> Regards,
> Bjorn
> 
>> +    };
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
