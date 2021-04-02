Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7E352542
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhDBBtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbhDBBtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:49:40 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056CDC0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 18:49:39 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y1so4192344ljm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j9RQT679vd506Q/98s/aT0/YHnrmdImyJeUqZ+dnfVs=;
        b=zviu1i1ODoFigiZ1KJ8aTTF0jIT+/sjNMgujHZmrH9QIPiTDXxC8LVdS/qy89e/duh
         StgEfRNRqX4b2OLZ4mMARerWhYJzH/HluCFwyuBAvY5IDQrY/f47CMCnwNWcacFFd/pv
         GxjcsmquwI6X/tVuke3Y83duwIQvXm5jA3i2ISxNBMCCZREYizaO38b+NMNlvGVC+QMd
         RdyYTZ13Cu3P/s626PI/8BzzSJ/biJx6hiTZ81kExUGxHTrFkcK17ntc1Oqt9tMWHzsY
         8TLnrBXd4abClI3rG73UUOzvcNGl/5CgNtPfVe9bZOOm3wf8zhQk1BMEr/amcLBTxKww
         T3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j9RQT679vd506Q/98s/aT0/YHnrmdImyJeUqZ+dnfVs=;
        b=qEhRKsF9fp2kAwYwRbYwEprqBEqqjKcWalHk7PV/07B7XmU9vxUARVaYiKdZO7+8RF
         WKoKQmyILdSwGxuCwD5vurYarqDuevPefPmQyV+SSEYUd7t35LMU5SkMIXIazCrc1JTj
         XSAz3JALc/5GItBcV0dRUb86g326R7WZCseGI0YL+Jao5+UMXexut1fAXQ+kGAGB40Y8
         Hx7V50Aucom/64KBsTpHJrtnk+xH8OWYDycINfL5CHcmKqRBHG804dIlsSXC7uyHarla
         tFreAhP5KxpzKwBGfUnatISXDIeeviphVTqcyluzH9XdzcqfOjLjH6+UAtEPGTo15nkB
         QEEA==
X-Gm-Message-State: AOAM533IFhpR+r0+zH2HYVEKR8cIfisFKmGVdMDLGkdSvJJG2FHa/BhO
        k9z16KiNrCzQMDVIPpsq9o1RxDJoU+85KA==
X-Google-Smtp-Source: ABdhPJxTzDGJJELTevLxL1omqsCZyRj/X18CZ50HdcHsz6uZ3Bp/bfAuF/cb6feI0vjC1tyZqWT/bQ==
X-Received: by 2002:a2e:99ce:: with SMTP id l14mr7160785ljj.93.1617328178325;
        Thu, 01 Apr 2021 18:49:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n5sm705677lfh.173.2021.04.01.18.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 18:49:37 -0700 (PDT)
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported
 clock sources
To:     Taniya Das <tdas@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
 <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c92f7a04-f010-4c63-4b39-482a5581317a@linaro.org>
Date:   Fri, 2 Apr 2021 04:49:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2021 04:23, Taniya Das wrote:
> Hi Dmitry,
> 
> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
>> video_pll0_out_even/_odd are not supported neither in the upstream nor
>> in the downstream kernels, so drop those clock sources.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/videocc-sdm845.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/videocc-sdm845.c 
>> b/drivers/clk/qcom/videocc-sdm845.c
>> index 5d6a7724a194..7153f044504f 100644
>> --- a/drivers/clk/qcom/videocc-sdm845.c
>> +++ b/drivers/clk/qcom/videocc-sdm845.c
>> @@ -21,24 +21,18 @@
>>   enum {
>>       P_BI_TCXO,
>>       P_CORE_BI_PLL_TEST_SE,
>> -    P_VIDEO_PLL0_OUT_EVEN,
>>       P_VIDEO_PLL0_OUT_MAIN,
>> -    P_VIDEO_PLL0_OUT_ODD,
>>   };
>>   static const struct parent_map video_cc_parent_map_0[] = {
>>       { P_BI_TCXO, 0 },
>>       { P_VIDEO_PLL0_OUT_MAIN, 1 },
>> -    { P_VIDEO_PLL0_OUT_EVEN, 2 },
>> -    { P_VIDEO_PLL0_OUT_ODD, 3 },
> 
> These are supported from the design, please do not remove them. It is 
> just that in SW currently it is not being used.
> But SW can decide to use them as they want. As said earlier these are 
> defined in the HW plans and thus do not want them to be updated manually 
> to create a mismatch.

The problem arises during conversion of these drivers to use parent_data 
instead of parent_names. You see, video_pll0_odd/_even are clocks which 
should be referenced using .hw (and thus defined inside the videocc 
driver) as we do for "video_pll0" parent. However there are no clk_hw 
entities defined for those clocks. For now I'd just use the { .name = 
video_pll0_out_odd" } entry for those clocks, however I still think this 
is not correct.

> 
>>       { P_CORE_BI_PLL_TEST_SE, 4 },
>>   };
>>   static const char * const video_cc_parent_names_0[] = {
>>       "bi_tcxo",
>>       "video_pll0",
>> -    "video_pll0_out_even",
>> -    "video_pll0_out_odd",
>>       "core_bi_pll_test_se",
>>   };
>> @@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
>>       .clkr.hw.init = &(struct clk_init_data){
>>           .name = "video_cc_venus_clk_src",
>>           .parent_names = video_cc_parent_names_0,
>> -        .num_parents = 5,
>> +        .num_parents = 3,
>>           .flags = CLK_SET_RATE_PARENT,
>>           .ops = &clk_rcg2_shared_ops,
>>       },
>>
> 


-- 
With best wishes
Dmitry
