Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB089269DCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 07:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgIOF0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 01:26:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:14799 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbgIOF0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 01:26:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600147600; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=np2dnezmZHhxT4DTIcpNxjZcB5lu0W3t10CJRHd1FoI=;
 b=YbPQGLKjHOEi9NXg7NaJkv3ooVNF7YdUGrwNeG1qh5eNvZCzNqWmGnvMPLJnArpThUWhncNi
 8yQdvVA0ZIFY9RzGDW2qDKE3C3h8UTQX2Y3sHCxcajbRhpQlB0EsRNth2vU8Tyoaik1lkDTY
 nWQHe3ZFFc4D0yWWeL4MZDf5v/Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f60504a25e1ee7586f7b959 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 05:25:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39DCEC433F1; Tue, 15 Sep 2020 05:25:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9366C433F0;
        Tue, 15 Sep 2020 05:25:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 10:55:29 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv4 1/2] soc: qcom: llcc: Move attribute config to its own
 function
In-Reply-To: <160010909573.4188128.171199552773965552@swboyd.mtv.corp.google.com>
References: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
 <343db8a7b0e85ae6e29b9e79b68b98c22fcbcdce.1599974998.git.saiprakash.ranjan@codeaurora.org>
 <160010909573.4188128.171199552773965552@swboyd.mtv.corp.google.com>
Message-ID: <edf5677e4363b42184a47a7483ce8ec6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-15 00:14, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-09-14 04:12:59)
>> Cleanup qcom_llcc_cfg_program() by moving llcc attribute
>> configuration to a separate function of its own. Also
>> correct misspelled 'instance' caught by checkpatch.
>> 
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 75 
>> ++++++++++++++++++++----------------
>>  1 file changed, 41 insertions(+), 34 deletions(-)
>> 
>> diff --git a/drivers/soc/qcom/llcc-qcom.c 
>> b/drivers/soc/qcom/llcc-qcom.c
>> index 429b5a60a1ba..60ee31842dea 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -318,14 +318,50 @@ size_t llcc_get_slice_size(struct 
>> llcc_slice_desc *desc)
>>  }
>>  EXPORT_SYMBOL_GPL(llcc_get_slice_size);
>> 
>> -static int qcom_llcc_cfg_program(struct platform_device *pdev)
>> +static int qcom_llcc_attr_cfg(const struct llcc_slice_config *table)
> 
> Call it config? It's certainly not a table.
> 

Yes, will do.

>>  {
>> -       int i;
>>         u32 attr1_cfg;
>>         u32 attr0_cfg;
>>         u32 attr1_val;
>>         u32 attr0_val;
>>         u32 max_cap_cacheline;
>> +       int ret;
>> +
>> +       attr1_cfg = LLCC_TRP_ATTR1_CFGn(table->slice_id);
>> +       attr0_cfg = LLCC_TRP_ATTR0_CFGn(table->slice_id);
> 
> Can this move down to near where it is used?
> 

Sure.

>> +
>> +       attr1_val = table->cache_mode;
>> +       attr1_val |= table->probe_target_ways << 
>> ATTR1_PROBE_TARGET_WAYS_SHIFT;
>> +       attr1_val |= table->fixed_size << ATTR1_FIXED_SIZE_SHIFT;
>> +       attr1_val |= table->priority << ATTR1_PRIORITY_SHIFT;
>> +
>> +       max_cap_cacheline = MAX_CAP_TO_BYTES(table->max_cap);
>> +
>> +       /* LLCC instances can vary for each target.
> 
> The /* should be on a line by itself.
> 

This was there before I moved this hunk but I will fix it.

>> +        * The SW writes to broadcast register which gets propagated
>> +        * to each llcc instance (llcc0,.. llccN).
>> +        * Since the size of the memory is divided equally amongst the
>> +        * llcc instances, we need to configure the max cap 
>> accordingly.
>> +        */
>> +       max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
>> +       max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
>> +       attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
>> +
>> +       attr0_val = table->res_ways & ATTR0_RES_WAYS_MASK;
>> +       attr0_val |= table->bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
>> +
>> +       ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, 
>> attr1_val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, 
>> attr0_val);
>> +
>> +       return ret;
> 
> return regmap_write(...)
> 

Ok done.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
