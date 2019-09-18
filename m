Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05261B609C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 11:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbfIRJpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 05:45:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56624 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbfIRJpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 05:45:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1D77160767; Wed, 18 Sep 2019 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568799898;
        bh=01k7VsRuEiArmVgviOohpsSpMMj+aFioBTpHuknqkqU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JQtrMNKmKlLkn02HSAU17ss9SOrAQIFDlsHI79hKwVIzPZJSjTBVJWqk8Q908C6NR
         UikarPP2aTWhlbxuGGjaWuGZyeKt4E4vofKp+IOLV+stNIE3R3N7oUDchKbhX5RYjR
         Up23E+4myxQ89LFjlDEFe1N0+uiEdIwU/m1Y+U+Y=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AFA56611FA;
        Wed, 18 Sep 2019 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568799896;
        bh=01k7VsRuEiArmVgviOohpsSpMMj+aFioBTpHuknqkqU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AHLJuNLfqBcq8XZzyXcm7iB5e2+Fp+j2s8ADqfecBfhp5WK6snHjtADqFCj+ua1wc
         jhm/v2XRwSWgqAdyxtDMw47HK0+NsXfAHouGpACmIHYDix85YZxg/nKRhYIa3syUEC
         a/wzN3Qkqy4Oa8FWwWGEaAMb+jkFswhS6vzTJu20=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AFA56611FA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190819163748.18318-1-tdas@codeaurora.org>
 <20190819163748.18318-4-tdas@codeaurora.org>
 <20190821180200.1F7EF2082F@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <6a5b6bf6-a99a-e4aa-b9ac-fcc0fceab5bd@codeaurora.org>
Date:   Wed, 18 Sep 2019 15:14:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190821180200.1F7EF2082F@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for your review.

On 8/21/2019 11:31 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-08-19 09:37:48)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index e1ff83cc361e..ebd4902afd9f 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -322,5 +331,4 @@ config KRAITCC
>>          help
>>            Support for the Krait CPU clocks on Qualcomm devices.
>>            Say Y if you want to support CPU frequency scaling.
>> -
>>   endif
> 
> Please remove this hunk
> 

Would remove this.

>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> new file mode 100644
>> index 000000000000..8718b675d609
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
> [...]
>> +       },
>> +};
>> +
>> +/* Camera Subsystem requires always ON. */
> 
> Yes, but why? This comment is useful unless it explains why.
> 

Next patch would take care.

>> +static struct clk_branch gcc_camera_ahb_clk = {
>> +       .halt_reg = 0xb008,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb008,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_hf_axi_clk = {
>> +       .halt_reg = 0xb020,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb020,
>> +               .enable_mask = BIT(0),

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
