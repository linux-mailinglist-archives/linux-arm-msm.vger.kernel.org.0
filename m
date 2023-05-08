Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5247A6FADB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 13:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbjEHLhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 07:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbjEHLhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 07:37:17 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE4F21570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 04:36:52 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ac87e7806aso36403541fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 04:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683545776; x=1686137776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwYbaMN3dCdCT8K/nKUJpbtKfxl8i/KYmyHshaMqV2w=;
        b=ZGpoUwM86kB2XE28iNttwtRQagoWcy7gceng/kGUVN/pZ1IfBCJWvktlPIyGCLU107
         eDsi8zBKrs7HRJ6+X7DlMimjc8OzYDuRbPBkZEVfLn1HjSV7ajOYAkx1YYGtRnwmd0RH
         n8wHUo6qIPfZT4udE+DFP2KlKnwCvqi0SwqaHhyOpJGcpJgZHiJ1RQl6WS1zOIEPEVec
         nFOQlX9ApBOPw2RjIP5QAvqzfxO/8IyxSYxuthmwMEAENZGv7bgGgiOdBiNu67TnyO4d
         pnQ2tDVeAcUzupQLzhLLkUyYWnb/9HeLqftEJ/QGuqBb3OUyz2pJRaHNY9pi0IgUcsgv
         gzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545776; x=1686137776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwYbaMN3dCdCT8K/nKUJpbtKfxl8i/KYmyHshaMqV2w=;
        b=Ful8vYyQRGxRW4n9gQulAgYGNJMIXCFbSIHasXDSbF7UfO+H5iwc1QEVsycHf+N4MX
         gGpmlgTvvvKx14w+E9eZjzq/nrYg9na5tzTk1uITtPVlLb8ox1L5xbgk47y2Gmv9oOF4
         J0tLrZPUyV7QwzDAd37ksgYP9yxc5s2orJExrmklqw+l+e42c8lBGmaLUPL7s7tSo9s1
         AQ3/BNiJ4BgqNkX/hmK2AS5T0cELxk172VMVvL8TcYaN3+YHDJd65ZmfkrNIs+X/tGiv
         exoviWSE+gKtLKtXdEPr6pp95jS7KmY/9RWArd9L09U8DQHxyDbcGZhiZVW/7ul8GHb0
         5kIQ==
X-Gm-Message-State: AC+VfDwES1FJEvjkVmN7LKaDs5xeN6zWHU5kI31p4cABSiesqvdOu53U
        uZZkzO7xKaqNGP7G6p2MIk3uMBfS8mJLUzRQCkI=
X-Google-Smtp-Source: ACHHUZ58fOkHPkkn/MpT7Bv4OCSJYfOgdpL4SsexdHmSaR7unLAkYkPId4VQB/G3VlXkMoswbeKieA==
X-Received: by 2002:a2e:b6c6:0:b0:2ab:4399:708b with SMTP id m6-20020a2eb6c6000000b002ab4399708bmr2666246ljo.40.1683545776425;
        Mon, 08 May 2023 04:36:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j2-20020a2e8002000000b002a798d12cdbsm1142660ljg.116.2023.05.08.04.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:36:15 -0700 (PDT)
Message-ID: <2921aee8-520d-080d-4ecb-7438fff4e0f2@linaro.org>
Date:   Mon, 8 May 2023 14:36:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <e1ee4334-ee99-2495-89b6-6a67f4130747@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e1ee4334-ee99-2495-89b6-6a67f4130747@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 11:27, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 19:53, Dmitry Baryshkov wrote:
>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
>> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
>> flags to PWRSTS_OFF_ON.
>>
>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> This is a stopgap solution, not exactly a fix, all signs on Heaven and
> Earth say that 8974 should support retention on this GDSC!
> 
> *although*
> 
> pre-v2.2 chips don't

Mine is apq8074 v2.2, if I'm not mistaken.

> 
> Konrad
>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>> index aa29c79fcd55..277ef0065aae 100644
>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>>   	.pd = {
>>   		.name = "mdss",
>>   	},
>> -	.pwrsts = PWRSTS_RET_ON,
>> +	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>>   static struct gdsc camss_jpeg_gdsc = {

-- 
With best wishes
Dmitry

