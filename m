Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B511CE05F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 18:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbgEKQ0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 12:26:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16933 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729463AbgEKQ0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 12:26:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589214406; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iB/2//54kD8Pat8R5JhkF2wDuD+zsA6Mpo5lwlEZfZ0=;
 b=CfW7yD3UomUEXyhDLRAqp9owkf+9SBhjBSRILVrE7eDLYioncDByxejSPEIpHxpg322PdSfJ
 grBmEcaQSv7OGK4KNSvCCYpyeweM8xfwNoZYSyw5iVJLC4wODfW6WXhbB74XKWS7JqI2ftFZ
 0nYuwJfZeaygoaI0+6gGK6xPlnY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb97cc5.7ff0e4e3d490-smtp-out-n03;
 Mon, 11 May 2020 16:26:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2B7CC44795; Mon, 11 May 2020 16:26:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07A1CC43636;
        Mon, 11 May 2020 16:26:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 May 2020 21:56:43 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] coresight: replicator: Reset replicator if context is
 lost
In-Reply-To: <CANLsYkx640pjt_crfHMUQt25w-xOfoVteYVpocYgPHRw-y-WeQ@mail.gmail.com>
References: <20200511083400.26554-1-saiprakash.ranjan@codeaurora.org>
 <CANLsYkx640pjt_crfHMUQt25w-xOfoVteYVpocYgPHRw-y-WeQ@mail.gmail.com>
Message-ID: <c9a303e97a567e417ee897e59f571d64@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 2020-05-11 21:49, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Mon, 11 May 2020 at 02:34, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On some QCOM SoCs, replicators in Always-On domain loses its
>> context as soon as the clock is disabled. Currently as a part
>> of pm_runtime workqueue, clock is disabled after the replicator
>> is initialized by amba_pm_runtime_suspend assuming that context
>> is not lost which is not true for replicators with such
>> limitations. Hence check the replicator idfilter registers
>> in dynamic_replicator_enable() and reset again.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> More info here - https://lore.kernel.org/patchwork/patch/1231182/
>> 
>> ---
>>  drivers/hwtracing/coresight/coresight-replicator.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
>> b/drivers/hwtracing/coresight/coresight-replicator.c
>> index e7dc1c31d20d..11df63f51071 100644
>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>> @@ -68,6 +68,17 @@ static int dynamic_replicator_enable(struct 
>> replicator_drvdata *drvdata,
>>         int rc = 0;
>>         u32 reg;
>> 
>> +       /*
>> +        * On some QCOM SoCs with replicators in Always-On domain, 
>> disabling
>> +        * clock will result in replicator losing its context. 
>> Currently
>> +        * as a part of pm_runtime workqueue, amba_pm_runtime_suspend 
>> disables
>> +        * clock assuming the context is not lost which is not true 
>> for cases
>> +        * with hardware limitations as the above.
>> +        */
>> +       if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0) 
>> &&
>> +           (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 
>> 0))
>> +               dynamic_replicator_reset(drvdata);
>> +
> 
> Based on your comment here[1] and the ongoing conversation, I will
> wait for a V2.
> 
> Thanks,
> Mathieu
> 
> [1]. https://lkml.org/lkml/2020/5/11/650
> 

Yes, I will post a v2 once we have consensus regarding which way we need 
to
add a workaround for such QCOM SoCs.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
