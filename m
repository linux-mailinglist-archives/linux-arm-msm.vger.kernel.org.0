Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0411644F7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiLFXTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiLFXTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:19:03 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BE92A419
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:18:59 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id f20so5805846lja.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuf0EjUhRjplBTwFsKQ3xCYaGpbzfMVTferzr5ryCGA=;
        b=VfpmrSK7ToWDW77AEhfzzLM3v97h0qH9EDcUrJ/OhMKLU7BPZHwB49NPsKcn6UzaoK
         vyMsKCAF6B2GES02GyNFeTD6gojFg2p5EQCdL9AuvwUAhpg+ed67G3FYIIOka8Ix5JG7
         5RfiGMTjQJucuqmPOCgnIJS1v1G1MboLLX3CwT2c+GVviFWdFnBwf1orGbTfZiCn8Zc/
         00RJdqXF+DBjHk5JGVyWXUESejOsJYxfiSfewvddQfxegsQmWt24p8obw/BmCbEPejj9
         2X++dCO4Rm/VeJ9JOj4n9KzsUbFwLJH583UyZmkqrLqjRSiEvdBSktELQXO3/mutQ2R+
         e7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuf0EjUhRjplBTwFsKQ3xCYaGpbzfMVTferzr5ryCGA=;
        b=SBMD1BYQgvCs19ASr1gQCA/orjUEt9d7223+3kChZSUgr5/ZCypgojV7EP44hjB7L6
         LKPAheq5YAQA0nePaDTIP8I2Qe9h//yy05i0Grjsvyl1G+6NpA92j2XJDYLGTQx6dCmn
         XbNsVdybNF8q6CY9WbBs16Sujsnez9ljwY7wb9/NqI0+5zG12b5jg1j2kSImcOJbCTQl
         r9io6QwfJhl6r/UARZn/mGGTizkdjak4+GclWa7bEAMVSUNrQwk7mfbxqN9QQTr4OQ5x
         iBZ5dQ5DK1I1byOwzO2E6HW0763zJzbM6HSNyJd6VBEqaYMnNDh7yQL4bvPTUvKNnN4T
         nl2g==
X-Gm-Message-State: ANoB5pn6vlGYle41enX98S+J/ru/Va+IgalvMW03amz0knZ/LtawILrj
        zK8QNIp6AZ+LvBVeLgysGN9RFQ==
X-Google-Smtp-Source: AA0mqf4483D/L/Zi3VPi9t5YrKjikrtaD4YsFl2h57mLM2T+dYplpcxFQTni4vLiPX8dfYp2spyKSQ==
X-Received: by 2002:a05:651c:153:b0:279:bbff:a928 with SMTP id c19-20020a05651c015300b00279bbffa928mr9602929ljd.415.1670368737559;
        Tue, 06 Dec 2022 15:18:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e13-20020ac24e0d000000b004946b549a19sm2641572lfr.45.2022.12.06.15.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:18:57 -0800 (PST)
Message-ID: <8504aa50-9378-6a9a-9d39-71befa620f20@linaro.org>
Date:   Wed, 7 Dec 2022 01:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
 <e18ef65c-c134-305f-4b47-8004bee12fb0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e18ef65c-c134-305f-4b47-8004bee12fb0@linaro.org>
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

On 05/12/2022 19:04, Alex Elder wrote:
> On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
>> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
>>
>> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'm not going to comment on the "Fixes" tag on this or any of the
> later patches in this series.
> 
> Shouldn't this line be removed too?
> 
> DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
>                     QCOM_SMD_RPM_MEM_CLK, 2);

Nice catch, I'll drop it.

> 
>                      -Alex
> 

-- 
With best wishes
Dmitry

