Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0267F1D6736
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 12:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgEQKCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 06:02:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48829 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727082AbgEQKCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 06:02:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589709723; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KxeEKVLkrXkcEg8UpVr4Kr3YJM9oruaRmBCy5D4rvXc=; b=EBiq2dPnIcgICpcXBc8jJWoPXogWCWi9W228uteIEfSN5K7jotbnseq1b8YHg1BUh/dzmAQt
 tNevmWyOGwN9YBoba6mFyqj48dTsqZCXgwLE5aSFFkQQdj38nUWdsZNYNyvqMeQ9m5aOIWkC
 2kov1oeIzi5G+KNTzxn39nxk3HE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec10b8e32b098143c35fbdb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 10:01:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCD8EC433D2; Sun, 17 May 2020 10:01:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.82.140.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85A0BC433F2;
        Sun, 17 May 2020 10:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85A0BC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/3] clk: qcom: gcc: Add support for a new frequency
 for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
 <1584356082-26769-2-git-send-email-tdas@codeaurora.org>
 <158438095454.88485.11063617239206162025@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <700ce3fd-8869-1531-ede3-79c2f514efad@codeaurora.org>
Date:   Sun, 17 May 2020 15:31:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158438095454.88485.11063617239206162025@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for your review.

On 3/16/2020 11:19 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-03-16 03:54:40)
>> There is a requirement to support 51.2MHz from GPLL6 for qup clocks,
>> thus update the frequency table and parent data/map to use the GPLL6
>> source PLL.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
> 
> Any Fixes: tag for this? I guess the beginning of this driver being
> introduced?
> 

Sure, will add the same.

>>   drivers/clk/qcom/gcc-sc7180.c | 73 ++++++++++++++++++++++---------------------
>>   1 file changed, 37 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> index 7f59fb8..ad75847 100644
>> --- a/drivers/clk/qcom/gcc-sc7180.c
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>> @@ -405,8 +406,8 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
>>
>>   static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>>          .name = "gcc_qupv3_wrap0_s0_clk_src",
>> -       .parent_data = gcc_parent_data_0,
>> -       .num_parents = 4,
>> +       .parent_data = gcc_parent_data_1,
> 
> This should have been done initially. We shouldn't need to describe
> "new" parents when they have always been there. Are there other clks in
> this driver that actually have more parents than we've currently
> described? If so, please fix them.
> 

The auto generation script does not consider to define the parent unless 
it is used in the frequency table to derive a frequency. For now I 
didn't find any other sources missed.

>> +       .num_parents = 5,
> 
> Can you use ARRAY_SIZE(gcc_parent_data_1) instead? That way this isn't a
> hard-coded value.
> 

Yes will take care of it too.

>>          .ops = &clk_rcg2_ops,
>>   };
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
