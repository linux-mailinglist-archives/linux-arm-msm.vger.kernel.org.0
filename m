Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7DE22CA31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 18:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgGXQH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 12:07:28 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62326 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728467AbgGXQHW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 12:07:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595606842; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BDjCdzox03R+E0WebnMzaH3e+8GkUl2oaYOMtWhsAZY=; b=bcTLN8lbOGieJte+AqySJES+DasbJFXoJMdAv0dQLEfLhcA8IW5Y5CFwdrc1zuoev/vZvCKk
 O8larDfBxZB0+mUEGQ5uxagOJtPM5MR8Dh5KAdXZCOLKKLLirlXb8S5mzYM1bBO0IFHWxBj8
 dpQsVQanAl9duOk8I6IB8oPMlYU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f1b07268db7256a955ba00e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 16:07:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03AB9C433C9; Fri, 24 Jul 2020 16:07:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [183.82.136.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CD91C43391;
        Fri, 24 Jul 2020 16:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CD91C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v4 4/4] clk: qcom: lpass: Add support for LPASS clock
 controller for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org>
 <1594795010-9074-5-git-send-email-tdas@codeaurora.org>
 <159531768310.3847286.13203525525881212775@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <893b1221-6e35-a903-77d4-a60a3ce0cbdc@codeaurora.org>
Date:   Fri, 24 Jul 2020 21:36:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159531768310.3847286.13203525525881212775@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the review.

On 7/21/2020 1:18 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-07-14 23:36:50)
>> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c

>> +static struct clk_alpha_pll lpass_lpaaudio_dig_pll = {
>> +       .offset = 0x1000,
>> +       .vco_table = fabia_vco,
>> +       .num_vco = ARRAY_SIZE(fabia_vco),
>> +       .regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lpass_lpaaudio_dig_pll",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
> 
> We don't need .name if we have .fw_name and this is a new binding/device.
> 

My bad, will cleanup in the next patch.

>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
