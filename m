Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C934BAAD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 21:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242698AbiBQUZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 15:25:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242714AbiBQUZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 15:25:09 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05C61662EA;
        Thu, 17 Feb 2022 12:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645129493; x=1676665493;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RstYiitqrHp46y7CZV1tpZwmk6wQ27JH6of+N2kAaek=;
  b=ohjQUZ7qQkf5r961vfLaT44rd2T6wF8kqOGhggjqm8KvasSDAzG2vQBM
   krq1f3Ml4GTwxB8DSkETe0eNyUYSfHyV7JVZvpJA5LnZck0tSufhHZGLe
   y0R6rHh9IGmfY7ayByHEbwAlnLX/e6FhStsIH1Ze8x8tSVyu4aEJa67dM
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Feb 2022 12:24:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 12:24:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 12:24:52 -0800
Received: from [10.110.101.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 17 Feb
 2022 12:24:51 -0800
Message-ID: <4d1a9755-46a1-edba-75fb-518a5ee49b93@quicinc.com>
Date:   Thu, 17 Feb 2022 12:24:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 1/4] drm/msm/dpu: revise timing engine programming to
 support widebus feature
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
 <1645049106-30481-2-git-send-email-quic_khsieh@quicinc.com>
 <93f24388-2e64-ca1a-84a4-174457e096d8@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <93f24388-2e64-ca1a-84a4-174457e096d8@linaro.org>
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


On 2/16/2022 10:34 PM, Dmitry Baryshkov wrote:
> On 17/02/2022 01:05, Kuogee Hsieh wrote:
>> Widebus feature will transmit two pixel data per pixel clock to 
>> interface.
>> Timing engine provides driving force for this purpose. This patch base
>> on HPG (Hardware Programming Guide) to revise timing engine register
>> setting to accommodate both widebus and non widebus application. Also
>> horizontal width parameters need to be reduced by half since two pixel
>> data are clocked out per pixel clock when widebus feature enabled.
>>
>> Widebus can be enabled individually at DP. However at DSI, widebus have
>> to be enabled along with DSC to achieve pixel clock rate be scaled down
>> with same ratio as compression ratio when 10 bits per source component.
>> Therefore this patch add no supports of DSI related widebus and 
>> compression.
>>
>> Changes in v2:
>> -- remove compression related code from timing
>> -- remove op_info from  struct msm_drm_private
>> -- remove unnecessary wide_bus_en variables
>> -- pass wide_bus_en into timing configuration by struct msm_dp
>>
>> Changes in v3:
>> -- split patch into 3 patches
>>
>> Changes in v4:
>> -- rework timing engine to not interfere with dsi/hdmi
>> -- cover both widebus and compression
>>
>> Changes in v5:
>> -- remove supports of DSI widebus and compression
>>
>> Changes in v7:
>> -- split this patch into 3 patches
>> -- add Tested-by
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 55 
>> ++++++++++++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
>>   5 files changed, 68 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1e648db..2b2dbb7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -208,6 +208,8 @@ struct dpu_encoder_virt {
>>         u32 idle_timeout;
>>   +    bool wide_bus_en;
>> +
>>       struct msm_dp *dp;
>>   };
>>   @@ -217,6 +219,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>   };
>>   +
>> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +    return dpu_enc->wide_bus_en;
>> +}
>> +
>>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong 
>> *hw_pp, unsigned bpc)
>>   {
>>       struct dpu_hw_dither_cfg dither_cfg = { 0 };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index e241914..0d73550 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder 
>> *drm_enc);
>>    */
>>   int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>>   +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
>> +
>>   #endif /* __DPU_ENCODER_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index ddd9d89..04ac2dc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -110,6 +110,20 @@ static void drm_mode_to_intf_timing_params(
>>           timing->v_back_porch += timing->v_front_porch;
>>           timing->v_front_porch = 0;
>>       }
>> +
>> +    timing->wide_bus_en = 
>> dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +
>> +    /*
>> +     * for DP, divide the horizonal parameters by 2 when
>> +     * widebus is enabled
>> +     */
>> +    if (phys_enc->hw_intf->cap->type == INTF_DP && 
>> timing->wide_bus_en) {
>> +        timing->width = timing->width >> 1;
>> +        timing->xres = timing->xres >> 1;
>> +        timing->h_back_porch = timing->h_back_porch >> 1;
>> +        timing->h_front_porch = timing->h_front_porch >> 1;
>> +        timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>> +    }
>>   }
>>     static u32 get_horizontal_total(const struct intf_timing_params 
>> *timing)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 116e2b5..b68e696 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -33,6 +33,7 @@
>>   #define INTF_TP_COLOR1                  0x05C
>>   #define INTF_CONFIG2                    0x060
>>   #define INTF_DISPLAY_DATA_HCTL          0x064
>> +#define INTF_ACTIVE_DATA_HCTL           0x068
>>   #define INTF_FRAME_LINE_COUNT_EN        0x0A8
>>   #define INTF_FRAME_COUNT                0x0AC
>>   #define   INTF_LINE_COUNT               0x0B0
>> @@ -90,15 +91,23 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>       u32 hsync_period, vsync_period;
>>       u32 display_v_start, display_v_end;
>>       u32 hsync_start_x, hsync_end_x;
>> +    u32 hsync_data_start_x, hsync_data_end_x;
>>       u32 active_h_start, active_h_end;
>>       u32 active_v_start, active_v_end;
>>       u32 active_hctl, display_hctl, hsync_ctl;
>>       u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
>>       u32 panel_format;
>> -    u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
>> +    u32 intf_cfg, intf_cfg2 = 0;
>> +    u32 display_data_hctl = 0, active_data_hctl = 0;
>> +    u32 data_width;
>> +    bool dp_intf = false;
>>         /* read interface_cfg */
>>       intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>> +
>> +    if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
>> +        dp_intf = true;
>> +
>>       hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
>>       p->h_front_porch;
>>       vsync_period = p->vsync_pulse_width + p->v_back_porch + 
>> p->height +
>> @@ -112,7 +121,7 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>       hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>>       hsync_end_x = hsync_period - p->h_front_porch - 1;
>>   -    if (p->width != p->xres) {
>> +    if (p->width != p->xres) { /* border fill added */
>>           active_h_start = hsync_start_x;
>>           active_h_end = active_h_start + p->xres - 1;
>>       } else {
>> @@ -120,7 +129,7 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>           active_h_end = 0;
>>       }
>>   -    if (p->height != p->yres) {
>> +    if (p->height != p->yres) { /* border fill added */
>>           active_v_start = display_v_start;
>>           active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>       } else {
>> @@ -130,27 +139,47 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>         if (active_h_end) {
>>           active_hctl = (active_h_end << 16) | active_h_start;
>> -        intf_cfg |= BIT(29);    /* ACTIVE_H_ENABLE */
>> +        intf_cfg |= BIT(29);
>>       } else {
>>           active_hctl = 0;
>>       }
>>         if (active_v_end)
>> -        intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
>> +        intf_cfg |= BIT(30);
>>         hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>       display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>   -    if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
>> +    /*
>> +     * DATA_HCTL_EN controls data timing which can be different from
>> +     * video timing. It is recommended to enable it for all cases, 
>> except
>> +     * if compression is enabled in 1 pixel per clock mode
>> +     */
>> +    if (p->wide_bus_en)
>> +        intf_cfg2 |=  (BIT(0) | BIT(4));
>
> Previously the HCTL_EN was set even for non-wide-bus cases. Was this 
> incorrect? Should we set it only for the wide bus case?

When widebus enable, then DATA_HCTL_EN must be enabled, since data and 
video  timing is different.

DATA_HCTL_EN can be enabled at other case too as long as data and video 
timing are same.

the only except is at compression is enabled in 1 pixel per clock mode 
as comment said

>
>> +
>> +    data_width = p->width;
>> +
>> +    hsync_data_start_x = hsync_start_x;
>> +    hsync_data_end_x =  hsync_start_x + data_width - 1;
>> +
>> +    display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>> +
>> +    if (dp_intf) {
>> +        /* DP timing adjustment */
>> +        display_v_start += p->hsync_pulse_width + p->h_back_porch;
>> +        display_v_end   -= p->h_front_porch;
>
> Quoting a question to v4:
> So, this changes the display_v_end. Is there a mistake currently (and
> so this change should be backported to stable kernels) or is it just
> unoptimal?

I think previous does not have display_v_end adjusted for DP.

I will add a patch to fix this, then this patch can be back ported to 
stable kernel.



>
>> +
>>           active_h_start = hsync_start_x;
>>           active_h_end = active_h_start + p->xres - 1;
>>           active_v_start = display_v_start;
>>           active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>   -        display_v_start += p->hsync_pulse_width + p->h_back_porch;
>> -
>>           active_hctl = (active_h_end << 16) | active_h_start;
>>           display_hctl = active_hctl;
>> +
>> +        intf_cfg |= BIT(29);
>> +        intf_cfg |= BIT(30);
>
> Could you please add defines for _new_ bits in this patch.
>
>>       }
>>         den_polarity = 0;
>> @@ -180,13 +209,6 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>                   (COLOR_8BIT << 4) |
>>                   (0x21 << 8));
>>   -    if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>> -        intf_cfg2 |= BIT(4);
>> -        display_data_hctl = display_hctl;
>> -        DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>> -        DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
>> -    }
>> -
>>       DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
>>       DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * 
>> hsync_period);
>>       DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
>> @@ -204,6 +226,9 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>       DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>>       DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>>       DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
>> +    DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>> +    DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
>> +    DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>
> Which generations received these registers? I'd be more comfortable if 
> the driver didn't write into the registers that are not handled by the 
> hardware. The rest of DPU driver does exactly that.
>
> Could you please add a check in the beginning of this function to 
> print and error message if wide bus is enabled, but DPU_DATA_HCTL_EN 
> is not supported. And move these writes under features check.
>
ok
>>   }
>>     static void dpu_hw_intf_enable_timing_engine(
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 3568be8..e4a518a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -30,6 +30,8 @@ struct intf_timing_params {
>>       u32 border_clr;
>>       u32 underflow_clr;
>>       u32 hsync_skew;
>> +
>> +    bool wide_bus_en;
>>   };
>>     struct intf_prog_fetch {
>
>
