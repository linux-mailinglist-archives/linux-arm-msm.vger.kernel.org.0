Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41FB390D78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 02:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhEZAnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 20:43:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34201 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232568AbhEZAnY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 20:43:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621989713; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=50NpdjUo/15mSOLHlwNmqUPYmCwce3Ug4lHCATEAoHE=; b=sRKABHk8D8WYojoQRPSMUbHtyH9ZOV8VZfmUrQ+Tb8z2ZkdaesC6BHmxynvBSkIWjEnxE6Bd
 z07V9sgJpRAgQjrseNqVBkRdhBQp8o7fVILDMZHIxpTxGeg4QJhX18ydADRFkAGQBcRSKinM
 SavJ4m1rSdRye71rVaPswcRmznw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60ad994fceebd0e932555e5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 00:41:51
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E88E1C43217; Wed, 26 May 2021 00:41:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD70DC4338A;
        Wed, 26 May 2021 00:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD70DC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
To:     Saravana Kannan <saravanak@google.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        psodagud@codeaurora.org,
        Android Kernel Team <kernel-team@android.com>
References: <CAGETcx_N-+7e0hgnmtuqavce0qgk7Ertf=9P-0kNZ01SOnFq_w@mail.gmail.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <cc8a433f-bc66-22ad-1fc3-cf35ad5ba32b@codeaurora.org>
Date:   Tue, 25 May 2021 17:41:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAGETcx_N-+7e0hgnmtuqavce0qgk7Ertf=9P-0kNZ01SOnFq_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/25/2021 5:00 PM, Saravana Kannan wrote:
> Sending again due to accidental HTML.
>
> On XXXXX, Siddharth Gupta wrote:
>> On 5/24/2021 8:03 PM, Bjorn Andersson wrote:
>>> On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:
>>>
>>>> Subdevices at the beginning of the subdev list should have
>>>> higher priority than those at the end of the list. Reverse
>>>> traversal of the list causes priority inversion, which can
>>>> impact the performance of the device.
>>>>
>>> The subdev lists layers of the communication onion, we bring them up
>>> inside out and we take them down outside in.
>>>
>>> This stems from the primary idea that we want to be able to shut things
>>> down cleanly (in the case of a stop) and we pass the "crashed" flag to
>>> indicate to each recipient during "stop" that it may not rely on the
>>> response of a lower layer.
>>>
>>> As such, I don't think it's right to say that we have a priority
>>> inversion.
>> My understanding of the topic was that each subdevice should be
>> independent of the other. In our case unfortunately the sysmon
>> subdevice depends on the glink endpoint.
> In that case, the glink has to be prepared/started before sysmon, right?
Yes, that will not change with the introduction of this change.
>
>> However the priority inversion doesn't happen in these
>> subdevices, it happens due to the SSR notifications that we send
>> to kernel clients. In this case kernel clients also can have QMI
>> sockets that in turn depend on the glink endpoint, which means
>> when they go to release the QMI socket a broadcast will be sent
>> out to all connected clients about the closure of the connection
>> which in this case happens to be the remoteproc which died. So
>> if we peel the onion, we will be unnecessarily be waiting for a
>> dead remoteproc.
> So why can't the QMI layer be smart about this and check that the
> remoteproc hasn't crashed before you try to communicate with it? Or if
> the glink is torn down before QMI gets to broadcast, then it's a
> pretty clear indication of failure and just notify all the kernel side
> QMI clients?
I made a mistake earlier, QMI is the layer that creates a QRTR
based socket over glink, and is not going to understand how the
socket works internally (think of an application creating a TCP
socket). The change makes it so that the glink layer is torn
down before.
>
>>>> For example a device adds the glink, sysmon and ssr subdevs
>>>> to its list. During a crash the ssr notification would go
>>>> before the glink and sysmon notifications. This can cause a
>>>> degraded response when a client driver waits for a response
>>>> from the crashed rproc.
>>>>
>>> In general the design is such that components are not expected to
>>> communicate with the crashed remote when "crashed" is set, this avoids
>>> the single-remote crash.
>> Here the glink device on the rpmsg bus won't know about the
>> crashed remoteproc till we send glink notification first, right?
> Why not just query the current state of the remote proc before trying
> to talk to it? It should be a quick check.
The subdevice concept serves the purpose of informing devices
like glink when the remoteproc goes down. It makes the entire
concept redundant if the subdevices need to check if the
remoteproc is up or not.
>
>> Since we send out sysmon and SSR notifications first, the glink
>> device will still be "alive" on the rpmsg bus.
>>> The case where this isn't holding up is when two remote processors
>>> crashes simultaneously, in which case e.g. sysmon has been seen hitting
>>> its timeout waiting for an ack from a dead remoteproc - but I was under
>>> the impression that this window shrunk dramatically as a side effect of
>>> us fixing the notification ordering.
>> You are right, the window would become smaller in the case of two
>> remoteprocs, but this issue can come up with even a single
>> remoteproc unless prioritize certain subdevices.
> I think the main problem you have here is rproc sub devices that
> depend on other rproc sub devices. But there's no dependency tracking
> here. Your change just happens to work for your specific case because
> the order of the sub devices in the list happens to work for your
> inter-subdevice dependencies. But this is definitely not going to work
> for all users of subdevices.
>
> If keeping track of dependency is too much complexity (I haven't read
> enough rproc code to comment on that), at the least, it looks like you
> need another ops instead of changing the order of stop() callbacks. Or
> at a minimum pick the ordering based on the "crashed" flag. A blanket,
> I'll just switch the ordering of stop() for everyone for all cases is
> wrong.
I will agree with you if you call this change ugly (because it
is), but I don't think this should break anything for anyone.
If subdevices are independent of each other the order in which
subdevice stop()/unprepare() is called becomes irrelevant.

In case they are dependent, for example - A(SSR)->B(glink), we
would call B start() before calling A start() since A cannot work
without B. During tear down unless B stop() is called A will
continue to think B exists, so B stop() needs to be called before
A stop(). Think of the TCP socket example I gave before - unless
TCP/IP knows that the NIC died it will continue to wait for the
other side to respond.
>
> In fact, in the normal/clean shutdown case, I'd think you'll want to
> stop the subdevices in reverse initialization order so that you can
> cleanly stop QMI/sysmon first before shutting down glink.
In the case of a normal/clean shutdown the users of the
remoteproc should cleanup their side of the resources before
informing the remoteproc framework to shutdown the remoteproc.
Reference counting in the framework will ensure that a remoteproc
framework isn't shutdown randomly unless it is a crash.

Thanks,
Sid
>
> -Saravana
