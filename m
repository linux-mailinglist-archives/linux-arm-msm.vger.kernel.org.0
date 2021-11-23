Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9AF459C9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 08:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhKWHSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 02:18:33 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:48493 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhKWHSd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 02:18:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637651725; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nE3ovaLN77qgrTG51LDPw79hGu8tknzLOrnocu5Lt7w=; b=IIWavl3USUmPWGIuLN0r2VbJVrLHXSpl8tG/wV/qyUZKVq3QOiiYYbNTbAsxe6VhhBcceASv
 kMHNiiVdi8LXPVwTSCou9VktFmbkqloMHhqpGp0y36DkM83WiTUkaU6usfKGpVCcLEPdx1KE
 arYQMURZcEfGBz3po52h4OL4WLE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619c950b6bacc185a54c5fb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 07:15:23
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA744C43616; Tue, 23 Nov 2021 07:15:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F3C8C4338F;
        Tue, 23 Nov 2021 07:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2F3C8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/2] soc: qcom: rpmhpd: Make mx as a parent of cx only for
 sdm845
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org
References: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
 <1637040382-22987-2-git-send-email-rnayak@codeaurora.org>
 <YZcXvw0KExXvPwSV@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <da24c062-6531-1b53-3112-210a88e1451e@codeaurora.org>
Date:   Tue, 23 Nov 2021 12:45:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZcXvw0KExXvPwSV@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/19/2021 8:49 AM, Bjorn Andersson wrote:
> On Mon 15 Nov 23:26 CST 2021, Rajendra Nayak wrote:
> 
>> The requirement to specify the active + sleep and active-only MX power
>> domains as the parents of the corresponding CX power domains is applicable
>> only on the sdm845 SoC. With the same struct definition reused for all the
>> SoCs this condition was wrongly applied to all those SoCs as well, which
>> isn't needed. Define new sdm845 specific structures to manage this
>> dependency and remove the parent assignements from the common structure.
>>
> 
> Looking at the downstream sm8150 dts I see that both cx and mmcx
> specifies mx as parent "supply".
> 
> Is this not needed or should we instead name these resources
> "cx_with_mx_parent" and have sm8150 opt in as well?

Right, looks like these are needed, after talking to some more folks
I was told RPMh does not really enforce any dependencies on any of the
SoCs, so my earlier statement was wrong that this was managed by RPMh.
Some SoCs just have some digital domain requirements which need these
dependencies to be managed (not all SoCs) and when we end up with such
a situation its almost always expected to be managed by the RPMh masters
(APPS running hlos in this case)
This is not just across cx/mx but others as well like mmcx/mxc/gfx etc.

Unfortunately I could not find this very well documented at an SoC level,
so perhaps the best way to go about is to look at downstream dependencies
and try to match them upstream :/
I will respin this to add the 8150 dependencies back (and if I see any more
for the others)
  
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmhpd.c | 22 ++++++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index c71481d..12d8ce9 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -108,7 +108,6 @@ static struct rpmhpd cx_ao;
>>   static struct rpmhpd cx = {
>>   	.pd = { .name = "cx", },
>>   	.peer = &cx_ao,
>> -	.parent = &mx.pd,
>>   	.res_name = "cx.lvl",
>>   };
>>   
>> @@ -116,7 +115,6 @@ static struct rpmhpd cx_ao = {
>>   	.pd = { .name = "cx_ao", },
>>   	.active_only = true,
>>   	.peer = &cx,
>> -	.parent = &mx_ao.pd,
>>   	.res_name = "cx.lvl",
>>   };
>>   
>> @@ -149,12 +147,28 @@ static struct rpmhpd mxc_ao = {
>>   };
>>   
>>   /* SDM845 RPMH powerdomains */
>> +static struct rpmhpd sdm845_cx_ao;
>> +static struct rpmhpd sdm845_cx = {
>> +	.pd = { .name = "cx", },
>> +	.peer = &sdm845_cx_ao,
>> +	.parent = &mx.pd,
>> +	.res_name = "cx.lvl",
>> +};
>> +
>> +static struct rpmhpd sdm845_cx_ao = {
>> +	.pd = { .name = "cx_ao", },
>> +	.active_only = true,
>> +	.peer = &sdm845_cx,
>> +	.parent = &mx_ao.pd,
>> +	.res_name = "cx.lvl",
>> +};
>> +
>>   static struct rpmhpd *sdm845_rpmhpds[] = {
>>   	[SDM845_EBI] = &ebi,
>>   	[SDM845_MX] = &mx,
>>   	[SDM845_MX_AO] = &mx_ao,
>> -	[SDM845_CX] = &cx,
>> -	[SDM845_CX_AO] = &cx_ao,
>> +	[SDM845_CX] = &sdm845_cx,
>> +	[SDM845_CX_AO] = &sdm845_cx_ao,
>>   	[SDM845_LMX] = &lmx,
>>   	[SDM845_LCX] = &lcx,
>>   	[SDM845_GFX] = &gfx,
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
