Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6B4643BA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 04:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbiLFDFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 22:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbiLFDFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 22:05:34 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4084E13D3A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 19:05:33 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id e189so8954883iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 19:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQf4ZY8NnOfS/XZrZYFBrjz8jiMgg2iTJlvBgkUiKnI=;
        b=B+LESh4NfFlaJrLJhK/+R7eY67yJrRUrFyBNEy7rQqgfKZgNOsllOH5A1HjUSu/ACQ
         rsaWsGUGxWXYWSHjOt8TVfCBD2CotfmtlqbiiuUugWxre3rmsuJh4v2L1QJbmlDT3HAx
         2HUMv63gCgipquCzvHgqPHRhfnuULE9027jRi2a7vwv6bdt9XL75QNqhDMvqbg1T0cLC
         D45HYjkIFDn8/Y/VFSWKLiS5uBDcMx9uw6hW0qdzJEd+AAfln962A3xS9dEhEiQKEdQp
         tS2SwV8gIDqXMiDu7AoyPPSZ/r61a0tn8I+wI4YWG9rW6wH5F0sZTOkXLAbpU0NR8Yao
         PH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQf4ZY8NnOfS/XZrZYFBrjz8jiMgg2iTJlvBgkUiKnI=;
        b=Bc0kx5B4wAU/uCO3VRg1pDTum5sgj+2tLDQeGNxOoJPS+HWQAUtBn9ybgBHcl9UZNv
         JDTRZ4/uxlBWf/HFpYN4FO30QbeFJ6o9QklZzL1IGsTqETy5sz6YwdliAjUo0mCo7E8j
         pJGKKW0dDfF3ieDM7L4IF6tyw2rvjbK7n810QqXr5te9QhALv2Fq5Oex8Q4ax4+vurbC
         BLvB9qOgwNzeY77p+XFBHLx3QFlXy0D4XhZs/9VHx68+l1Q1kABMm0VXIpe0uJIWZ+mX
         23DGIS/tCeuj5uilXzOhATmtiUWdYEgcUzHoc5xrjzHuKw8O/qZXlDVh9x/WaqPXYFYi
         qL/g==
X-Gm-Message-State: ANoB5pkOLZLTWHRFohdhDQs+2UtC6TWcdiM8Y04J8bfG5Fzf+2gUW3K3
        7YnQpvx8ScjJeQhYwhfemkg/2A==
X-Google-Smtp-Source: AA0mqf5RyDbcFgJcCuznHg/LSos18Hg/iENVPFz7iPLYoFND0sWm3/uY1TqH7HaYlk3NyHApBqPE0Q==
X-Received: by 2002:a05:6638:37a5:b0:363:dd45:9df6 with SMTP id w37-20020a05663837a500b00363dd459df6mr40029387jal.274.1670295932596;
        Mon, 05 Dec 2022 19:05:32 -0800 (PST)
Received: from [10.211.55.3] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id o62-20020a022241000000b00389d2ff28a5sm6410719jao.47.2022.12.05.19.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 19:05:32 -0800 (PST)
Message-ID: <39903fb5-fd28-c159-b300-47d3ec4cd0fc@linaro.org>
Date:   Mon, 5 Dec 2022 21:05:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Alex Elder <elder@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        konrad.dybcio@linaro.org, agross@kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221202221240.225720-1-elder@linaro.org>
 <20221205225646.gtwhakd4lxh6vlfc@builder.lan>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <20221205225646.gtwhakd4lxh6vlfc@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/5/22 4:56 PM, Bjorn Andersson wrote:
> On Fri, Dec 02, 2022 at 04:12:40PM -0600, Alex Elder wrote:
>> From: Luca Weiss <luca.weiss@fairphone.com>
>>
>> The IPA core clock is required for SM6350.  Define it.
>>
>> [elder@linaro.org: rebased with Dmitry's changes]
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Sorry about that, I knew I was supposed to sign
off and thought I had.

You told me separately that this was sufficient:

Signed-off-by: Alex Elder <elder@linaro.org>

If you want me to send a new version with the
signoff just let me know.  Thanks.

					-Alex
> 
> Thanks for rebasing this Alex. But as you're handling the patch you need
> to add your S-o-b; which will make sure your [] makes sense as well.
> 
> Regards,
> Bjorn
> 
>> ---
>> v2: This is now based on qualcomm/for-next.
>>
>>   drivers/clk/qcom/clk-rpmh.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 2c2ef4b6d130e..586a810c682ca 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -606,6 +606,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
>>   	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
>>   	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
>>   	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
>> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>>   };
>>   
>>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>> -- 
>> 2.34.1
>>

