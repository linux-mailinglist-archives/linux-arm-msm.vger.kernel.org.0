Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4121873B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 20:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732481AbgCPT6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 15:58:12 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:47003 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732366AbgCPT6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 15:58:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584388692; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0jutu2TrYwknNeBbhpvzrOvPcmG3lvgPL/hDLeN1Qxs=; b=sdwPEF5JYYpmIvY+1ndJDjIKpG793RznbT+4iQvxl5B/tREo5roHmPPPXZJ0jF2Q1BwY5Srw
 1wtBlztx7UdiY/oNclhNP2rV/JPZ2+OPZxIVJpStgDWN5glUZxiFZHq9JhRWzSHB7mVuof4e
 DhFJr8HSXnyaT0BvofEsm8Ri5TU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6fda52.7fbaa5492d50-smtp-out-n03;
 Mon, 16 Mar 2020 19:58:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5EF4EC433BA; Mon, 16 Mar 2020 19:58:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (cpe-75-80-185-151.san.res.rr.com [75.80.185.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53466C433CB;
        Mon, 16 Mar 2020 19:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53466C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc: Add USB3 PIPE clock operations
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1584172319-24843-1-git-send-email-wcheng@codeaurora.org>
 <1584172319-24843-3-git-send-email-wcheng@codeaurora.org>
 <158437819409.88485.6326749791923076608@swboyd.mtv.corp.google.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <9707b6f5-89d4-9800-bee2-825877b535ac@codeaurora.org>
Date:   Mon, 16 Mar 2020 12:58:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158437819409.88485.6326749791923076608@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the feedback.

On 3/16/2020 10:03 AM, Stephen Boyd wrote:
> Quoting Wesley Cheng (2020-03-14 00:51:58)
>> Add the USB3 PIPE clock structures, so that the USB driver can
>> vote for the GCC to enable/disable it when required.  This clock
>> is needed for SSUSB operation.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/clk/qcom/gcc-sm8150.c | 26 ++++++++++++++++++++++++++
> 
> Can you please combine these two patches and add sm8150 in the subject?
> 

Sure, I'll combine the two patches into one and include the SM8150 tag
in the subject on the next patch series.

>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
>> index d0cd03d..ef98fdc 100644
>> --- a/drivers/clk/qcom/gcc-sm8150.c
>> +++ b/drivers/clk/qcom/gcc-sm8150.c
>> @@ -3172,6 +3172,18 @@ enum {
>>         },
>>  };
>>  
>> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
>> +       .halt_check = BRANCH_HALT_SKIP,
>> +       .clkr = {
>> +               .enable_reg = 0xf058,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb3_prim_phy_pipe_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>>  static struct clk_branch gcc_usb3_sec_clkref_clk = {
>>         .halt_reg = 0x8c028,
>>         .halt_check = BRANCH_HALT,
>> @@ -3219,6 +3231,18 @@ enum {
>>         },
>>  };
>>  
>> +static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
>> +       .halt_check = BRANCH_HALT_SKIP,
> 
> Sad to see that we'll never resolve this.
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
