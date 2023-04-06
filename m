Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DD46D9AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238037AbjDFOpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 10:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239477AbjDFOo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 10:44:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B71B44A
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 07:44:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h11so44163011lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680792240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GoNU+GadKU3QWy/XxC84RJUEWk73D4f2JeVQMiCKdk=;
        b=BbUoiW8L6w/9wIsJcUDeO4bohDNl4/APFqKc3mJbXYdtAtYDYg8Oyqk2KJ9ItHYdyU
         OaW5HWGOSeUoVvl11cBS3QLK7a08IckT4NRs5K2wsznr8TqP477NOPZ5u7Zsj0/V0wrW
         BaJqQih9q03ya5rTy21LwSQkG7dPHTfqp8brhdH4EPgrWHe+S4aTvx7qDudAaZPX/vrG
         HHdu1XB7oRddVvdrIei3NCTsXobMh7K5WOPN+azBA6YVV/3aad8lw/jHASitOD6hio1v
         rs7wfq98vEaZTzzq2tGJgEChBNsVREU9Xos0kvNjVkT5XYKFZKcVxC4YXtquk4UFvJEz
         SNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680792240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GoNU+GadKU3QWy/XxC84RJUEWk73D4f2JeVQMiCKdk=;
        b=Q2YbJDwIw0PFGRxaMoHnXvWivc0h5dTR8YCCQqG4+4GLMf9m3CzU67wRTz0oB2eOqJ
         0R1iFzUes8iI2BRuyi0+FgpF96qlu7mimO658TVbpxGGx7+EBwNlDl1ghUsoUpPa9XWD
         SAFegcqevujxhO3Z+4wPuAw6ntlD5ApOFswZZtTLnTvvWDcNCsUTg6MXPUImQDwKEoFQ
         LMhiXZWvFdo/KTyXZwGXFBsr3gimYJMMO8ATmI/WYOoc0c32BgDHe/LjVTZzJDwLClav
         lPM/07H1Yw851CSh7Zhug6sYc86VrSGtxuG+7lGhUJGl7QLQqkn3FutN2xEB997G+Yay
         cnBQ==
X-Gm-Message-State: AAQBX9cMldVyErBijl0qlkrkx9zs1dpu6PBlcHQz5dRpyzKM3Xeic9C4
        sOQYBCabpo8LeXPmf6B9qa90Fg==
X-Google-Smtp-Source: AKy350aqIKjEC6AQIfwUvpbuilrqhaKUX62eLL1udBptHHLvM+Xc0uqllkudj+V48kd7U8ZGJtMtaw==
X-Received: by 2002:ac2:5e91:0:b0:4ea:e688:a048 with SMTP id b17-20020ac25e91000000b004eae688a048mr2761195lfq.69.1680792240131;
        Thu, 06 Apr 2023 07:44:00 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id y10-20020ac2446a000000b004b4b600c093sm289472lfl.92.2023.04.06.07.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:43:59 -0700 (PDT)
Message-ID: <fed27bde-f7c7-fae2-de6f-a997587b93b1@linaro.org>
Date:   Thu, 6 Apr 2023 16:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 02/14] clk: qcom: smd-rpm: Add .is_enabled hook
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-2-ae80a325fe94@linaro.org>
 <20230322030218.7xjrsgt3abqft2y7@ripper>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230322030218.7xjrsgt3abqft2y7@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.03.2023 04:02, Bjorn Andersson wrote:
> On Wed, Mar 08, 2023 at 10:35:18PM +0100, Konrad Dybcio wrote:
>> From: Shawn Guo <shawn.guo@linaro.org>
>>
>> The RPM clock enabling state can be found with 'enabled' in struct
>> clk_smd_rpm.  Add .is_enabled hook so that clk_summary in debugfs can
>> show a correct enabling state for RPM clocks.
>>
> 
> I don't think .is_enabled should be implemented for clocks where the
> actual state can't be queried.
> 
> E.g. should a clock which is is_enabled = false be unprepared during
> disable_unused? It's already disabled...
That's true, it sounds silly.

However, I feel like it's the least painful option, as trying to disable
a clock that's already actually disabled (read, in hw+RPM, not Linux)
will not do any harm.

Not adding this (and by extension not making use of any sort of unused
clk cleanup) will prevent the system from hitting low power modes and
SMD RPM is strictly speaking, too dumb to figure out that these clocks
aren't really consumed.

Konrad
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> [Konrad: rebase]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/clk/qcom/clk-smd-rpm.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 198886c1b6c8..ecacfbc4a16c 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -424,18 +424,27 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
>>  	return 0;
>>  }
>>  
>> +static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
>> +
>> +	return r->enabled;
>> +}
>> +
>>  static const struct clk_ops clk_smd_rpm_ops = {
>>  	.prepare	= clk_smd_rpm_prepare,
>>  	.unprepare	= clk_smd_rpm_unprepare,
>>  	.set_rate	= clk_smd_rpm_set_rate,
>>  	.round_rate	= clk_smd_rpm_round_rate,
>>  	.recalc_rate	= clk_smd_rpm_recalc_rate,
>> +	.is_enabled	= clk_smd_rpm_is_enabled,
>>  };
>>  
>>  static const struct clk_ops clk_smd_rpm_branch_ops = {
>>  	.prepare	= clk_smd_rpm_prepare,
>>  	.unprepare	= clk_smd_rpm_unprepare,
>>  	.recalc_rate	= clk_smd_rpm_recalc_rate,
>> +	.is_enabled	= clk_smd_rpm_is_enabled,
>>  };
>>  
>>  DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
>>
>> -- 
>> 2.39.2
>>
