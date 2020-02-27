Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F61317105D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 06:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbgB0FdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 00:33:05 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:16722 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728453AbgB0FdE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 00:33:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582781583; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=z5QCR+5CQZXJeKsaK1cOJr/DwfcXkvDbVqkcSQPZeS0=; b=dTZZPicrsXfQx0LtihyTIpnlHtEWoqFTkRP1prDVrKhHV90kqVDxDKcB7xdpfBBNHmEML5XO
 t6VDN65CA4TruDhNkkzKRJXsPxjRekf7l3aYL0N3pa+vBrBf6tXmO3J8lk93wKN1lJrokOUn
 zZ4X+Tp+okHkJ5TY5/5cvVopfjA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57547a.7f45e60cea08-smtp-out-n02;
 Thu, 27 Feb 2020 05:32:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C20FC4479F; Thu, 27 Feb 2020 05:32:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5888BC43383;
        Thu, 27 Feb 2020 05:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5888BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v7 2/3] soc: qcom: rpmh: Update dirty flag only when data
 changes
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
 <1582694833-9407-3-git-send-email-mkshah@codeaurora.org>
 <158275700389.177367.5843608826404724304@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3f7c689b-700a-1d76-505e-76446c62439f@codeaurora.org>
Date:   Thu, 27 Feb 2020 11:02:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158275700389.177367.5843608826404724304@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/27/2020 4:13 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-02-25 21:27:12)
>> Currently rpmh ctrlr dirty flag is set for all cases regardless
>> of data is really changed or not. Add changes to update it when
>> data is updated to newer values.
>>
>> Also move dirty flag updates to happen from within cache_lock.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> Probably worth adding a Fixes tag here? Doesn't make sense to mark
> something dirty when it isn't changed.
Done. will update in v8.
>> ---
>>   drivers/soc/qcom/rpmh.c | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index eb0ded0..83ba4e0 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>   existing:
>>          switch (state) {
>>          case RPMH_ACTIVE_ONLY_STATE:
>> -               if (req->sleep_val != UINT_MAX)
>> +               if (req->sleep_val != UINT_MAX) {
>>                          req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          case RPMH_WAKE_ONLY_STATE:
>> -               req->wake_val = cmd->data;
>> +               if (req->wake_val != cmd->data) {
>> +                       req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          case RPMH_SLEEP_STATE:
>> -               req->sleep_val = cmd->data;
>> +               if (req->sleep_val != cmd->data) {
>> +                       req->sleep_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          default:
>>                  break;
> Please remove the default case. There are only three states in the enum. The
> compiler will warn if a switch statement doesn't cover all cases and
> we'll know to add something here if another enum value is added in the
> future.
Done.
>>          }
>>   
>> -       ctrlr->dirty = true;
>>   unlock:
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   
>> @@ -323,6 +331,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>>          list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>>                  kfree(req);
>>          INIT_LIST_HEAD(&ctrlr->batch_cache);
>> +       ctrlr->dirty = true;
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   }
>>   
>> @@ -456,6 +465,7 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>   {
>>          struct cache_req *p;
>> +       unsigned long flags;
>>          int ret;
>>   
>>          if (!ctrlr->dirty) {
>> @@ -488,7 +498,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>                          return ret;
>>          }
>>   
>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>          ctrlr->dirty = false;
>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> So we take the spinlock to update it here. But we don't hold the
> spinlock to test for !dirty up above. Seems like either rpmh_flush() can
> only be called sequentially, or the lock added here needs to be held
> during the whole flush. Which way is it?

Thanks, i will remove !ctrlr->dirty check within rpmh_flush() as 
currently we invoke it only when caches are dirty.

Last cpu going down can first check dirty flag outside rpmh_flush() and 
decide to invoke it accoringly.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
