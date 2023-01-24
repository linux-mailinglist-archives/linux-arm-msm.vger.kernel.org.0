Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C71667950F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 11:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjAXKUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 05:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjAXKUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 05:20:15 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FB63E617
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 02:20:12 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so37697714ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZAw4Wd/yIjakYBu/HQ1aGBARqEQv7QS64hYIpsab74=;
        b=RRAonQSeen9UFZdm5y7pb0rYTtTt3nZK8xN6CkeoZ6A6OZaR3IneFLSnZbCbFX7QqL
         sVj5B7loHSTDXP/mogaqoosuy9fohaaEwY50EE8V9LpmAtS+0uIHpYH1mg9SqWd+RjBy
         5HHw3hfi36jAbPKHRTB4Hly1hxa7d5k0L/3owxU3TtlARdw1VzgX1ozjrCgzvFM0b+Cz
         rLjRG4pyEIX++vmxstRMsjFLLtF+U9PMFvyqweS3LOnY4wDJc2+/gPXCR6EtgkYCyg6K
         y6fjKC41kV9j53J52/We9M1oWPcoMc4VJN+XhuRf9xEDKETi2Hw4wVYlMGaUcLcg5hlA
         ZPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZAw4Wd/yIjakYBu/HQ1aGBARqEQv7QS64hYIpsab74=;
        b=upNWORdpw244Yi7I/b697F9oEBw8Z5DNw3KH+pvLQwr+AJjwHoI/SV1YJEntJZ0ucr
         XYhD35IltpSNbLxepXY7AkJCNHUP6NzH/tRkhssYe3hXA9bDQUA1zWh84Z6ML5l04DTY
         5fYxFiXERoAqUYhIEFqXuGg6UvWwjJRMVNrcLBWDwHKRLsFRwLsCqU+ZOKsHPHTl82PZ
         Z7n0ib++Js1jLAYZsqqtEL9+u6GkQ3Ym4Rqcc2Mdo/iteAXm8BffqzXXE7s1jnj5F/fQ
         gsc/j6qvETY46Hz4/Ab50tNidC2zmWX8mKoD4yfS0T9mE5Vn8W744jwT9mHQxojtiuPU
         IQnA==
X-Gm-Message-State: AFqh2krL/9fRV52BiQx7e3ZMqmJL6Wi7A6wlKl1Bh3lSepeB3p3XpgwD
        8ExkuMzeOR5Aq8NVKoW7Si8cgw==
X-Google-Smtp-Source: AMrXdXuN1UUFLI3cQ5HGZONf6xzIfHcBdoCW3QFSYVTY1/p1lEc/mqprKVme2OUnem84eOZKKrAkFQ==
X-Received: by 2002:a17:906:1798:b0:84d:43e4:3633 with SMTP id t24-20020a170906179800b0084d43e43633mr27252357eje.36.1674555610686;
        Tue, 24 Jan 2023 02:20:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id jr17-20020a170906515100b0084d4b8f5889sm696697ejc.102.2023.01.24.02.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 02:20:10 -0800 (PST)
Message-ID: <d4ae5354-ec53-c676-2b91-fc45cc425c68@linaro.org>
Date:   Tue, 24 Jan 2023 12:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP
 clocks
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
 <20230124101346.gwx4z4n6sem5r72t@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124101346.gwx4z4n6sem5r72t@SoMainline.org>
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

On 24/01/2023 12:13, Marijn Suijten wrote:
> On 2023-01-15 14:41:43, Dmitry Baryshkov wrote:
>> DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
>> SSPP blocks used for the cursor planes. This has lead to the confusion
>> at least for the MSM8998 platform. In preparation to supporting the
>> cursor SSPP blocks, use proper enum values to index DMA SSPP clock
>> controls.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> One question follows...
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>>   2 files changed, 34 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index ad0c55464154..b0f6e071fe4b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> <snip>
>> @@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> 
> Are these DMA pipes with CURSOR support, or how should I see this?  For
> MSM8998 I suggested to remove the _CURSOR bit since it has two dedicated
> cursor pipes (not yet represented in the catalog) but these SoCs don't
> seem to have those.
>

As I wrote earlier, this part just marks them to be used for HW cursor 
support.

-- 
With best wishes
Dmitry

