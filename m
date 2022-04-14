Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A51501DC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 23:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239662AbiDNV50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 17:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242503AbiDNV5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 17:57:23 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA008D68B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649973297; x=1681509297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VdwoQqewOhPCjmr7f2MA1Pva0mzIwZZSabeZvt1Ng3U=;
  b=P7Vc78HkM19u5+4fBf5UJ3ObY5btNXwYGsZAOwP+cMN59MrImdSkVXCD
   G+aRMLJWBPg4fWqyOVKL08LCPvl7VIrdJ2l0SlnU6+aLNNW5mnfAiBAFR
   +drkt5ZW4UxfLd4EIVGxBA0GbBJnnEVaFvQm+m3ADM0NL7NS7cLflH57S
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 14:54:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 14:54:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:54:56 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 14:54:54 -0700
Message-ID: <aa80e350-688d-0d7b-df61-ea88584e069c@quicinc.com>
Date:   Thu, 14 Apr 2022 14:54:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 06/12] drm/msm/dpu: make changes to dpu_encoder to support
 virtual encoder
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <markyacoub@chromium.org>, <quic_jesszhan@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
 <177eca6a-32a8-b121-30ae-d365329df7f2@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <177eca6a-32a8-b121-30ae-d365329df7f2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/4/2022 3:36 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> Make changes to dpu_encoder to support virtual encoder needed
>> to support writeback for dpu.
> 
> This patch will change significantly if
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 57 
>> +++++++++++++++++++++--------
>>   1 file changed, 42 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index e977c05..947069b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -974,6 +974,7 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>       struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>> +    enum dpu_hw_blk_type blk_type;
>>       int num_lm, num_ctl, num_pp;
>>       int i, j;
>> @@ -1061,20 +1062,36 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>> +        if (phys->intf_mode == INTF_MODE_WB_LINE)
>> +            blk_type = DPU_HW_BLK_WB;
>> +        else
>> +            blk_type = DPU_HW_BLK_INTF;
>> +
>>           num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
>> -            global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
>> +            global_state, drm_enc->base.id, blk_type,
>>               hw_blk, ARRAY_SIZE(hw_blk));
>> -        for (j = 0; j < num_blk; j++) {
>> -            struct dpu_hw_intf *hw_intf;
>> -            hw_intf = to_dpu_hw_intf(hw_blk[i]);
>> -            if (hw_intf->idx == phys->intf_idx)
>> -                phys->hw_intf = hw_intf;
>> +        if (blk_type == DPU_HW_BLK_WB) {
>> +            for (j = 0; j < num_blk; j++) {
>> +                struct dpu_hw_wb *hw_wb;
>> +
>> +                hw_wb = to_dpu_hw_wb(hw_blk[i]);
>> +                if (hw_wb->idx == phys->intf_idx)
>> +                    phys->hw_wb = hw_wb;
>> +            }
>> +        } else {
>> +            for (j = 0; j < num_blk; j++) {
>> +                struct dpu_hw_intf *hw_intf;
>> +
>> +                hw_intf = to_dpu_hw_intf(hw_blk[i]);
>> +                if (hw_intf->idx == phys->intf_idx)
>> +                    phys->hw_intf = hw_intf;
>> +            }
>>           }
> 
> I think that if we sequentially call dpu_rm_get_assigned_resources(.., 
> DPU_HW_BLK_INTF, ...) and then dpu_rm_get_assigned_resources(.., 
> DPU_HW_BLK_WB, ...), the code would be cleaner.
> 
> Or even better get the WB direclty using the provided ID.

Yeah i think you have done something like this for INTF on msm-next.
Will follow that and post in the next version :)

> 
>> -        if (!phys->hw_intf) {
>> +        if (!phys->hw_intf && !phys->hw_wb) {
>>               DPU_ERROR_ENC(dpu_enc,
>> -                      "no intf block assigned at idx: %d\n", i);
>> +                      "no intf or WB block assigned at idx: %d\n", i);
>>               return;
>>           }
>> @@ -1224,15 +1241,22 @@ static void dpu_encoder_virt_disable(struct 
>> drm_encoder *drm_enc)
>>       mutex_unlock(&dpu_enc->enc_lock);
>>   }
>> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
>> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg 
>> *catalog,
>>           enum dpu_intf_type type, u32 controller_id)
>>   {
>>       int i = 0;
>> -    for (i = 0; i < catalog->intf_count; i++) {
>> -        if (catalog->intf[i].type == type
>> -            && catalog->intf[i].controller_id == controller_id) {
>> -            return catalog->intf[i].id;
>> +    if (type != INTF_WB) {
>> +        for (i = 0; i < catalog->intf_count; i++) {
>> +            if (catalog->intf[i].type == type
>> +                && catalog->intf[i].controller_id == controller_id) {
>> +                return catalog->intf[i].id;
>> +            }
>> +        }
>> +    } else {
>> +        for (i = 0; i < catalog->wb_count; i++) {
>> +            if (catalog->wb[i].id == controller_id)
>> +                return catalog->wb[i].id;
>>           }
>>       }
>> @@ -2096,6 +2120,9 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>       case DRM_MODE_ENCODER_TMDS:
>>           intf_type = INTF_DP;
>>           break;
>> +    case DRM_MODE_ENCODER_VIRTUAL:
>> +        intf_type = INTF_WB;
>> +        break;
>>       }
>>       WARN_ON(disp_info->num_of_h_tiles < 1);
>> @@ -2128,11 +2155,11 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>                   i, controller_id, phys_params.split_role);
>> -        phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>> +        phys_params.intf_idx = 
>> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>>                                                       intf_type,
>>                                                       controller_id);
>>           if (phys_params.intf_idx == INTF_MAX) {
>> -            DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id 
>> %d\n",
>> +            DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type 
>> %d, id %d\n",
>>                             intf_type, controller_id);
>>               ret = -EINVAL;
>>           }
> 
> 
