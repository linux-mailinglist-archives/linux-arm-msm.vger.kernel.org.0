Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80126E9350
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 13:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbjDTLsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 07:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbjDTLsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 07:48:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F1310C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 04:48:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4edcdfa8638so499623e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681991287; x=1684583287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
        b=j/jHkLE3rW45/Eb7oViVdeEuTCbgLb3dJ1DaMd4dkcG01aQyARQoL9vKLJR2MAqee7
         9/3JlhAnHnLuU5TPyvUqpriI5zwG5X73t7jJvMB6ItPvtgLqClrqmHcWiDU3Fgr68EOt
         Pz/XwjHx8Mrv4E8ouFFU0BffiAqbKJ59MdCI/Vr+RxyP+dGsBQ7JrUIZCBn2n97qQZH2
         TX7GTJ3swuBByfoww/DVAh3x+0SUqiWdBhIXQx+Vko5CGEVs8GQYU1Iu3Y9gLauHr4me
         MjKBtTJdHvDteIYw7vS1pTGCbALFrcQPRW84yAevZ+wNzQ4N+9FCDincpXVOfcjvOMwY
         BgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681991287; x=1684583287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
        b=lFoZzfJxZXpDzVeOjbKC1kR6l1YoYozT6O+5IK6d8rcKjOWaRJ0XWpLSWShn44pqSJ
         aqtHfTTW3r45BHInEx2zQG91Hr66HtrbGKJ7nv1sZ1zy4Td+IGmP+MwFSfOzU5eUnLF2
         BXbbJ5G606HEjBJJrZNoYDJMyVCuaunz1/itaDXa9Z4rIguvyvilQvtKS/1/nJrzFWTo
         +17bCSH3M0TwSI5BjYtmjILx9GgX+Vw1P2YsFlX9JhVT9YlNyVXO99O5O01LVIckVUme
         0KzG1I4O4eMo0dCiuXJmiUxcFMSZJPwXGUDrIdQYYWeu0JlBxZwMd1n0H5ZRxF5MotQD
         zBrQ==
X-Gm-Message-State: AAQBX9caSoQkhCs0dCzSaN9p9Ok1NIKM72Bw2ZjxHvNM7aHuFmM1dvVT
        aAWwD/6LEm0BS4TvYqBVTcm2Uw==
X-Google-Smtp-Source: AKy350bDBd5I0jzSrTgkcplYpxYdInqlBZJb94gB+M0ExOUSpGan2r6Fowa9JWmLRx3tG5jrkzMKMg==
X-Received: by 2002:a19:f80b:0:b0:4eb:2523:e929 with SMTP id a11-20020a19f80b000000b004eb2523e929mr375118lff.43.1681991287486;
        Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y21-20020ac24215000000b004ece331c830sm192447lfh.206.2023.04.20.04.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Message-ID: <a2addd26-e027-c5f5-ee40-e8e5be9d866c@linaro.org>
Date:   Thu, 20 Apr 2023 14:48:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to
 sdm845_dspp_blk
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2023 04:14, Konrad Dybcio wrote:
> SDM845 was the first SoC to include both PCC v4 and GC v1.8.
> We don't currently support any other blocks but the common config
> for these two can be reused for a large amount of SoCs.
> 
> Rename it to indicate the origin of that combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   9 files changed, 27 insertions(+), 27 deletions(-)

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

