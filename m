Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DB24DB71B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 18:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244128AbiCPR2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 13:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbiCPR2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 13:28:15 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648B71EEF6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 10:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647451620; x=1678987620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mwzxoxcurfDvYM52+QfKZP/RRPcSyKQu64Hl5G6N4c8=;
  b=YHSBYLP5/7l9OWAgluwrTuxubBHe5vcrsNKib525jfvexwImSnGIFwV1
   LooqhH/AQAzvUGYKiPg8mD0P7pI7onm9Qs1fXLBWCWgZB3EFzOKhCAE7B
   1Bur2xVq1MTPxPqRcgVoESeqg3b6J4WLOJclOCdoaelCTwTD+Bgsnq1/o
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 10:27:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 10:26:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:26:59 -0700
Received: from [10.110.116.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 10:26:58 -0700
Message-ID: <063a761c-0591-79e4-dcfc-1587a60d605a@quicinc.com>
Date:   Wed, 16 Mar 2022 10:26:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3 5/5] drm/msm: allow compile time selection
 of driver components
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
 <237c6a57-26c7-bbb9-da51-b098233c390e@quicinc.com>
 <4d3a3fe9-43bb-e796-c5a5-a8e1bdcd4805@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <4d3a3fe9-43bb-e796-c5a5-a8e1bdcd4805@linaro.org>
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



On 3/16/2022 12:31 AM, Dmitry Baryshkov wrote:
> On 16/03/2022 03:28, Abhinav Kumar wrote:
>>
>>
>> On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
>>> MSM DRM driver already allows one to compile out the DP or DSI support.
>>> Add support for disabling other features like MDP4/MDP5/DPU drivers or
>>> direct HDMI output support.
>>>
>>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/Kconfig    | 50 ++++++++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/msm/Makefile   | 18 ++++++++++--
>>>   drivers/gpu/drm/msm/msm_drv.h  | 33 ++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++--
>>>   4 files changed, 106 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>> index 9b019598e042..3735fd41eb3b 100644
>>> --- a/drivers/gpu/drm/msm/Kconfig
>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>> @@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
>>>         Only use this if you are a driver developer.  This should *not*
>>>         be enabled for production kernels.  If unsure, say N.
>>> -config DRM_MSM_HDMI_HDCP
>>> -    bool "Enable HDMI HDCP support in MSM DRM driver"
>>> +config DRM_MSM_MDSS
>>> +    bool
>>> +    depends on DRM_MSM
>>> +    default n
>> shouldnt DRM_MSM_MDSS be defaulted to y?
> 
> No, it will be selected either by MDP5 or by DPU1. It is not used if 
> DRM_MSM is compiled with just MDP4 or headless support in mind.
Ok got it.
> 
>>
>> Another question is the compilation validation of the combinations of 
>> these.
>>
>> So we need to try:
>>
>> 1) DRM_MSM_MDSS + DRM_MSM_MDP4
>> 2) DRM_MSM_MDSS + DRM_MSM_MDP5
>> 3) DRM_MSM_MDSS + DRM_MSM_DPU
>>
>> Earlier since all of them were compiled together any 
>> inter-dependencies will not show up. Now since we are separating it 
>> out, just wanted to make sure each of the combos compile?
> 
> I think you meant:
> - headless
> - MDP4
> - MDP5
> - DPU1
> - MDP4 + MDP5
> - MDP4 + DPU1
> - MDP5 + DPU1
> - all three drivers
> 
Yes, each of these combinations.
>>
>>> +
>>> +config DRM_MSM_MDP4
>>> +    bool "Enable MDP4 support in MSM DRM driver"
>>>       depends on DRM_MSM
>>>       default y
>>>       help
>>> -      Choose this option to enable HDCP state machine
>>> +      Compile in support for the Mobile Display Processor v4 (MDP4) in
>>> +      the MSM DRM driver. It is the older display controller found in
>>> +      devices using APQ8064/MSM8960/MSM8x60 platforms.
>>> +
>>> +config DRM_MSM_MDP5
>>> +    bool "Enable MDP5 support in MSM DRM driver"
>>> +    depends on DRM_MSM
>>> +    select DRM_MSM_MDSS
>>> +    default y
>>> +    help
>>> +      Compile in support for the Mobile Display Processor v5 (MDP4) in
>>> +      the MSM DRM driver. It is the display controller found in devices
>>> +      using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 
>>> platforms.
>>> +
>>> +config DRM_MSM_DPU
>>> +    bool "Enable DPU support in MSM DRM driver"
>>> +    depends on DRM_MSM
>>> +    select DRM_MSM_MDSS
>>> +    default y
>>> +    help
>>> +      Compile in support for the Display Processing Unit in
>>> +      the MSM DRM driver. It is the display controller found in devices
>>> +      using e.g. SDM845 and newer platforms.
>>>   config DRM_MSM_DP
>>>       bool "Enable DisplayPort support in MSM DRM driver"
>>> @@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
>>>       help
>>>         Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
>>>         the platform.
>>> +
>>> +config DRM_MSM_HDMI
>>> +    bool "Enable HDMI support in MSM DRM driver"
>>> +    depends on DRM_MSM
>>> +    default y
>>> +    help
>>> +      Compile in support for the HDMI output MSM DRM driver. It can
>>> +      be a primary or a secondary display on device. Note that this 
>>> is used
>>> +      only for the direct HDMI output. If the device outputs HDMI data
>>> +      throught some kind of DSI-to-HDMI bridge, this option can be 
>>> disabled.
>>> +
>>> +config DRM_MSM_HDMI_HDCP
>>> +    bool "Enable HDMI HDCP support in MSM DRM driver"
>>> +    depends on DRM_MSM && DRM_MSM_HDMI
>>> +    default y
>>> +    help
>>> +      Choose this option to enable HDCP state machine
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index e76927b42033..5fe9c20ab9ee 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -16,6 +16,8 @@ msm-y := \
>>>       adreno/a6xx_gpu.o \
>>>       adreno/a6xx_gmu.o \
>>>       adreno/a6xx_hfi.o \
>>> +
>>> +msm-$(CONFIG_DRM_MSM_HDMI) += \
>>>       hdmi/hdmi.o \
>>>       hdmi/hdmi_audio.o \
>>>       hdmi/hdmi_bridge.o \
>>> @@ -27,8 +29,8 @@ msm-y := \
>>>       hdmi/hdmi_phy_8x60.o \
>>>       hdmi/hdmi_phy_8x74.o \
>>>       hdmi/hdmi_pll_8960.o \
>>> -    disp/mdp_format.o \
>>> -    disp/mdp_kms.o \
>>> +
>>> +msm-$(CONFIG_DRM_MSM_MDP4) += \
>>>       disp/mdp4/mdp4_crtc.o \
>>>       disp/mdp4/mdp4_dtv_encoder.o \
>>>       disp/mdp4/mdp4_lcdc_encoder.o \
>>> @@ -37,6 +39,8 @@ msm-y := \
>>>       disp/mdp4/mdp4_irq.o \
>>>       disp/mdp4/mdp4_kms.o \
>>>       disp/mdp4/mdp4_plane.o \
>>> +
>>> +msm-$(CONFIG_DRM_MSM_MDP5) += \
>>>       disp/mdp5/mdp5_cfg.o \
>>>       disp/mdp5/mdp5_ctl.o \
>>>       disp/mdp5/mdp5_crtc.o \
>>> @@ -47,6 +51,8 @@ msm-y := \
>>>       disp/mdp5/mdp5_mixer.o \
>>>       disp/mdp5/mdp5_plane.o \
>>>       disp/mdp5/mdp5_smp.o \
>>> +
>>> +msm-$(CONFIG_DRM_MSM_DPU) += \
>>>       disp/dpu1/dpu_core_perf.o \
>>>       disp/dpu1/dpu_crtc.o \
>>>       disp/dpu1/dpu_encoder.o \
>>> @@ -69,6 +75,13 @@ msm-y := \
>>>       disp/dpu1/dpu_plane.o \
>>>       disp/dpu1/dpu_rm.o \
>>>       disp/dpu1/dpu_vbif.o \
>>> +
>>> +msm-$(CONFIG_DRM_MSM_MDSS) += \
>>> +    msm_mdss.o \
>>> +
>>> +msm-y += \
>>> +    disp/mdp_format.o \
>>> +    disp/mdp_kms.o \
>>>       disp/msm_disp_snapshot.o \
>>>       disp/msm_disp_snapshot_util.o \
>>>       msm_atomic.o \
>>> @@ -86,7 +99,6 @@ msm-y := \
>>>       msm_gpu_devfreq.o \
>>>       msm_io_utils.o \
>>>       msm_iommu.o \
>>> -    msm_mdss.o \
>>>       msm_perf.o \
>>>       msm_rd.o \
>>>       msm_ringbuffer.o \
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>>> b/drivers/gpu/drm/msm/msm_drv.h
>>> index c1aaadfbea34..6bad7e7b479d 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct 
>>> drm_device *dev);
>>>   void msm_fbdev_free(struct drm_device *dev);
>>>   struct hdmi;
>>> +#ifdef CONFIG_DRM_MSM_HDMI
>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
>>>           struct drm_encoder *encoder);
>>>   void __init msm_hdmi_register(void);
>>>   void __exit msm_hdmi_unregister(void);
>>> +#else
>>> +static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct 
>>> drm_device *dev,
>>> +        struct drm_encoder *encoder)
>>> +{
>>> +    return -EINVAL;
>>> +}
>>> +static inline void __init msm_hdmi_register(void) {}
>>> +static inline void __exit msm_hdmi_unregister(void) {}
>>> +#endif
>>>   struct msm_dsi;
>>>   #ifdef CONFIG_DRM_MSM_DSI
>>> @@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct 
>>> msm_dp *dp_display,
>>>   #endif
>>> +#ifdef CONFIG_DRM_MSM_MDP4
>>>   void msm_mdp4_register(void);
>>>   void msm_mdp4_unregister(void);
>>> +#else
>>> +static inline void msm_mdp4_register(void) {}
>>> +static inline void msm_mdp4_unregister(void) {}
>>> +#endif
>>> +
>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>>   void msm_mdp_register(void);
>>>   void msm_mdp_unregister(void);
>>> +#else
>>> +static inline void msm_mdp_register(void) {}
>>> +static inline void msm_mdp_unregister(void) {}
>>> +#endif
>>> +
>>> +#ifdef CONFIG_DRM_MSM_DPU
>>>   void msm_dpu_register(void);
>>>   void msm_dpu_unregister(void);
>>> +#else
>>> +static inline void msm_dpu_register(void) {}
>>> +static inline void msm_dpu_unregister(void) {}
>>> +#endif
>>> +
>>> +#ifdef CONFIG_DRM_MSM_MDSS
>>>   void msm_mdss_register(void);
>>>   void msm_mdss_unregister(void);
>>> +#else
>>> +static inline void msm_mdss_register(void) {}
>>> +static inline void msm_mdss_unregister(void) {}
>>> +#endif
>>>   #ifdef CONFIG_DEBUG_FS
>>>   void msm_framebuffer_describe(struct drm_framebuffer *fb, struct 
>>> seq_file *m);
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>>> b/drivers/gpu/drm/msm/msm_mdss.c
>>> index 4d25d8955301..66714b356762 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
>>>   static int find_mdp_node(struct device *dev, void *data)
>>>   {
>>> -    return of_match_node(dpu_dt_match, dev->of_node) ||
>>> -        of_match_node(mdp5_dt_match, dev->of_node);
>>> +#ifdef CONFIG_DRM_MSM_DPU
>>> +    if (of_match_node(dpu_dt_match, dev->of_node))
>>> +        return true;
>>> +#endif
>>> +
>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>> +    if (of_match_node(mdp5_dt_match, dev->of_node))
>>> +        return true;
>>> +#endif
>>> +
>>> +    return false;
>>>   }
>>>   static int mdss_probe(struct platform_device *pdev)
> 
> 
