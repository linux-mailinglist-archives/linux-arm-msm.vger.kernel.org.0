Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D18029D6CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731741AbgJ1WS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:18:27 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:23547 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731778AbgJ1WSV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:18:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603923500; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=n61h+5YYasIk33Lo8BOIbNeWUCt022f8IcnO5pYLxNg=; b=vpGPA6fglx4vNtOwFE7RWOxaOfjIs2wPPjGVzgoBk2kbbNTr4gd5x7AAmAwJj4uXDLdSAZMq
 wo4CWbEV5iSrgH1SblqDV2ABhZF2Q5xHz6xh/p6gb2/RwlZJVy/gN2PwwtYA00NXCkrrK/ce
 vUCYVgU3fvKMQSyBvNeroluS2Rs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f997e9c20b52b32d7d55db6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 14:22:20
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7AA1FC43385; Wed, 28 Oct 2020 14:22:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5B7FC433F0;
        Wed, 28 Oct 2020 14:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5B7FC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSBidXM6IG1oaTogY29yZTogQWRkIHN1?=
 =?UTF-8?Q?pport_MHI_EE_FP_for_download_firmware?=
To:     =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        "hemantk=codeaurora.org@codeaurora.org" 
        <hemantk=codeaurora.org@codeaurora.org>
References: <632f397f8c8bdc4df85a26d78beb58f3@sslemail.net>
 <27de7fd88ffeb7f95b2a709f0eaec6c5@codeaurora.org>
 <HK2PR06MB35079CE0636E6B940F6A7E5686170@HK2PR06MB3507.apcprd06.prod.outlook.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <7a79e992-f575-816b-ff9f-ac37cac7023b@codeaurora.org>
Date:   Wed, 28 Oct 2020 08:22:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB35079CE0636E6B940F6A7E5686170@HK2PR06MB3507.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/27/2020 7:57 PM, Carl Yin(殷张成) wrote:
> Hi bbhatt:
> 
> On Wednesday, October 28, 2020 9:34 AM, bbhatt wrote:
>> Hi Carl,
>> On 2020-10-27 16:01, Hemant Kumar wrote:
>>> Hi Jeff,
>>>
>>> On 10/27/20 8:11 AM, Jeffrey Hugo wrote:
>>>> On 10/27/2020 3:43 AM, carl.yin@quectel.com wrote:
>>>>> From: "carl.yin" <carl.yin@quectel.com>
>>>>>
>>>>> MHI wwan modems support download firmware to nand or emmc by
>>>>> firehose protocol, process as next:
>>>>> 1. wwan modem normal bootup and enter EE AMSS, create mhi DIAG chan
>>>>> device 2. send EDL cmd via DIAG chan, then modem enter EE EDL 3.
>>>>> boot.c download 'firehose/prog_firehose_sdx55.mbn' via BHI interface
>>>>> 4. modem enter EE FP, and create mhi EDL chan device 5. user space
>>>>> tool download FW to modem via EDL chan by firehose protocol
>>>>>
>>>>> Signed-off-by: carl.yin <carl.yin@quectel.com>
>>>>> ---
>>>>>    drivers/bus/mhi/core/boot.c     |  4 +++-
>>>>>    drivers/bus/mhi/core/init.c     |  2 ++
>>>>>    drivers/bus/mhi/core/internal.h |  1 +
>>>>>    drivers/bus/mhi/core/main.c     |  3 +++
>>>>>    drivers/bus/mhi/core/pm.c       | 16 +++++++++++++++-
>>>>>    include/linux/mhi.h             |  4 +++-
>>>>>    6 files changed, 27 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/bus/mhi/core/boot.c
>>>>> b/drivers/bus/mhi/core/boot.c index 24422f5..ab39ad6 100644
>>>>> --- a/drivers/bus/mhi/core/boot.c
>>>>> +++ b/drivers/bus/mhi/core/boot.c
>>>>> @@ -460,8 +460,10 @@ void mhi_fw_load_handler(struct mhi_controller
>>>>> *mhi_cntrl)
>>>>>            return;
>>>>>        }
>>>>> -    if (mhi_cntrl->ee == MHI_EE_EDL)
>>>>> +    if (mhi_cntrl->ee == MHI_EE_EDL) {
>>>>> +        mhi_ready_state_transition(mhi_cntrl);
>>>>>            return;
>>>>> +    }
>>>>>        write_lock_irq(&mhi_cntrl->pm_lock);
>>>>>        mhi_cntrl->dev_state = MHI_STATE_RESET; diff --git
>>>>> a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c index
>>>>> ac4aa5c..9c2c2f3 100644
>>>>> --- a/drivers/bus/mhi/core/init.c
>>>>> +++ b/drivers/bus/mhi/core/init.c
>>>>> @@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
>>>>>        [MHI_EE_WFW] = "WFW",
>>>>>        [MHI_EE_PTHRU] = "PASS THRU",
>>>>>        [MHI_EE_EDL] = "EDL",
>>>>> +    [MHI_EE_FP] = "FP",
>>>>>        [MHI_EE_DISABLE_TRANSITION] = "DISABLE",
>>>>>        [MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
>>>>>    };
>>>>> @@ -35,6 +36,7 @@ const char * const
>>>>> dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>>>>>        [DEV_ST_TRANSITION_READY] = "READY",
>>>>>        [DEV_ST_TRANSITION_SBL] = "SBL",
>>>>>        [DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>>>>> +    [DEV_ST_TRANSITION_FP] = "FP",
>> Longer description here would be nice (FLASH PROGRAMMER).
> [carl.yin] yes, for SDX24 and SDX55 chip, 'FIREHOSE PROGRAMMER' is more better.

"Flash programmer" is more generic.  It means that the EE can be used 
with a different protocol than firehose if there is a use for that.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
