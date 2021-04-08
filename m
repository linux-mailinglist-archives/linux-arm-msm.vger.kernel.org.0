Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70745357B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 06:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhDHExV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 00:53:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32186 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhDHExV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 00:53:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617857590; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QqXE4ejJAgtd/c/muemMoevn+W3/HSUeukjZSrm63wA=; b=umJrHU7rYyt8lsCxazDviJDouW2rjD71tROoV+RMvCU00AUZAy3ZCcDEQ/EbPtf2SBT0PftJ
 HZmqcHTXhhdLxGzGBAnaSl5w8alEYcV/WT970p5F9qCkEHBr+M+BnbWqU10fhWD1Nzqlm16F
 hEC0qRBScxAKLiyJNwriD+Mx4V4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 606e8c3274f773a6645b37fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 04:53:06
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C08BC43468; Thu,  8 Apr 2021 04:53:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [49.206.34.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97356C433ED;
        Thu,  8 Apr 2021 04:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97356C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <YF3jfshT3OSolcws@kroah.com>
 <e1afc071-57a6-5d7f-b467-92b618419b76@codeaurora.org>
 <YGLqXI8HOaOrMq1B@kroah.com>
 <d2348b758fa57acf53885b67f066e0a1@codeaurora.org>
 <YGMIoM3xIZzRvU3i@kroah.com>
 <c984ff015109ed606d2933125d385015@codeaurora.org>
 <YGMohXctT9FqiG4N@kroah.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <7f67d898-2b04-8e38-a945-5a717d1ce8c4@codeaurora.org>
Date:   Thu, 8 Apr 2021 10:22:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGMohXctT9FqiG4N@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/30/2021 7:02 PM, Greg Kroah-Hartman wrote:
> On Tue, Mar 30, 2021 at 06:18:43PM +0530, Sai Prakash Ranjan wrote:
>> On 2021-03-30 16:46, Greg Kroah-Hartman wrote:
>>> On Tue, Mar 30, 2021 at 03:25:58PM +0530, Sai Prakash Ranjan wrote:
>>>> On 2021-03-30 14:37, Greg Kroah-Hartman wrote:
>>>>> On Tue, Mar 30, 2021 at 02:12:04PM +0530, Sandeep Maheswaram wrote:
>>>>>> On 3/26/2021 7:07 PM, Greg Kroah-Hartman wrote:
>>>>>>> On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
>>>>>>>> This patch adds a shutdown callback to USB DWC core driver to ensure that
>>>>>>>> it is properly shutdown in reboot/shutdown path. This is required
>>>>>>>> where SMMU address translation is enabled like on SC7180
>>>>>>>> SoC and few others. If the hardware is still accessing memory after
>>>>>>>> SMMU translation is disabled as part of SMMU shutdown callback in
>>>>>>>> system reboot or shutdown path, then IOVAs(I/O virtual address)
>>>>>>>> which it was using will go on the bus as the physical addresses which
>>>>>>>> might result in unknown crashes (NoC/interconnect errors).
>>>>>>>>
>>>>>>>> Previously this was added in dwc3 qcom glue driver.
>>>>>>>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
>>>>>>>> But observed kernel panic as glue driver shutdown getting called after
>>>>>>>> iommu shutdown. As we are adding iommu nodes in dwc core node
>>>>>>>> in device tree adding shutdown callback in core driver seems correct.
>>>>>>> So shouldn't you also remove this from the qcom glue driver at the same
>>>>>>> time?  Please submit both as a patch series.
>>>>>>>
>>>>>>> thanks,
>>>>>>>
>>>>>>> greg k-h
>>>>>> Hi Greg,
>>>>>>
>>>>>> The qcom glue driver patch is not merged yet. I have just mentioned
>>>>>> for it for reference.
>>>>> You know that we can not add callbacks for no in-kernel user, so what
>>>>> good is this patch for now?
>>>>>
>>>> What in-kernel user? Since when does shutdown callback need an
>>>> in-kernel
>>>> user? When you reboot or shutdown a system, it gets called. The reason
>>>> why the shutdown callback is needed is provided in the commit text.
>>> As I can't see the patch here, I have no idea...
>> You are replying now to the same patch which adds this shutdown callback :)
>> Anyways the qcom dwc3 driver patch which is abandoned which is also
>> mentioned
>> in the commit text is here [1] and the new shutdown callback patch which we
>> are both replying to is in here [2]
>>
>> [1] https://lore.kernel.org/lkml/1605162619-10064-1-git-send-email-sanm@codeaurora.org/
>>
>> [2] https://lore.kernel.org/lkml/1616527652-7937-1-git-send-email-sanm@codeaurora.org/
> Thanks, so, what am I supposed to do here?  The patch is long gone from
> my queue...
>
> greg k-h

Hi Greg,

Should I resend this patch ? If so let me know your about opinion about 
Stephen's comment on just calling dwc3_remove in

dwc3_shutdown and ignoring return value.

https://lore.kernel.org/patchwork/patch/1401242/#1599316

Thanks

Sandeep

