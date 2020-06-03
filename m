Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6147E1ECD72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 12:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgFCKYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 06:24:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:30630 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726625AbgFCKYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 06:24:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591179870; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Fb+tt2vSov7DVf31htcsTqiqyyJapmcyXoiOnQlcHbc=;
 b=E60eBs9AGajsl3lCuPu0ydcxS7AqDR07Vsfzema6CMW/iKXzea0DfgklawIiKe3KBUTv9R1c
 LuuAw0O8uCtQg8uGUHPHUjsU8xBuzMvXZCZP7Tp8pMKqgUTktmybvcv8GeXZSEHaavcxG3Z1
 lMxARQGtA3nSWZoJJscFNqKZ82s=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ed77a524db551abde621317 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 10:24:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4A13FC433CB; Wed,  3 Jun 2020 10:24:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A84B2C433CA;
        Wed,  3 Jun 2020 10:24:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 15:54:17 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, robin.murphy@arm.com
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
Message-ID: <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

Thanks again for looking at this.

On 2020-06-03 03:42, Mike Leach wrote:
[...]

>> 
>> SMMU/IOMMU won't be able to do much here as it is the client's
>> responsiblity to
>> properly shutdown and SMMU device link just makes sure that
>> SMMU(supplier) shutdown is
>> called only after its consumers shutdown callbacks are called.
> 
> I think this use case can be handled slightly differently than the
> general requirements for modular CoreSight drivers.
> 
> What is needed here is a way of stopping the underlying ETR hardware
> from issuing data to the SMMU, until the entire device has been shut
> down, in a way that does not remove the driver, breaking existing
> references and causing a system crash.
> 
> We could introduce a new mode to the ETR driver - e.g. 
> CS_MODE_SHUTDOWN.
> 
> At the end of the block tmc_shutdown(struct amba_device *adev), set
> drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
> This new mode can be used to  prevent the underlying hardware from
> being able to restart until the device is re-powered.
> 
> This mode can be detected in the code that enables / disables the ETR
> and handled appropriately (updates to tmc_enable_etr_sink and
> tmc_disable_etr_sink).
> This mode will persist until the device is re-started - but because we
> are on the device shutdown path this is not an issue.
> 
> This should leave the CoreSight infrastructure stable until the
> drivers are shut down normally as part of the device power down
> process.
> 

Sounds good to me, but if the coresight_unregister() is the trouble 
point
causing these crashes, then can't we just remove that from 
tmc_shutdown()
callback? This would be like maintaining the same behaviour as now where
on reboot/shutdown we basically don't do anything except for disabling 
ETR.
This way, we do not have to introduce any new mode as well. To be exact, 
in
tmc_shutdown() we just disable ETR and then return without unregistering
which should not cause any issues since this is shutdown not the remove
callback which is a requirement for making coresight modular like below:

static void tmc_shutdown(struct amba_device *adev)
  {
          unsigned long flags;
          struct tmc_drvdata *drvdata = amba_get_drvdata(adev);

          spin_lock_irqsave(&drvdata->spinlock, flags);

          if (drvdata->mode == CS_MODE_DISABLED)
                  goto out;

          if (drvdata->config_type == TMC_CONFIG_TYPE_ETR)
                  tmc_etr_disable_hw(drvdata);

          /*
           * We do not care about coresight unregister here unlike remove
           * callback which is required for making coresight modular 
since
           * the system is going down after this.
           */
  out:
          spin_unlock_irqrestore(&drvdata->spinlock, flags);
  }


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
