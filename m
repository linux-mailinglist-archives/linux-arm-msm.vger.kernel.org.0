Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163DF6F4DE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 01:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjEBXyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 19:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEBXyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 19:54:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60321704
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 16:54:19 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so5130861e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683071658; x=1685663658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5t+YkOkDpznQp4uoL/9fUc9/dIQJ4G85gG1Hxhyav9w=;
        b=SvTiJQiosQNAY+ZQ5IN7hz3fY9aqBpU45Ypaqkjir6dxUUkIX2UG1mBA0v/k08gUP1
         bO/aMHDlYOF+mRHdW1sUTedthcNUYx/Ixu561JmcK10jWT5A/aQmKylhFahDcWoh32m1
         JhS82V6fFxwSi7ZxX01hgXEHIYZLh7SXoe0XAXKdJuH0ta6J2bA5XJo7+h3DdFHij5d5
         e9S007yipuJkERcSBBmg6QCKMED0uoo1aOkEY1W6i4G80PNUfkIz/+3zMFUPpbxzRdyO
         hZFiYbYRT9GWqeJRt+8o9xyNS/QiESIW+SSp59bG8dnafGgtS6k7mcxur0jaeEwKAs1O
         6sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683071658; x=1685663658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5t+YkOkDpznQp4uoL/9fUc9/dIQJ4G85gG1Hxhyav9w=;
        b=TasCLleUjjtiZ38gBMJMVR7YLmk2BufTknZNkvhycYmk22mmGTh6iV1d2rw7j8lPxj
         DggM0u17+yY2ognjnlAStfTt6+T4Mgavzl13+vgHOfD6J84vh/v6VQsM1/6IP+SAKpNm
         uoVpdsUwSp+h8KfRQQhQwu4oeufkJ9uT/RpATEvjrrIvlL0s47Qz+Ow7L+Mtgjs3lemT
         WJ2C2WWqAiThVZ+LHXGs5hY12z0dQRwjQALowYrwjqbtY5GY3iYTxNRQaM6cIijL82CW
         oV/0txQGirVxaYCKnGaw/FgKdDvsUn7eLmBL4pTSd+V5FjrMO8rttsLIyjEDduhq6So+
         xOkQ==
X-Gm-Message-State: AC+VfDzR74pk4AW3vBmDJZgO0MOzbKd6iczCAdQaMefCeeIKmoufxe+b
        2utCChVCxhvFfT0RV34EV63/HA==
X-Google-Smtp-Source: ACHHUZ4Z1bIwEw+ukb4OHOqUK7VaV86neoYxUThsJpmsKb8C2t2M0hvpYeH+i9DgiRo+HuorOWtZ1g==
X-Received: by 2002:a19:c216:0:b0:4f0:f3d:b8c6 with SMTP id l22-20020a19c216000000b004f00f3db8c6mr367714lfc.30.1683071658000;
        Tue, 02 May 2023 16:54:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a23-20020a19f817000000b004ee85d1444esm5636334lff.208.2023.05.02.16.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 16:54:17 -0700 (PDT)
Message-ID: <9f977692-d74d-9f49-e626-399aeeef7f18@linaro.org>
Date:   Wed, 3 May 2023 02:54:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
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
 <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
 <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
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

On 03/05/2023 02:51, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> The function dpu_encoder_get_wb() returns controller_id if the
>> corresponding WB is present in the catalog. We can inline this function
>> and rely on dpu_rm_get_wb() returning NULL for indices for which the
>> WB is not present on the device.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
>>   1 file changed, 2 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 4c85cbb030e4..507ff3f88c67 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const 
>> struct dpu_mdss_cfg *catalog,
>>       return INTF_MAX;
>>   }
>> -static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg 
>> *catalog,
>> -        enum dpu_intf_type type, u32 controller_id)
>> -{
>> -    int i = 0;
>> -
>> -    if (type != INTF_WB)
>> -        return WB_MAX;
>> -
>> -    for (i = 0; i < catalog->wb_count; i++) {
>> -        if (catalog->wb[i].id == controller_id)
>> -            return catalog->wb[i].id;
>> -    }
>> -
>> -    return WB_MAX;
>> -}
>> -
>>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>>           struct dpu_encoder_phys *phy_enc)
>>   {
>> @@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>            */
>>           u32 controller_id = disp_info->h_tile_instance[i];
>>           enum dpu_intf intf_idx;
>> -        enum dpu_wb wb_idx;
>>           if (disp_info->num_of_h_tiles > 1) {
>>               if (i == 0)
>> @@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>                                   disp_info->intf_type,
>>                                   controller_id);
>> -        wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
>> -                disp_info->intf_type, controller_id);
>> -
>>           if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>>               phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> intf_idx);
>> -        if (wb_idx >= WB_0 && wb_idx < WB_MAX)
>> -            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
>> +        if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>> +            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, 
>> controller_id);
> 
> 
>  From what I see, with 
> https://patchwork.freedesktop.org/patch/534776/?series=117146&rev=1 we 
> are dropping those checks from the RM too, so we are going to rely 
> totally on entering the values correctly in catalog from now on?

Yes. I see no reason to mistrust the kernel data itself.

> 
>>           if (!phys_params.hw_intf && !phys_params.hw_wb) {
>>               DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at 
>> idx: %d\n", i);

-- 
With best wishes
Dmitry

