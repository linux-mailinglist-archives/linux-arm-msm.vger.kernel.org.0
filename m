Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7CD3909E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 21:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhEYTto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 15:49:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49404 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232653AbhEYTto (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 15:49:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621972094; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7HujQ3ytiVUpOoBuHQNgqxNnR8h83bOt0+a+zswp5OI=; b=cX6rPQsYrp7JFe6jjSnA81WRnJ5+H3b8rwL2KlrdQTuElKQqLoLIFblkBiWc0pbxpKgQTV/E
 llE8uEizttawBpQDVG8BoeIQKAny/DeQ9NX2ludFaut+JaDF0D3PQvY+qEsiOaVYpUD66nmj
 2o7PnXYbQe6HMi0piwtWJMraGMw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ad54742bff04e53bbf97b9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 19:48:04
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B981EC43460; Tue, 25 May 2021 19:48:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99E50C4338A;
        Tue, 25 May 2021 19:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 99E50C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org
References: <1621292893-18827-1-git-send-email-sidgup@codeaurora.org>
 <YKxo5BXwEPjS5K4d@yoga>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <02bc228b-4bd2-de5a-6cf7-5623b8048e7f@codeaurora.org>
Date:   Tue, 25 May 2021 12:48:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKxo5BXwEPjS5K4d@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/24/2021 8:03 PM, Bjorn Andersson wrote:
> On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:
>
>> Subdevices at the beginning of the subdev list should have
>> higher priority than those at the end of the list. Reverse
>> traversal of the list causes priority inversion, which can
>> impact the performance of the device.
>>
> The subdev lists layers of the communication onion, we bring them up
> inside out and we take them down outside in.
>
> This stems from the primary idea that we want to be able to shut things
> down cleanly (in the case of a stop) and we pass the "crashed" flag to
> indicate to each recipient during "stop" that it may not rely on the
> response of a lower layer.
>
> As such, I don't think it's right to say that we have a priority
> inversion.
My understanding of the topic was that each subdevice should be
independent of the other. In our case unfortunately the sysmon
subdevice depends on the glink endpoint.

However the priority inversion doesn't happen in these
subdevices, it happens due to the SSR notifications that we send
to kernel clients. In this case kernel clients also can have QMI
sockets that in turn depend on the glink endpoint, which means
when they go to release the QMI socket a broadcast will be sent
out to all connected clients about the closure of the connection
which in this case happens to be the remoteproc which died. So
if we peel the onion, we will be unnecessarily be waiting for a
dead remoteproc.
>
>> For example a device adds the glink, sysmon and ssr subdevs
>> to its list. During a crash the ssr notification would go
>> before the glink and sysmon notifications. This can cause a
>> degraded response when a client driver waits for a response
>> from the crashed rproc.
>>
> In general the design is such that components are not expected to
> communicate with the crashed remote when "crashed" is set, this avoids
> the single-remote crash.
Here the glink device on the rpmsg bus won't know about the
crashed remoteproc till we send glink notification first, right?
Since we send out sysmon and SSR notifications first, the glink
device will still be "alive" on the rpmsg bus.
>
> The case where this isn't holding up is when two remote processors
> crashes simultaneously, in which case e.g. sysmon has been seen hitting
> its timeout waiting for an ack from a dead remoteproc - but I was under
> the impression that this window shrunk dramatically as a side effect of
> us fixing the notification ordering.
You are right, the window would become smaller in the case of two
remoteprocs, but this issue can come up with even a single
remoteproc unless prioritize certain subdevices.
>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 626a6b90f..ac8fc42 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1167,7 +1167,7 @@ static int rproc_handle_resources(struct rproc *rproc,
>>   
>>   static int rproc_prepare_subdevices(struct rproc *rproc)
>>   {
>> -	struct rproc_subdev *subdev;
>> +	struct rproc_subdev *subdev, *itr;
>>   	int ret;
>>   
>>   	list_for_each_entry(subdev, &rproc->subdevs, node) {
>> @@ -1181,9 +1181,11 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
>>   	return 0;
>>   
>>   unroll_preparation:
>> -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
>> -		if (subdev->unprepare)
>> -			subdev->unprepare(subdev);
>> +	list_for_each_entry(itr, &rproc->subdevs, node) {
>> +		if (itr == subdev)
>> +			break;
>> +		if (itr->unprepare)
>> +			itr->unprepare(subdev);
>>   	}
>>   
>>   	return ret;
>> @@ -1191,7 +1193,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
>>   
>>   static int rproc_start_subdevices(struct rproc *rproc)
>>   {
>> -	struct rproc_subdev *subdev;
>> +	struct rproc_subdev *subdev, *itr;
>>   	int ret;
>>   
>>   	list_for_each_entry(subdev, &rproc->subdevs, node) {
>> @@ -1205,9 +1207,11 @@ static int rproc_start_subdevices(struct rproc *rproc)
>>   	return 0;
>>   
>>   unroll_registration:
>> -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
>> -		if (subdev->stop)
>> -			subdev->stop(subdev, true);
>> +	list_for_each_entry(itr, &rproc->subdevs, node) {
>> +		if (itr == subdev)
>> +			break;
>> +		if (itr->stop)
>> +			itr->stop(itr, true);
>>   	}
>>   
>>   	return ret;
>> @@ -1217,7 +1221,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
>>   {
>>   	struct rproc_subdev *subdev;
>>   
>> -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>> +	list_for_each_entry(subdev, &rproc->subdevs, node) {
> I presume this is the case you actually care about, can you help me
> understand if you changed the others for consistence or if there's some
> flow of events where that might be necessary.
Yes you are right, I only changed the others for consistence.
However, I will give this more thought and see if unprepare in
the reverse order can make a difference.

Thanks,
Sid
>
> Regards,
> Bjorn
>
>>   		if (subdev->stop)
>>   			subdev->stop(subdev, crashed);
>>   	}
>> @@ -1227,7 +1231,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>>   {
>>   	struct rproc_subdev *subdev;
>>   
>> -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>> +	list_for_each_entry(subdev, &rproc->subdevs, node) {
>>   		if (subdev->unprepare)
>>   			subdev->unprepare(subdev);
>>   	}
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
