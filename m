Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2031DAEDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 11:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgETJci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 05:32:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:20911 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726688AbgETJch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 05:32:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589967157; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8wS2Ok+wgF4WG5zj5QXvmTTV1vQ1OAhmfXmB4CKETuM=; b=D5Gru2w/XR5KAiFUzDFFt9fsD+JwL6zCl79djbOZo5j7fzKoFGE5sEAmQHUmFHySoBko0f1L
 tTW3uRzGGguOIK4h1udSU+s9zq6RwjMUZqZiaqrQO6bP5kCYY4RWnw6cTzaxDrz+HAOgZ/Gj
 2eX7ydlXlFhUAfw2POqQVb9wKf0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec4f9330d1be1ca0171fad3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 09:32:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77A33C433C8; Wed, 20 May 2020 09:32:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.10] (unknown [183.83.147.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66090C433C6;
        Wed, 20 May 2020 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66090C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
Subject: Re: [PATCH V5 5/5] rpmsg: glink: unregister rpmsg device during
 endpoint destroy
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
 <1589346606-15046-6-git-send-email-aneela@codeaurora.org>
 <20200513221342.GC8328@xps15>
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
Message-ID: <be35a111-87cc-7d5e-fd74-8653175f8a09@codeaurora.org>
Date:   Wed, 20 May 2020 15:02:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200513221342.GC8328@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/14/2020 3:43 AM, Mathieu Poirier wrote:
> On Wed, May 13, 2020 at 10:40:06AM +0530, Arun Kumar Neelakantam wrote:
>> Rpmsg device unregister is not happening if channel close is triggered
>> from local side and causing re-registration of device failures.
>>
>> Unregister rpmsg device for local close in endpoint destroy path.
>>
>> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
>> ---
>>   drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 0e8a28c0..fc8ef66 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1207,6 +1207,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>>   {
>>   	struct glink_channel *channel = to_glink_channel(ept);
>>   	struct qcom_glink *glink = channel->glink;
>> +	struct rpmsg_channel_info chinfo;
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(&channel->recv_lock, flags);
>> @@ -1214,6 +1215,13 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>>   	spin_unlock_irqrestore(&channel->recv_lock, flags);
>>   
>>   	/* Decouple the potential rpdev from the channel */
>> +	if (channel->rpdev) {
> If we proceed this way no other channel can have an rpdev.  I would hope that
> unregistration of rpdev would be more symetrical to what is done in patch 03.
>
> Thanks,
> Mathieu
Unregister here also required along with in qcom_glink_rx_close() 
otherwise if the remote open the channel again it map to stale rpmsg 
device.
>
>> +		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>> +		chinfo.src = RPMSG_ADDR_ANY;
>> +		chinfo.dst = RPMSG_ADDR_ANY;
>> +
>> +		rpmsg_unregister_device(glink->dev, &chinfo);
>> +	}
>>   	channel->rpdev = NULL;
>>   
>>   	qcom_glink_send_close_req(glink, channel);
>> @@ -1477,6 +1485,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
>>   
>>   		rpmsg_unregister_device(glink->dev, &chinfo);
>>   	}
>> +	channel->rpdev = NULL;
>>   
>>   	qcom_glink_send_close_ack(glink, channel->rcid);
>>   
>> -- 
>> 2.7.4
