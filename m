Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACE228DC3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgJNI7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 04:59:53 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:61966 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728296AbgJNI7v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 04:59:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602665990; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KPSsKBU4AtYZ0Tv/Rov4QuYJbSn5M72i4xpfY5+CQ/Y=; b=ldo5+zx7AqhRe0ktFr5W7b1gfpw280thGwsYDGnoXDa7ubYR9sG//pYnjADhk2ihm5TJYevv
 fd6AWgL+axU78ARiFxk3R/zhXzEHZMcRJrkeOACk+8t+XBWjAaYMrjKTlWmCa0nU4EK1ihZR
 XIdoPN0IqhYoSiWX1qegRHsqaJI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f86be0642f9861fb1a84736 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 08:59:50
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3898C43387; Wed, 14 Oct 2020 08:59:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.66.241] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BAC7C433CB;
        Wed, 14 Oct 2020 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BAC7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        sergei.shtylyov@gmail.com
References: <20201008235934.8931-1-wcheng@codeaurora.org>
 <20201008235934.8931-3-wcheng@codeaurora.org>
 <20201013150056.GA3497815@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <6814554a-8587-7293-97c9-c3c1d10e86ce@codeaurora.org>
Date:   Wed, 14 Oct 2020 01:59:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013150056.GA3497815@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/2020 8:00 AM, Rob Herring wrote:
> On Thu, Oct 08, 2020 at 04:59:32PM -0700, Wesley Cheng wrote:
>> Introduce the dt-binding for enabling USB type C orientation and role
>> detection using the PM8150B.  The driver will be responsible for receiving
>> the interrupt at a state change on the CC lines, reading the
>> orientation/role, and communicating this information to the remote
>> clients, which can include a role switch node and a type C switch.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  .../bindings/usb/qcom,pmic-typec.yaml         | 115 ++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>> new file mode 100644
>> index 000000000000..40e0a296f922
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm PMIC based USB type C Detection Driver
>> +
>> +maintainers:
>> +  - Wesley Cheng <wcheng@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm PMIC Type C Detect
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm8150b-usb-typec
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: Type C base address
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: CC change interrupt from PMIC
>> +
>> +  port:
>> +    description: Remote endpoint connection to the DRD switch
>> +    type: object
> 
> I don't understand what this is supposed to be. You'll have to expand 
> the example or provide a block diagram of what the connections/routing 
> looks like.
> 

Hi Rob,

The "port" node is going to be the connection to the usb role switch
device, which will be listening for the USB type C port change events.
(i.e handling USB role events, etc...)  In previous patches, this was
part of the connector node, which may not have made much sense, as the
connector model is used to describe the HW connections within a design.
 The role switch endpoint is more of a SW interaction between drivers,
thus the motivation to remove it from the connector node.

I think the current usb-connector design is OK as it is, since the only
component essentially involved in the SS path is the SS MUX that we've
been discussing, and this is true among designs that are supporting SSUSB.


Thanks

Regards,
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
