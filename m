Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EAF1EB695
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 09:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgFBHac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 03:30:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13396 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbgFBHac (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 03:30:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591083030; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=t/U+WoycaFN2KK63K1sGkIxDUPZFgqtCuW351y3NGsQ=;
 b=wVnN1hxx+1gEviDXY1BuisIi6WwdGf3JPkbHDhnGTuqT3LebxF9rlg5QPUW0yzrJR6u/hm6U
 5jmtL9E2wJiWcJlA2tyHIXKjmnGzDrvKWSePwbpljS7hkRLXKm194wUyn5Sb9S1niXblVUVX
 iph3Q6aHjaMt6mkewzGwq07iOpg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ed5ffffb65440fdba5f0d01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 07:30:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6AD15C433C6; Tue,  2 Jun 2020 07:30:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C199C433C6;
        Tue,  2 Jun 2020 07:30:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jun 2020 13:00:05 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>, robin.murphy@arm.com
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <20200601212858.GB24287@xps15>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
Message-ID: <6d759cc28628ea72767c1304883630eb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

Thanks for taking your time for review.

On 2020-06-02 02:58, Mathieu Poirier wrote:
> Hi Sai,
> 
> On top of the comments already privided by Mike, I have the following:
> 
> On Mon, Jun 01, 2020 at 01:32:26PM +0530, Sai Prakash Ranjan wrote:
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
>>  	CS_LOCK(drvdata->base);
>>  }
>> 
>> -static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>> +void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>>  	__tmc_etb_disable_hw(drvdata);
>>  	coresight_disclaim_device(drvdata->base);
>> @@ -118,7 +118,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata 
>> *drvdata)
>>  	return 0;
>>  }
>> 
>> -static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
>> +void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>>  	CS_UNLOCK(drvdata->base);
>> 
> 
> Why do we care about ETB and ETF when they both use RAM internal to the 
> device?
> Moreover, the system RAM they use is not dedicated and as such falls 
> back to the
> kernel's memory pool.
> 

Actually we don't, I added the disable for ETF/ETB for completeness 
since we are
adding shutdown callback for TMC devices and not just ETR although this 
issue applies
only for ETR and it doesn't hurt to disable these devices in shutdown 
path.

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
>>  	__tmc_etr_disable_hw(drvdata);
>>  	/* Disable CATU device if this ETR is connected to one */
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c 
>> b/drivers/hwtracing/coresight/coresight-tmc.c
>> index 5a271ebc4585..7e687a356fe0 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
>> @@ -540,6 +540,34 @@ static int tmc_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>  	return ret;
>>  }
>> 
>> +static void tmc_shutdown(struct amba_device *adev)
>> +{
>> +	struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
>> +
>> +	if (!drvdata->enable)
>> +		goto out;
>> +
>> +	/*
>> +	 * We do not care about the active trace sessions here
>> +	 * since the system is going down unlike remove callback,
>> +	 * just make sure that the hardware is shutdown.
>> +	 */
>> +	switch (drvdata->config_type) {
>> +	case TMC_CONFIG_TYPE_ETB:
>> +		tmc_etb_disable_hw(drvdata);
>> +		break;
>> +	case TMC_CONFIG_TYPE_ETF:
>> +		tmc_etf_disable_hw(drvdata);
>> +		break;
>> +	case TMC_CONFIG_TYPE_ETR:
>> +		tmc_etr_disable_hw(drvdata);
>> +	}
>> +
>> +out:
>> +	misc_deregister(&drvdata->miscdev);
>> +	coresight_unregister(drvdata->csdev);
> 
> If a session is active when tmc_shutdown() is called, unregistering the 
> ETF/ETR
> will result in a kernel crash if the session is stopped before the 
> kernel has
> had the opportunity to shutdown.  It is the problem as trying to make 
> coresight
> drivers modular.
> 
> For this to really work the ongoing session would need to be stopped.  
> That
> would teardown the path and stop the sink.

I have tested this with and without active trace sessions multiple times 
on 2 devices
and did not observe a single crash. The crash should be easily triggered 
as per
what you are saying if we have active sessions but I do not see any 
crash.

> 
> That being said I'm sure that dependencies on an IOMMU isn't a problem 
> confined
> to coresight. I am adding Robin Murphy, who added this commit [1], to 
> the thread
> in the hope that he can provide guidance on the right way to do this.
> 

SMMU/IOMMU won't be able to do much here as it is the client's 
responsiblity to
properly shutdown and SMMU device link just makes sure that 
SMMU(supplier) shutdown is
called only after its consumers shutdown callbacks are called.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
