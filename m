Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7A51EEA55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 20:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbgFDSeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 14:34:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22128 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730348AbgFDSeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 14:34:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591295645; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=b+m+f2wIQAOgddiFH2GauZEHY1uboxw/Z1poVAGvYyQ=;
 b=kg/T8Gr6bc7sRACYzJNsvjkGOwJbJfLiLpVWu9GjWaOhtcnTZAOh0SBnjv6EKowPK/ZJtBg6
 GwG77OAa4dO8En0Py9hfVehBQmdJMJERXuSf+kTpUdfzo/nztMtqXdOUXoJULbTryHwoeBmw
 C48iusv97oiOtUGSHUxCuH+ftoU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5ed93e9cc0031c71c20ed0f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 18:34:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00A70C433B2; Thu,  4 Jun 2020 18:34:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11E1AC433A1;
        Thu,  4 Jun 2020 18:34:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jun 2020 00:04:02 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Pradeep P V K <ppvk@codeaurora.org>, bjorn.andersson@linaro.org,
        adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V2 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling
 support
In-Reply-To: <20200604170906.GP4525@google.com>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
 <1591269283-24084-2-git-send-email-ppvk@codeaurora.org>
 <20200604170906.GP4525@google.com>
Message-ID: <23d6da79d604ce5113d90a2adab17483@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-04 22:39, Matthias Kaehlcke wrote:
> On Thu, Jun 04, 2020 at 04:44:42PM +0530, Pradeep P V K wrote:
>> Interconnect bandwidth scaling support is now added as a
>> part of OPP [1]. So, make sure interconnect driver is ready
>> before handling interconnect scaling.
>> 
>> This change is based on
>> [1] [Patch v8] Introduce OPP bandwidth bindings
>> (https://lkml.org/lkml/2020/5/12/493)
>> 
>> [2] [Patch v3] mmc: sdhci-msm: Fix error handling
>> for dev_pm_opp_of_add_table()
>> (https://lkml.org/lkml/2020/5/5/491)
>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>> b/drivers/mmc/host/sdhci-msm.c
>> index b277dd7..a13ff1b 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/interconnect.h>
>> 
>>  #include "sdhci-pltfm.h"
>>  #include "cqhci.h"
>> @@ -2070,6 +2071,18 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  	}
>>  	msm_host->bulk_clks[0].clk = clk;
>> 
>> +	/* Make sure that ICC driver is ready for interconnect bandwdith
>> +	 * scaling before registering the device for OPP.
>> +	 */
>> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
>> +	if (ret) {
>> +		if (ret == -EPROBE_DEFER)
>> +			dev_info(&pdev->dev, "defer icc path: %d\n", ret);
> 
> I already commented on this on v1:
> 
>   This log seems to add little more than noise, or are there particular 
> reasons
>   why it is useful in this driver? Most drivers just return silently in 
> case of
>   deferred probing.
> 
> If you think the log is really needed please explain why.

Both the err logs seem redundant.
EPROBE_DEFERS are rather readily
noticeable through the return val.
dev_.._find_icc_paths already prints
err messages when we fail to get icc
paths.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
