Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18C532EDFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 16:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCEPJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 10:09:50 -0500
Received: from z11.mailgun.us ([104.130.96.11]:12595 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhCEPJR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 10:09:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614956957; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9b27vSN3tCBqisdmgNin0kziLJgNzACUIiuL/zcftHQ=; b=P5c5h0ZksBgR5wA35bDTLORSrTxh5XCPxGEOxvCkr6B+HW2fNXI9rS0Iarv6gL7B0uCOTOk8
 PmQ21R46hyWjWE3FYJXYR3ExH93sRwXZ47lMI5xu1Dck70ev2IhnFOgBvjY2a++ctjGx9oMl
 wBAwz2actUzE0i5E9Jbsv5MrH7s=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60424996cb774affa9c653b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 15:09:10
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7C7E1C433ED; Fri,  5 Mar 2021 15:09:09 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D38AC433CA;
        Fri,  5 Mar 2021 15:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D38AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
 <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org>
 <CAMZdPi_+hpUkzpxKc1+K=xes=WZtkknaVarfgnfnYuP_a=kiBQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4ea01db5-9bdf-e002-8d1f-e272853edfcd@codeaurora.org>
Date:   Fri, 5 Mar 2021 08:09:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_+hpUkzpxKc1+K=xes=WZtkknaVarfgnfnYuP_a=kiBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/5/2021 8:08 AM, Loic Poulain wrote:
> Hi Jeffrey,
> 
> On Fri, 5 Mar 2021 at 15:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 3/5/2021 7:09 AM, Loic Poulain wrote:
>>> mhi_cntrl->timeout_ms is set by the controller and indicates the
>>> maximum amount of time the controller device will take to be ready.
>>> In case of PCI modems, this value is quite high given modems can take
>>> up to 15 seconds from cold boot to be ready.
>>>
>>> Reusing this value in mhi_pm_resume can cause huge resuming latency
>>> and delay the whole system resume (in case of system wide suspend/
>>> resume), leading to bad use experience.
>>
>> I think this needs more explanation.  The timeout is a maximum value.
>> You indicate that 2 seconds is more than enough for any MHI device to
>> exit M3 (citation needed), but 15 seconds is too much?  The difference
>> should only be apparent when the device doesn't transition in the timeout.
>>
>> Put another way, this doesn't say why 15 seconds is bad, if every device
>> only needs 2, given that wait_event_timeout() doesn't always wait for
>> the entire timeout value if the event occurs earlier.
> 
> Yes, right that deserves an explanation: depending on the platform and
> the suspend type (deep, s2idle), the PCI device may or may not lose
> power. In case power is maintained, there is no problem and the
> controller is successfully moved to M0. But in case of power loss, the
> device is going to restart, and MHI resuming is going to timeout and
> fail since M0 will never be reached. On PCI side we simply
> reinitialize the controller in case of resume failure. So in other
> words, MHI resume is expected to fail in some cases and it should be
> handled with minimal impact on the system.

Can we detect the power loss in far less than 2 seconds, and abort the 
resume process?  Waiting for the entire timeout, regardless of the 
value, in the power loss scenario you describe seems less than ideal for 
the system impact you are attempting to optimize.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
