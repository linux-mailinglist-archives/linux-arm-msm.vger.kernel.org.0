Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4451D6737
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 12:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgEQKCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 06:02:34 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:33587 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727097AbgEQKCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 06:02:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589709754; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ie72CSVaBZTWLUhd2XX2zBN7xMC96ipHL36jNl8eEyM=; b=CYIbe3YzLCBKKa8L/CihdBivqFx1B5+qA5pvKJITbhyJRTZ8o2AG4x+F1CKvskzXqXR5oMc3
 dzk+IyFpjL2Wkf4n74abn0vFKBW78kna+9NeLir16CD8eVPM5EaroF9euiH+gEO8T0JvKARw
 9Dv4V4kq2+DqgOnH8wPWfIZcJjs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ec10bbad4b17227ea29a9fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 10:02:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A628C433F2; Sun, 17 May 2020 10:02:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.82.140.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FA8BC433D2;
        Sun, 17 May 2020 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3FA8BC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 3/3] clk: qcom: gcc: Add support for Secure control
 source clock
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
 <1584356082-26769-4-git-send-email-tdas@codeaurora.org>
 <158438098823.88485.2094714876575396381@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <b77c644f-e194-8778-8135-9e8f98ac5f2a@codeaurora.org>
Date:   Sun, 17 May 2020 15:32:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158438098823.88485.2094714876575396381@swboyd.mtv.corp.google.com>
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
> Quoting Taniya Das (2020-03-16 03:54:42)
>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> index ad75847..3302f19 100644
>> --- a/drivers/clk/qcom/gcc-sc7180.c
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>> @@ -817,6 +817,26 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>>          },
>>   };
>>
>> +static const struct freq_tbl ftbl_gcc_sec_ctrl_clk_src[] = {
>> +       F(4800000, P_BI_TCXO, 4, 0, 0),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sec_ctrl_clk_src = {
>> +       .cmd_rcgr = 0x3d030,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_3,
>> +       .freq_tbl = ftbl_gcc_sec_ctrl_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sec_ctrl_clk_src",
>> +               .parent_data = gcc_parent_data_3,
>> +               .num_parents = 3,
> 
> ARRAY_SIZE please.
> 

Will take care of the same.

>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>>   static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
>>          .halt_reg = 0x82024,
>>          .halt_check = BRANCH_HALT_DELAY,

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
