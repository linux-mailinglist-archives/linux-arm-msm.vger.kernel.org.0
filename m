Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581356F2224
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 03:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347214AbjD2Blh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 21:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjD2Blf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 21:41:35 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9492D51
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:41:32 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-2f7a7f9667bso224624f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682732491; x=1685324491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyK4VBwu5TMqPPUtow8WZGcT3GMoUUkkYoxuh/U+jzQ=;
        b=NRQGvDlcHRJPhxeAYMYoH0aCKt8K3DR/wgvGtvEzELQOJcrM+IL7nlvStr1JhQSlb1
         3sxOKVy5zZ6cUQcv3oJXvCidyy6QMpFYyarTLrTBb1FppXPro3XXVQM4OMMe3SBXO3Xr
         f63RaHIf9FOOgSifb+fSeBRUr7z17ruOHGPc/EiX7P3QX4Tp1Eyy9XJuEIIFmRAl67OR
         eKy7sY/HIR2npR4M4kqi2RrnD1NdjmNfGhVjLXaers1+G/pQVW+fHk8VlgaSoshbCVS/
         3K2b/m6ogwM6zzlBna1Puc3sLvzjynJy+lcXPrHhsxLhZzfgpiYj+Hj0QIKIpqgcaXbF
         7/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682732491; x=1685324491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyK4VBwu5TMqPPUtow8WZGcT3GMoUUkkYoxuh/U+jzQ=;
        b=UNTkZeMiAZIpGprn24jwIzF4df17gJAUhFXC7SV8WAtrrn5W+6lTXt4+cLw4Av6Num
         t4iJqqFPUZOsdHqMo6s1y0/kyFtTSecqkoA5gvAo3PK2PQmAJrENHshCYuwdRPTGOBaG
         rfvsYZ103vVU1RdNxBu9+QsEMvw4DIiDdfX4213Ml23N2/sPq90vyzO6JGhnn5d0Jtsh
         eIzUgEwvmDDf2j55YIoJDclN1Luqkjf4ejV+cGxx6yyXtjloVOTFlWqBCFXOrM+YTk6o
         vsYuESRwialKE/I0SSagoHW6ycY65itL7Q/eDqym9OAt0hpLGysiurnjuAkUxNbQ9+Fa
         I5tw==
X-Gm-Message-State: AC+VfDxJC+VBmESSrIlnO+uXT5sDcNms3mnMnCEhYwbev8AFLVex+kr4
        zazk/wIju/9fBdK2TYTXtqizlQ==
X-Google-Smtp-Source: ACHHUZ5hMzwXEj/paH5qOsOOh1AeDfjE/FiUyUgPJtPc3Pe1Gzl/vYg738/nsARBv+M0TIKAmXYxag==
X-Received: by 2002:adf:fe48:0:b0:2f0:58a:db82 with SMTP id m8-20020adffe48000000b002f0058adb82mr4835610wrs.36.1682732491348;
        Fri, 28 Apr 2023 18:41:31 -0700 (PDT)
Received: from [10.6.148.94] ([212.140.138.218])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c219a00b003f180d5b145sm25739096wme.40.2023.04.28.18.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 18:41:30 -0700 (PDT)
Message-ID: <772a63ca-9b88-3c98-e769-7e614968c127@linaro.org>
Date:   Sat, 29 Apr 2023 04:41:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature PP_BLK
 and PP_BLK_TE
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-6-git-send-email-quic_khsieh@quicinc.com>
 <ad672cff-3355-97af-24b4-3626efebc284@linaro.org>
 <e9f493fa-77f2-0a5b-5e09-bd1baae8a8d0@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e9f493fa-77f2-0a5b-5e09-bd1baae8a8d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2023 04:08, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 5:45 PM, Dmitry Baryshkov wrote:
>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>> Legacy DPU requires PP hardware block involved into setting up DSC
>>
>> Nit: to be envolved
>>
>>> data path. This patch add DDPU_PINGPONG_DSC feature bit to both
>>
>> adds
>>
>>> PP_BLK and PP_BLK_TE so that both dpu_hw_pp_setup_dsc() and
>>> dpu_hw_pp_dsc_enable() will be executed during DSC path setup.
>>
>> Would it be easier to add PP_BLK_NO_DSC instead and make DSC enabled 
>> by default for PP_BLK / PP_BLK_TE?
>>
> 
> No because for some chipsets like qcm2290, it has a ping pong block but 
> no DSC.

And so it will use PP_BLK_NO_DSC (like msm8998 for PP_2/_3). But this 
might be not the optimal solution. Let's check all possible cases:

- PP (or PP_TE?) with no DSC support,
- PP/PP_TE tightly bound to the particular DSC instance, should be 
allocated together,
- PP/PP_TE which can use any DSC block.
- all PP_DITHER probably support any DSC?

Is this list correct? If so, we'd need to be able to specify the DSC id 
in the PP block description.

> 
>>>
>>> Reported-by : Marijn Suijten <marijn.suijten@somainline.org>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12 +++++-----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26 
>>> ++++++++++------------
>>>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 
>>> ++++++++++----------
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26 
>>> ++++++++++------------
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>>>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 ++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  9 +++++---
>>>   11 files changed, 62 insertions(+), 61 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 17f821c..b7cd746 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>> BIT(DPU_PINGPONG_DSC), 0,
>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>> BIT(DPU_PINGPONG_DSC), 0,
>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> index ceca741..8888bd9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 
>>> 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 
>>> 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> index 42b0e58..3a7dffa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> @@ -128,24 +128,22 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>> -            -1),
>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>> -            -1),
>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>>   };
>>>   static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> index 5bb9882..e766a2d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> @@ -116,23 +116,23 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>               -1),
>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>               -1),
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> index ed130582..137b151 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> @@ -129,24 +129,22 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sm8250_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_0,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_1,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>> -            -1),
>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, 
>>> sdm845_pp_sblk,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>> -            -1),
>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, BIT(DPU_PINGPONG_DSC), 
>>> MERGE_3D_2,
>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>>   };
>>>   static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> index a46b117..e5631a2 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> @@ -80,8 +80,8 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sc7180_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk, -1, 
>>> -1),
>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk, -1, 
>>> -1),
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk, 
>>> -1, -1),
>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, 0, sdm845_pp_sblk, 
>>> -1, -1),
>>>   };
>>>   static const struct dpu_intf_cfg sc7180_intf[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> index 988d820..7b4ad0f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> @@ -60,7 +60,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg sm6115_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk,
>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> index c9003dc..20d4d14 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> @@ -57,7 +57,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>>>   };
>>>   static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk,
>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 91bfc8a..83c0cd9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -501,21 +501,21 @@ static const struct dpu_pingpong_sub_blks 
>>> sc7280_pp_sblk = {
>>>       .intr_done = _done, \
>>>       .intr_rdptr = _rdptr, \
>>>       }
>>> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>> +#define PP_BLK_TE(_name, _id, _base, _features, _merge_3d, _sblk, 
>>> _done, _rdptr) \
>>>       {\
>>>       .name = _name, .id = _id, \
>>>       .base = _base, .len = 0xd4, \
>>> -    .features = PINGPONG_SDM845_SPLIT_MASK, \
>>> +    .features = PINGPONG_SDM845_SPLIT_MASK | _features, \
>>>       .merge_3d = _merge_3d, \
>>>       .sblk = &_sblk, \
>>>       .intr_done = _done, \
>>>       .intr_rdptr = _rdptr, \
>>>       }
>>> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, 
>>> _done, _rdptr) \
>>>       {\
>>>       .name = _name, .id = _id, \
>>>       .base = _base, .len = 0xd4, \
>>> -    .features = PINGPONG_SDM845_MASK, \
>>> +    .features = PINGPONG_SDM845_MASK | _features, \
>>>       .merge_3d = _merge_3d, \
>>>       .sblk = &_sblk, \
>>>       .intr_done = _done, \
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index fc87db1..6b49171 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -144,6 +144,7 @@ enum {
>>>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>>>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split 
>>> fifo
>>>    * @DPU_PINGPONG_DITHER,    Dither blocks
>>> + * @DPU_PINGPONG_DSC,        PP block binding to DSC
>>>    * @DPU_PINGPONG_MAX
>>>    */
>>>   enum {
>>> @@ -152,6 +153,7 @@ enum {
>>>       DPU_PINGPONG_SPLIT,
>>>       DPU_PINGPONG_SLAVE,
>>>       DPU_PINGPONG_DITHER,
>>> +    DPU_PINGPONG_DSC,
>>>       DPU_PINGPONG_MAX
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> index 3822e06..f255a04 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct 
>>> dpu_hw_pingpong *c,
>>>       c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>>>       c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>>>       c->ops.get_line_count = dpu_hw_pp_get_line_count;
>>> -    c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>> -    c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>> -    c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>> +
>>> +    if (features & BIT(DPU_PINGPONG_DSC)) {
>>> +        c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>> +        c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>> +        c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>> +    }
>>>       if (test_bit(DPU_PINGPONG_DITHER, &features))
>>>           c->ops.setup_dither = dpu_hw_pp_setup_dither;
>>

-- 
With best wishes
Dmitry

