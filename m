Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C08275AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 16:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIWOzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 10:55:20 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:63607 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgIWOzU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 10:55:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600872920; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=g1EwZU50j8AHC5qbXjEPUsEa4+UOYZkGy7owG2kQFjE=; b=rjLHuwVz/UXWfCcek9s7YCwJx7w7U4J+ZsKO4FXfYzhd3P1mxwEb2tWf+Jq4YIc2I31NsnmZ
 SxbRxVhGhQyqp17hxEXr5uE1gxTvzg/KrtydYAuHT8yVmqt0XXp2RG5Vw6buUkYm5r5SJR+g
 sn4+unql6rvSG4/GaOWCS96iRPM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6b61d751ea4325f30bbf5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 14:55:19
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96607C433CA; Wed, 23 Sep 2020 14:55:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EE38C433C8;
        Wed, 23 Sep 2020 14:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8EE38C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
 <797a690f-247c-7ff1-6468-8d56b0b81116@codeaurora.org>
 <CAMZdPi-iaCWm21GzTLpoXZuCxawAPgLo_X91zSQ2VFTfV_4rvA@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <673a42ea-70d0-3005-b359-a54407bdb66e@codeaurora.org>
Date:   Wed, 23 Sep 2020 08:55:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-iaCWm21GzTLpoXZuCxawAPgLo_X91zSQ2VFTfV_4rvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/23/2020 8:35 AM, Loic Poulain wrote:
> Hi Jeffrey,
> 
> On Wed, 23 Sep 2020 at 16:04, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 9/23/2020 7:40 AM, Loic Poulain wrote:
>>> This is a generic MHI-over-PCI controller driver for MHI only devices
>>> such as QCOM modems. For now it supports registering of Qualcomm SDX55
>>> based PCIe modules. The MHI channels have been extracted from mhi
>>> downstream driver.
>>>
>>> This driver is easily extendable to support other MHI PCI devices like
>>> different modem hw or OEM superset.
>>>
>>
>> Maybe I'm being a bit dense, but what does this "driver" even do?
>>
>> Ok, it'll bind to SDX55 and "power up" the MHI.  I don't see any
>> communication with the device, so I'm not really seeing the value here.
>>    Feels like this should be patch 1 of a series, but patches 2 - X are
>> "missing".
> 
> Well, yes and no. On MHI controller side point-of-view, the driver is
> quite complete, since its only goal is to implement the MHI transport
> layer and to register the available channels. The PCI driver is really
> no expected to do more (contrary to ath11k), everything else will be
> implemented by MHI device drivers at upper level. I agree most of them
> are not yet implemented (only qrtr-mhi for IPCR channel), but I'm
> currently working on this.

Hmm.  I guess I wonder why the functionality provided by this patch 
isn't incorporated into some other driver.  I see why its not really a 
great idea to pick a random client driver (like ipc router) and push the 
responsibility into them.  However, do we hook up these external modems 
to remoteproc?  If we are managing the devices somewhere else (for FW 
loading, SSR, etc), then it would seem like a good place for this 
functionality.

In summary, this feels like a shim driver that is a driver for driver's 
sake, which doesn't feel like the right design.  I don't think I have a 
better suggestion through.  Since I don't have a concrete "this should 
be done some other way" I won't be offended if you ignore this "complaint".

However, assuming you continue with this approach, I think this change 
needs more documentation.  At a minimum I think what you just explained 
to me needs to be in the commit text.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
