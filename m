Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A43E2951B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 19:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503698AbgJURqF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 13:46:05 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:10580 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503697AbgJURqF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 13:46:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603302364; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8fOddQzlEEdhYl1kSn5KGaQqPYDDhv4mavRBWob1yeM=; b=de6WaFWGnWVc3udkbchbveh3r9ZOdA4eioQEwT8THxejf0OpVgqErhfiYhgNO5V2AXq0ao4M
 DHNFpdI9S+NKd+O0/6rxl/nUNSxMSHheYtebGK2ieRmH1oLrxCJ8vXgp6ycpcQizWxTkkaZg
 vDg1uMngcdGbH4DZ0CD6l3w5n3s=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f9073dca03b63d67326ada6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 17:46:04
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82370C433FF; Wed, 21 Oct 2020 17:46:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8D36C433FE;
        Wed, 21 Oct 2020 17:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8D36C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v7 3/4] docs: Add documentation for userspace client
 interface
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-4-git-send-email-hemantk@codeaurora.org>
 <c5dd8ec9-f4bf-dee4-98e1-9fba171b1f1d@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <b0209674-8dcb-c994-c0ef-0d2caefd28ff@codeaurora.org>
Date:   Wed, 21 Oct 2020 10:46:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5dd8ec9-f4bf-dee4-98e1-9fba171b1f1d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff,

On 10/21/20 8:28 AM, Jeffrey Hugo wrote:
> On 10/16/2020 10:04 PM, Hemant Kumar wrote:
>> +release
> 
> Should this be "close" since close() is the actual function userspace 
> would call?
I was keeping kernel driver in mind while writing this, i can change it 
to close() if release() is confusing here.
> 
>> +-------
>> +
>> +Decrements UCI device reference count and UCI channel reference count 
>> upon last
>> +release(). UCI channel clean up is performed. MHI channel moves to 
>> disabled
>> +state and inbound buffers are freed.
>> +
> 
> 
Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
