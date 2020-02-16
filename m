Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817F1160422
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 14:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgBPNPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 08:15:07 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25212 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728009AbgBPNPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 08:15:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581858906; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5WgNLkoZaizjR2CQ36beTIXiSMguicFOfe2WiUmsxlk=; b=uwiTw/VcysWh25ryA1wcAo+jml7ozhTUKXmUsfjLffsdlsoIZLYOsjWcAHrZtwJxM0SZ9PPP
 Mqb2ARYwJcLkPNINmHu0wvMXjCaELvGaXA4Iy4jWrJ5qMQ5K/BSQAi3lftm/e1JFhCA7s1+h
 wLX8oZteE3I6nWeZlh0D/dLYbhA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e494057.7fa3a96a8c38-smtp-out-n02;
 Sun, 16 Feb 2020 13:15:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31F97C4479C; Sun, 16 Feb 2020 13:15:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0114AC43383;
        Sun, 16 Feb 2020 13:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0114AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Documentation for qcom,eud
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, rnayak@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-2-git-send-email-akdwived@codeaurora.org>
 <f06e6af6-5045-ce75-fcc6-e07890b3a29c@linaro.org>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <cbd9adaf-7333-ede3-d407-0ccbe91a2f4c@codeaurora.org>
Date:   Sun, 16 Feb 2020 18:44:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f06e6af6-5045-ce75-fcc6-e07890b3a29c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/4/2020 8:47 AM, Bryan O'Donoghue wrote:
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
>
> Forgot to mention, this file should be described in YAML.
Ok
>
> ./Documentation/devicetree/writing-schema.rst
> ./Documentation/devicetree/bindings/example-schema.yaml
>
> ---
> bod

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
