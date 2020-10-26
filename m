Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1439F2999C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 23:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394551AbgJZWhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 18:37:24 -0400
Received: from z5.mailgun.us ([104.130.96.5]:35237 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394552AbgJZWhX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 18:37:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603751843; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=y1i8qtqfp0ZdnHugW/F30HmEn1D4bAHJAO0sjejblDA=; b=spW+yil3Pw9eHWzkiG4NzHbfMa9b4gGfAZcjIwR3WtHNXlO5OaIjFKj2KycUiNXmAEF6Wgw/
 TwAt9C1V886oi7gp/KtaX4xK2X5y1WPp7E6udwWBMzliNGEE85CA2GDZJko6WJT8E32nLjZd
 YAaLiW+9c//YQLn5zH2rQoHnGmo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f974f7e18530f07b72eba06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 22:36:46
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F7D3C433F0; Mon, 26 Oct 2020 22:36:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79EA7C43382;
        Mon, 26 Oct 2020 22:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79EA7C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v9 3/4] docs: Add documentation for userspace client
 interface
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Dan Williams <dcbw@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org,
        netdev@vger.kernel.org
References: <1603495075-11462-1-git-send-email-hemantk@codeaurora.org>
 <1603495075-11462-4-git-send-email-hemantk@codeaurora.org>
 <20201025144627.65b2324e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <e92a5a5b-ac62-a6d8-b6b4-b65587e64255@codeaurora.org>
 <4e4dc63d0a0b5a820f7a70e30e29746fd6735a96.camel@redhat.com>
 <7934e50d-72bd-f20a-54da-33f29c66c3fa@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <a0920f91-e043-8a67-f5c4-ea06eb1ddb2a@codeaurora.org>
Date:   Mon, 26 Oct 2020 15:36:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7934e50d-72bd-f20a-54da-33f29c66c3fa@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/20 6:56 AM, Jeffrey Hugo wrote:
> On 10/26/2020 7:46 AM, Dan Williams wrote:
>> On Mon, 2020-10-26 at 07:38 -0600, Jeffrey Hugo wrote:
>>> On 10/25/2020 3:46 PM, Jakub Kicinski wrote:
>>>> On Fri, 23 Oct 2020 16:17:54 -0700 Hemant Kumar wrote:
>>>>> +UCI driver enables userspace clients to communicate to external
>>>>> MHI devices
>>>>> +like modem and WLAN. UCI driver probe creates standard character
>>>>> device file
>>>>> +nodes for userspace clients to perform open, read, write, poll
>>>>> and release file
>>>>> +operations.
>>>>
>>>> What's the user space that talks to this?
>>>>
>>>
>>> Multiple.
>>>
>>> Each channel has a different purpose.  There it is expected that a
>>> different userspace application would be using it.
>>>
>>> Hemant implemented the loopback channel, which is a simple channel
>>> that
>>> just sends you back anything you send it.  Typically this is consumed
>>> by
>>> a test application.
>>>
>>> Diag is a typical channel to be consumed by userspace.  This is
>>> consumed
>>> by various applications that talk to the remote device for
>>> diagnostic
>>> information (logs and such).
>>
>> QMI too?
>> Dan
> 
> Interesting question.  My product doesn't use QMI.  I would expect that 
> all QMI runs through Router these days, but I am seeing some QMI 
> channels in the downstream source.
> 
> Hemant, Do you know what is the usecase for the QMI0/QMI1 channels?
> 
QMI0/QMI1 is used to send QMI message (control path) to bring the qmi 
rmnet data call.

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
