Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0764B324F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 02:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353793AbiBLBIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 20:08:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243505AbiBLBIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 20:08:43 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448E8D5C
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644628120; x=1676164120;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FXy9fQiaxBhOGsT0MNYKWzTDGJUR7zrGJg4+hqOOoR8=;
  b=Q7/Jm4028AiqWlO0VfErklWCr4r8Fqk3eTkbFVW6eSUDdFeC/sQCRxTM
   LHit8ZkZFCzZD7YGvRAbMqsIs/nzRbzmgOaT+YzH85irYg+GEOQVb188s
   1O2kWS+CZVydnMgmHANcNIJz+R6viO/p4fu62xFRbAIEQgGdBOJt0T0QN
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 17:08:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 17:08:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 17:08:39 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 17:08:36 -0800
Message-ID: <02c3280e-2df4-be6e-b621-f98a4fbfefd6@quicinc.com>
Date:   Fri, 11 Feb 2022 17:08:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v5 3/6] drm/msm/dpu: get INTF blocks directly
 rather than through RM
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-4-dmitry.baryshkov@linaro.org>
 <0bc25257-b866-7c95-efa8-ac7eac96b316@quicinc.com>
 <9d87a3ff-e3d5-2fa9-92b9-e7d724812559@linaro.org>
 <f88d7138-9ba2-c8ec-0767-5d0b071d8de6@quicinc.com>
 <0fe11ff5-b91d-a8e7-d48e-11111bf76e6b@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0fe11ff5-b91d-a8e7-d48e-11111bf76e6b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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



On 2/11/2022 5:47 AM, Dmitry Baryshkov wrote:
> On 11/02/2022 02:31, Abhinav Kumar wrote:
>>
>>
>> On 2/10/2022 1:32 AM, Dmitry Baryshkov wrote:
>>> On 10/02/2022 03:25, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
>>>>> INTF blocks are not really handled by resource manager, they are
>>>>> assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
>>>>> Then this allocation is passed to RM and then returned to then
>>>>> dpu_encoder.
>>>>> So allocate them outside of RM and use them directly.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>
>>>> I have some questions about this approach.
>>>>
>>>> Agreed, that when there is one encoder tied to one interface, we 
>>>> dont need to go through RM because RM just gives what the encoder 
>>>> asks. Instead we can directly get the interface from encoder.
>>>>
>>>> But what happens when multiple displays are requesting the same 
>>>> interface?
>>>>
>>>> There are use-cases which we have handled especially in mid-tier 
>>>> chips which do not have external display where between mode-switches
>>>> OR between some user triggered events DSI0 was shared between two 
>>>> displays.
>>>>
>>>> So  lets say display 1 (with encoder X) requests DSI0
>>>> and display 2 (with encoder Y) also requests DSI0,
>>>
>>> All the encoders are allocated in the loop over possible DSI/DP 
>>> interfaces. Thus it's not possible to have two encoders being driven 
>>> by the same DSI entity. Moreover, the MSM DSI manager would not be 
>>> able to cope with such cases.
>>>
>>> In my opinion, the proper way to handle such cases would be a bridge 
>>> which would generate hotplug events and toggle display pipeline 
>>> inbetween.
>>
>> Like I wrote in the previous comment, today there is always one 
>> encoder requesting for one interface (or two for split DSI ) and there 
>> is no chance of a conflict ( the loop that you are referring to ).
>>
>> And yes I am aware that DSI does not support this today.
>>
>> Myself and a few others internally are looking ahead and thinking of 
>> what can come in the future and something which we already support 
>> downstream, which is to support sharing the interface across encoders.
>>
>> So what happens downstream is the controller ID comes from the device 
>> tree:
>>
>> 6266     info->num_of_h_tiles = display->ctrl_count;
>> 6267     for (i = 0; i < info->num_of_h_tiles; i++)
>> 6268         info->h_tile_instance[i] = 
>> display->ctrl[i].ctrl->cell_index;
>> 6269
>>
>> There is a concept of a dsi_display quite similar to the dsi_manager 
>> we have upstream. There are also implementations already in place of a 
>> shared display, where like I was describing in IRC, the DSI0 can be 
>> shared across two encoders between a mode_set().
>>
>> Hotplug is not necessarily the only trigger which happens, it can just
>> be a simple mode_set() in between.
> 
> Even having a modeset, you will have to trigger the electrical switch 
> between the DSI sinks. It should be a separate device sitting in both 
> DSI pipelines, so you'll have a question of having it in sync.
> 
>> In that case, this encoder to intf mapping in the RM will protect 
>> against concurrent hardware use.
>>
>> Ofcourse, all this is not present today but will someday :)
>>
>> That time this will have to be brought back.
>>
>> So I thought I must mention the use-cases which will get potentially 
>> affected with this change of removing INTF from RM.
>>
>> If for the sake of code simplicity, if we want to ignore the possibility
>> of this coming back later, please let me know what you think and we can
>> take this further by acking it.
> 
> As I wrote on the IRC, I suppose that neither you nor me can imagine the 
> way such usecases might be actually implemented when the need arises.
> 
> You have an idea of using multiple encoders. Fine idea, nothing 
> particularly wrong with it.
> 
> I'd use single pipeline and multiple panels being switched. Or the panel 
> driver providing modes for both small and larger panels (or internal and 
> external) at the same time and guarding the switch on its own.
> 
> The engineer that would implement this feature might come with another 
> approach (and might e.g. implement dynamic drm_bridge pipelines inside 
> the core).
> 
> And if we bring in DSI split link into the equation, the situation might 
> become even more complex (with one of encoders owning a half of the DSI 
> and and enother encoder owning another half).
> 
> We should always think about future use cases, but we should not 
> over-predict the future. Unnecessary abstractions complicate the code, 
> making the driver harder to comprehend, harder to modify and more 
> error-prone.
> 
> That said I'd suggest/ask to ack and accept this patch.

Alright, since we have discussed pros and cons of this approach, in the 
absence of any current code/features which will get impacted due to this,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I will make an equivalent change in the WB series.


> 
>>
>>
>>>
>>>> with this change, the code will allow that as there is no interface to
>>>> encoder mapping.
>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +---------
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 16 -----
>>>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 --
>>>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 ---
>>>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  8 ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 68 
>>>>> ++-----------------
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  8 +++
>>>>>   8 files changed, 16 insertions(+), 134 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> index 1e648db439f9..11f7126728db 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> @@ -420,26 +420,6 @@ int dpu_encoder_get_linecount(struct 
>>>>> drm_encoder *drm_enc)
>>>>>       return linecount;
>>>>>   }
>>>>> -void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
>>>>> -                  struct dpu_encoder_hw_resources *hw_res)
>>>>> -{
>>>>> -    struct dpu_encoder_virt *dpu_enc = NULL;
>>>>> -    int i = 0;
>>>>> -
>>>>> -    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>> -    DPU_DEBUG_ENC(dpu_enc, "\n");
>>>>> -
>>>>> -    /* Query resources used by phys encs, expected to be without 
>>>>> overlap */
>>>>> -    memset(hw_res, 0, sizeof(*hw_res));
>>>>> -
>>>>> -    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>> -        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>> -
>>>>> -        if (phys->ops.get_hw_resources)
>>>>> -            phys->ops.get_hw_resources(phys, hw_res);
>>>>> -    }
>>>>> -}
>>>>> -
>>>>>   static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
>>>>>   {
>>>>>       struct dpu_encoder_virt *dpu_enc = NULL;
>>>>> @@ -973,7 +953,7 @@ static void dpu_encoder_virt_mode_set(struct 
>>>>> drm_encoder *drm_enc,
>>>>>       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>>>>       struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>>>>       int num_lm, num_ctl, num_pp;
>>>>> -    int i, j;
>>>>> +    int i;
>>>>>       if (!drm_enc) {
>>>>>           DPU_ERROR("invalid encoder\n");
>>>>> @@ -1040,8 +1020,6 @@ static void dpu_encoder_virt_mode_set(struct 
>>>>> drm_encoder *drm_enc,
>>>>>       cstate->num_mixers = num_lm;
>>>>>       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>> -        int num_blk;
>>>>> -        struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
>>>>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>>           if (!dpu_enc->hw_pp[i]) {
>>>>> @@ -1059,16 +1037,8 @@ static void dpu_encoder_virt_mode_set(struct 
>>>>> drm_encoder *drm_enc,
>>>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>>> -        num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
>>>>> -            global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
>>>>> -            hw_blk, ARRAY_SIZE(hw_blk));
>>>>> -        for (j = 0; j < num_blk; j++) {
>>>>> -            struct dpu_hw_intf *hw_intf;
>>>>> -
>>>>> -            hw_intf = to_dpu_hw_intf(hw_blk[i]);
>>>>> -            if (hw_intf->idx == phys->intf_idx)
>>>>> -                phys->hw_intf = hw_intf;
>>>>> -        }
>>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>>> phys->intf_idx);
>>>>>           if (!phys->hw_intf) {
>>>>>               DPU_ERROR_ENC(dpu_enc,
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>> index e241914a9677..722dd7db6bdf 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>> @@ -18,22 +18,6 @@
>>>>>   #define IDLE_TIMEOUT    (66 - 16/2)
>>>>> -/**
>>>>> - * Encoder functions and data types
>>>>> - * @intfs:    Interfaces this encoder is using, INTF_MODE_NONE if 
>>>>> unused
>>>>> - */
>>>>> -struct dpu_encoder_hw_resources {
>>>>> -    enum dpu_intf_mode intfs[INTF_MAX];
>>>>> -};
>>>>> -
>>>>> -/**
>>>>> - * dpu_encoder_get_hw_resources - Populate table of required 
>>>>> hardware resources
>>>>> - * @encoder:    encoder pointer
>>>>> - * @hw_res:    resource table to populate with encoder required 
>>>>> resources
>>>>> - */
>>>>> -void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>>>>> -                  struct dpu_encoder_hw_resources *hw_res);
>>>>> -
>>>>>   /**
>>>>>    * dpu_encoder_assign_crtc - Link the encoder to the crtc it's 
>>>>> assigned to
>>>>>    * @encoder:    encoder pointer
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> index e7270eb6b84b..42febfce79c7 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> @@ -91,9 +91,6 @@ struct dpu_encoder_virt_ops {
>>>>>    * @disable:            DRM Call. Disable mode.
>>>>>    * @atomic_check:        DRM Call. Atomic check new DRM state.
>>>>>    * @destroy:            DRM Call. Destroy and release resources.
>>>>> - * @get_hw_resources:        Populate the structure with the hardware
>>>>> - *                resources that this phys_enc is using.
>>>>> - *                Expect no overlap between phys_encs.
>>>>>    * @control_vblank_irq        Register/Deregister for VBLANK IRQ
>>>>>    * @wait_for_commit_done:    Wait for hardware to have flushed the
>>>>>    *                current pending frames to hardware
>>>>> @@ -129,8 +126,6 @@ struct dpu_encoder_phys_ops {
>>>>>                   struct drm_crtc_state *crtc_state,
>>>>>                   struct drm_connector_state *conn_state);
>>>>>       void (*destroy)(struct dpu_encoder_phys *encoder);
>>>>> -    void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
>>>>> -                 struct dpu_encoder_hw_resources *hw_res);
>>>>>       int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool 
>>>>> enable);
>>>>>       int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
>>>>>       int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>> index 34a6940d12c5..7d2beea9cc4e 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>> @@ -534,13 +534,6 @@ static void 
>>>>> dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
>>>>>       kfree(cmd_enc);
>>>>>   }
>>>>> -static void dpu_encoder_phys_cmd_get_hw_resources(
>>>>> -        struct dpu_encoder_phys *phys_enc,
>>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>>> -{
>>>>> -    hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_CMD;
>>>>> -}
>>>>> -
>>>>>   static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>>>>>           struct dpu_encoder_phys *phys_enc)
>>>>>   {
>>>>> @@ -736,7 +729,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>>>>>       ops->enable = dpu_encoder_phys_cmd_enable;
>>>>>       ops->disable = dpu_encoder_phys_cmd_disable;
>>>>>       ops->destroy = dpu_encoder_phys_cmd_destroy;
>>>>> -    ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
>>>>>       ops->control_vblank_irq = 
>>>>> dpu_encoder_phys_cmd_control_vblank_irq;
>>>>>       ops->wait_for_commit_done = 
>>>>> dpu_encoder_phys_cmd_wait_for_commit_done;
>>>>>       ops->prepare_for_kickoff = 
>>>>> dpu_encoder_phys_cmd_prepare_for_kickoff;
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>> index ddd9d89cd456..db6a9b896e42 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>> @@ -465,13 +465,6 @@ static void 
>>>>> dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
>>>>>       kfree(phys_enc);
>>>>>   }
>>>>> -static void dpu_encoder_phys_vid_get_hw_resources(
>>>>> -        struct dpu_encoder_phys *phys_enc,
>>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>>> -{
>>>>> -    hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
>>>>> -}
>>>>> -
>>>>>   static int dpu_encoder_phys_vid_wait_for_vblank(
>>>>>           struct dpu_encoder_phys *phys_enc)
>>>>>   {
>>>>> @@ -680,7 +673,6 @@ static void 
>>>>> dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>>>>>       ops->enable = dpu_encoder_phys_vid_enable;
>>>>>       ops->disable = dpu_encoder_phys_vid_disable;
>>>>>       ops->destroy = dpu_encoder_phys_vid_destroy;
>>>>> -    ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
>>>>>       ops->control_vblank_irq = 
>>>>> dpu_encoder_phys_vid_control_vblank_irq;
>>>>>       ops->wait_for_commit_done = 
>>>>> dpu_encoder_phys_vid_wait_for_commit_done;
>>>>>       ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> index 2d385b4b7f5e..3f518c809e33 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> @@ -144,7 +144,6 @@ struct dpu_global_state {
>>>>>       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>>>>>       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
>>>>>       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>>>>> -    uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>>>>>       uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>>>>>   };
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> index 63ed0d7df848..8df21a46308e 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> @@ -28,7 +28,6 @@ static inline bool reserved_by_other(uint32_t 
>>>>> *res_map, int idx,
>>>>>    */
>>>>>   struct dpu_rm_requirements {
>>>>>       struct msm_display_topology topology;
>>>>> -    struct dpu_encoder_hw_resources hw_res;
>>>>>   };
>>>>>   int dpu_rm_destroy(struct dpu_rm *rm)
>>>>> @@ -448,54 +447,6 @@ static int _dpu_rm_reserve_ctls(
>>>>>       return 0;
>>>>>   }
>>>>> -static int _dpu_rm_reserve_intf(
>>>>> -        struct dpu_rm *rm,
>>>>> -        struct dpu_global_state *global_state,
>>>>> -        uint32_t enc_id,
>>>>> -        uint32_t id)
>>>>> -{
>>>>> -    int idx = id - INTF_0;
>>>>> -
>>>>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->intf_blks)) {
>>>>> -        DPU_ERROR("invalid intf id: %d", id);
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> -
>>>>> -    if (!rm->intf_blks[idx]) {
>>>>> -        DPU_ERROR("couldn't find intf id %d\n", id);
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> -
>>>>> -    if (reserved_by_other(global_state->intf_to_enc_id, idx, 
>>>>> enc_id)) {
>>>>> -        DPU_ERROR("intf id %d already reserved\n", id);
>>>>> -        return -ENAVAIL;
>>>>> -    }
>>>>> -
>>>>> -    global_state->intf_to_enc_id[idx] = enc_id;
>>>>> -    return 0;
>>>>> -}
>>>>> -
>>>>> -static int _dpu_rm_reserve_intf_related_hw(
>>>>> -        struct dpu_rm *rm,
>>>>> -        struct dpu_global_state *global_state,
>>>>> -        uint32_t enc_id,
>>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>>> -{
>>>>> -    int i, ret = 0;
>>>>> -    u32 id;
>>>>> -
>>>>> -    for (i = 0; i < ARRAY_SIZE(hw_res->intfs); i++) {
>>>>> -        if (hw_res->intfs[i] == INTF_MODE_NONE)
>>>>> -            continue;
>>>>> -        id = i + INTF_0;
>>>>> -        ret = _dpu_rm_reserve_intf(rm, global_state, enc_id, id);
>>>>> -        if (ret)
>>>>> -            return ret;
>>>>> -    }
>>>>> -
>>>>> -    return ret;
>>>>> -}
>>>>> -
>>>>>   static int _dpu_rm_make_reservation(
>>>>>           struct dpu_rm *rm,
>>>>>           struct dpu_global_state *global_state,
>>>>> @@ -517,11 +468,6 @@ static int _dpu_rm_make_reservation(
>>>>>           return ret;
>>>>>       }
>>>>> -    ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, 
>>>>> enc->base.id,
>>>>> -                &reqs->hw_res);
>>>>> -    if (ret)
>>>>> -        return ret;
>>>>> -
>>>>>       return ret;
>>>>>   }
>>>>> @@ -530,8 +476,6 @@ static int _dpu_rm_populate_requirements(
>>>>>           struct dpu_rm_requirements *reqs,
>>>>>           struct msm_display_topology req_topology)
>>>>>   {
>>>>> -    dpu_encoder_get_hw_resources(enc, &reqs->hw_res);
>>>>> -
>>>>>       reqs->topology = req_topology;
>>>>>       DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
>>>>> @@ -561,8 +505,6 @@ void dpu_rm_release(struct dpu_global_state 
>>>>> *global_state,
>>>>>           ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
>>>>>       _dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
>>>>>           ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>>>>> -    _dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>>>>> -        ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
>>>>>   }
>>>>>   int dpu_rm_reserve(
>>>>> @@ -626,11 +568,6 @@ int dpu_rm_get_assigned_resources(struct 
>>>>> dpu_rm *rm,
>>>>>           hw_to_enc_id = global_state->ctl_to_enc_id;
>>>>>           max_blks = ARRAY_SIZE(rm->ctl_blks);
>>>>>           break;
>>>>> -    case DPU_HW_BLK_INTF:
>>>>> -        hw_blks = rm->intf_blks;
>>>>> -        hw_to_enc_id = global_state->intf_to_enc_id;
>>>>> -        max_blks = ARRAY_SIZE(rm->intf_blks);
>>>>> -        break;
>>>>>       case DPU_HW_BLK_DSPP:
>>>>>           hw_blks = rm->dspp_blks;
>>>>>           hw_to_enc_id = global_state->dspp_to_enc_id;
>>>>> @@ -656,3 +593,8 @@ int dpu_rm_get_assigned_resources(struct dpu_rm 
>>>>> *rm,
>>>>>       return num_blks;
>>>>>   }
>>>>> +
>>>>> +struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum 
>>>>> dpu_intf intf_idx)
>>>>> +{
>>>>> +    return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> index 0f27759211b5..ee50f6651b6e 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> @@ -84,5 +84,13 @@ void dpu_rm_release(struct dpu_global_state 
>>>>> *global_state,
>>>>>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>>       struct dpu_global_state *global_state, uint32_t enc_id,
>>>>>       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int 
>>>>> blks_size);
>>>>> +
>>>>> +/**
>>>>> + * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given 
>>>>> it's index.
>>>>> + * @rm: DPU Resource Manager handle
>>>>> + * @intf_idx: INTF's index
>>>>> + */
>>>>> +struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum 
>>>>> dpu_intf intf_idx);
>>>>> +
>>>>>   #endif /* __DPU_RM_H__ */
>>>
>>>
> 
> 
