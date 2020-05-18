Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFF91D7986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 15:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgERNTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 09:19:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52176 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726855AbgERNTU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 09:19:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589807959; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/vpx/m8pDfBLAbCOs2E0+YfNBsuZAzWzTkmXxzLVrpo=; b=Bae+kLlW0UQUhfVjiQv8aV72beSsDiV520x62YU9wbZs05eVNRXHHJkwfMNFtuqB3glzJT9E
 CHmNLso2tpFYOYvnTASQ/PLyOleXRi4cwkJbSGB5bKcpmV/ZfmJ2GKLn+SGm/oPTZOQHK3bs
 M0y5eJlIKkBvT3pIdMI+GJAAlyM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec28b4c.7f67d74a74c8-smtp-out-n04;
 Mon, 18 May 2020 13:19:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2392CC432C2; Mon, 18 May 2020 13:19:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.11] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A269C433F2;
        Mon, 18 May 2020 13:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A269C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V6 3/3] dt-bindings: serial: Add binding for UART pin swap
To:     Rob Herring <robh@kernel.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, rojay@codeaurora.org,
        skakit@codeaurora.org, mka@chromium.org
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
 <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
 <20200515030133.GA11479@bogus>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <884f8277-715c-3377-12b2-c9d9a8413842@codeaurora.org>
Date:   Mon, 18 May 2020 18:49:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515030133.GA11479@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 5/15/2020 8:31 AM, Rob Herring wrote:
> On Thu, May 07, 2020 at 08:30:47PM +0530, Akash Asthana wrote:
>> Add documentation to support RX-TX & CTS-RTS GPIO pin swap in HW.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/serial/serial.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
>> index 53204d9..e657dd6 100644
>> --- a/Documentation/devicetree/bindings/serial/serial.yaml
>> +++ b/Documentation/devicetree/bindings/serial/serial.yaml
>> @@ -67,6 +67,12 @@ properties:
>>         (wired and enabled by pinmux configuration).  This depends on both the
>>         UART hardware and the board wiring.
>>   
>> +  rx-tx-swap:
>> +    description: RX and TX pins are swapped.
>> +
>> +  cts-rts-swap:
>> +    description: CTS and RTS pins are swapped.
> Need 'type: boolean' on both of these.

okay, will correct in next version

Regards,

Akash

>
>> +
>>   if:
>>     required:
>>       - uart-has-rtscts
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
