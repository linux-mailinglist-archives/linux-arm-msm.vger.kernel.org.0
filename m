Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01000248210
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHRJkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 05:40:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55185 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgHRJkz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 05:40:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597743654; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uvO1Cuom7MQDHiD5guU9iypdCG5Ah4NoX6vDWiRvJqY=;
 b=HpFb3+xVBf2tAIXwUZtOfQ9EBOA33Q5mL4bv0+PCIe2Sp+siimLesqf2udFSdCP7Mjz2xtjP
 57yOeHzyCSIIV9+R5da5sBG02EXphxJEPqEW6J5GpI6qab2hB1X/O7tx4mycLrr5qlxhcONW
 Ivt8aYGMqOYdsS2DAstvCWGGpg4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f3ba1fa2f4952907d7ab131 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 09:40:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A2E6C433CB; Tue, 18 Aug 2020 09:40:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB677C433C6;
        Tue, 18 Aug 2020 09:40:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Aug 2020 15:10:08 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
In-Reply-To: <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
Message-ID: <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-08-18 02:35, Doug Anderson wrote:
> Hi,
> 
> On Mon, Aug 17, 2020 at 7:47 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
>> 
>> Older chipsets may not be allowed to configure certain LLCC registers
>> as that is handled by the secure side software. However, this is not
>> the case for newer chipsets and they must configure these registers
>> according to the contents of the SCT table, while keeping in mind that
>> older targets may not have these capabilities. So add support to allow
>> such configuration of registers to enable capacity based allocation
>> and power collapse retention for capable chipsets.
> 
> I have very little idea about what the above means.  That being said,
> what's broken that this patch fixes?  Please include this in the CL
> description.  It should answer, in the very least, the following two
> questions:
> 

As the commit message says about secure software configuring these LLCC 
registers,
usually 2 things can happen in that case.

1) Accessing those registers in non secure world like Kernel would 
result in a
fault which is trapped by secure side.

2) Access to those registers may be just ignored and there will be no 
faults.

So for older chipsets, this is a fix to not allow them to access those 
registers.
For newer chipsets, we follow the recommended settings from HW/SW arch 
teams.
But... upstream llcc driver only supports SDM845 currently which is not 
required
to configure those registers and as per my testing, no crash is observed 
on SDM845.
So we won't need fixes tag.

> a) Were existing attempts to do capacity based allocation failing, or
> is capacity based allocation a new whizbang feature that a future
> patch will add and you need this one to land first?
> 

Capacity-based allocation and Way-based allocation are cache 
partitioning
schemes/algorithms usually used in shared LLCs. Now which one to use or 
why
one is preferred over the other are decided by HW/SW architecture teams 
and are
recommended by them. So if the question is what is capacity based 
allocation and
how it works, then I am afraid that I will not be able to explain that 
algorithm
just like that.

> b) Why was it bad not to enable power collapse retention?  Was this
> causing things to get corrupted after resume?  Was this causing us to
> fail to suspend?  Were we burning too little power in S3 and the
> battery vendors are looking for an excuse to sell bigger batteries?
> 
> I'm not very smart and am also lacking documentation for what the heck
> all this is, so I'm looking for the "why" of your patch.
> 

That's a fair point. I will try to dig through to find some context for 
"question b"
and check if there were any battery vendors involved in this decision ;)

> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> (sai: use table instead of dt property and minor commit msg change)
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> Changes in v2:
>>  * Fix build errors reported by kernel test robot.
>> 
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/drivers/soc/qcom/llcc-qcom.c 
>> b/drivers/soc/qcom/llcc-qcom.c
>> index 429b5a60a1ba..865f607cf502 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -45,6 +45,9 @@
>>  #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
>>  #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
>> 
>> +#define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21F00
>> +#define LLCC_TRP_PCB_ACT              0x21F04
>> +
>>  #define BANK_OFFSET_STRIDE           0x80000
>> 
>>  /**
>> @@ -318,6 +321,11 @@ size_t llcc_get_slice_size(struct llcc_slice_desc 
>> *desc)
>>  }
>>  EXPORT_SYMBOL_GPL(llcc_get_slice_size);
>> 
>> +static const struct of_device_id __maybe_unused 
>> qcom_llcc_configure_of_match[] = {
>> +       { .compatible = "qcom,sc7180-llcc" },
>> +       { }
>> +};
> 
> Why are you introducing a whole second table?  Shouldn't you just add
> a field to "struct qcom_llcc_config" ?
> 

This was my 2nd option, first one was to have this based on the version 
of LLCC
which are exposed by hw info registers. But that didn't turn out good 
since I
couldn't find any relation of this property with LLCC version.

Second option was as you mentioned to have a field to qcom_llcc_config. 
Now this is good,
but then I thought that if we add LLCC support for 20(random number) 
SoCs of which
10 is capable of supporting cap_based_alloc and rest 10 are not, then we 
will still be adding
20 more lines to each SoC's llcc_config if we follow this 2nd option.

So why not opt for a 3rd option with the table where you just need to 
specify only the capable
targets which is just 10 in our sample case above.

Am I just overthinking this too much and should just go with the 2nd 
option as you mentioned?

> 
>> +
>>  static int qcom_llcc_cfg_program(struct platform_device *pdev)
>>  {
>>         int i;
>> @@ -327,13 +335,17 @@ static int qcom_llcc_cfg_program(struct 
>> platform_device *pdev)
>>         u32 attr0_val;
>>         u32 max_cap_cacheline;
>>         u32 sz;
>> +       u32 disable_cap_alloc = 0, retain_pc = 0;
> 
> Don't init to 0.  See below.
> 
> 
>>         int ret = 0;
>>         const struct llcc_slice_config *llcc_table;
>>         struct llcc_slice_desc desc;
>> +       const struct of_device_id *llcc_configure;
>> 
>>         sz = drv_data->cfg_size;
>>         llcc_table = drv_data->cfg;
>> 
>> +       llcc_configure = of_match_node(qcom_llcc_configure_of_match, 
>> pdev->dev.of_node);
>> +
> 
> As per above, just use the existing config.
> 

See above explanation.

> 
>>         for (i = 0; i < sz; i++) {
>>                 attr1_cfg = 
>> LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
>>                 attr0_cfg = 
>> LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
>> @@ -369,6 +381,21 @@ static int qcom_llcc_cfg_program(struct 
>> platform_device *pdev)
>>                                         attr0_val);
>>                 if (ret)
>>                         return ret;
>> +
>> +               if (llcc_configure) {
>> +                       disable_cap_alloc |= 
>> llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
> 
> Don't "|=".  You're the only place touching this variable.  Just set 
> it.
> 

Ack, will change.

> 
>> +                       ret = regmap_write(drv_data->bcast_regmap,
>> +                                               
>> LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
>> +                       if (ret)
>> +                               return ret;
>> +
>> +                       retain_pc |= llcc_table[i].retain_on_pc << 
>> llcc_table[i].slice_id;
> 
> Don't "|=".  You're the only place touching this variable.  Just set 
> it.
> 

Ack, will change.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
