Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA611A6542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 12:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbgDMKgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 06:36:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:48487 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727806AbgDMKgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 06:36:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586774177; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SFH893uQOOO6/8hNRsrKM3ohXphYzx9aQKAy6M1a/H0=; b=BO65vkzwLpgDqt7fSbTO4U4NSp8XvxZqS2c0i2L0c/Ne5gxEk3xb0Ikzti3dJ3P9Y3scc6Nd
 BFoPX2ragJ7CP8Q+wtczP2iDs94O24KgleUa/OIsEgkZOwIdS673edEcrif0rVoLvU3FHwjy
 cjGk8V7DEjZipu7eM9jPiuM4HU4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e94408c.7f3e13bfcf48-smtp-out-n01;
 Mon, 13 Apr 2020 10:35:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AC0AC433CB; Mon, 13 Apr 2020 10:35:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.111.193.245] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5101CC433F2;
        Mon, 13 Apr 2020 10:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5101CC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 01/21] opp: Manage empty OPP tables with clk handle
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-2-git-send-email-rnayak@codeaurora.org>
 <20200409075724.7t3bt3oxaxoygldb@vireshk-i7>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <78dcbda6-12d1-7a88-b1f9-a03fb0ba9b87@codeaurora.org>
Date:   Mon, 13 Apr 2020 16:04:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409075724.7t3bt3oxaxoygldb@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/9/2020 1:27 PM, Viresh Kumar wrote:
> On 08-04-20, 19:16, Rajendra Nayak wrote:
>> With OPP core now supporting DVFS for IO devices, we have instances of
>> IO devices (same IP block) which require an OPP on some platforms/SoCs
> 
> By OPP you mean both freq and voltage here ?

yes, freq and perf state.

> 
>> while just needing to scale the clock on some others.
> 
> And only freq here ?

yes.

> 
>> In order to avoid conditional code in every driver which supports such
>> devices (to check for availability of OPPs and then deciding to do
>> either dev_pm_opp_set_rate() or clk_set_rate()) add support to manage
>> empty OPP tables with a clk handle.
> 
> Why can't these devices have an opp table with just rate mentioned in each node
> ?

These are existing devices already upstream.

> 
>> This makes dev_pm_opp_set_rate() equivalent of a clk_set_rate() for
>> devices with just a clk and no OPPs specified, and makes
>> dev_pm_opp_set_rate(0) bail out without throwing an error.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/opp/core.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index ba43e6a..e4f01e7 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -819,6 +819,8 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
>>   	if (unlikely(!target_freq)) {
>>   		if (opp_table->required_opp_tables) {
>>   			ret = _set_required_opps(dev, opp_table, NULL);
>> +		} else if (!_get_opp_count(opp_table)) {
>> +			return 0;
> 
> Why should anyone call this with target_freq = 0 ? I know it was required to
> drop votes in the above case, but why here ?

Well, it is to drop votes. But in cases where we don't have perf votes being put
(and only clock is scaled), the driver would still call this with freq = 0, i am
just making sure that in such cases its treated as a nop.

> 
>>   		} else {
>>   			dev_err(dev, "target frequency can't be 0\n");
>>   			ret = -EINVAL;
>> @@ -849,6 +851,18 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
>>   		goto put_opp_table;
>>   	}
>>   
>> +	/*
>> +	 * For IO devices which require an OPP on some platforms/SoCs
>> +	 * while just needing to scale the clock on some others
>> +	 * we look for empty OPP tables with just a clock handle and
>> +	 * scale only the clk. This makes dev_pm_opp_set_rate()
>> +	 * equivalent to a clk_set_rate()
>> +	 */
>> +	if (!_get_opp_count(opp_table)) {
>> +		ret = _generic_set_opp_clk_only(dev, clk, freq);
>> +		goto put_opp_table;
>> +	}
>> +
> 
> Is this enough? _of_add_opp_table_v2() returns with error if there is no OPP
> node within the table. Please give an example of how DT looks for the case you
> want to support.

FWIK, no one should call a _of_add_opp_table_v2 in cases where there is no OPP in DT?
The 'empty' OPP table from what I understand will be created by dev_pm_opp_set_clkname.
A good case to look at is the PATCH 13/21 in this series. The driver I am modifying
is used on sdm845/sc7180 and a host of other older qualcomm SoCs. Since i am adding
support for perf state voting using OPP only on sdm845/sc7180 I want the existing
platforms to just do what they were doing. Now thats not possible unless I start
adding a bunch of if/else around every opp call in the driver to distinguish between
the two.

I am a little surprised since I though the idea of doing something like this came from
you :) (or perhaps Stephen, I somehow can't recollect) to avoid all the if/else conditions
I had when I initially posted some of these changes.
Btw, you had this patch reviewed when this was posted a long while back too [1]

[1] https://patchwork.kernel.org/patch/11027217/

  
> 
>>   	temp_freq = old_freq;
>>   	old_opp = _find_freq_ceil(opp_table, &temp_freq);
>>   	if (IS_ERR(old_opp)) {
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
