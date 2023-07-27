Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8A0765D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 22:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjG0UQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 16:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjG0UQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 16:16:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9211FEC
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 13:16:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so187724266b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690488985; x=1691093785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2T375Ssx+UEfU7GbH72fivtcmNW7nMylQw2olYslzk=;
        b=XVY0/1dqONL61WTn5WB9qU1CRZEnFzUB+rvr19NPh6h8up2Wt+QQFHUKJUoQITvBgm
         x/Tk6rGqniO+NbBcETzCGRQhUz9c7AWvDvcOUEQn6sZSNtkU4OphVi6jhbj7gzUODjgq
         BfWNz3giP2IaQqFjEsN+qqQjj84CXvamN7v7Z9uKbZDJdvabjdppVTn9x/DkqWq5TWUs
         TYKAorlvYXeLUXt6NXpviP1cqi6kgztrIh+cTll40IHNP+/cDxtNuRa+FiITxEKjwDOD
         W3lWm5kfnjwTxO2dLGiNF8wiGxZxOBOmJJMKtedGJX1HAjTNS9FzFOo2lp6lKUacsWg3
         Eh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690488985; x=1691093785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2T375Ssx+UEfU7GbH72fivtcmNW7nMylQw2olYslzk=;
        b=beFwqep1P/SRPJFGtf7bVYJ3R5PLxF0NHLawx6uM4xqTyLhRIn2AWrKqDvpGvuvzaq
         ue27a2KgE5T1sCFUCrXtepo1HNmkH98Nms+b6A/EOIHfQAg1QK2QlA9Wy6p7U+hkSUZo
         NI0OSa4IRWtScXNjRuNEm7iZCota1Mk2FBM+HB7YXwSfBRKKfQo8ongJIaOCElKrq+Ip
         yJ2FIhFN3JyDmNYxcJ3j3K7aGwsnEw0Tx5ifO9f8moPhBxA5c2qSk7p5ZdqT8/Qo7OnM
         PSDQuryJ7f6WdgcwfgZ0iGrC5OwGBKqpcLl7kj9PxzD/n9kxyjkMeBISHzKnytcvkJNc
         jR4g==
X-Gm-Message-State: ABy/qLYKi/wfsh385GmQZYfn37h8feuHnad7IAFLoin+MMseoRbquBD+
        gzgRlCPnTN+PNnEWHwHI0vj0mA==
X-Google-Smtp-Source: APBJJlFNRomPSTSGEc6en6XEeaeO7E4EobAWgCrBWDpKWtt2HOsaUmfP2btsTpm22qaYtACEi4+SAA==
X-Received: by 2002:a17:906:314e:b0:965:6075:d100 with SMTP id e14-20020a170906314e00b009656075d100mr209012eje.39.1690488984566;
        Thu, 27 Jul 2023 13:16:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id mb5-20020a170906eb0500b0096f6a131b9fsm1155284ejb.23.2023.07.27.13.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 13:16:24 -0700 (PDT)
Message-ID: <2a38d144-3a2d-ee61-1554-ae94766b1d36@linaro.org>
Date:   Thu, 27 Jul 2023 23:16:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
 <bndyttm2ytf7bz2cdok4ewnd7vpv75ud4eqialpleihjs6ahr2@6ehcv3zjpkky>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bndyttm2ytf7bz2cdok4ewnd7vpv75ud4eqialpleihjs6ahr2@6ehcv3zjpkky>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 23:14, Marijn Suijten wrote:
> On 2023-07-27 19:21:02, Dmitry Baryshkov wrote:
>> Replace the only user of the DPU_INTF_TE feature flag with the direct
>> DPU version comparison.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
>>   3 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 9589fe719452..60d4dd88725e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>   	phys_enc->intf_mode = INTF_MODE_CMD;
>>   	cmd_enc->stream_sel = 0;
>>   
>> -	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
>> -					 &phys_enc->hw_intf->cap->features);
>> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>> +		phys_enc->has_intf_te = true;
> 
> We could also check if the INTF block has the callbacks (which it based
> on the presence of the interrupt line in the catalog instead), but then
> I think we might loose some extra validation which you tidied up in a
> later patch in this series?

Almost. The logic was the following: we should be using INTF for DPU >= 
5.0. And if we have DPU >= 5.0 and no callbacks, it's an error.

> 
>>   
>>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>>   	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index c19dc70d4456..17426f0f981e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -100,7 +100,6 @@
>>   
>>   #define INTF_SC7180_MASK \
>>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>> -	 BIT(DPU_INTF_TE) | \
>>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>>   	 BIT(DPU_DATA_HCTL_EN))
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index a6f8eee58b92..69c9099cf5a6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -175,7 +175,6 @@ enum {
>>    * INTF sub-blocks
>>    * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
>>    *                                  pixel data arrives to this INTF
>> - * @DPU_INTF_TE                     INTF block has TE configuration support
>>    * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>>    *                                  than video timing
>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>> @@ -183,7 +182,6 @@ enum {
>>    */
>>   enum {
>>   	DPU_INTF_INPUT_CTRL = 0x1,
>> -	DPU_INTF_TE,
>>   	DPU_DATA_HCTL_EN,
>>   	DPU_INTF_STATUS_SUPPORTED,
>>   	DPU_INTF_MAX
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

