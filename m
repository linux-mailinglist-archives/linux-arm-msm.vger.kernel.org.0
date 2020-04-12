Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED761A5EBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 15:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgDLNZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 09:25:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17217 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725909AbgDLNZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 09:25:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586697944; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4VfuyD4f5rFnoAYJobQ4/A4xjtNnrrA1oaLe/r4z69A=; b=XSmSdUxJDmkltZPanzH4mYNExqxxwDNAVx2oZOOP+ZnjZ5QBI5kv+sSlHR3bZXfRSZ6UShdt
 ldZdLynaPSn6a4OOgyc31vyGtpNgyqO4CyHH8I6tCCAL9cloTD9ga8DsqYrgy+YQAqXkyGyf
 s1mpL717x9BF5RNhN2TK/B+VBHQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9316cb.7f0d02778a40-smtp-out-n04;
 Sun, 12 Apr 2020 13:25:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 690B0C43636; Sun, 12 Apr 2020 13:25:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.136.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD29CC433F2;
        Sun, 12 Apr 2020 13:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD29CC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v16 3/6] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-4-git-send-email-mkshah@codeaurora.org>
 <158646379456.77611.8638840660664120750@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <69028d69-0a11-3ceb-afe1-25171b8718cd@codeaurora.org>
Date:   Sun, 12 Apr 2020 18:55:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158646379456.77611.8638840660664120750@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/10/2020 1:53 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-05 23:32:18)
>> TCSes have previously programmed data when rpmh_flush is called.
> rpmh_flush()
Ok, i will update in v17.
>
>> This can cause old data to trigger along with newly flushed.
>>
>> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>>
>> With this there is no need to invoke rpmh_rsc_invalidate() call from
>> rpmh_invalidate().
>>
>> Simplify rpmh_invalidate() by moving invalidate_batch() inside.
>>
>> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 41 ++++++++++++++++++-----------------------
>>   1 file changed, 18 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 03630ae..a75f3df 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -498,24 +492,25 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>   }
>>   
>>   /**
>> - * rpmh_invalidate: Invalidate all sleep and active sets
>> - * sets.
>> + * rpmh_invalidate: Invalidate sleep and wake sets in batch_cache
>>    *
>>    * @dev: The device making the request
>>    *
>> - * Invalidate the sleep and active values in the TCS blocks.
>> + * Invalidate the sleep and wake values in batch_cache.
>>    */
>>   int rpmh_invalidate(const struct device *dev)
>>   {
>>          struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>> -       int ret;
>> -
>> -       invalidate_batch(ctrlr);
>> +       struct batch_cache_req *req, *tmp;
>> +       unsigned long flags;
>>   
>> -       do {
>> -               ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>> -       } while (ret == -EAGAIN);
>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>> +               kfree(req);
>> +       INIT_LIST_HEAD(&ctrlr->batch_cache);
>> +       ctrlr->dirty = true;
>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   
>> -       return ret;
>> +       return 0;
> Now this always returns 0. Maybe it should become a void function, but
> doing that requires a change in the interconnect code so maybe do it
> later.

Sure i will add in my To-Do list.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
