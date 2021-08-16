Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD533ED2EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 13:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhHPLMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 07:12:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45658 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235858AbhHPLMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 07:12:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629112333; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=u5sPAV/lkbkRUwSXinAbzwupjK8Yencd4Nn83gWmewY=; b=uSreDpPx9xwzt/Lr+JvBeBoD98lIo0hK05CSIwmxWxj2f9p+sDL34Jq/jw+EwaYyUsQyejmB
 qA37VIfLP/AZ1vyov2VqgZsJh8r7z4e6Hkltck4iEbPEXZLLTB/GInThLPSc2h6BrGB0O2hP
 FFETwhljSqk3nUgqCvE3VTVjMLk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 611a47f97ee604097778ed13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Aug 2021 11:11:53
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86B72C4360D; Mon, 16 Aug 2021 11:11:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.3] (unknown [122.163.152.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 481CFC4360C;
        Mon, 16 Aug 2021 11:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 481CFC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
 <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org>
 <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
 <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org>
 <CAE-0n53TCo1UTVi3e18N5hF3+Y_bLiqgH1o5PEua7F9-bog_gQ@mail.gmail.com>
 <YRMHjmEG3l4SolTi@builder.lan>
 <CAE-0n51+t6ATCcDgfKeMyh0f0p0=otnUmBjChViX-r3qJYfhZg@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <bcbd4fc6-9646-a526-16f9-cefd912d1de0@codeaurora.org>
Date:   Mon, 16 Aug 2021 16:41:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51+t6ATCcDgfKeMyh0f0p0=otnUmBjChViX-r3qJYfhZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/11/2021 9:55 AM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-08-10 16:11:10)
>> On Tue 10 Aug 14:18 CDT 2021, Stephen Boyd wrote:
>>
>>> Quoting Sibi Sankar (2021-08-10 10:24:32)
>>>> On 2021-08-09 23:28, Stephen Boyd wrote:
>>>>> Quoting Deepak Kumar Singh (2021-08-09 04:05:08)
>>>>>> On 8/6/2021 1:10 AM, Stephen Boyd wrote:
>>>>>>> Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
>>>>>>>> Some use cases require SMP2P interrupts to wake up the host
>>>>>>>> from suspend.
>>>>>>> Please elaborate on this point so we understand what sort of scenarios
>>>>>>> want to wakeup from suspend.
>>>>>> Once such scenario is where WiFi/modem crashes and notifies crash to
>>>>>> local host through smp2p
>>>>>>
>>>>>> if local host is in suspend it should wake up to handle the crash and
>>>>>> reboot the WiFi/modem.
>>>>> Does anything go wrong if the firmware crashes during suspend and the
>>>>> local host doesn't handle it until it wakes for some other reason? I'd
>>>>> like to understand if the crash handling can be delayed/combined with
>>>>> another wakeup.
>>>> If the modem firmware crashes
>>>> during suspend, the system comes
>>>> out of xo-shutdown and AFAIK stays
>>>> there until we handle the interrupt.
>>>>
>>> So you're saying we waste power if we don't wakeup the AP and leave the
>>> SoC in a shallow low power state? That would be good to have indicated
>>> in the code via a comment and in the commit text so we know that we want
>>> to handle the wakeup by default.
>> Sounds like in a system without autosleep (or userspace equivalent) it
>> would be desirable to leave the SoC in this lower state than to wake up
>> the system handle the crash and then just idle?
>>
>> But leaving the system in this state will result in you missing your
>> important phone calls...
>>
> Yes I think we should just add a comment to the code and commit text and
> move on.
Thanks, updated in patch set V2
