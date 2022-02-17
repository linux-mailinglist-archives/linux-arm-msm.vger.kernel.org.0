Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBFE24B9551
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 02:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiBQBSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 20:18:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiBQBSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 20:18:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0619929E97E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 17:18:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id e5so7058945lfr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 17:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q8vq/lMANoiPuSkUiSSgpjx4GabIzyvkuP99lIKmiNg=;
        b=XSfGyNVdEmVkRTps5KHosZENmrAG7iiXpIDwGnLYCjkgwdEB8UNWSWMgJLRyWX92BA
         8VjD5+zo/7xpNsdmItbsp+XmaeKi5wVYvfwNeI/lKbD0qKYOjy6bfIEYiVNtSjI8MZxk
         Wgw1tE3cB2Rsgns+uXm4DOkXhAAWsTJ9/UV49jcRBl6MZE25prA6tl2t768WujAsXzE5
         TSFagPZyGQq782CyOrstKbNJbPfGw7eDnGkkiGqOtJ+bkWf1sNfax7o51+dCJ3d4+a6d
         piUsreICjCCDFzHr6aecoH4sR0kAvdRzN545ctE9S4Rn27dwFPR1/izdMHYlSJ9kyPZg
         itDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q8vq/lMANoiPuSkUiSSgpjx4GabIzyvkuP99lIKmiNg=;
        b=uZ26lPxNTiAKsC4UyLrP+kzvtXbKvAykhRglOY5dCTHVGZ2FJiXzgD2KJmRs1rH2Me
         FoU2VJ64Ic5JLhyk1oJ3jOEQ3S8M18q7dfbsp0n6iY/wyDjXY49DBpDPgzVu0dcEIChC
         e9bSV8smwhHpUtCoke+psCzx49J8kRdWdkpXqyWs993uq0pzrIOeEewkXmkPHTkcQf/4
         nIMgbHMt9vtfXf9jNuiboMp8uqjbuxFwEfxi5OSD/f25mZMrIAp/x3BoQwVBOwzjaMCA
         UzCl/abCkvUiuogZoQ5/n6IBItflQPVuBos2N1JwULSpN2yLwV8msozbzvNS+3reI+2t
         b9Pg==
X-Gm-Message-State: AOAM5323z/c23ij3Dkfkvjr1esIkU7YbhQnchq2h9sFS56/yvfUYd5rq
        wXTkhiEPKJEVUInTt/NG9cqJ6g==
X-Google-Smtp-Source: ABdhPJw0PpX55HWMdzPEOT+u4a/swAzAMi+9j3IBgpXfCDtTlWJh57XuradXaaW2Ac86ARmV0l2v1A==
X-Received: by 2002:a05:6512:689:b0:443:14c1:ae81 with SMTP id t9-20020a056512068900b0044314c1ae81mr466530lfe.183.1645060713257;
        Wed, 16 Feb 2022 17:18:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c12sm1227842lfc.227.2022.02.16.17.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 17:18:32 -0800 (PST)
Message-ID: <342ac115-e200-3bb0-9092-d148ba34cefd@linaro.org>
Date:   Thu, 17 Feb 2022 04:18:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: simplify intf allocation code
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-9-dmitry.baryshkov@linaro.org>
 <ddd2d3b9-2bbe-1255-a3b9-3f5a5aaae514@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ddd2d3b9-2bbe-1255-a3b9-3f5a5aaae514@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/02/2022 20:51, Abhinav Kumar wrote:
> 
> 
> On 2/15/2022 6:16 AM, Dmitry Baryshkov wrote:
>> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
>> which intf type we mean, pass INTF_DSI/INTF_DP directly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 +++++++--------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++--
>>   3 files changed, 13 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index fa1dc088a672..597d40f78d38 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -490,7 +490,7 @@ void dpu_encoder_helper_split_config(
>>       hw_mdptop = phys_enc->hw_mdptop;
>>       disp_info = &dpu_enc->disp_info;
>> -    if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
>> +    if (disp_info->intf_type != INTF_DSI)
>>           return;
>>       /**
>> @@ -552,7 +552,7 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>       else
>>           topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 
>> : 1;
>> -    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>> +    if (dpu_enc->disp_info.intf_type == INTF_DSI) {
>>           if (dpu_kms->catalog->dspp &&
>>               (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>               topology.num_dspp = topology.num_lm;
>> @@ -1074,7 +1074,7 @@ static void 
>> _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>>       }
>> -    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
>> +    if (dpu_enc->disp_info.intf_type == INTF_DP &&
>>           dpu_enc->cur_master->hw_mdptop &&
>>           dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>>           dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
>> @@ -1082,7 +1082,7 @@ static void 
>> _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>>       _dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>> -    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
>> +    if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>>               !WARN_ON(dpu_enc->num_phys_encs == 0)) {
>>           unsigned bpc = dpu_enc->connector->display_info.bpc;
>>           for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>> @@ -1949,7 +1949,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>   {
>>       int ret = 0;
>>       int i = 0;
>> -    enum dpu_intf_type intf_type = INTF_NONE;
>>       struct dpu_enc_phys_init_params phys_params;
>>       if (!dpu_enc) {
>> @@ -1965,15 +1964,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>       phys_params.parent_ops = &dpu_encoder_parent_ops;
>>       phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>> -    switch (disp_info->intf_type) {
>> -    case DRM_MODE_ENCODER_DSI:
>> -        intf_type = INTF_DSI;
>> -        break;
>> -    case DRM_MODE_ENCODER_TMDS:
>> -        intf_type = INTF_DP;
>> -        break;
>> -    }
>> -
>>       WARN_ON(disp_info->num_of_h_tiles < 1);
>>       DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", 
>> disp_info->num_of_h_tiles);
>> @@ -2005,11 +1995,11 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>                   i, controller_id, phys_params.split_role);
>>           phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>> -                                                    intf_type,
>> -                                                    controller_id);
>> +                disp_info->intf_type,
>> +                controller_id);
>>           if (phys_params.intf_idx == INTF_MAX) {
>>               DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id 
>> %d\n",
>> -                          intf_type, controller_id);
>> +                          disp_info->intf_type, controller_id);
>>               ret = -EINVAL;
>>           }
>> @@ -2092,7 +2082,7 @@ int dpu_encoder_setup(struct drm_device *dev, 
>> struct drm_encoder *enc,
>>       timer_setup(&dpu_enc->frame_done_timer,
>>               dpu_encoder_frame_done_timeout, 0);
>> -    if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
>> +    if (disp_info->intf_type == INTF_DSI)
>>           timer_setup(&dpu_enc->vsync_event_timer,
>>                   dpu_encoder_vsync_event_handler,
>>                   0);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index ebe3944355bb..3891bcbbe5a4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -36,7 +36,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder 
>> *encoder,
>>   /**
>>    * struct msm_display_info - defines display properties
>> - * @intf_type:          DRM_MODE_ENCODER_ type
>> + * @intf_type:          INTF_ type
>>    * @capabilities:       Bitmask of display flags
>>    * @num_of_h_tiles:     Number of horizontal tiles in case of split 
>> interface
>>    * @h_tile_instance:    Controller instance used per tile. Number of 
>> elements is
>> @@ -45,7 +45,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder 
>> *encoder,
>>    *                 used instead of panel TE in cmd mode panels
>>    */
>>   struct msm_display_info {
>> -    int intf_type;
>> +    enum dpu_intf_type intf_type;
>>       uint32_t capabilities;
>>       uint32_t num_of_h_tiles;
>>       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 5f0dc44119c9..bca4f05a5782 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -564,7 +564,7 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>           priv->encoders[priv->num_encoders++] = encoder;
>>           memset(&info, 0, sizeof(info));
>> -        info.intf_type = encoder->encoder_type;
>> +        info.intf_type = INTF_DSI;
>>           rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>           if (rc) {
>> @@ -630,7 +630,8 @@ static int _dpu_kms_initialize_displayport(struct 
>> drm_device *dev,
>>           info.num_of_h_tiles = 1;
>>           info.h_tile_instance[0] = i;
>>           info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>> -        info.intf_type = encoder->encoder_type;
>> +        /* FIXME: HW catalog treats both DP and eDP interfaces as 
>> INTF_DP */
> 
> I thought we discussed an approach to address this FIXME.
> https://patchwork.freedesktop.org/patch/473871/?series=99651&rev=2
> 
> Without addressing that, there is really no need for this change because 
> the only confusion between DRM_MODE_ENCODER_*** mapping to intf_type 
> mapping comes for eDP and DP as they use the same DRM_MODE_ENCODER_TMDS.

It's not that distinction which triggered me to sketch this patch.
It was more about the code.
We loop over all INTF_DSI (or INTF_DP) interfaces.
Then we deduce that for this intf we should use DRM_MODE_ENCODER_foo.
We pass it to dpu_encoder_setup_display() only to map it back to 
INTF_DSI (DP). This makes completely no sense to me.

> 
>> +        info.intf_type = INTF_DP;
>>           rc = dpu_encoder_setup(dev, encoder, &info);
>>           if (rc) {
>>               DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",


-- 
With best wishes
Dmitry
