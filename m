Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CCA4B31D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 01:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiBLASM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 19:18:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiBLASL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 19:18:11 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A83CF9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 16:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644625089; x=1676161089;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FDLgE8llULtIvj6N7KccSY5GoOJ9I6Pfdx8ftuxfcBQ=;
  b=k6PQpfE2DAMerwxAVOwgYFUgrF01KZZVJsUPXM6hifIp6+3oZtw7qRyQ
   3PNFX7yYLWKfADgjnqgOSnWXjFG5oQbcP1KmaxkBW2QSnKNIvHkNQxtFB
   Xwf0d1/K49U2gKThaEE3Y5wrbH9OBMJIKmJuRNy01HG2fq6VaCRWz9N2K
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 16:18:08 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 16:18:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 16:17:47 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 16:17:44 -0800
Message-ID: <5adb90e6-61bb-33fb-deea-330b911a6ce7@quicinc.com>
Date:   Fri, 11 Feb 2022 16:17:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/7] drm/msm/dpu: simplify intf allocation code
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-3-dmitry.baryshkov@linaro.org>
 <423162c0-797d-51d6-d6f6-7ea14219632c@quicinc.com>
 <0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2022 4:05 PM, Dmitry Baryshkov wrote:
> On 12/02/2022 02:38, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
>>> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
>>> which intf type we mean, pass INTF_DSI/INTF_DP directly.
>>>
>>
>> Typically, I am only seeing a 1:1 mapping like
>>
>> DRM_MODE_ENCODER_DSI means DSI
>> DRM_MODE_ENCODER_VIRTUAL means WB
>>
>> So I am not seeing any guessing for the encoder.
> 
> s/guessing/deriving/
> 
> Initially I spotted the DRM_MODE_CONNECTOR_DisplayPort comparison, then 
> I noticed that there is a misnaming, we were talking about the intf_type 
> (which clearly belongs to INTF_foo namespace), while passing 
> DRM_ENCODER_bar instead. Thus comes the proposal to make intf_type 
> actually contain INTF_type and let DRM_ENCODER live in encoder's code.
> 
> 
>>
>> The only conflict I am seeing is between DP and EDP as both use
>> DRM_MODE_ENCODER_TMDS and hence this approach will be useful there.
>>
>> But that has been marked as a "FIXME" below.
>>
>> I am suggesting an approach to handle that as well below.
>> Let me know if you agree with that.
> 
> Actually this brings a question to me. Do we need to distinguish between 
> INTF_DP and INTF_EDP from the DPU driver point of view? Are there any 
> differences? Or we'd better always use INTF_DP here and make INTF_EDP a 
> memorial of old eDP IP found in 8x74/8x84?
> 
> So far I see that sc7280 uses INTF_5 for DRM_MODE_CONNECTOR_eDP, but 
> declares it as INTF_DP. Most probably we should stick to this idea and 
> drop INTF_EDP from dpu1?

I believe you are referring to this part:

static const struct dpu_intf_cfg sc7280_intf[] = {
     INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
     INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
     INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 
24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
};

This is interesting ... this should have been marked as INTF_eDP unless 
I am missing some reason why.

My take on this is that, since are re-using DP driver now for DP and 
eDP, less confusion the better in terms of naming of DP/eDP.

I think we should fix that in the catalog to INTF_eDP. And in case some 
place is missed out due to this change fix that too.

Meanwhile I can check with sankeerth if there was any specific reason 
for not using INTF_eDP in the original commit:

commit ef7837ff091c8805cfa18d2ad06c2e5f4d820a7e
Author: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date:   Tue Nov 2 13:18:42 2021 +0530

     drm/msm/dp: Add DP controllers for sc7280

     The eDP controller on SC7280 is similar to the eDP/DP controllers
     supported by the current driver implementation.

     SC7280 supports one EDP and one DP controller which can operate
     concurrently.

     This change adds the support for eDP and DP controller on sc7280.

     Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

> 
>>
>>
>>> While we are at it, fix the DP audio enablement code which was comparing
>>> intf_type, DRM_MODE_ENCODER_TMDS (= 2) with
>>> DRM_MODE_CONNECTOR_DisplayPort (= 10).
>>> Which would never succeed.
>>
>> This is a surprising catch for me and left me thinking for a while 
>> about how DP audio is working with this bug because that piece of code 
>> was done to program a register which is needed for DP audio.
> 
> So did I!
> 
>>
>> This bug happened due to difference in the meaning of intf_type between
>> upstream and downstream.
>>
>> After checking more, we found that the register in question has been 
>> deprecated on newer chipsets so I have asked Kuogee to selectively 
>> program it. Here is the change for that:
>>
>> https://patchwork.freedesktop.org/patch/473869/
> 
> I'll further comment on it in the respective thread.
> 
>>
>>>
>>
>>> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port 
>>> on MSM")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 28 +++++++--------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 +--
>>>   3 files changed, 13 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 1e648db439f9..e8fc029ad607 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -493,7 +493,7 @@ void dpu_encoder_helper_split_config(
>>>       hw_mdptop = phys_enc->hw_mdptop;
>>>       disp_info = &dpu_enc->disp_info;
>>> -    if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
>>> +    if (disp_info->intf_type != INTF_DSI)
>>>           return;
>>>       /**
>>> @@ -555,7 +555,7 @@ static struct msm_display_topology 
>>> dpu_encoder_get_topology(
>>>       else
>>>           topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 
>>> : 1;
>>> -    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>>> +    if (dpu_enc->disp_info.intf_type == INTF_DSI) {
>>>           if (dpu_kms->catalog->dspp &&
>>>               (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>>               topology.num_dspp = topology.num_lm;
>>> @@ -1099,7 +1099,7 @@ static void 
>>> _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>>>       }
>>> -    if (dpu_enc->disp_info.intf_type == 
>>> DRM_MODE_CONNECTOR_DisplayPort &&
>>> +    if (dpu_enc->disp_info.intf_type == INTF_DP &&
>>>           dpu_enc->cur_master->hw_mdptop &&
>>>           dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>>>           dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
>>> @@ -1107,7 +1107,7 @@ static void 
>>> _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>>>       _dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>>> -    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
>>> +    if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>>>               !WARN_ON(dpu_enc->num_phys_encs == 0)) {
>>>           unsigned bpc = 
>>> dpu_enc->phys_encs[0]->connector->display_info.bpc;
>>>           for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>> @@ -1981,7 +1981,6 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>   {
>>>       int ret = 0;
>>>       int i = 0;
>>> -    enum dpu_intf_type intf_type = INTF_NONE;
>>>       struct dpu_enc_phys_init_params phys_params;
>>>       if (!dpu_enc) {
>>> @@ -1997,15 +1996,6 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>       phys_params.parent_ops = &dpu_encoder_parent_ops;
>>>       phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>>> -    switch (disp_info->intf_type) {
>>> -    case DRM_MODE_ENCODER_DSI:
>>> -        intf_type = INTF_DSI;
>>> -        break;
>>> -    case DRM_MODE_ENCODER_TMDS:
>>> -        intf_type = INTF_DP;
>>> -        break;
>>> -    }
>>> -
>>>       WARN_ON(disp_info->num_of_h_tiles < 1);
>>>       DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", 
>>> disp_info->num_of_h_tiles);
>>> @@ -2037,11 +2027,11 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>                   i, controller_id, phys_params.split_role);
>>>           phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>>> -                                                    intf_type,
>>> -                                                    controller_id);
>>> +                disp_info->intf_type,
>>> +                controller_id);
>>>           if (phys_params.intf_idx == INTF_MAX) {
>>>               DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id 
>>> %d\n",
>>> -                          intf_type, controller_id);
>>> +                          disp_info->intf_type, controller_id);
>>>               ret = -EINVAL;
>>>           }
>>> @@ -2124,11 +2114,11 @@ int dpu_encoder_setup(struct drm_device *dev, 
>>> struct drm_encoder *enc,
>>>       timer_setup(&dpu_enc->frame_done_timer,
>>>               dpu_encoder_frame_done_timeout, 0);
>>> -    if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
>>> +    if (disp_info->intf_type == INTF_DSI)
>>>           timer_setup(&dpu_enc->vsync_event_timer,
>>>                   dpu_encoder_vsync_event_handler,
>>>                   0);
>>> -    else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
>>> +    else if (disp_info->intf_type == INTF_DP || disp_info->intf_type 
>>> == INTF_EDP)
>>>           dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
>>>       INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> index ebe3944355bb..3891bcbbe5a4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> @@ -36,7 +36,7 @@ void dpu_encoder_get_hw_resources(struct 
>>> drm_encoder *encoder,
>>>   /**
>>>    * struct msm_display_info - defines display properties
>>> - * @intf_type:          DRM_MODE_ENCODER_ type
>>> + * @intf_type:          INTF_ type
>>>    * @capabilities:       Bitmask of display flags
>>>    * @num_of_h_tiles:     Number of horizontal tiles in case of split 
>>> interface
>>>    * @h_tile_instance:    Controller instance used per tile. Number 
>>> of elements is
>>> @@ -45,7 +45,7 @@ void dpu_encoder_get_hw_resources(struct 
>>> drm_encoder *encoder,
>>>    *                 used instead of panel TE in cmd mode panels
>>>    */
>>>   struct msm_display_info {
>>> -    int intf_type;
>>> +    enum dpu_intf_type intf_type;
>>>       uint32_t capabilities;
>>>       uint32_t num_of_h_tiles;
>>>       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 47fe11a84a77..f4028be9e2e2 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct 
>>> drm_device *dev,
>>>           priv->encoders[priv->num_encoders++] = encoder;
>>>           memset(&info, 0, sizeof(info));
>>> -        info.intf_type = encoder->encoder_type;
>>> +        info.intf_type = INTF_DSI;
>>>           rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>>           if (rc) {
>>> @@ -630,7 +630,7 @@ static int _dpu_kms_initialize_displayport(struct 
>>> drm_device *dev,
>>>           info.num_of_h_tiles = 1;
>>>           info.h_tile_instance[0] = i;
>>>           info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>>> -        info.intf_type = encoder->encoder_type;
>>
>> You can query the connector type from the DP driver like this:
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 7cc4d21..0fae0fc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1457,7 +1457,7 @@ void msm_dp_debugfs_init(struct msm_dp 
>> *dp_display, struct drm_minor *minor)
>>   }
>>
>>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device 
>> *dev,
>> -                       struct drm_encoder *encoder)
>> +                       struct drm_encoder *encoder, int 
>> **connector_type)
>>   {
>>          struct msm_drm_private *priv;
>>          int ret;
>> @@ -1498,6 +1498,8 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>
>>          priv->bridges[priv->num_bridges++] = dp_display->bridge;
>>
>> +       *connector_type = dp_display->connector_type;
>> +
>>          return 0;
>>   }
>>
>> Then you can do something like:
>>
>> if (connector_type == eDP)
>>          info.intf_type = INTF_eDP;
>> else if (connector_type == DP)
>>          info.intf_type = INTF_DP;
>>> +        info.intf_type = INTF_DP; /* FIXME: support eDP too */
>>>           rc = dpu_encoder_setup(dev, encoder, &info);
>>>           if (rc) {
>>>               DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> 
> 
