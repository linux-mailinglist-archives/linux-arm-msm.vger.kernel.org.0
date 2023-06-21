Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9A4738693
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjFUOQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 10:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbjFUOPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 10:15:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D932100
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:15:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f875b267d9so4376639e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687356928; x=1689948928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO0wRiGvwvFFxc6ddvmc2hEJ6Af99eLgH/iA0sVZGJI=;
        b=WwFu6VlAr2SlRovLrSh6EFSE2IYpH6tY701z5wzbbVvoP0YIoZX5Ntj4y4tDHau4ld
         np4r2NKmcObhZV2pf6z2ifzK53z1TUtUSqBGou0hZiXzExjgQT55JBuIOhQpLTIgVrHq
         W1fLy6Mjrv5xL4aO4eWXe4ElQeOonxTnx7d00Y+cNL9V0e/6MAUeXIHjHAmXWuHOSA/h
         HR17SfTbhE5a9eqjkP15ZWgw7jIaRR/HD1syWw7WaoD2fvuHwxZStwuwuKkDED9I7pf9
         kOuV2w6ugcNN9+nX4Gdr76FdocrNEK1i6gJ1dn+4+mO3xc7ZJggHMroy9C3JZhmsWEca
         I/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356928; x=1689948928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO0wRiGvwvFFxc6ddvmc2hEJ6Af99eLgH/iA0sVZGJI=;
        b=O8O6BR5UJCkjys8b99DIDDM2nfTl+lzyKi/xsNMlC63NvRiGc5T5bfV+aSR2i8cmp/
         LrzG1Bwboz+FPzxdXpB7KEjt6ZUWj1GGXG9+k5DQeZN9FuoGdn1pshddYkj/7+YvH/Bs
         dnxcrmzhndbGaCWwyOB18gaoH5c8VmAaHxr3KP7E1c/slM9pkoTFAX/uFwp70uIXztwh
         VRh4E7eUYI3+UykH3Qjs46vhWLqHuSDGz/L91WClpBEBrYZOOgFb2BA118TeDMo0pzvo
         oVwGtVihdLvPlPpDGLnnLK2lBdV6fT6Va4NCdolYgPun+uftUfjkuIfIagmcv+Zga1Gx
         xDdg==
X-Gm-Message-State: AC+VfDzBdjWcGiV/UFr6/i/gTAxcuYKMapi/JlJQafFRssLSmAz3riGo
        iKMVtiv1/rL575GS29YPuDTHqQ==
X-Google-Smtp-Source: ACHHUZ6mkH/Gyz2cXYdyzimv0/bg1Z67dEVNVGZbDw89bpZv7w/IKri2Jz1t1xJik3NTF2w8OJd1Ag==
X-Received: by 2002:a19:3807:0:b0:4f7:6775:2a66 with SMTP id f7-20020a193807000000b004f767752a66mr8453628lfa.53.1687356927422;
        Wed, 21 Jun 2023 07:15:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u27-20020ac248bb000000b004f64fb058f7sm795002lfg.225.2023.06.21.07.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 07:15:26 -0700 (PDT)
Message-ID: <372f776d-6d98-5438-2a13-0aeac4182a31@linaro.org>
Date:   Wed, 21 Jun 2023 17:15:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
 <20230613234113.tnzjgfbyhj5zokgl@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230613234113.tnzjgfbyhj5zokgl@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 02:41, Bjorn Andersson wrote:
> On Sat, May 13, 2023 at 12:17:25AM +0300, Dmitry Baryshkov wrote:
>> The gcc and lcc devices have been switched to the DT-defined cxo_board
>> clock. Now we can drop the manually defined cxo clock.
>>
> 
> Perhaps I'm reading this incorrectly, but don't you introduce that clock
> in DT in the next commit? It would be nice to allow for at least some
> overlap between existing dtb and the new scheme.

No, this clock existed in DT for some time, I'm just removing the 
necessity for an intermediate clock in the gcc driver.

> 
> Regards,
> Bjorn
> 
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
>>   1 file changed, 17 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
>> index 458c18b639db..64d4f508e43a 100644
>> --- a/drivers/clk/qcom/gcc-mdm9615.c
>> +++ b/drivers/clk/qcom/gcc-mdm9615.c
>> @@ -26,17 +26,6 @@
>>   #include "clk-branch.h"
>>   #include "reset.h"
>>   
>> -static struct clk_fixed_factor cxo = {
>> -	.mult = 1,
>> -	.div = 1,
>> -	.hw.init = &(struct clk_init_data){
>> -		.name = "cxo",
>> -		.parent_names = (const char *[]){ "cxo_board" },
>> -		.num_parents = 1,
>> -		.ops = &clk_fixed_factor_ops,
>> -	},
>> -};
>> -
>>   enum {
>>   	DT_CXO,
>>   	DT_PLL4,
>> @@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_hw *gcc_mdm9615_hws[] = {
>> -	&cxo.hw,
>> -};
>> -
>>   static struct clk_regmap *gcc_mdm9615_clks[] = {
>>   	[PLL0] = &pll0.clkr,
>>   	[PLL0_VOTE] = &pll0_vote,
>> @@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
>>   	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
>>   	.resets = gcc_mdm9615_resets,
>>   	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
>> -	.clk_hws = gcc_mdm9615_hws,
>> -	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
>>   };
>>   
>>   static const struct of_device_id gcc_mdm9615_match_table[] = {
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

