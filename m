Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D211DAEB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 11:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETJ3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 05:29:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:24492 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgETJ3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 05:29:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589966948; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AH8NpsIZ428sBqJkkR7gT3RuauuE+SCfT6aV1XgGu6Q=; b=FGM3xjY2nhfobWXvyDI53bOr3fRszn9AchT4eZvgZW+0UxICyUuHZ/udnJn5tGqlW+LpLdaw
 BkzzFzWOGHpDRe9V0KTV1z3T/sVKqRAvhlA639jylWe/qWGfbrY8A7lUfb4vWhJke423eDHJ
 YPsRNoMTQePE3QiDIQgX5AM4Jp8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec4f863.7f71746852d0-smtp-out-n04;
 Wed, 20 May 2020 09:29:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6650C433CB; Wed, 20 May 2020 09:29:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.10] (unknown [183.83.147.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CA65C433C8;
        Wed, 20 May 2020 09:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CA65C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
Subject: Re: [PATCH V5 1/5] rpmsg: glink: Use complete_all for open states
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
 <1589346606-15046-2-git-send-email-aneela@codeaurora.org>
 <20200513205915.GA8328@xps15>
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
Message-ID: <0381f314-e833-e1dd-6931-3fb884dddd34@codeaurora.org>
Date:   Wed, 20 May 2020 14:58:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200513205915.GA8328@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/14/2020 2:29 AM, Mathieu Poirier wrote:
> Hi Arun,
>
> On Wed, May 13, 2020 at 10:40:02AM +0530, Arun Kumar Neelakantam wrote:
>> From: Chris Lew <clew@codeaurora.org>
>>
>> The open_req and open_ack completion variables are the state variables
>> to represet a remote channel as open. Use complete_all so there are no
> s/represet/represent
done added in patch set 6
>
>> races with waiters and using completion_done.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
>> ---
>>   drivers/rpmsg/qcom_glink_native.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 1995f5b..604f11f 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -970,7 +970,7 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>>   		return -EINVAL;
>>   	}
>>   
>> -	complete(&channel->open_ack);
>> +	complete_all(&channel->open_ack);
> If you do this and as per the note in the comment section above
> completion_done(), there shouldn't be a need to call completion_done() in
> qcom_glink_announce_create().
>
> Thanks,
> Mathieu
the completion_done() check still required to avoid sending intent 
request on channel which only opened by remote.
>   
>
>>   
>>   	return 0;
>>   }
>> @@ -1413,7 +1413,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>>   	channel->rcid = ret;
>>   	spin_unlock_irqrestore(&glink->idr_lock, flags);
>>   
>> -	complete(&channel->open_req);
>> +	complete_all(&channel->open_req);
>>   
>>   	if (create_device) {
>>   		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
>> -- 
>> 2.7.4
