Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7ABF4DABDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 08:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbiCPHcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 03:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244228AbiCPHcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 03:32:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4217333EBC
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 00:31:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt26so2315576lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GmTHvqCrS386fDIWw57GkKXCMyG7EzbNQjkEyeWGQTY=;
        b=Zf1ZXcQkYKUd50ZZ/3Oa7G+DAZjXsF6t/wu3QUh3ydSDNnkj/ASz5BgOzCMgvSfwin
         JuP0o2BH/HLWidXF2Xfur2/N8Bfc1JNKybUUb96IEfDcbRlHIBono4yhrHxoiOMg12tF
         0UZqlN5ys1YoDWUmSrykMdVRTwaAOMsPa9nyZGHSnK1zqMcI4sQfADDhth0RiHm3BZK5
         jgFJ/OHLlqyILkLeYDyUVCjSJg+wXOrBxMtkSO5PF8KmX4wnMAwiuFTd0fEGvaye9or7
         AlnSikWwkvixuIJULD3hFrLWeDYsc2hMbnn2GGNYXNffQSeONc1f6XjKkuTt0JcRyq12
         hG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GmTHvqCrS386fDIWw57GkKXCMyG7EzbNQjkEyeWGQTY=;
        b=4grYfnOx5gsSjnPqTZ+CVGo/WM9lSpdbMOiWe8kUGA4JH+3DXVq/R4O02i5tm+KZb6
         2bbw7aAjR+oqRqR/bIWfdg0CMaE5q8yIotFqXLgQfCvo+72NxixIGWGa0TO7a7rKNC/n
         kKOMGgjjbt/cnE2uv6nQ2xQPgfb/4filAu2OagY+v3WFNKy8CdsxFfQ4WPcP4QBA3cpo
         GSryvEPWJ+QRSDkxB9sJGlzC8V4JOucjShnfhd0fXQhd+uuCHGUW6yhc7CPHD67/hmnA
         BrEpjw5xAw24xIDHvdeC6gkLDEtmFhBJEhXKTOMsYi/5fy3rrXIQSXzdsRwJvAwmbBfO
         v8Xg==
X-Gm-Message-State: AOAM530fW4CCHelooytZ7vLQ7FfWELyUlA2QOYVF7a5uTsNFYWUCjrR1
        pV6T6QJHrp76l5H9H3v4ENxPqQ==
X-Google-Smtp-Source: ABdhPJy50liVPG58YrDePATkasEUSCwDPauyy+d8JhcNsI3eUvJ7bHues4snnUYv938XofY8MQ99mA==
X-Received: by 2002:a05:6512:2249:b0:448:38e7:c4d9 with SMTP id i9-20020a056512224900b0044838e7c4d9mr18703081lfu.540.1647415875451;
        Wed, 16 Mar 2022 00:31:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26-20020ac251ba000000b004484764f56bsm107223lfk.150.2022.03.16.00.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 00:31:14 -0700 (PDT)
Message-ID: <4d3a3fe9-43bb-e796-c5a5-a8e1bdcd4805@linaro.org>
Date:   Wed, 16 Mar 2022 10:31:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 5/5] drm/msm: allow compile time selection of driver
 components
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
 <237c6a57-26c7-bbb9-da51-b098233c390e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <237c6a57-26c7-bbb9-da51-b098233c390e@quicinc.com>
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

On 16/03/2022 03:28, Abhinav Kumar wrote:
> 
> 
> On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
>> MSM DRM driver already allows one to compile out the DP or DSI support.
>> Add support for disabling other features like MDP4/MDP5/DPU drivers or
>> direct HDMI output support.
>>
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/Kconfig    | 50 ++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/Makefile   | 18 ++++++++++--
>>   drivers/gpu/drm/msm/msm_drv.h  | 33 ++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++--
>>   4 files changed, 106 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index 9b019598e042..3735fd41eb3b 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
>>         Only use this if you are a driver developer.  This should *not*
>>         be enabled for production kernels.  If unsure, say N.
>> -config DRM_MSM_HDMI_HDCP
>> -    bool "Enable HDMI HDCP support in MSM DRM driver"
>> +config DRM_MSM_MDSS
>> +    bool
>> +    depends on DRM_MSM
>> +    default n
> shouldnt DRM_MSM_MDSS be defaulted to y?

No, it will be selected either by MDP5 or by DPU1. It is not used if 
DRM_MSM is compiled with just MDP4 or headless support in mind.

> 
> Another question is the compilation validation of the combinations of 
> these.
> 
> So we need to try:
> 
> 1) DRM_MSM_MDSS + DRM_MSM_MDP4
> 2) DRM_MSM_MDSS + DRM_MSM_MDP5
> 3) DRM_MSM_MDSS + DRM_MSM_DPU
> 
> Earlier since all of them were compiled together any inter-dependencies 
> will not show up. Now since we are separating it out, just wanted to 
> make sure each of the combos compile?

I think you meant:
- headless
- MDP4
- MDP5
- DPU1
- MDP4 + MDP5
- MDP4 + DPU1
- MDP5 + DPU1
- all three drivers

> 
>> +
>> +config DRM_MSM_MDP4
>> +    bool "Enable MDP4 support in MSM DRM driver"
>>       depends on DRM_MSM
>>       default y
>>       help
>> -      Choose this option to enable HDCP state machine
>> +      Compile in support for the Mobile Display Processor v4 (MDP4) in
>> +      the MSM DRM driver. It is the older display controller found in
>> +      devices using APQ8064/MSM8960/MSM8x60 platforms.
>> +
>> +config DRM_MSM_MDP5
>> +    bool "Enable MDP5 support in MSM DRM driver"
>> +    depends on DRM_MSM
>> +    select DRM_MSM_MDSS
>> +    default y
>> +    help
>> +      Compile in support for the Mobile Display Processor v5 (MDP4) in
>> +      the MSM DRM driver. It is the display controller found in devices
>> +      using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 
>> platforms.
>> +
>> +config DRM_MSM_DPU
>> +    bool "Enable DPU support in MSM DRM driver"
>> +    depends on DRM_MSM
>> +    select DRM_MSM_MDSS
>> +    default y
>> +    help
>> +      Compile in support for the Display Processing Unit in
>> +      the MSM DRM driver. It is the display controller found in devices
>> +      using e.g. SDM845 and newer platforms.
>>   config DRM_MSM_DP
>>       bool "Enable DisplayPort support in MSM DRM driver"
>> @@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
>>       help
>>         Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
>>         the platform.
>> +
>> +config DRM_MSM_HDMI
>> +    bool "Enable HDMI support in MSM DRM driver"
>> +    depends on DRM_MSM
>> +    default y
>> +    help
>> +      Compile in support for the HDMI output MSM DRM driver. It can
>> +      be a primary or a secondary display on device. Note that this 
>> is used
>> +      only for the direct HDMI output. If the device outputs HDMI data
>> +      throught some kind of DSI-to-HDMI bridge, this option can be 
>> disabled.
>> +
>> +config DRM_MSM_HDMI_HDCP
>> +    bool "Enable HDMI HDCP support in MSM DRM driver"
>> +    depends on DRM_MSM && DRM_MSM_HDMI
>> +    default y
>> +    help
>> +      Choose this option to enable HDCP state machine
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index e76927b42033..5fe9c20ab9ee 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -16,6 +16,8 @@ msm-y := \
>>       adreno/a6xx_gpu.o \
>>       adreno/a6xx_gmu.o \
>>       adreno/a6xx_hfi.o \
>> +
>> +msm-$(CONFIG_DRM_MSM_HDMI) += \
>>       hdmi/hdmi.o \
>>       hdmi/hdmi_audio.o \
>>       hdmi/hdmi_bridge.o \
>> @@ -27,8 +29,8 @@ msm-y := \
>>       hdmi/hdmi_phy_8x60.o \
>>       hdmi/hdmi_phy_8x74.o \
>>       hdmi/hdmi_pll_8960.o \
>> -    disp/mdp_format.o \
>> -    disp/mdp_kms.o \
>> +
>> +msm-$(CONFIG_DRM_MSM_MDP4) += \
>>       disp/mdp4/mdp4_crtc.o \
>>       disp/mdp4/mdp4_dtv_encoder.o \
>>       disp/mdp4/mdp4_lcdc_encoder.o \
>> @@ -37,6 +39,8 @@ msm-y := \
>>       disp/mdp4/mdp4_irq.o \
>>       disp/mdp4/mdp4_kms.o \
>>       disp/mdp4/mdp4_plane.o \
>> +
>> +msm-$(CONFIG_DRM_MSM_MDP5) += \
>>       disp/mdp5/mdp5_cfg.o \
>>       disp/mdp5/mdp5_ctl.o \
>>       disp/mdp5/mdp5_crtc.o \
>> @@ -47,6 +51,8 @@ msm-y := \
>>       disp/mdp5/mdp5_mixer.o \
>>       disp/mdp5/mdp5_plane.o \
>>       disp/mdp5/mdp5_smp.o \
>> +
>> +msm-$(CONFIG_DRM_MSM_DPU) += \
>>       disp/dpu1/dpu_core_perf.o \
>>       disp/dpu1/dpu_crtc.o \
>>       disp/dpu1/dpu_encoder.o \
>> @@ -69,6 +75,13 @@ msm-y := \
>>       disp/dpu1/dpu_plane.o \
>>       disp/dpu1/dpu_rm.o \
>>       disp/dpu1/dpu_vbif.o \
>> +
>> +msm-$(CONFIG_DRM_MSM_MDSS) += \
>> +    msm_mdss.o \
>> +
>> +msm-y += \
>> +    disp/mdp_format.o \
>> +    disp/mdp_kms.o \
>>       disp/msm_disp_snapshot.o \
>>       disp/msm_disp_snapshot_util.o \
>>       msm_atomic.o \
>> @@ -86,7 +99,6 @@ msm-y := \
>>       msm_gpu_devfreq.o \
>>       msm_io_utils.o \
>>       msm_iommu.o \
>> -    msm_mdss.o \
>>       msm_perf.o \
>>       msm_rd.o \
>>       msm_ringbuffer.o \
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index c1aaadfbea34..6bad7e7b479d 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct 
>> drm_device *dev);
>>   void msm_fbdev_free(struct drm_device *dev);
>>   struct hdmi;
>> +#ifdef CONFIG_DRM_MSM_HDMI
>>   int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
>>           struct drm_encoder *encoder);
>>   void __init msm_hdmi_register(void);
>>   void __exit msm_hdmi_unregister(void);
>> +#else
>> +static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct 
>> drm_device *dev,
>> +        struct drm_encoder *encoder)
>> +{
>> +    return -EINVAL;
>> +}
>> +static inline void __init msm_hdmi_register(void) {}
>> +static inline void __exit msm_hdmi_unregister(void) {}
>> +#endif
>>   struct msm_dsi;
>>   #ifdef CONFIG_DRM_MSM_DSI
>> @@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct 
>> msm_dp *dp_display,
>>   #endif
>> +#ifdef CONFIG_DRM_MSM_MDP4
>>   void msm_mdp4_register(void);
>>   void msm_mdp4_unregister(void);
>> +#else
>> +static inline void msm_mdp4_register(void) {}
>> +static inline void msm_mdp4_unregister(void) {}
>> +#endif
>> +
>> +#ifdef CONFIG_DRM_MSM_MDP5
>>   void msm_mdp_register(void);
>>   void msm_mdp_unregister(void);
>> +#else
>> +static inline void msm_mdp_register(void) {}
>> +static inline void msm_mdp_unregister(void) {}
>> +#endif
>> +
>> +#ifdef CONFIG_DRM_MSM_DPU
>>   void msm_dpu_register(void);
>>   void msm_dpu_unregister(void);
>> +#else
>> +static inline void msm_dpu_register(void) {}
>> +static inline void msm_dpu_unregister(void) {}
>> +#endif
>> +
>> +#ifdef CONFIG_DRM_MSM_MDSS
>>   void msm_mdss_register(void);
>>   void msm_mdss_unregister(void);
>> +#else
>> +static inline void msm_mdss_register(void) {}
>> +static inline void msm_mdss_unregister(void) {}
>> +#endif
>>   #ifdef CONFIG_DEBUG_FS
>>   void msm_framebuffer_describe(struct drm_framebuffer *fb, struct 
>> seq_file *m);
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>> b/drivers/gpu/drm/msm/msm_mdss.c
>> index 4d25d8955301..66714b356762 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
>>   static int find_mdp_node(struct device *dev, void *data)
>>   {
>> -    return of_match_node(dpu_dt_match, dev->of_node) ||
>> -        of_match_node(mdp5_dt_match, dev->of_node);
>> +#ifdef CONFIG_DRM_MSM_DPU
>> +    if (of_match_node(dpu_dt_match, dev->of_node))
>> +        return true;
>> +#endif
>> +
>> +#ifdef CONFIG_DRM_MSM_MDP5
>> +    if (of_match_node(mdp5_dt_match, dev->of_node))
>> +        return true;
>> +#endif
>> +
>> +    return false;
>>   }
>>   static int mdss_probe(struct platform_device *pdev)


-- 
With best wishes
Dmitry
