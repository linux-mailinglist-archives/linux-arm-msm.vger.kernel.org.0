Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA37644F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiLFXat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLFXas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:30:48 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DA242F5A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:30:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so26091697lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x75PTEmtYcgAOyLUuin7gV+lrOHZWzurDx5MMXePYG8=;
        b=LD5pquG0f4q8rIr3L3BNjJiraWzh/bDb/fjm/Tthx8SuOMJzqdAnG//huRWmfW0a3k
         lZnt/ecSCPo9+s5LVzHnWwL9q8X4xwgc7smC6EUcOYMWmYeKZ1Jykk866qfalFhrEh95
         iKOOdOPavxHuavd13JekxA1e30Tj7e4W7cNi/R7AWvyuGT3VxahjVDAq/DeTC+vfV7t4
         2J5OIf6iaAaujz/0H8CwjUadUauFNuACEZj7p9bHq6ktfZNA93S/gNTDD88g5EOQP3du
         V/dLRthTmyGq3ehCWZhws/si00E4StAMM32JJtIQyVLP/f0HGAvwcZD9+wN/qaIhVIjF
         6t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x75PTEmtYcgAOyLUuin7gV+lrOHZWzurDx5MMXePYG8=;
        b=5qlCaQzGpVhNuobf8m66j8z3Na1FEvoEecG9rYpIQ6NDyksmbs7VMTLwGaJqmxBc5T
         lZL1x7s6pjV+4SjRnJOXtVbcEtHvi/Pyxil4ONDoaDzIL99AYHCnCt9alyXAQJwaw9XF
         lMWw6foqgFUyvS9yaQkIcESzOGMg04EvkwAa846ukB9r77FwWrOiELTXhAy+VWQV8KBN
         eCcLUctWH8tQmzJpMhDQi2jgLNr8cVGT8YxZ320jvrVspPjWut/jvnmyQ3OrcpOf7jgN
         9Q8GzWV0nIIk/2aFjGdRK4kOt6GDy2Gs5q8ht2IgqGYoRBAOuI7sBRnFV0cImhg9Neun
         b/ng==
X-Gm-Message-State: ANoB5pm3fL8q0vcj7Ikie20EHm4acJH73mcQuMtmiqYKbkcnSkOrKPBO
        IzABk/cKuAjKzPyaaYGZDSVD+w==
X-Google-Smtp-Source: AA0mqf6KrgyT5iFBvG6K4QngYjh4RKXglNj98kTZCNAZM30TjibdUy4T8Tty1Z6RZod7vuahO76Yig==
X-Received: by 2002:a05:6512:2985:b0:49a:d9ae:3038 with SMTP id du5-20020a056512298500b0049ad9ae3038mr24044881lfb.44.1670369445545;
        Tue, 06 Dec 2022 15:30:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a05651203a600b004b55ddeb7e3sm1510623lfp.309.2022.12.06.15.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:30:45 -0800 (PST)
Message-ID: <76cfae59-22b2-1eb3-c546-6d1d5afcb8e1@linaro.org>
Date:   Wed, 7 Dec 2022 01:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 11/16] clk: qcom: smd-rpm: simplify XO_BUFFER clocks
 definitions
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-12-dmitry.baryshkov@linaro.org>
 <ff241a30-c970-d347-5a68-18b79a730d8c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ff241a30-c970-d347-5a68-18b79a730d8c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 19:05, Alex Elder wrote:
> On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
>> Remove the duplication between the names of the normal and active-only
>> XO_BUFFER and XO_BUFFER_PINCTRL clocks by using preprocessor logic to
>> add _a suffix.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This is nice.  See two comments below.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>
> 
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 54 +++++++++++++++++-----------------
>>   1 file changed, 27 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>> index cb47d69889fb..9f33dbd60e96 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -112,17 +112,17 @@
>>           __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>>           QCOM_RPM_SMD_KEY_STATE)
>> -#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, 
>> r)      \
>> -        __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, 
>> _active,          \
>> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, 
>> r)              \
>> +        __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
>>           QCOM_SMD_RPM_CLK_BUF_A, r_id, r,                  \
>>           QCOM_RPM_KEY_SOFTWARE_ENABLE)
>> -#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, 
>> _active,          \
>> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, 
>> _name,              \
>>                            r_id, r)                  \
> 
> Can the above line be merged with its predecessor?
> 
> (I now have looked at later patches, and I see you add a new argument
> that makes this original alignment still make sense.  If that's why
> you didn't here, you've done the right thing.)

Let's fix it in this patch, to remove possible questions.

> 
>> -        DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, 
>> _active,          \
>> +        DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,              \
>>                            r_id, r);                  \
> 
> Same comment here.
> 


-- 
With best wishes
Dmitry

