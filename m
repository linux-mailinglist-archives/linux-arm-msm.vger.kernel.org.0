Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9C6196DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 04:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfEJC6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 22:58:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48424 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfEJC6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 22:58:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E9CC7602DC; Fri, 10 May 2019 02:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557457127;
        bh=XLLv4bUR+OY9ABRV/+7uwvmNvS54liCSR5ocsFHuJFQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jvHMDqEHlxQ9PTKP0D8QvZ61RHCicfIlsVbQGQgKztj4hUED4TVWkqudj56KDNN0J
         be3v/TaINdzIAnomU7TVQvvP6kYY4ARst6Wg8FsiLPapV8zOssn1rPolKTj7ghInge
         O3c1vQNW1ATIotJ44sz6bu8VVo90vjjY/tLg8w+A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9E01602DC;
        Fri, 10 May 2019 02:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557457127;
        bh=XLLv4bUR+OY9ABRV/+7uwvmNvS54liCSR5ocsFHuJFQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jvHMDqEHlxQ9PTKP0D8QvZ61RHCicfIlsVbQGQgKztj4hUED4TVWkqudj56KDNN0J
         be3v/TaINdzIAnomU7TVQvvP6kYY4ARst6Wg8FsiLPapV8zOssn1rPolKTj7ghInge
         O3c1vQNW1ATIotJ44sz6bu8VVo90vjjY/tLg8w+A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9E01602DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
 <1557339895-21952-4-git-send-email-tdas@codeaurora.org>
 <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org>
Date:   Fri, 10 May 2019 08:28:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for the review.

On 5/9/2019 10:57 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-05-08 11:24:55)
>> Update the init data name for each of the dynamic frequency switch
>> controlled clock associated with the RCG clock name, so that it can be
>> generated as per the hardware plan. Thus update the macro accordingly.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> 
> This patch doesn't make any sense to me.
> 
>> ---
>>   drivers/clk/qcom/clk-rcg.h    |  2 +-
>>   drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++++++----------------------
>>   2 files changed, 49 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>> index 5562f38..e40e8f8 100644
>> --- a/drivers/clk/qcom/clk-rcg.h
>> +++ b/drivers/clk/qcom/clk-rcg.h
>> @@ -171,7 +171,7 @@ struct clk_rcg_dfs_data {
>>   };
>>
>>   #define DEFINE_RCG_DFS(r) \
>> -       { .rcg = &r##_src, .init = &r##_init }
>> +       { .rcg = &r, .init = &r##_init }
> 
> Why do we need to rename the init data?
> 

We want to manage the init data as the clock source name, so that we 
could manage to auto generate our code. So that we do not have to 
re-name the clock init data manually if the DFS source names gets 
updated at any point of time.

>>
>>   extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
>>                                      const struct clk_rcg_dfs_data *rcgs,
>> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
>> index 7131dcf..a76178b 100644
>> --- a/drivers/clk/qcom/gcc-sdm845.c
>> +++ b/drivers/clk/qcom/gcc-sdm845.c
>> @@ -408,7 +408,7 @@ enum {
>>          { }
>>   };
>>
>> -static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init = {
>> +static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>>          .name = "gcc_qupv3_wrap0_s0_clk_src",
>>          .parent_names = gcc_parent_names_0,
>>          .num_parents = 4,
>> @@ -3577,22 +3577,22 @@ enum {
>>   MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
>>
>>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>> -       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
> 
> I've trimmed the above to try and see what's changed but it doesn't make
> sense still.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
