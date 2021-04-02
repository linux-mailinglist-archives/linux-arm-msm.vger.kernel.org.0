Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E899B3524FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhDBBPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:15:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24664 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhDBBPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:15:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617326104; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+r8G9p/DQUN0/bgRmIwvRNNTdPTgTyYNHXGdyoICLLs=; b=ABHA0QPMhzfy6UBLHnFYM9pc0iitPbjzRp5Tf7p+RS67LaOwaUTdiEG9IDNk+/ndt+ZaHhqc
 R5aVD4ROEB0+RUdPolzUakAWdifnKSwDoitPKBv9eRiCA3QBqU7h2pIjCSii2ytP+ThAqQml
 EIIh+8L7DTjAh/zbPLB16mQKFbI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 606670158166b7eff7635311 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:15:01
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C5AFC43461; Fri,  2 Apr 2021 01:15:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [49.204.182.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A59DC433C6;
        Fri,  2 Apr 2021 01:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2A59DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum
 entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-7-dmitry.baryshkov@linaro.org>
 <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
 <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <cb94aa7c-8bf1-62c3-1c35-9732c20ec7bf@codeaurora.org>
Date:   Fri, 2 Apr 2021 06:44:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/27/2021 1:43 PM, Dmitry Baryshkov wrote:
> Hi Tanya,
> 
> On Sat, 27 Mar 2021 at 04:49, Taniya Das <tdas@codeaurora.org> wrote:
>>
>> Hi Dmitry,
>>
>> Thanks for the patch for cleanup.
>> It is okay to remove TEST source, but you can still keep the sleep clock
>> source as it could be still connected to certain RCGs and could be used
>> to derive low frequencies if required.
>>
>> As these sources are generated from the HW plans it would be good if we
>> keep them as they are except the TEST source.
> 
> Please note that I've barely removed the unused enum entry, which is
> not used in any of clock parent maps. So I'd suggest to either add it
> to relevant clock parent maps and to the videocc bindings or to drop
> unused enum entry.
> 

Reviewed-by: Taniya Das <tdas@codeaurora.org>
>>
>> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
>>> Drop unused enum entries from the list of parent enums.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/clk/qcom/videocc-sc7180.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
>>> index 276e5ecd4840..f5d04791a3cd 100644
>>> --- a/drivers/clk/qcom/videocc-sc7180.c
>>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>>> @@ -19,8 +19,6 @@
>>>
>>>    enum {
>>>        P_BI_TCXO,
>>> -     P_CHIP_SLEEP_CLK,
>>> -     P_CORE_BI_PLL_TEST_SE,
>>>        P_VIDEO_PLL0_OUT_EVEN,
>>>        P_VIDEO_PLL0_OUT_MAIN,
>>>        P_VIDEO_PLL0_OUT_ODD,
>>>
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>
>> --
> 
> 
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
