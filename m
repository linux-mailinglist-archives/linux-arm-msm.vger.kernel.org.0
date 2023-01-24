Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA1E679507
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 11:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjAXKTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 05:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjAXKTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 05:19:32 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA755272
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 02:19:31 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id rl14so34319831ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NWRaKd8MaSuhdLqBXYVm4jaClMKGiFjYeMv/cdRLf40=;
        b=L+C+H6oXIaD+lmLLTahBxIinb1u6Z+GY/cHVO9T4IS99OCdgGPsF9JiW46Gxqh7+Ps
         C2MKj3PtsxfhQh6rlRXnpsWDetGAINFdPw7uELuuaFGLTwI9AO3v74B06akxvq94U28l
         vV1RjdO48TAtDA48YNkWpwY5z16yrUDQznZXYt/GjKkLlHqnK9pJLor2lbUYNckLCPRV
         hswt7itBeGkloNfgnfgkw5/Dz0XTdZpo8BGaJLwf3EzSoU8BhqHo3acQvj6+vUzqgox0
         KhR/iBthKKCuxA+RnDQxKwA9qNJPZcgZwxe9/ntVg+Ludawry0OBX2/UEOm26xruYERN
         iZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWRaKd8MaSuhdLqBXYVm4jaClMKGiFjYeMv/cdRLf40=;
        b=ngfCFnasxJ07NxMRjJpEa6evI5/qLVMf9Htf+H/vHTzaroBHu74WQzWuNBbfjDA1QH
         xjKGEBYNkuMy0SCLuSv1BJ+QUQunoorTKqUwRc3ge9Z5A0mUNNDCpBnuna8iEvio5lIN
         fZaycopnE0c/X2OPtqPjn9QPGwMsTPhUX5lVg/J47Aj/EbeWhDxY8joAvX1pV97C+rN/
         hNKvCkXWXK9KgWV7kDGzrkhqG6ApXTyrMg2IBom3VGB/AqJY1KOfYAQlIt8LQx5xq/qk
         77pmF5NvPuQ9GNkqlfWYgR5O1u0ytL+AOojl5Pg2k4Ugccy9Nmq4pv7a24gON32kIJQB
         CAJQ==
X-Gm-Message-State: AFqh2kriMcP/WeivrwxvgxmHUZ78xSnvUlkZIN1IwUqxMW3k0CnFXRYy
        7ppb0atjJD5WGipA4ajyjBVR4A==
X-Google-Smtp-Source: AMrXdXss0wHN3Fdh33W2mVe+fA7krvtB8Ij9JgFlhtX/RBzDUVMxZMBBzxYw158YL/304S26G21B3Q==
X-Received: by 2002:a17:907:1042:b0:7c1:5863:f8c4 with SMTP id oy2-20020a170907104200b007c15863f8c4mr28122612ejb.21.1674555569624;
        Tue, 24 Jan 2023 02:19:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709061e8a00b00852e0bbed1dsm701598ejj.17.2023.01.24.02.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 02:19:29 -0800 (PST)
Message-ID: <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
Date:   Tue, 24 Jan 2023 12:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        David Airlie <airlied@gmail.com>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 11:59, Marijn Suijten wrote:
> On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
>> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
>> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
>> planes). Correct corresponding SSPP declarations.
>>
>> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Cc: Jami Kettunen <jami.kettunen@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 0f3da480b066..ad0c55464154 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
>>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> 
> Drop the _CURSOR mask here?  And the double space....

Ack for the doublespace. By removing _CURSOR we would disallow using 
these planes as hw cursor planes. This would switch all compositors into 
sw cursor mode, thus damaging the performance.

> 
>> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
>> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> 
> Yes, msm8998_mdp defines both DMA2/3 and CURSOR0/1 clocks.  R-b after
> using DMA_MSM8998_MASK without the DPU_SSPP_CURSOR bit.
> 
> However, my downstream sources still define cursor SSPPs that are
> missing here (after all, there's clk-ctrl for these already), at xin ID
> 2 and 10 with addresses 0x3500 and 0x37000 downstream (-0x1000 here):
> 
> 	SSPP_BLK("sspp_?", SSPP_CURSOR0, 0x34000, DMA_CURSOR_SM8998_MASK,
> 		cursor sblk?, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR0),
> 	SSPP_BLK("sspp_?", SSPP_CURSOR1, 0x36000, DMA_CURSOR_SM8998_MASK,

I think this should not be the DMA_CURSOR_MSM8998_MASK, but don't bet on 
my words, I haven't check actual cursor plane capabilities.

> 		cursor sblk?, 10, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR1),
> 
> Or should you/I send that as a separate folloup patch?

Ideally one can add these two planes and then switch two mentioned DMA 
planes to plain DMA_MSM8998_MASK.

> 
> - Marijn
> 
>>   };
>>   
>>   static const struct dpu_sspp_cfg sdm845_sspp[] = {

-- 
With best wishes
Dmitry

