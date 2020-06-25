Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A892209753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 02:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388061AbgFYADS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 20:03:18 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:28091 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387843AbgFYADR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 20:03:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593043396; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3INbwNDUP/wezgbPwIovPzcDp4TH4ao4dSsadBi2Wxk=; b=E2FN6sytQmCLbkFbbRn+SiHrLDe2W+Mho47q75EuZRIBPiPnhalumbE0gtzMFx1Kq8egp0My
 /+Z7+NgaNLP4MmDiV5BlYrQbtRgEjCtHpRycrwbvCampRDEFqbHFRsGdKO61VCs48QTF+ZgQ
 TrGTcxmfRzItl/DzOEgAM2L0FwY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5ef3e9c386de6ccd447a4b4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 00:03:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA7EEC43391; Thu, 25 Jun 2020 00:03:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB0FBC433C8;
        Thu, 25 Jun 2020 00:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB0FBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 2/4] bus: mhi: core: Move MHI_MAX_MTU to external
 header file
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-3-git-send-email-hemantk@codeaurora.org>
 <20200619053353.GB3245@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <a6babc13-e646-d08c-6f53-4d6961745ce0@codeaurora.org>
Date:   Wed, 24 Jun 2020 17:03:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200619053353.GB3245@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani

On 6/18/20 10:33 PM, Manivannan Sadhasivam wrote:
> On Thu, Jun 11, 2020 at 11:13:42AM -0700, Hemant Kumar wrote:
>> Currently this macro is defined in internal MHI header as
>> a TRE length mask. Moving it to external header allows MHI
>> client drivers to set this upper bound for the transmit
>> buffer size.
>>
> 
> So we have 2 definitions for MHI_MAX_MTU now? Why can't you remove the one
> available internally?
Good catch, let me fix that in next patch series.
> 
> Thanks,
> Mani
> 
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> ---
>>   include/linux/mhi.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index a39b77d..ce43f74 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -16,6 +16,9 @@
>>   #include <linux/wait.h>
>>   #include <linux/workqueue.h>
>>   
>> +/* MHI client drivers to set this upper bound for tx buffer */
>> +#define MHI_MAX_MTU 0xffff
>> +
>>   #define MHI_VOTE_BUS BIT(0) /* do not disable the mhi bus */
>>   #define MHI_VOTE_DEVICE BIT(1) /* prevent mhi device from entering lpm */
>>   
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
