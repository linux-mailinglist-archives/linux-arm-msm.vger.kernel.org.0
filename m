Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FA51EA83A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 19:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgFARNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 13:13:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40932 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726067AbgFARNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 13:13:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591031588; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=39+zL4ynTaUECjgLVW6qMRBSs3K/KmYk/5G/8M7YXUM=;
 b=VJC4toVFzPG4khtXNrbjkXsc+WFqmBGN/CCUaSFYXP0+wYmJmu11ToKp6jVFmhNUXcWe70An
 ZbswV/iB3Ct+zHDcpoS+dYfFjKttqWS0QOHd9JKkB7elu/6HKLY1ggp8ORtmnstM8wXE9W3b
 mj8RG8BiTi7KpXa00OzC3ZnKFoY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ed5371d8e09c0ae0968f906 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 17:13:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DC6EC433CA; Mon,  1 Jun 2020 17:13:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 71EA2C433C6;
        Mon,  1 Jun 2020 17:13:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Jun 2020 22:43:00 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] coresight: tmc: Add enable flag to indicate the
 status of ETR/ETF
In-Reply-To: <CAJ9a7Vh=GPKdYcX3aiJfaAVQ3j8rEmoSvP0CDeF-mfPpV4DMaw@mail.gmail.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <6e62147c36c76b9485d14960dced4f6acda17591.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <CAJ9a7Vh=GPKdYcX3aiJfaAVQ3j8rEmoSvP0CDeF-mfPpV4DMaw@mail.gmail.com>
Message-ID: <0b1ce383d9df84af3c23efad7eae21ae@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

Thanks for the review.

On 2020-06-01 18:57, Mike Leach wrote:
> Hi,
> 
> On Mon, 1 Jun 2020 at 09:02, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Add a flag to check whether TMC ETR/ETF is enabled or not.
>> This is later used in shutdown callback to determine if
>> we require to disable ETR/ETF.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/hwtracing/coresight/coresight-tmc.c | 2 ++
>>  drivers/hwtracing/coresight/coresight-tmc.h | 2 ++
>>  2 files changed, 4 insertions(+)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c 
>> b/drivers/hwtracing/coresight/coresight-tmc.c
>> index 39fba1d16e6e..5a271ebc4585 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
>> @@ -62,11 +62,13 @@ void tmc_flush_and_stop(struct tmc_drvdata 
>> *drvdata)
>> 
>>  void tmc_enable_hw(struct tmc_drvdata *drvdata)
>>  {
>> +       drvdata->enable = true;
>>         writel_relaxed(TMC_CTL_CAPT_EN, drvdata->base + TMC_CTL);
>>  }
>> 
>>  void tmc_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>> +       drvdata->enable = false;
>>         writel_relaxed(0x0, drvdata->base + TMC_CTL);
>>  }
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h 
>> b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 71de978575f3..d156860495c7 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -184,6 +184,7 @@ struct etr_buf {
>>   * @idr_mutex: Access serialisation for idr.
>>   * @sysfs_buf: SYSFS buffer for ETR.
>>   * @perf_buf:  PERF buffer for ETR.
>> + * @enable:    Indicates whether ETR/ETF is enabled.
>>   */
>>  struct tmc_drvdata {
>>         void __iomem            *base;
>> @@ -207,6 +208,7 @@ struct tmc_drvdata {
>>         struct mutex            idr_mutex;
>>         struct etr_buf          *sysfs_buf;
>>         struct etr_buf          *perf_buf;
>> +       bool                    enable;
> 
> Is this flag needed?
> For TMC, drvdata->mode indicates if the device is in use.
> 

Yes we can use mode flag, will make this change in the next version.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
