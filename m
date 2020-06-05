Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1BC1EF2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 10:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgFEIGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 04:06:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26818 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgFEIGd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 04:06:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591344393; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=049ityVEOxtL3FukO3eAXaJK1CB8e5f03uXhxkkdNhc=;
 b=DRG34L5G15LqyYTFE/spTW3OG2vOy18WvYXk1yJusl1oNR5wMDJGb/yGg0lCW1Ml2AUY2X4z
 TrWX38CAh9Ll5iPiPD/svMFmzIdthvH5WWTMHmOpwSeu0p3ZFYdV0AJj2uI49ypY54xdzgn5
 62D4T5NSezaBZ0+xqv26ZS6xw4k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ed9fd0044a25e0052009121 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 08:06:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1B09C43391; Fri,  5 Jun 2020 08:06:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27E7CC433CB;
        Fri,  5 Jun 2020 08:06:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jun 2020 13:36:21 +0530
From:   ppvk@codeaurora.org
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, bjorn.andersson@linaro.org,
        adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V2 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling
 support
In-Reply-To: <23d6da79d604ce5113d90a2adab17483@codeaurora.org>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
 <1591269283-24084-2-git-send-email-ppvk@codeaurora.org>
 <20200604170906.GP4525@google.com>
 <23d6da79d604ce5113d90a2adab17483@codeaurora.org>
Message-ID: <dad8aba58bc3828a05da122555a54db8@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-05 00:04, Sibi Sankar wrote:
> On 2020-06-04 22:39, Matthias Kaehlcke wrote:
>> On Thu, Jun 04, 2020 at 04:44:42PM +0530, Pradeep P V K wrote:
>>> Interconnect bandwidth scaling support is now added as a
>>> part of OPP [1]. So, make sure interconnect driver is ready
>>> before handling interconnect scaling.
>>> 
>>> This change is based on
>>> [1] [Patch v8] Introduce OPP bandwidth bindings
>>> (https://lkml.org/lkml/2020/5/12/493)
>>> 
>>> [2] [Patch v3] mmc: sdhci-msm: Fix error handling
>>> for dev_pm_opp_of_add_table()
>>> (https://lkml.org/lkml/2020/5/5/491)
>>> 
>>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>> 
>>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>>> b/drivers/mmc/host/sdhci-msm.c
>>> index b277dd7..a13ff1b 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -14,6 +14,7 @@
>>>  #include <linux/slab.h>
>>>  #include <linux/iopoll.h>
>>>  #include <linux/regulator/consumer.h>
>>> +#include <linux/interconnect.h>
>>> 
>>>  #include "sdhci-pltfm.h"
>>>  #include "cqhci.h"
>>> @@ -2070,6 +2071,18 @@ static int sdhci_msm_probe(struct 
>>> platform_device *pdev)
>>>  	}
>>>  	msm_host->bulk_clks[0].clk = clk;
>>> 
>>> +	/* Make sure that ICC driver is ready for interconnect bandwdith
>>> +	 * scaling before registering the device for OPP.
>>> +	 */
>>> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
>>> +	if (ret) {
>>> +		if (ret == -EPROBE_DEFER)
>>> +			dev_info(&pdev->dev, "defer icc path: %d\n", ret);
>> 
>> I already commented on this on v1:
>> 
>>   This log seems to add little more than noise, or are there 
>> particular reasons
>>   why it is useful in this driver? Most drivers just return silently 
>> in case of
>>   deferred probing.
>> 
>> If you think the log is really needed please explain why.
> 
Sorry. i forget to remove this print on V2. i will address this in my 
next patch set.

> Both the err logs seem redundant.
> EPROBE_DEFERS are rather readily
> noticeable through the return val.
> dev_.._find_icc_paths already prints
> err messages when we fail to get icc
> paths.

True. i will remove this too in my next patch set.

