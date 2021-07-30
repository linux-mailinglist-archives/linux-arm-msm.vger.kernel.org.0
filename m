Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8953DB30B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 07:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbhG3F5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 01:57:49 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15467 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237004AbhG3F5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 01:57:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627624665; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i8VV9v0a2gpBXLh/ROC+kMXxRYleXm1itqYFFkohULA=; b=FaNmDqPKbzk/643nKupXQA44meI4I4mGzfs+hCbjMU2voSWPhp/SZb8BEWCsQR7Wdug5mf+f
 bgWe7o+XZvdjQhaVI4k13Dcrfh81dEPdrkXvJU7/yLQNizUGku5mA7ecaluvS1Ok9UsVtktY
 qKijHdEjzj011qXZ6MDgrfPMyFk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 610394d34815712f3add5a55 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 05:57:39
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6D22C433F1; Fri, 30 Jul 2021 05:57:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.203.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D19B3C4338A;
        Fri, 30 Jul 2021 05:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D19B3C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: qfprom: Add optional
 power-domains property
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org>
 <1627560036-1626-2-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=Vtp0HGFpoS4cdZOQ0GUBbhiyw=TuYxWNTGVAyMUKMhvQ@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9e482bc2-59e0-0d30-aa7e-4e2a2bd594b4@codeaurora.org>
Date:   Fri, 30 Jul 2021 11:27:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Vtp0HGFpoS4cdZOQ0GUBbhiyw=TuYxWNTGVAyMUKMhvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/29/2021 9:49 PM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 29, 2021 at 5:01 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> qfprom devices on some SoCs need to vote on the performance state
>> of a power-domain, so add the power-domains optional property to the
>> bindings
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> index 861b205..a498a08 100644
>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> @@ -51,6 +51,9 @@ properties:
>>     vcc-supply:
>>       description: Our power supply.
>>
>> +  power-domains:
>> +    description: A phandle to a power domain node.
>> +
> 
> I'm trying to channel my inner Rob here by saying that this
> description doesn't add anything and this should just be:

Thanks, I trust the inner Rob in you :), so I'll drop the description
and repost.

> 
> power-domains:
>    maxItems: 1
> 
> Here's an example of Rob saying this:
> 
> https://lore.kernel.org/linux-devicetree/20210712151322.GA1931925@robh.at.kernel.org/
> 
> Other than that, feel free to add my "Reviewed-by" tag.
> 
> -Doug
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
