Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C4770B0FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 23:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjEUVvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 17:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjEUVvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 17:51:36 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A43DDB
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:51:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af2e908163so17345711fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684705893; x=1687297893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdcfr+Mqe+nejGnID0ER1VhX+tnCrYLDf1fHXZd1m5U=;
        b=h0YmQE4DZlcAoSXrJx+qa03mKVEVBFzc41z3zopqefnykjW46h18ji9/2nd+1yRHaP
         asANOLz5I72uQvPxHiKNRIjduLepWevMK5vqzXWrz8wx5picu5+GmDMFQnIFMq5AqfgP
         S5m7avBpdKUSWhFwktBj6q7KvNNNHbfDUgkwEvUl20qsfhpJLhwj4GW6bEwh/h3FahrX
         OnC222uKGPUp6B6mPBhcGc/hcmHKZhBmSEOQJWCHhFl1xyOzAtWR62T1J+ummyviEB35
         fyJxRfb2dIKuQhUmy7xmVKmNnZY677DFJl1x3Hc1Vp+igkgNUMXnDrtwlXhD5I6VDmxq
         t8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684705893; x=1687297893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdcfr+Mqe+nejGnID0ER1VhX+tnCrYLDf1fHXZd1m5U=;
        b=PYWkHUopZpSQdHeaf5yf4J5QTwoulUH3ivgFBwm3SSd61WfImDCyVQM3e1cAuNKl9c
         kABnk/O7MAV+YxN6vWPmDo7O/GMmLz1hzMZEYWJ6QXXzkji0ISE+xuYjy/lBP9FNkc95
         pRei0/YH+8jpruDLXCsukiQ0CSUhxBjdAI1UH639g+01oF6+KP7Zwz4yC20z3jwPrl24
         R+OYGtJ7dSCdKRnELO25+tvvyKRzSI85uO76+c/M7P5kPXW0riqnqD2jXF15rmhFhn3o
         ZdAimpwnWlgRbUOwXxcT0+wzui9m/daZY8EDJkKkqKSGOVMhPn6R2a2s5C0D9bhb3Z8b
         hrVA==
X-Gm-Message-State: AC+VfDxH2paTfgI4ljKsOWYXAWPHVkCfNAf4e9t/kn6M0D6OrIdHYLRX
        GTjkiw+zUVl0b4c8lw5HbjjSYg==
X-Google-Smtp-Source: ACHHUZ5KbqwqTIOY5qFN3b7VMVAXJqTU1RHjkNFgfuy0TNIJ999sF7RpjYR5HKC07/5BpEiloXsagg==
X-Received: by 2002:a2e:3213:0:b0:2a9:f114:f168 with SMTP id y19-20020a2e3213000000b002a9f114f168mr3093590ljy.46.1684705893285;
        Sun, 21 May 2023 14:51:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o3-20020a2eb443000000b002aeeda05382sm858204ljm.29.2023.05.21.14.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 14:51:32 -0700 (PDT)
Message-ID: <25774b84-701a-5ffa-17ed-e498b594a866@linaro.org>
Date:   Mon, 22 May 2023 00:51:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS driver
Content-Language: en-GB
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 00:50, Steev Klimaszewski wrote:
> Hi Dmitry
> 
> On Sun, May 21, 2023 at 12:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Both DPU and MDSS programming requires knowledge of some of UBWC
>> parameters. This results in duplication of UBWC data between MDSS and
>> DPU drivers. To remove such duplication and make the driver more
>> error-prone, export respective configuration from the MDSS driver and
>> make DPU use it, instead of bundling a copy of such data.
>>
> 
> Surely you mean less error prone?

Yes, of course!

> 
>> Dmitry Baryshkov (6):
>>    drm/msm/mdss: correct UBWC programming for SM8550
>>    drm/msm/mdss: rename ubwc_version to ubwc_enc_version
>>    drm/msm/mdss: export UBWC data
>>    drm/msm/mdss: populate missing data
>>    drm/msm/dpu: use MDSS data for programming SSPP
>>    drm/msm/dpu: drop UBWC configuration
>>
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
>>   drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
>>   drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
>>   22 files changed, 122 insertions(+), 139 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
>>
>> --
>> 2.39.2
>>

-- 
With best wishes
Dmitry

