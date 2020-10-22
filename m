Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A9829569A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 05:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895283AbgJVDE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 23:04:57 -0400
Received: from z5.mailgun.us ([104.130.96.5]:39668 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895287AbgJVDE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 23:04:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603335896; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+nQ5ZSBmVVyAWKnZjaUdFuEquc1+aCE/YrO2L81++rQ=; b=uuZO1dLGysDeqZPTEQG7tP+USdQ+CJGBSmSxdbBoWtsaVg3//T1J+OOERlmcmVsoi0RGJaa9
 fGLyoYlsQnwC9jEMb1ookio6Mn2LwpXVO7Z6ICvtSpkXfyfUqGzFqroHhZfaQloFfKvIU8zu
 xpKN4XeIs7VdP7/GknyG+Us+M2k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f90f6d44f8cc67c313300a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 03:04:52
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD1E3C433FE; Thu, 22 Oct 2020 03:04:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0472C433C9;
        Thu, 22 Oct 2020 03:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0472C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v7 3/4] docs: Add documentation for userspace client
 interface
To:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-4-git-send-email-hemantk@codeaurora.org>
 <c5dd8ec9-f4bf-dee4-98e1-9fba171b1f1d@codeaurora.org>
 <b0209674-8dcb-c994-c0ef-0d2caefd28ff@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <198e5431-756c-38b1-2426-eb4ab8074b60@codeaurora.org>
Date:   Wed, 21 Oct 2020 21:04:50 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <b0209674-8dcb-c994-c0ef-0d2caefd28ff@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/21/2020 11:46 AM, Hemant Kumar wrote:
> Hi Jeff,
> 
> On 10/21/20 8:28 AM, Jeffrey Hugo wrote:
>> On 10/16/2020 10:04 PM, Hemant Kumar wrote:
>>> +release
>>
>> Should this be "close" since close() is the actual function userspace 
>> would call?
> I was keeping kernel driver in mind while writing this, i can change it 
> to close() if release() is confusing here.

I guess I was considering the client perspective, but this is kernel 
documentation so I can see your perspective.  I don't have a strong 
preference.  I suppose keep it as is.

>>
>>> +-------
>>> +
>>> +Decrements UCI device reference count and UCI channel reference 
>>> count upon last
>>> +release(). UCI channel clean up is performed. MHI channel moves to 
>>> disabled
>>> +state and inbound buffers are freed.
>>> +
>>
>>
> Thanks,
> Hemant


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
