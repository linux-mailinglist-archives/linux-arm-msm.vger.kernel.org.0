Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5140502F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239685AbiDOT2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 15:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238001AbiDOT2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 15:28:52 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427FD3EF1D
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650050783; x=1681586783;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=jcr5nkMBNp/LyQ+fBP9xkqE4+JhDLAQF72XqUR/pjOA=;
  b=sDEV0NUbMieFIh135Ota0MHo0hMNOZ8SAQkUgs+t4XC7ld402PUyKdYI
   lHQ7U6Q6uGdiV56wVGEty7G7csUJ4h8m2EF1dT/Jwd3s+ECMtLUWBR5IM
   BrXEMSED4MQrGLYkfSs2HuoQFSN7xHKqflS5JSKppHYQgdHHOmlo11NAO
   Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Apr 2022 12:26:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 12:26:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 12:26:21 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Apr
 2022 12:26:18 -0700
Message-ID: <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
Date:   Fri, 15 Apr 2022 12:25:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Martin Botka <martin.botka@somainline.org>,
        <linux-arm-msm@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <robdclark@gmail.com>, <nganji@codeaurora.org>,
        <seanpaul@chromium.org>, <daniel@ffwll.ch>,
        <markyacoub@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_jesszhan@quicinc.com>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
 <20220414222642.f7wy3wdbsgmrqrxj@SoMainline.org>
 <1af827f1-b9b5-ed43-7bd8-8af6206eabaa@quicinc.com>
In-Reply-To: <1af827f1-b9b5-ed43-7bd8-8af6206eabaa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marijn

Looking at msm-next tip, this code has already been refactored in

https://gitlab.freedesktop.org/drm/msm/-/commit/ef58e0ad34365e2c8274b74e6e745b8c180ff0d3

So, I will just rebase my changes on msm-next tip and it should address 
below comments as well.


Thanks

Abhinav
On 4/14/2022 3:30 PM, Abhinav Kumar wrote:
> Hi Marijn
> 
> Thank you for your suggestion.
> I will address it and add your "Reported by".
> 
> Thanks
> 
> Abhinav
> 
> On 4/14/2022 3:26 PM, Marijn Suijten wrote:
>> On 2022-02-04 13:17:19, Abhinav Kumar wrote:
>>> Make changes to dpu_encoder to support virtual encoder needed
>>> to support writeback for dpu.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 57 
>>> +++++++++++++++++++++--------
>>>   1 file changed, 42 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index e977c05..947069b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -974,6 +974,7 @@ static void dpu_encoder_virt_mode_set(struct 
>>> drm_encoder *drm_enc,
>>>       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>>       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>>       struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>> +    enum dpu_hw_blk_type blk_type;
>>>       int num_lm, num_ctl, num_pp;
>>>       int i, j;
>>> @@ -1061,20 +1062,36 @@ static void dpu_encoder_virt_mode_set(struct 
>>> drm_encoder *drm_enc,
>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>> +        if (phys->intf_mode == INTF_MODE_WB_LINE)
>>> +            blk_type = DPU_HW_BLK_WB;
>>> +        else
>>> +            blk_type = DPU_HW_BLK_INTF;
>>> +
>>>           num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
>>> -            global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
>>> +            global_state, drm_enc->base.id, blk_type,
>>>               hw_blk, ARRAY_SIZE(hw_blk));
>>> -        for (j = 0; j < num_blk; j++) {
>>> -            struct dpu_hw_intf *hw_intf;
>>> -            hw_intf = to_dpu_hw_intf(hw_blk[i]);
>>> -            if (hw_intf->idx == phys->intf_idx)
>>> -                phys->hw_intf = hw_intf;
>>> +        if (blk_type == DPU_HW_BLK_WB) {
>>> +            for (j = 0; j < num_blk; j++) {
>>> +                struct dpu_hw_wb *hw_wb;
>>> +
>>> +                hw_wb = to_dpu_hw_wb(hw_blk[i]);
>>> +                if (hw_wb->idx == phys->intf_idx)
>>> +                    phys->hw_wb = hw_wb;
>>> +            }
>>> +        } else {
>>> +            for (j = 0; j < num_blk; j++) {
>>> +                struct dpu_hw_intf *hw_intf;
>>> +
>>> +                hw_intf = to_dpu_hw_intf(hw_blk[i]);
>>> +                if (hw_intf->idx == phys->intf_idx)
>>> +                    phys->hw_intf = hw_intf;
>>> +            }
>>
>> It appears the original bit of code iterates j from 0 to num_blks yet
>> only uses i as iteration value.  All of this code seems reentrant
>> meaning that executing it more than one times is redundant.  You've
>> adopted this mistake, though I'd argue it should use j in hw_blk[i] as
>> that follows the number of elements in hw_blk returned by
>> dpu_rm_get_assigned_resources.
>>
>> I suggest to address this in a separate patch (I can send that too, feel
>> free to add my Reported-by otherwise) and rebase this patch on top of
>> that, substituting i with j here as well.  It seems to have been
>> introduced by b954fa6baaca ("drm/msm/dpu: Refactor rm iterator").
>>
>> - Marijn
>>
>>>           }
>>> -        if (!phys->hw_intf) {
>>> +        if (!phys->hw_intf && !phys->hw_wb) {
>>>               DPU_ERROR_ENC(dpu_enc,
>>> -                      "no intf block assigned at idx: %d\n", i);
>>> +                      "no intf or WB block assigned at idx: %d\n", i);
>>>               return;
>>>           }
>>> @@ -1224,15 +1241,22 @@ static void dpu_encoder_virt_disable(struct 
>>> drm_encoder *drm_enc)
>>>       mutex_unlock(&dpu_enc->enc_lock);
>>>   }
>>> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
>>> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg 
>>> *catalog,
>>>           enum dpu_intf_type type, u32 controller_id)
>>>   {
>>>       int i = 0;
>>> -    for (i = 0; i < catalog->intf_count; i++) {
>>> -        if (catalog->intf[i].type == type
>>> -            && catalog->intf[i].controller_id == controller_id) {
>>> -            return catalog->intf[i].id;
>>> +    if (type != INTF_WB) {
>>> +        for (i = 0; i < catalog->intf_count; i++) {
>>> +            if (catalog->intf[i].type == type
>>> +                && catalog->intf[i].controller_id == controller_id) {
>>> +                return catalog->intf[i].id;
>>> +            }
>>> +        }
>>> +    } else {
>>> +        for (i = 0; i < catalog->wb_count; i++) {
>>> +            if (catalog->wb[i].id == controller_id)
>>> +                return catalog->wb[i].id;
>>>           }
>>>       }
>>> @@ -2096,6 +2120,9 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>       case DRM_MODE_ENCODER_TMDS:
>>>           intf_type = INTF_DP;
>>>           break;
>>> +    case DRM_MODE_ENCODER_VIRTUAL:
>>> +        intf_type = INTF_WB;
>>> +        break;
>>>       }
>>>       WARN_ON(disp_info->num_of_h_tiles < 1);
>>> @@ -2128,11 +2155,11 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>>                   i, controller_id, phys_params.split_role);
>>> -        phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>>> +        phys_params.intf_idx = 
>>> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>>>                                                       intf_type,
>>>                                                       controller_id);
>>>           if (phys_params.intf_idx == INTF_MAX) {
>>> -            DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id 
>>> %d\n",
>>> +            DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type 
>>> %d, id %d\n",
>>>                             intf_type, controller_id);
>>>               ret = -EINVAL;
>>>           }
>>> -- 
>>> 2.7.4
>>>
