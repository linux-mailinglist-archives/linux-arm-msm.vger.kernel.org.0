Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB331EA847
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 19:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFARPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 13:15:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15418 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgFARPP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 13:15:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591031714; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IRcNB0OpS0geFxfNcF8I6B/taWV6RDssBF+tdvwyM3o=;
 b=coNPcBvrvmb8LUX1zoiNoxZOUzdGHsL6GiORioo6HmRFbS32xAQdvZfdHZyzyxT2Tfi2PML/
 kPfji3qeJZ0ZuOgs12XOS2uDvWIxCiybknvjSSaWSKqdGtXFSXKDlQnEoP5RJlITyhz7mCsh
 MIwKDUlk9h2/Qt/xqjj0iPwKSNI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ed5379ee276c808de2169b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 17:15:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40946C43395; Mon,  1 Jun 2020 17:15:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55B32C433C9;
        Mon,  1 Jun 2020 17:15:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Jun 2020 22:45:09 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <CAJ9a7VgxDru8P_RXE2ewGkSA2mfCNvOp+hMuNLB4AszXBOUp1g@mail.gmail.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgxDru8P_RXE2ewGkSA2mfCNvOp+hMuNLB4AszXBOUp1g@mail.gmail.com>
Message-ID: <f3c3a52effa9828d47712a9d4f852dfc@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

Thanks for the review.

On 2020-06-01 19:05, Mike Leach wrote:
> Hi,
> 
> On Mon, 1 Jun 2020 at 09:02, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Implement a shutdown callback to ensure ETR/ETF hardware is
>> properly shutdown in reboot/shutdown path. This is required
>> for ETR/ETF which has SMMU address translation enabled like
>> on SC7180 SoC and few others. If the hardware is still accessing
>> memory after SMMU translation is disabled as part of SMMU
>> shutdown callback in system reboot or shutdown path, then
>> IOVAs(I/O virtual address) which it was using will go on the bus
>> as the physical addresses which might result in unknown crashes
>> (NoC/interconnect errors). So we make sure from this shutdown
>> callback that the ETR/ETF is shutdown before SMMU translation is
>> disabled and device_link in SMMU driver will take care of ordering
>> of shutdown callbacks such that SMMU shutdown callback is not
>> called before any of its consumer shutdown callbacks.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  .../hwtracing/coresight/coresight-tmc-etf.c   |  4 +--
>>  .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
>>  drivers/hwtracing/coresight/coresight-tmc.c   | 29 
>> +++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tmc.h   |  3 ++
>>  4 files changed, 35 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c 
>> b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index 36cce2bfb744..cba3e7592820 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -85,7 +85,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata 
>> *drvdata)
>>         CS_LOCK(drvdata->base);
>>  }
>> 
>> -static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>> +void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>>         __tmc_etb_disable_hw(drvdata);
>>         coresight_disclaim_device(drvdata->base);
>> @@ -118,7 +118,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata 
>> *drvdata)
>>         return 0;
>>  }
>> 
>> -static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
>> +void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>>         CS_UNLOCK(drvdata->base);
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c 
>> b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 625882bc8b08..b29c2db94d96 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1110,7 +1110,7 @@ static void __tmc_etr_disable_hw(struct 
>> tmc_drvdata *drvdata)
>> 
>>  }
>> 
>> -static void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>> +void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>>         __tmc_etr_disable_hw(drvdata);
>>         /* Disable CATU device if this ETR is connected to one */
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c 
>> b/drivers/hwtracing/coresight/coresight-tmc.c
>> index 5a271ebc4585..7e687a356fe0 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
>> @@ -540,6 +540,34 @@ static int tmc_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>         return ret;
>>  }
>> 
>> +static void tmc_shutdown(struct amba_device *adev)
>> +{
>> +       struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
>> +
> 
> Take drvdata->spinlock here? The tmc_xxx_disable_hw functions are
> normally called with the spinlock claimed.
> 

Sure will take spinlock here.

>> +       if (!drvdata->enable)
> 
> As per previous patch drvdata->mode can be used here.
> 

Yes, will use mode here and drop enable flag in the next version.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
