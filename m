Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AF36695D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 12:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241136AbjAMLoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 06:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241679AbjAMLoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 06:44:19 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E24869C3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 03:35:16 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f34so32695914lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 03:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iapGRaVZJCJhixJmVEyuyZPoh1zMlniKZSdec3xz9/s=;
        b=gzuRt+XXCGY+pseGlNd8jzfI0vyS1DiOWhXp42uUmVYV9hVHCcVWWCKiJPPT5yineG
         kWtBfnIkHQ6Ud3vmRf5rmNCqviBMODil+TlyOSjQjXKr+j5EBcKrEDbmceG+MMww7UOb
         PMnN4IxZYd+04iY/L+T1fU8iLgThf6wa+cdwrrzv63Leowz+PLptytw2ZKUHbbmWBLoQ
         t9oX6qWTXDE2CHQ18LIBEX9W1GCGm1n/EhMnw1HYhg9YJHFgptLNbhIVjHIuMhB/08TA
         gWdEdhSO6eDNPzgoSEaJrEpFWI63cP0LVJgkHE4SNEGS9C2Q9uUPITcRC1tLngoD8qiu
         veXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iapGRaVZJCJhixJmVEyuyZPoh1zMlniKZSdec3xz9/s=;
        b=gS1Aua4KIIIsCjE9mgyBcFPTbaQM1pmoVc7TLLUVNacvTju1bubCOn315vMpFzzt3h
         XF8cdwlVp6rWFtKF+5RHrGCdRsjACOz7vN1Xh2VUtZxLBPuJK2jp1ESePt2lOkMwx2F4
         WLbExtp8dpodOYg2I5DjRfrjBDrVWamdTA9ihyA7avURQ/WOiWpDpKP0E2/YS5tC3Iqs
         KboC7dFKretkou8MmQroxJ3h/UEfTN8q2vofogC4aze71w2i9vQbLJDKuoLQ/ZqiyEHR
         IhiAzkZ2T4HCRxRfsxRNREZohTJj2WoRQCoBUIBNhYQa3Wkziw5D4ZAxTNvZsfROtrwI
         e+VA==
X-Gm-Message-State: AFqh2kpsPfVDx093IVyeqavbSILUZB5zKPzmkWdhw0Hj+5v72mhsy7i6
        tZwUIUlQ0JE4gw5voS7eldcXaw==
X-Google-Smtp-Source: AMrXdXtQ9D+5uTSbrFcqZzXxSXL0fie2kl2XAydJ3YJvlFna/70bK4USgVvrvOfMPDcWOU9myMUMHA==
X-Received: by 2002:a05:6512:a83:b0:4cc:a108:842b with SMTP id m3-20020a0565120a8300b004cca108842bmr2215979lfu.41.1673609710462;
        Fri, 13 Jan 2023 03:35:10 -0800 (PST)
Received: from [192.168.2.31] ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id v15-20020a056512348f00b004abc977ad7fsm3800668lfr.294.2023.01.13.03.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:35:10 -0800 (PST)
Message-ID: <66296817-669f-b3f9-146e-48d5808e124e@linaro.org>
Date:   Fri, 13 Jan 2023 13:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 11/13] clk: qcom: cpu-8996: fix PLL clock ops
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
 <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 18:10, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
>> better.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I *think* SUPPORTS_DYNAMIC_UPDATE should also be kicked from
> non-alt PLLs.. Otherwise we might have been kicking ourselves
> in the face all along, changing the frequency of a running
> PLL that doesn't support it if we were using the main PLL
> and not the altPLL/ACD..
> 
> Downstream sets it only for clk_ops_alpha_pll_hwfsm which is
> used on alt PLLs only
> 
> This change seems sound, as Huayra supports dynamic update
> even without setting any flags.

I don't know where Huayra came from. Downstream uses plain hwfsm pll. 
Huayra uses different alpha register settings.

> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 1c00eb629b61..b53cddc4bca3 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
>>   		.name = "pwrcl_pll",
>>   		.parent_data = pll_parent,
>>   		.num_parents = ARRAY_SIZE(pll_parent),
>> -		.ops = &clk_alpha_pll_huayra_ops,
>> +		.ops = &clk_alpha_pll_hwfsm_ops,
>>   	},
>>   };
>>   
>> @@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
>>   		.name = "perfcl_pll",
>>   		.parent_data = pll_parent,
>>   		.num_parents = ARRAY_SIZE(pll_parent),
>> -		.ops = &clk_alpha_pll_huayra_ops,
>> +		.ops = &clk_alpha_pll_hwfsm_ops,
>>   	},
>>   };
>>   

-- 
With best wishes
Dmitry

