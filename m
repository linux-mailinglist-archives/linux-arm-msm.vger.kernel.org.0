Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7574E36AB66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 06:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhDZETo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 00:19:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18713 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhDZETm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 00:19:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619410741; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=66tJuA13q/oDNjPH3yutoGke3HUXSFdj83MfWMzDQPk=; b=f0Hiqu8jrCPZNxBl/Sq1Mgzpv72HkXhmz4/YqdiTKmZbn48lhNucCe7tz1s9qjD7GeOUmvSS
 Hfc8gGX2GCyhSqo+dUgdsiph8L9lFeWiX8yOM5HwmJsTToinsy+XppGEK484xDdRZfBQP5fN
 D80YxTJhBi3hApWWYpGGlPJn7+E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60863f11f34440a9d4667191 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 04:18:25
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DA56C4338A; Mon, 26 Apr 2021 04:18:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.15] (unknown [117.222.115.120])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD284C433F1;
        Mon, 26 Apr 2021 04:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD284C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] nvmem: qfprom: minor nit fixes, no functional change
To:     Doug Anderson <dianders@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
References: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=VN+iP85D6dkEDE=C7Z9rX_-mQXU-u-Jo_5=s46tZcq0Q@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <4ae40590-d806-5538-79b6-d3c343d8b7c7@codeaurora.org>
Date:   Mon, 26 Apr 2021 09:48:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VN+iP85D6dkEDE=C7Z9rX_-mQXU-u-Jo_5=s46tZcq0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/23/2021 8:34 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 23, 2021 at 12:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> Fix a missed newline, and update a comment which is stale
>> after the merge of '5a1bea2a: nvmem: qfprom: Add support for fuse
>> blowing on sc7280'
>> No other functional change in this patch.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>> Sending a follow-up patch for these nits since they came in after
>> the previous patch was already pulled in
>> https://lore.kernel.org/patchwork/patch/1401964/
>>
>>   drivers/nvmem/qfprom.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
>> index d6d3f24..b7d2060 100644
>> --- a/drivers/nvmem/qfprom.c
>> +++ b/drivers/nvmem/qfprom.c
>> @@ -122,6 +122,7 @@ static const struct qfprom_soc_compatible_data sc7280_qfprom = {
>>          .keepout = sc7280_qfprom_keepout,
>>          .nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
>>   };
>> +
>>   /**
>>    * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
>>    * @priv: Our driver data.
>> @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>>          }
>>
>>          /*
>> -        * Hardware requires 1.8V min for fuse blowing; this may be
>> +        * Hardware requires a min voltage for fuse blowing; this may be
>>           * a rail shared do don't specify a max--regulator constraints
>>           * will handle.
>>           */
> 
> Thanks for sending these! Is there a reason you didn't do the "else
> if" change too?

Oops, sorry, looks like i didn't scroll all the way down.
Sending a v2 shortly.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
