Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B136B154CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 21:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBFURj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 15:17:39 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:28233 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727827AbgBFURi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 15:17:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581020258; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=+Lr0ag6PJr7p2Q4hz+BuThC09scWtqJ2UecN/NDVE0U=; b=p2jRzEHkEUwt3ICMGCz7LwVh6hpgcd+7g0GjC+ztuZtDQIey+PZjBUb4zkpM0yqHkCnNTNpD
 IJyITxI60Z92x6OubX5zos0IrUEE/eocKmIn3ep5rjE4wYmqxSWkKl7M34F4DeXtzRVuv+LD
 vVFnqSP7YsMddTlVxKAKageKAVg=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3c7455.7f291d8c1e68-smtp-out-n03;
 Thu, 06 Feb 2020 20:17:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26699C433A2; Thu,  6 Feb 2020 20:17:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEAACC433CB;
        Thu,  6 Feb 2020 20:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CEAACC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 09/16] bus: mhi: core: Add support for downloading RDDM
 image during panic
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-10-manivannan.sadhasivam@linaro.org>
 <e18c2c4d-730b-fd40-7f8b-2236620bcb45@codeaurora.org>
Message-ID: <be7839ab-6104-4d1a-be32-11acdd4cfbd5@codeaurora.org>
Date:   Thu, 6 Feb 2020 13:17:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <e18c2c4d-730b-fd40-7f8b-2236620bcb45@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/6/2020 9:41 AM, Jeffrey Hugo wrote:
> On 1/31/2020 6:50 AM, Manivannan Sadhasivam wrote:
>> MHI protocol supports downloading RDDM (RAM Dump) image from the
>> device through BHIE. This is useful to debugging as the RDDM image
>> can capture the firmware state.
>>
>> This is based on the patch submitted by Sujeev Dias:
>> https://lkml.org/lkml/2018/7/9/989
>>
>> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
>> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
>> [mani: splitted the data transfer patch and cleaned up for upstream]
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   drivers/bus/mhi/core/boot.c     | 157 +++++++++++++++++++++++++++++++-
>>   drivers/bus/mhi/core/init.c     |  38 ++++++++
>>   drivers/bus/mhi/core/internal.h |   2 +
>>   drivers/bus/mhi/core/pm.c       |  31 +++++++
>>   include/linux/mhi.h             |  24 +++++
>>   5 files changed, 249 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> index 36956fb6eff2..564d61f98257 100644
>> --- a/drivers/bus/mhi/core/boot.c
>> +++ b/drivers/bus/mhi/core/boot.c
>> @@ -20,7 +20,159 @@
>>   #include <linux/wait.h>
>>   #include "internal.h"
>> -/* Download AMSS image to device */
> 
> Seems a bit odd to add this line in patch 8, only to remove it here in 
> patch 9.  Feels like never adding it in the first place would be better. 
>   Not something to warrant a v3 through.
> 

Since my nit is minor-

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
