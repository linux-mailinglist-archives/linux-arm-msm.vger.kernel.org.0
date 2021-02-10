Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D661316570
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 12:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhBJLoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 06:44:54 -0500
Received: from so15.mailgun.net ([198.61.254.15]:33948 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230111AbhBJLmc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 06:42:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612957325; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FdWZ8v47qn9vG1ClIB6jnANA2037y82kDKbNrM59kRc=;
 b=IxSDPY8iWJtKxg8vLGfGXFZWrD64jafl3T4VfcCuwar+T0/nUaV8kWa2vqWxem1mpblGkvUJ
 +mXH+JS+LVRg8dKogHmb05C6jb2WCJVjO/BVrhZQvjhb5qFWi864+WMxILnSlf5yuMcr2t74
 CflPrk673JQS77nZW/eWbA7J/jU=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6023c65ee3df861f4bca41d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 11:41:18
 GMT
Sender: kalyan_t=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60890C43461; Wed, 10 Feb 2021 11:41:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BC8AC433C6;
        Wed, 10 Feb 2021 11:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Feb 2021 17:11:16 +0530
From:   kalyan_t@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: turn off vblank irqs
 aggressively in dpu driver
In-Reply-To: <CAF6AEGvvtDq7FK4NcKCc2FG2sbArBU-YboEA4u73oPR9o3coag@mail.gmail.com>
References: <1608287227-17685-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGvvtDq7FK4NcKCc2FG2sbArBU-YboEA4u73oPR9o3coag@mail.gmail.com>
Message-ID: <fda3742598a6952c4e6797f31763aea8@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-01 00:46, Rob Clark wrote:
> On Fri, Dec 18, 2020 at 2:27 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> Set the flag vblank_disable_immediate = true to turn off vblank irqs
>> immediately as soon as drm_vblank_put is requested so that there are
>> no irqs triggered during idle state. This will reduce cpu wakeups
>> and help in power saving.
>> 
>> To enable vblank_disable_immediate flag the underlying KMS driver
>> needs to support high precision vblank timestamping and also a
>> reliable way of providing vblank counter which is incrementing
>> at the leading edge of vblank.
>> 
>> This patch also brings in changes to support vblank_disable_immediate
>> requirement in dpu driver.
>> 
>> Changes in v1:
>>  - Specify reason to add vblank timestamp support. (Rob)
>>  - Add changes to provide vblank counter from dpu driver.
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> 
> This seems to be triggering:
> 
> [  +0.032668] ------------[ cut here ]------------
> [  +0.004759] msm ae00000.mdss: drm_WARN_ON_ONCE(cur_vblank != 
> vblank->last)
> [  +0.000024] WARNING: CPU: 0 PID: 362 at
> drivers/gpu/drm/drm_vblank.c:354 drm_update_vblank_count+0x1e4/0x258
> [  +0.017154] Modules linked in: joydev
> [  +0.003784] CPU: 0 PID: 362 Comm: frecon Not tainted
> 5.11.0-rc5-00037-g33d3504871dd #2
> [  +0.008135] Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> [  +0.006167] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
> [  +0.006169] pc : drm_update_vblank_count+0x1e4/0x258
> [  +0.005105] lr : drm_update_vblank_count+0x1e4/0x258
> [  +0.005106] sp : ffffffc010003b70
> [  +0.003409] x29: ffffffc010003b70 x28: ffffff80855d9d98
> [  +0.005466] x27: 0000000000000000 x26: 0000000000fe502a
> [  +0.005458] x25: 0000000000000001 x24: 0000000000000001
> [  +0.005466] x23: 0000000000000001 x22: ffffff808561ce80
> [  +0.005465] x21: 0000000000000000 x20: 0000000000000000
> [  +0.005468] x19: ffffff80850d6800 x18: 0000000000000000
> [  +0.005466] x17: 0000000000000000 x16: 0000000000000000
> [  +0.005465] x15: 000000000000000a x14: 000000000000263b
> [  +0.005466] x13: 0000000000000006 x12: ffffffffffffffff
> [  +0.005465] x11: 0000000000000010 x10: ffffffc090003797
> [  +0.005466] x9 : ffffffed200e2a8c x8 : 0000000000000000
> [  +0.005466] x7 : 00000000ffffffff x6 : ffffffed213b2b51
> [  +0.005465] x5 : c0000000ffffdfff x4 : ffffffed21218048
> [  +0.005465] x3 : 0000000000000000 x2 : 0000000000000000
> [  +0.005465] x1 : 0000000000000000 x0 : 0000000000000000
> [  +0.005466] Call trace:
> [  +0.002520]  drm_update_vblank_count+0x1e4/0x258
> [  +0.004748]  drm_handle_vblank+0xd0/0x35c
> [  +0.004130]  drm_crtc_handle_vblank+0x24/0x30
> [  +0.004487]  dpu_crtc_vblank_callback+0x3c/0xc4
> [  +0.004662]  dpu_encoder_vblank_callback+0x70/0xc4
> [  +0.004931]  dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
> [  +0.005378]  dpu_core_irq_callback_handler+0xf4/0xfc
> [  +0.005107]  dpu_hw_intr_dispatch_irq+0x100/0x120
> [  +0.004834]  dpu_core_irq+0x44/0x5c
> [  +0.003597]  dpu_irq+0x1c/0x28
> [  +0.003141]  msm_irq+0x34/0x40
> [  +0.003153]  __handle_irq_event_percpu+0xfc/0x254
> [  +0.004838]  handle_irq_event_percpu+0x3c/0x94
> [  +0.004574]  handle_irq_event+0x54/0x98
> [  +0.003944]  handle_level_irq+0xa0/0xd0
> [  +0.003943]  generic_handle_irq+0x30/0x48
> [  +0.004131]  dpu_mdss_irq+0xe4/0x118
> [  +0.003684]  generic_handle_irq+0x30/0x48
> [  +0.004127]  __handle_domain_irq+0xa8/0xac
> [  +0.004215]  gic_handle_irq+0xdc/0x150
> [  +0.003856]  el1_irq+0xb4/0x180
> [  +0.003237]  dpu_encoder_vsync_time+0x78/0x230
> [  +0.004574]  dpu_encoder_kickoff+0x190/0x354
> [  +0.004386]  dpu_crtc_commit_kickoff+0x194/0x1a0
> [  +0.004748]  dpu_kms_flush_commit+0xf4/0x108
> [  +0.004390]  msm_atomic_commit_tail+0x2e8/0x384
> [  +0.004661]  commit_tail+0x80/0x108
> [  +0.003588]  drm_atomic_helper_commit+0x118/0x11c
> [  +0.004834]  drm_atomic_commit+0x58/0x68
> [  +0.004033]  drm_atomic_helper_set_config+0x70/0x9c
> [  +0.005018]  drm_mode_setcrtc+0x390/0x584
> [  +0.004131]  drm_ioctl_kernel+0xc8/0x11c
> [  +0.004035]  drm_ioctl+0x2f8/0x34c
> [  +0.003500]  drm_compat_ioctl+0x48/0xe8
> [  +0.003945]  __arm64_compat_sys_ioctl+0xe8/0x104
> [  +0.004750]  el0_svc_common.constprop.0+0x114/0x188
> [  +0.005019]  do_el0_svc_compat+0x28/0x38
> [  +0.004031]  el0_svc_compat+0x20/0x30
> [  +0.003772]  el0_sync_compat_handler+0x104/0x18c
> [  +0.004749]  el0_sync_compat+0x178/0x180
> [  +0.004034] ---[ end trace 2959d178e74f2555 ]---
> 
> 
> BR,
> -R
> 
Hi Rob,

on DPU HW, with prefetch enabled, the frame count increment and vsync 
irq are not happening at same instance. This is causing the frame count 
to mismatch.

Example:
|----###########--^--|----###########--^--|

for the above vsync cycle with prefetch enabled "^" --> marks a fetch 
counter where in we are asking the hw to start fetching in the front 
porch so that we will have more time to fetch data by first active line 
of next frame.

In this case, the vsync irq will be triggered at fetch start marker 
("^") so that double buffered updates are submitted to HW and the frame 
count update will happen at the end of front porch ("|")

to handle this, can we fallback on the SW vblank counter 
(drm_vblank_no_hw_counter) ? another way is to run a static counter in 
the driver irq handler and return that to drm_vblank framework instead 
reading from the HW block.  can you share your thoughts ?

-Kalyan
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 80 
>> ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 30 ++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 11 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  1 +
>>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 17 +++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  5 ++
>>  6 files changed, 144 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index d4662e8..9a80981 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
>>         kfree(dpu_crtc);
>>  }
>> 
>> +static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc 
>> *crtc)
>> +{
>> +       struct drm_device *dev = crtc->dev;
>> +       struct drm_encoder *encoder;
>> +
>> +       drm_for_each_encoder(encoder, dev)
>> +               if (encoder->crtc == crtc)
>> +                       return encoder;
>> +
>> +       return NULL;
>> +}
>> +
>> +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>> +{
>> +       struct drm_encoder *encoder;
>> +
>> +       encoder = get_encoder_from_crtc(crtc);
>> +       if (!encoder) {
>> +               DRM_ERROR("no encoder found for crtc %d\n", 
>> crtc->index);
>> +               return false;
>> +       }
>> +
>> +       return dpu_encoder_get_frame_count(encoder);
>> +}
>> +
>> +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>> +                                          bool in_vblank_irq,
>> +                                          int *vpos, int *hpos,
>> +                                          ktime_t *stime, ktime_t 
>> *etime,
>> +                                          const struct 
>> drm_display_mode *mode)
>> +{
>> +       unsigned int pipe = crtc->index;
>> +       struct drm_encoder *encoder;
>> +       int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
>> +
>> +       encoder = get_encoder_from_crtc(crtc);
>> +       if (!encoder) {
>> +               DRM_ERROR("no encoder found for crtc %d\n", pipe);
>> +               return false;
>> +       }
>> +
>> +       vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
>> +       vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
>> +
>> +       /*
>> +        * the line counter is 1 at the start of the VSYNC pulse and 
>> VTOTAL at
>> +        * the end of VFP. Translate the porch values relative to the 
>> line
>> +        * counter positions.
>> +        */
>> +
>> +       vactive_start = vsw + vbp + 1;
>> +       vactive_end = vactive_start + mode->crtc_vdisplay;
>> +
>> +       /* last scan line before VSYNC */
>> +       vfp_end = mode->crtc_vtotal;
>> +
>> +       if (stime)
>> +               *stime = ktime_get();
>> +
>> +       line = dpu_encoder_get_linecount(encoder);
>> +
>> +       if (line < vactive_start)
>> +               line -= vactive_start;
>> +       else if (line > vactive_end)
>> +               line = line - vfp_end - vactive_start;
>> +       else
>> +               line -= vactive_start;
>> +
>> +       *vpos = line;
>> +       *hpos = 0;
>> +
>> +       if (etime)
>> +               *etime = ktime_get();
>> +
>> +       return true;
>> +}
>> +
>>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>                 struct dpu_plane_state *pstate, struct dpu_format 
>> *format)
>>  {
>> @@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs 
>> dpu_crtc_funcs = {
>>         .early_unregister = dpu_crtc_early_unregister,
>>         .enable_vblank  = msm_crtc_enable_vblank,
>>         .disable_vblank = msm_crtc_disable_vblank,
>> +       .get_vblank_timestamp = 
>> drm_crtc_vblank_helper_get_vblank_timestamp,
>> +       .get_vblank_counter = dpu_crtc_get_vblank_counter,
>>  };
>> 
>>  static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>> @@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs 
>> dpu_crtc_helper_funcs = {
>>         .atomic_check = dpu_crtc_atomic_check,
>>         .atomic_begin = dpu_crtc_atomic_begin,
>>         .atomic_flush = dpu_crtc_atomic_flush,
>> +       .get_scanout_position = dpu_crtc_get_scanout_position,
>>  };
>> 
>>  /* initialize crtc */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index f7f5c25..5cd3f31 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -425,6 +425,36 @@ int dpu_encoder_helper_unregister_irq(struct 
>> dpu_encoder_phys *phys_enc,
>>         return 0;
>>  }
>> 
>> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
>> +{
>> +       struct dpu_encoder_virt *dpu_enc;
>> +       struct dpu_encoder_phys *phys;
>> +       int framecount = 0;
>> +
>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
>> +
>> +       if (phys && phys->ops.get_frame_count)
>> +               framecount = phys->ops.get_frame_count(phys);
>> +
>> +       return framecount;
>> +}
>> +
>> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
>> +{
>> +       struct dpu_encoder_virt *dpu_enc;
>> +       struct dpu_encoder_phys *phys;
>> +       int linecount = 0;
>> +
>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
>> +
>> +       if (phys && phys->ops.get_line_count)
>> +               linecount = phys->ops.get_line_count(phys);
>> +
>> +       return linecount;
>> +}
>> +
>>  void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
>>                                   struct dpu_encoder_hw_resources 
>> *hw_res)
>>  {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index b491346..99a5d73 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct 
>> drm_encoder *drm_enc);
>>   */
>>  void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
>>                                                         u32 
>> idle_timeout);
>> +/**
>> + * dpu_encoder_get_linecount - get interface line count for the 
>> encoder.
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>> +
>> +/**
>> + * dpu_encoder_get_frame_count - get interface frame count for the 
>> encoder.
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>> 
>>  #endif /* __DPU_ENCODER_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index f8f2515..ecbc4be 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -143,6 +143,7 @@ struct dpu_encoder_phys_ops {
>>         void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
>>         void (*restore)(struct dpu_encoder_phys *phys);
>>         int (*get_line_count)(struct dpu_encoder_phys *phys);
>> +       int (*get_frame_count)(struct dpu_encoder_phys *phys);
>>  };
>> 
>>  /**
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index 9a69fad..f983595 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -658,6 +658,22 @@ static int dpu_encoder_phys_vid_get_line_count(
>>         return 
>> phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
>>  }
>> 
>> +static int dpu_encoder_phys_vid_get_frame_count(
>> +               struct dpu_encoder_phys *phys_enc)
>> +{
>> +       struct intf_status s = {0};
>> +
>> +       if (!dpu_encoder_phys_vid_is_master(phys_enc))
>> +               return -EINVAL;
>> +
>> +       if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_status)
>> +               return -EINVAL;
>> +
>> +       phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
>> +
>> +       return s.frame_count;
>> +}
>> +
>>  static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops 
>> *ops)
>>  {
>>         ops->is_master = dpu_encoder_phys_vid_is_master;
>> @@ -676,6 +692,7 @@ static void dpu_encoder_phys_vid_init_ops(struct 
>> dpu_encoder_phys_ops *ops)
>>         ops->handle_post_kickoff = 
>> dpu_encoder_phys_vid_handle_post_kickoff;
>>         ops->needs_single_flush = 
>> dpu_encoder_phys_vid_needs_single_flush;
>>         ops->get_line_count = dpu_encoder_phys_vid_get_line_count;
>> +       ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
>>  }
>> 
>>  struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 374b0e8..764a773 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -14,6 +14,7 @@
>> 
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_vblank.h>
>> 
>>  #include "msm_drv.h"
>>  #include "msm_mmu.h"
>> @@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>          */
>>         dev->mode_config.allow_fb_modifiers = true;
>> 
>> +       dev->max_vblank_count = 0;
>> +       /* Disable vblank irqs aggressively for power-saving */
>> +       dev->vblank_disable_immediate = true;
>> +
>>         /*
>>          * _dpu_kms_drm_obj_init should create the DRM related objects
>>          * i.e. CRTCs, planes, encoders, connectors and so forth
>> --
>> 2.7.4
>> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
