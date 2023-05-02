Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46856F4DF6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 01:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjEBX7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 19:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjEBX7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 19:59:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF95BE6A
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 16:59:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4edc63c82d1so5144982e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 16:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683071939; x=1685663939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6Nm1mbo6FhgRiBVP5uaXGfyIE0BDikVhGfcFGWbfYM=;
        b=p9j2YuyakukgtWlHuMJKsC2ZUZTY3LSZf0s3I0V3bObJa2QEnH940PPmkKc0jsKfUv
         RN9mvqQs4xNdVDmTrYV3pO9gPeEnSneRBCm/Kx8JSpdB1hsihbumObyLIf6egHA1lds6
         aHweFY03ISub2UMy61DaKCSbiVNaCN4aOG7fr9Q7V9KGuJf72mXD9xd+2AMfEfOsjJvY
         tKxbvVImHdvyaeJstGfQgJPAWW+i4MIYm2EpQkhEdAoHCcAaJRyCwOmiRJJwlr1QV82R
         J3fK3dROWoIVXeIKVgb/Pp1/KbKA8dx0nw2h685oM7lszquYnUUneHNNZrbM/6qpDUVM
         WcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683071939; x=1685663939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Nm1mbo6FhgRiBVP5uaXGfyIE0BDikVhGfcFGWbfYM=;
        b=WkLfbLnQMlNnpDCwiHbaB+m5BKX+5Pp6HaFwsyEDy8YBagNlRumPa+RKQXdH/DfSa6
         +2wRbKGs4POE7ecCDD+Lr5fOKaz8xEPc2sIhFmb7Q+tVBaZvSeccAdpcwzX4pDvWE8IJ
         FOAVtb38IghSfFe5c9OEs4iPgvHz3pjZaCYSXIaE6vss678htKL4WXS3LNtt1gp2Z36b
         yEasA7ANLYH+fmOEyJtGhydEqcQgdIRELXqvf6xnW01p1/TRCFAAE9XH7lwGSHwpYdqb
         i2nCFevxPCjtUI+yM3T5dTzW15dCOCoIfZZX4uW5khQ7pA1z+Y3wRurHXWg+IPZ1pD/X
         A8WA==
X-Gm-Message-State: AC+VfDxHWVbqIzsJcEUfYHufcOa/VKwVapBuhM0JxrPYL96JBgNd4uB9
        v9Odw0mF6E1Pu0wz5miOW1Bvow==
X-Google-Smtp-Source: ACHHUZ7rY7GDBKZZOm/v8tHEjWiPTvSl+wLJRLDgakYH05FXlsDAcaovAy4ZGt3GBuG8Kpc22Jsy0A==
X-Received: by 2002:ac2:4a75:0:b0:4ef:eeaa:e9b9 with SMTP id q21-20020ac24a75000000b004efeeaae9b9mr391585lfp.35.1683071939198;
        Tue, 02 May 2023 16:58:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g10-20020a19ee0a000000b004efee5841b9sm4618968lfb.290.2023.05.02.16.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 16:58:58 -0700 (PDT)
Message-ID: <72e531fe-1ee5-a850-4887-11e1835983f9@linaro.org>
Date:   Wed, 3 May 2023 02:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/7] drm/msm/dpu: call dpu_rm_get_intf() from
 dpu_encoder_get_intf()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-7-dmitry.baryshkov@linaro.org>
 <d4558099-541e-cc55-860a-fe21af3a8ca6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d4558099-541e-cc55-860a-fe21af3a8ca6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 02:57, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> There is little sense to get intf index just to call dpu_rm_get_intf()
>> on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 507ff3f88c67..b35e92c658ad 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1259,22 +1259,23 @@ static void 
>> dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>       mutex_unlock(&dpu_enc->enc_lock);
>>   }
>> -static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg 
>> *catalog,
>> +static struct dpu_hw_intf *dpu_encoder_get_intf(const struct 
>> dpu_mdss_cfg *catalog,
>> +        struct dpu_rm *dpu_rm,
>>           enum dpu_intf_type type, u32 controller_id)
>>   {
>>       int i = 0;
>>       if (type == INTF_WB)
>> -        return INTF_MAX;
>> +        return NULL;
>>       for (i = 0; i < catalog->intf_count; i++) {
>>           if (catalog->intf[i].type == type
>>               && catalog->intf[i].controller_id == controller_id) {
>> -            return catalog->intf[i].id;
>> +            return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>>           }
> 
> Why has the for loop been retained in this function but not for 
> writeback? is there any difference? Doesnt looks like there needs to be.

For writeback we always return controller_id (WB_2). For interfaces we 
have to map type+controller_id to the INTF instance.

> 
>>       }
>> -    return INTF_MAX;
>> +    return NULL;
>>   }
>>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>> @@ -2244,7 +2245,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>            * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
>>            */
>>           u32 controller_id = disp_info->h_tile_instance[i];
>> -        enum dpu_intf intf_idx;
>>           if (disp_info->num_of_h_tiles > 1) {
>>               if (i == 0)
>> @@ -2258,12 +2258,9 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>                   i, controller_id, phys_params.split_role);
>> -        intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>> -                                disp_info->intf_type,
>> -                                controller_id);
>> -
>> -        if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>> -            phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> intf_idx);
>> +        phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, 
>> &dpu_kms->rm,
>> +                               disp_info->intf_type,
>> +                               controller_id);
>>           if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>>               phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, 
>> controller_id);
>> @@ -2287,7 +2284,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>               DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>>               break;
>>           }
>> -
> unnecessary change?


ack, it sneaked in. I'll drop it for v2.

>>       }
>>       mutex_unlock(&dpu_enc->enc_lock);

-- 
With best wishes
Dmitry

