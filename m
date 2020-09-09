Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7252627B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 09:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgIIHES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 03:04:18 -0400
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54358
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727820AbgIIHEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 03:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599635040;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=yyZlFrBbj3mCUI/S6kobHVWb+8g7yss2Z7S57ZfQS00=;
        b=FZBXLkFz62bMWjcmzghRM/72fIqaZmWBHqWVkVhJGKOOyTZuvRaAeMiblou5a42M
        r/YqB5+yBK1HmPpuZFjXEobTV6uvNEM1nt2KINwt6dmqdhFx2O6cOKGUyg/5TjjrTU3
        kkkkaUNnqfmbRr84OgrCBj4ST8G4aHsASUYRiq5U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599635040;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=yyZlFrBbj3mCUI/S6kobHVWb+8g7yss2Z7S57ZfQS00=;
        b=AvatYPzMzkeDNEujC9ND7zVJxLrlI3Ma91lGNonPBc09ezlZ/Aj+BebpomnSbxh0
        9njN6uaw/coI/+48DIqt6gzm2dqrSltJ23HPaU3Ie6mGFyJZgd+WyGc6z+ziDupT/3u
        /hrcpVPvFlEAykKLDuhBJPcWHO4HNv9UfaULQxwM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 9 Sep 2020 07:04:00 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCHv3] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
In-Reply-To: <159958993124.450588.14302117254509761157@swboyd.mtv.corp.google.com>
References: <010101746c377537-ce93e925-598b-4dce-bb16-4cda020f4d6f-000000@us-west-2.amazonses.com>
 <159958993124.450588.14302117254509761157@swboyd.mtv.corp.google.com>
Message-ID: <0101017471ada945-235f5256-432a-4354-87f0-8c8b4a681aa7-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.09-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-09-09 00:02, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-09-07 22:36:48)
>> From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
>> 
>> Older chipsets may not be allowed to configure certain LLCC registers
>> as that is handled by the secure side software. However, this is not
>> the case for newer chipsets and they must configure these registers
>> according to the contents of the SCT table, while keeping in mind that
>> older targets may not have these capabilities. So add support to allow
>> such configuration of registers to enable capacity based allocation
>> and power collapse retention for capable chipsets.
>> 
>> Reason for choosing capacity based allocation rather than the default
>> way based allocation is because capacity based allocation allows more
>> finer grain partition and provides more flexibility in configuration.
>> As for the retention through power collapse, it has an advantage where
>> the cache hits are more when we wake up from power collapse although
>> it does burn more power but the exact power numbers are not known at
>> the moment.
>> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> (sai: use existing config instead of dt property and commit msg 
>> change)
> 
> Should be the following format:
> 
> [saiprakash.ranjan@codeaurora.org: use existing...]
> 

Hmm, is this documented somewhere because a quick grep shows
quite a few places where just the first name is added. Plus
there is already a signed-off-by line below this, so we know
that it is this 'sai' who made the extra changes.

>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> diff --git a/drivers/soc/qcom/llcc-qcom.c 
>> b/drivers/soc/qcom/llcc-qcom.c
>> index 429b5a60a1ba..b908656ce519 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -45,6 +45,9 @@
>>  #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
>>  #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
>> 
>> +#define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21F00
>> +#define LLCC_TRP_PCB_ACT              0x21F04
> 
> Use lowercase hex please. LLCC_COMMON_STATUS0 is using lowercase.
> 

Ok

>> +
>>  #define BANK_OFFSET_STRIDE           0x80000
>> 
>>  /**
>> @@ -89,6 +92,7 @@ struct llcc_slice_config {
>>  struct qcom_llcc_config {
>>         const struct llcc_slice_config *sct_data;
>>         int size;
>> +       bool need_llcc_cfg;
>>  };
>> 
>>  static const struct llcc_slice_config sc7180_data[] =  {
>> @@ -122,11 +126,13 @@ static const struct llcc_slice_config 
>> sdm845_data[] =  {
>>  static const struct qcom_llcc_config sc7180_cfg = {
>>         .sct_data       = sc7180_data,
>>         .size           = ARRAY_SIZE(sc7180_data),
>> +       .need_llcc_cfg  = true,
>>  };
>> 
>>  static const struct qcom_llcc_config sdm845_cfg = {
>>         .sct_data       = sdm845_data,
>>         .size           = ARRAY_SIZE(sdm845_data),
>> +       .need_llcc_cfg  = false,
> 
> false is the default so just leave it out?
> 

Done on purpose as I wanted to be explicit here so that
anyone reading it knows that it doesn't support configuring
in kernel. Yes the default is false but it won't hurt to be
explicit here to avoid confusion.

>>  };
>> 
>>  static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>> @@ -327,6 +333,7 @@ static int qcom_llcc_cfg_program(struct 
>> platform_device *pdev)
>>         u32 attr0_val;
>>         u32 max_cap_cacheline;
>>         u32 sz;
>> +       u32 disable_cap_alloc, retain_pc;
>>         int ret = 0;
>>         const struct llcc_slice_config *llcc_table;
>>         struct llcc_slice_desc desc;
>> @@ -369,6 +376,21 @@ static int qcom_llcc_cfg_program(struct 
>> platform_device *pdev)
>>                                         attr0_val);
>>                 if (ret)
>>                         return ret;
>> +
>> +               if (drv_data->need_llcc_config) {
>> +                       disable_cap_alloc = 
>> llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
> 
> Can we move u32 disable_cap_alloc, retain_pc here? That would keep it
> local to this if condition. Or make llc_table[i].slice_id into a local
> variable so the shift line isn't so long? Or make the body of this 
> while
> loop a new function that takes an llcc_table[i] pointer so that lines
> are easier to read?
> 

The whole function qcom_llcc_cfg_program() is just a loop so
adding another function moving that loop wouldn't look good.
llc_table[i].slice_id is already used elsewhere in this function
and changing everywhere is not related to this patch. So I will
go with your suggestion to move disable_cap_alloc and retain_pc
to if block.

Thanks for the review.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
