Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B3B21679E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 09:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgGGHmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 03:42:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12590 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbgGGHms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 03:42:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594107767; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Pec7NT7AnLdBquf3dwS+ZU4vRm60qiT2fcsC0z2KbYc=; b=SupqBMkEYuhkH8oDtuEwzCfe2G/Uqz6OWunjrnwdFg5T6zcA8YdkRmSHRGwApKYdq8iMmVUl
 UeMii+75CNqBKOITbS7p2PVn1JcoQZt2nwsDZ5n3HmJ+HZriFuukqXEqVRWNGgRC7AvMIo9L
 0Tn1AAhcWMe/N/7To4n8KIABLC0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f04276ac746eb6f00e4c0da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 07:42:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F4C0C433C8; Tue,  7 Jul 2020 07:42:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.43.48] (unknown [223.182.243.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A0E8C433C6;
        Tue,  7 Jul 2020 07:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A0E8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org,
        sricharan@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
References: <1594097915-26725-1-git-send-email-kathirav@codeaurora.org>
 <20200707051452.GO11847@yoga>
From:   Kathiravan T <kathirav@codeaurora.org>
Message-ID: <c8fe2c89-697c-9cba-b5f4-0752ed80004b@codeaurora.org>
Date:   Tue, 7 Jul 2020 13:12:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707051452.GO11847@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 7/7/2020 10:44 AM, Bjorn Andersson wrote:
> On Mon 06 Jul 21:58 PDT 2020, Kathiravan T wrote:
>
>> set target proc as APPS to route the gpio interrupts to APPS
>>
>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> This says "first Rajkumar certified the patch's origin, then you picked
> it up and certified its origin". As such I would expect that Rajkumar is
> the author of the patch.
>
> If you both came up with the patch add a Co-developed-by: tag.
>
> Regards,
> Bjorn
Thanks, fixed in V2.
>> ---
>>   drivers/pinctrl/qcom/pinctrl-ipq8074.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
>> index 0edd41c..aec68b1 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
>> @@ -50,6 +50,7 @@
>>   		.intr_enable_bit = 0,		\
>>   		.intr_status_bit = 0,		\
>>   		.intr_target_bit = 5,		\
>> +		.intr_target_kpss_val = 3,	\
>>   		.intr_raw_status_bit = 4,	\
>>   		.intr_polarity_bit = 1,		\
>>   		.intr_detection_bit = 2,	\
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

