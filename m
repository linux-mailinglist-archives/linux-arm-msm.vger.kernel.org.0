Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E857D164535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 14:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBSNVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 08:21:50 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:58328 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726788AbgBSNVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 08:21:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582118510; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EJ69/rQIpsMhqCMo4+XIs+5vRF2VLIJtTPq/QzZue78=; b=emjYqXgPpq7vyJB27qai+bGUmeySnzhr5QxY21cHBpmLPSqcza2mby2QKiJjDoU5WDuiJz0u
 2WkoqwpsBGNPwgQGY+Q4krHMqIy86+pxFZ8HE0U4FRWaqhA2FWHAvDSue9C0h9Xqve0gOtZx
 79495zpXtz2o+t5d7R9uF4kghR0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d366d.7f8e946bbab0-smtp-out-n03;
 Wed, 19 Feb 2020 13:21:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D6A8C4479F; Wed, 19 Feb 2020 13:21:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 190F6C43383;
        Wed, 19 Feb 2020 13:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 190F6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V4 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-4-git-send-email-akashast@codeaurora.org>
 <20200218190731.GC15781@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ec5de895-3e86-811e-7ffc-fb98e115f850@codeaurora.org>
Date:   Wed, 19 Feb 2020 18:51:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218190731.GC15781@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2/19/2020 12:37 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> I didn't see a patch that implements the binding, did you post it?

We haven't posted any update on patch@ 
https://patchwork.kernel.org/cover/11313817/

[tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register]. 
We will spin it ASAP.

>
>
> On Mon, Feb 17, 2020 at 03:06:52PM +0530, Akash Asthana wrote:
>> Add documentation to support RX/TX/CTS/RTS pin swap in HW.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> index 11530df..7e4b9af 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>> @@ -165,6 +165,15 @@ patternProperties:
>>             - description: UART core irq
>>             - description: Wakeup irq (RX GPIO)
>>   
>> +      rx-tx-swap:
>> +        description: RX and TX pins are swap.
> s/swap/swapped/
Ok
>
>> +
>> +      cts-rts-swap:
>> +        description: CTS and RTS pins are swap.
> s/swap/swapped/
Ok
>
>> +
>> +      rx-tx-cts-rts-swap:
>> +        description: RX-TX and CTS-RTS both pairs are swap.
> I don't think this option adds much value, if both pairs are swapped
> the above two properties can be set.

Yeah ok, It is possible to derive value for rx-tx-cts-rts if above 2 
properties are set.

>
>> +
>>       required:
>>         - compatible
>>         - interrupts
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

Thanks for reviewing,


Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
