Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D7E269DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 07:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgIOFWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 01:22:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28155 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgIOFWs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 01:22:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600147367; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+DxdXglsCm9GNu2FhjIm9kRGho72XduQ5AptOxX+trE=;
 b=SRD44rkMj4sIIOLHReKcG/osrNr7oC8tZ92aWS2mVgJTpcj/okRjGYEMaqztiB+mk/DHDWxg
 eyTdnLGFRcrgYUo+MO65YCY9jPqae8oaxBfMOK9C+HpW2cc0LuvZvoT5vaVi3+ZibgAw1VeI
 +DsTlnXnEIXctBRnN/Tr83wUkyc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f604fa74f13e63f0462764c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 05:22:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 792F5C433F1; Tue, 15 Sep 2020 05:22:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60003C433CA;
        Tue, 15 Sep 2020 05:22:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 10:52:45 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCHv4 2/2] soc: qcom: llcc: Support chipsets that can write to
 llcc regs
In-Reply-To: <160010921920.4188128.15524650302574745988@swboyd.mtv.corp.google.com>
References: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
 <84742b96802d94da00006be8d51cadce4ae04f9f.1599974998.git.saiprakash.ranjan@codeaurora.org>
 <160010921920.4188128.15524650302574745988@swboyd.mtv.corp.google.com>
Message-ID: <590f9bacf06d735a7961ddb8234299ca@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-15 00:16, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-09-14 04:13:00)
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
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> (saiprakash.ranjan@codeaurora.org: use existing config and reword 
>> commit msg)
> 
> Should be [ not (
> 

Ok

>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 27 +++++++++++++++++++++++++--
>>  1 file changed, 25 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/soc/qcom/llcc-qcom.c 
>> b/drivers/soc/qcom/llcc-qcom.c
>> index 60ee31842dea..6aedccff49bb 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -375,6 +382,22 @@ static int qcom_llcc_cfg_program(struct 
>> platform_device *pdev)
>>                 if (ret)
>>                         return ret;
>> 
>> +               if (cfg->need_llcc_cfg) {
>> +                       u32 disable_cap_alloc, retain_pc;
>> +
>> +                       disable_cap_alloc = 
>> llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
>> +                       ret = regmap_write(drv_data->bcast_regmap,
>> +                                       LLCC_TRP_SCID_DIS_CAP_ALLOC, 
>> disable_cap_alloc);
>> +                       if (ret)
>> +                               return ret;
>> +
>> +                       retain_pc = llcc_table[i].retain_on_pc << 
>> llcc_table[i].slice_id;
>> +                       ret = regmap_write(drv_data->bcast_regmap,
>> +                                       LLCC_TRP_PCB_ACT, retain_pc);
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +
>>                 if (llcc_table[i].activate_on_init) {
>>                         desc.slice_id = llcc_table[i].slice_id;
>>                         ret = llcc_slice_activate(&desc);
> 
> I thought all of this stuff would move into the config function. So the
> for loop is simplified to a function call and return if failure.

The config function was specifically for attribute config
not for other llcc configs like these, so I will rename
qcom_llcc_attr_cfg() to _qcom_llcc_cfg_program() and move
everything there.

As a side note, I have your mails in my inbox but these
messages are not appearing in the list [1]. For Patch 2,
its on the list [2]. I have noticed same thing on your
messages for previous patches, where your reply for one
patch was on the list but the other one was missing, you
might have to check that.

[1] https://lore.kernel.org/patchwork/patch/1305132/
[2] https://lore.kernel.org/patchwork/patch/1305133/

Same with lore.kernel.org/lkml/ links but since url was big, I gave the
above patchwork links.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
