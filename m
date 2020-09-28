Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC5E27ACA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 13:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgI1LXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 07:23:07 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:18232 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbgI1LXH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 07:23:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601292186; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=us7P7ojJim1W+0abmFda2xNmj06J8S8jN+J76iJNAj8=;
 b=q5Sbvl2eyDry6Plm+o5Hn/AJizxDYZMaK9UE1ILiutNaTMNQcFj2Y5+ZC2w3aSNEwpEdaA1w
 NVEDbNNhF95D+L+0aX+A/IQ7D+n9oU/UXrWM9YyF5Vfei+r7vBZClgyL7HAbT2elD1aoEBDm
 eu0tX4to5ZeKLbiwwYh/WimAHLY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f71c791356bcc21fb2dc1dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 11:22:57
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37F1FC433CB; Mon, 28 Sep 2020 11:22:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48196C433CA;
        Mon, 28 Sep 2020 11:22:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 16:52:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, mike.leach@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        peterz@infradead.org, coresight@lists.linaro.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        denik@google.com
Subject: Re: [PATCH 2/2] coresight: etm4x: Fix save and restore of
 TRCVMIDCCTLR1 register
In-Reply-To: <0e0bc2fd-0449-35bc-882a-3b942a55fda4@arm.com>
References: <cover.1601222348.git.saiprakash.ranjan@codeaurora.org>
 <19e06f26c1e4b0bf48d3971e2f1fb1af27da159a.1601222348.git.saiprakash.ranjan@codeaurora.org>
 <0e0bc2fd-0449-35bc-882a-3b942a55fda4@arm.com>
Message-ID: <388adccec089823fcd6d009892ad95a1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-09-28 16:35, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 09/27/2020 05:20 PM, Sai Prakash Ranjan wrote:
>> In commit f188b5e76aae ("coresight: etm4x: Save/restore state
>> across CPU low power states"), mistakenly TRCVMIDCCTLR1 register
>> value was saved in trcvmidcctlr0 state variable which is used to
>> store TRCVMIDCCTLR0 register value in etm4x_cpu_save() and then
>> same value is written back to both TRCVMIDCCTLR0 and TRCVMIDCCTLR1
>> in etm4x_cpu_restore(). There is already a trcvmidcctlr1 state
>> variable available for TRCVMIDCCTLR1, so use it.
>> 
>> Fixes: 8b44fdfef6a2 ("coresight: etm4x: Allow etm4x to be built as a 
>> module")
> 
> Why is this commit in question ?

My bad sorry, I thought there are two commits which touch this hunk of 
code,
but I see now that the module code just renamed the file, so this fixes 
tag
is not required.

> 
>> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU 
>> low power states")
> 
> I believe this is the right fixes tag.
> 

Yes, I will resend with only this fixes tag.

>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c 
>> b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index de76d57850bc..abd706b216ac 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1243,7 +1243,7 @@ static int etm4_cpu_save(struct etmv4_drvdata 
>> *drvdata)
>>   	state->trccidcctlr1 = readl(drvdata->base + TRCCIDCCTLR1);
>>     	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR0);
>> -	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR1);
>> +	state->trcvmidcctlr1 = readl(drvdata->base + TRCVMIDCCTLR1);
>>     	state->trcclaimset = readl(drvdata->base + TRCCLAIMCLR);
>>   @@ -1353,7 +1353,7 @@ static void etm4_cpu_restore(struct 
>> etmv4_drvdata *drvdata)
>>   	writel_relaxed(state->trccidcctlr1, drvdata->base + TRCCIDCCTLR1);
>>     	writel_relaxed(state->trcvmidcctlr0, drvdata->base + 
>> TRCVMIDCCTLR0);
>> -	writel_relaxed(state->trcvmidcctlr0, drvdata->base + TRCVMIDCCTLR1);
>> +	writel_relaxed(state->trcvmidcctlr1, drvdata->base + TRCVMIDCCTLR1);
>> 
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
