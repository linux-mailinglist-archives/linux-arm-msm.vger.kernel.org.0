Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6771F361B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 10:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgFIIak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 04:30:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17151 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbgFIIak (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 04:30:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591691439; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VohXKRDS9Puk813cVYWgC6ku1tCISrnzQ9+U/f81FYA=;
 b=Zkc3unIyKUcHi58RTQ+RULH85o7DNS/rgojpDZW73MVGQehAfb8VC61hsLaBT2vla/gMbeEi
 s8If6wyDXqv17TTR2J/qWp936QWGGo2IReQAaj6xc+oVnUgFQYF2muta418YeJIizSzX2ru2
 MPiP5zhW0GCNnqh8VOs1+DJF4k4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5edf4898badb0d4bcf0b63e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 08:30:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01B40C4339C; Tue,  9 Jun 2020 08:30:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38F70C433CA;
        Tue,  9 Jun 2020 08:30:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Jun 2020 14:00:14 +0530
From:   ppvk@codeaurora.org
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc-owner@vger.kernel.org, rnayak@codeaurora.org,
        matthias@chromium.org, linux-arm-msm-owner@vger.kernel.org
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=C2=A0V3_1/2=5D_mmc=3A_sdhci-msm=3A_Add_?=
 =?UTF-8?Q?interconnect_bandwidth_scaling_support?=
In-Reply-To: <8b2808215a09871bfccccb72cfa01e60@codeaurora.org>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
 <1591349427-27004-1-git-send-email-ppvk@codeaurora.org>
 <1591349427-27004-2-git-send-email-ppvk@codeaurora.org>
 <8b2808215a09871bfccccb72cfa01e60@codeaurora.org>
Message-ID: <f23dc598cbdbd59df22f29c2b77bd14c@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

Thanks for the review.

On 2020-06-05 17:10, Sibi Sankar wrote:
> Hey Pradeep,
> Thanks for the patch.
> 
> On 2020-06-05 15:00, Pradeep P V K wrote:
>> Interconnect bandwidth scaling support is now added as a
>> part of OPP [1]. So, make sure interconnect driver is ready
> 
> can you please replace driver with paths
> instead?
> 
ok. I will address this in my next patch set.

>> before handling interconnect scaling.
>> 
>> This change is based on
>> [1] [Patch v8] Introduce OPP bandwidth bindings
>> (https://lkml.org/lkml/2020/5/12/493)
>> 
>> [2] [Patch v3] mmc: sdhci-msm: Fix error handling
>> for dev_pm_opp_of_add_table()
>> (https://lkml.org/lkml/2020/5/5/491)
> 
> sry didn't notice ^^ earlier
> you might want to place these
> comments and dependencies similar
> to the following patch.
> https://patchwork.kernel.org/patch/11573903/
> 
ok. will modify in my next patch.

>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>> b/drivers/mmc/host/sdhci-msm.c
>> index b277dd7..a945e84 100644
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
>> @@ -2070,6 +2071,13 @@ static int sdhci_msm_probe(struct 
>> platform_device *pdev)
>>  	}
>>  	msm_host->bulk_clks[0].clk = clk;
>> 
>> +	/* Make sure that ICC driver is ready for interconnect bandwdith
> 
> typo /s/bandwdith/bandwidth
> 
>> +	 * scaling before registering the device for OPP.
>> +	 */
> 
> /* Check for optional interconnect paths */
> Maybe using ^^ would suffice since
> that's what we are actually doing
> 
sure. i will re-modify the comments as suggested ^^ in my next patch.

> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
> 
>> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
>> +	if (ret)
>> +		goto bus_clk_disable;
>> +
>>  	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
>>  	if (IS_ERR(msm_host->opp_table)) {
>>  		ret = PTR_ERR(msm_host->opp_table);
