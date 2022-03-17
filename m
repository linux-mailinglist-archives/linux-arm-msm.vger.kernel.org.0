Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97114DCA3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 16:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbiCQPoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 11:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiCQPog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 11:44:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE09D9E92
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 08:43:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r22so7772810ljd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=lCpqAlRaI4P8B9UKX7hIuglb6Z9rSVji533HAj9CHeU=;
        b=P28XkeWjYFlwXz4ViOvczSeLhs7tAJ2V92qkmXQPyCgH0lqyvOg6phWcEIzwKU8gyk
         LnxKTYiVSVaziIdJt3Nt1kZo8SsC8IT0+Tdoc+UrYQM7ElWX7d1vSj4SxaThN09iJYg4
         HsfN5imPpddShwSgAMd43Xg+vW+stiAVsh5ps4BF49OjcOaQ0cW/gBkmgw2fV+BJGWts
         PVrv1KcVE29NmzEFG/ttQG15F/LTqQ0j7HE5JzcCFeeq+AazGvrGG8SG/fflv6bdoe/N
         /VotF5VH6lLgSg6GcfJ+7gx1hw7lQI62xf1+oF7xwRUjDuj4HYO5Qoo/4qHSuo13F7Y0
         Rwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=lCpqAlRaI4P8B9UKX7hIuglb6Z9rSVji533HAj9CHeU=;
        b=GwtbDa8qy0/A3yOzaSjMxbMDY1Y+Z66jO6QXkMAhqefHgRHtTSxNmkaJuEqaXmLwYc
         dtLxEuU89m/e0iAhAMXFLsItaejp+9UFO/2qBmelNpqWn85SloNpmbH9Ipc1NVCu7Gvx
         fPr12LVEr91Ppfu07wlP8aEUX16/lNB8eJR7R7VbnwP4Bo076hWa097gYpvsU1i8cuOK
         /GSvw0Y+wHakUpgCMiduaM/N/2V7kKstDQGTpeiUCEK75DOu+IeH+BUmS41v10tpmKnw
         GbLQPchDfMoIRAj6cY+iEKGqGCTwLJoJGkfyZtt4KLKgEGYKqDBwJ4wEki7IfFaK0Q1E
         8Obg==
X-Gm-Message-State: AOAM533rEKRuyw55LQjgGmkOE/AaMorRCXWr5uSrMH1AYMuKle5RzKP9
        rXysEYJwtoSAYopSiXpGl+Qoxg==
X-Google-Smtp-Source: ABdhPJyGl8UPtNq8SAQIrOv8tEjhVwJepRBH0TqYD7EqaIrrhjccNSlyeNpX6m0d1++BQ88HgRl4lQ==
X-Received: by 2002:a2e:8547:0:b0:248:b0a:bc45 with SMTP id u7-20020a2e8547000000b002480b0abc45mr3286785ljj.271.1647531797031;
        Thu, 17 Mar 2022 08:43:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26-20020ac251ba000000b004484764f56bsm475705lfk.150.2022.03.17.08.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 08:43:16 -0700 (PDT)
Message-ID: <7f47bcbb-72e9-6aed-02dc-a302befe792a@linaro.org>
Date:   Thu, 17 Mar 2022 18:43:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3 5/5] drm/msm: allow compile time selection
 of driver components
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
 <237c6a57-26c7-bbb9-da51-b098233c390e@quicinc.com>
 <4d3a3fe9-43bb-e796-c5a5-a8e1bdcd4805@linaro.org>
 <063a761c-0591-79e4-dcfc-1587a60d605a@quicinc.com>
 <c5a5cec0-5143-1511-a66d-674dd23e83a8@linaro.org>
In-Reply-To: <c5a5cec0-5143-1511-a66d-674dd23e83a8@linaro.org>
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

On 17/03/2022 15:44, Dmitry Baryshkov wrote:
> On 16/03/2022 20:26, Abhinav Kumar wrote:
>>
>>
>> On 3/16/2022 12:31 AM, Dmitry Baryshkov wrote:
>>> On 16/03/2022 03:28, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
>>>>> MSM DRM driver already allows one to compile out the DP or DSI 
>>>>> support.
>>>>> Add support for disabling other features like MDP4/MDP5/DPU drivers or
>>>>> direct HDMI output support.
>>>>>
>>>>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/Kconfig    | 50 
>>>>> ++++++++++++++++++++++++++++++++--
>>>>>   drivers/gpu/drm/msm/Makefile   | 18 ++++++++++--
>>>>>   drivers/gpu/drm/msm/msm_drv.h  | 33 ++++++++++++++++++++++
>>>>>   drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++--
>>>>>   4 files changed, 106 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>>>> index 9b019598e042..3735fd41eb3b 100644
>>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>>> @@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
>>>>>         Only use this if you are a driver developer.  This should 
>>>>> *not*
>>>>>         be enabled for production kernels.  If unsure, say N.
>>>>> -config DRM_MSM_HDMI_HDCP
>>>>> -    bool "Enable HDMI HDCP support in MSM DRM driver"
>>>>> +config DRM_MSM_MDSS
>>>>> +    bool
>>>>> +    depends on DRM_MSM
>>>>> +    default n
>>>> shouldnt DRM_MSM_MDSS be defaulted to y?
>>>
>>> No, it will be selected either by MDP5 or by DPU1. It is not used if 
>>> DRM_MSM is compiled with just MDP4 or headless support in mind.
>> Ok got it.
>>>
>>>>
>>>> Another question is the compilation validation of the combinations 
>>>> of these.
>>>>
>>>> So we need to try:
>>>>
>>>> 1) DRM_MSM_MDSS + DRM_MSM_MDP4
>>>> 2) DRM_MSM_MDSS + DRM_MSM_MDP5
>>>> 3) DRM_MSM_MDSS + DRM_MSM_DPU
>>>>
>>>> Earlier since all of them were compiled together any 
>>>> inter-dependencies will not show up. Now since we are separating it 
>>>> out, just wanted to make sure each of the combos compile?
>>>
>>> I think you meant:
>>> - headless
>>> - MDP4
>>> - MDP5
>>> - DPU1
>>> - MDP4 + MDP5
>>> - MDP4 + DPU1
>>> - MDP5 + DPU1
>>> - all three drivers
>>>
>> Yes, each of these combinations.
> 
> Each of them was tested.

Hmm. It looks like I had DSI disabled during the tests. Will fix it up.

> 
>>>>
>>>>> +
>>>>> +config DRM_MSM_MDP4
>>>>> +    bool "Enable MDP4 support in MSM DRM driver"
>>>>>       depends on DRM_MSM
>>>>>       default y
>>>>>       help
>>>>> -      Choose this option to enable HDCP state machine
>>>>> +      Compile in support for the Mobile Display Processor v4 
>>>>> (MDP4) in
>>>>> +      the MSM DRM driver. It is the older display controller found in
>>>>> +      devices using APQ8064/MSM8960/MSM8x60 platforms.
>>>>> +
>>>>> +config DRM_MSM_MDP5
>>>>> +    bool "Enable MDP5 support in MSM DRM driver"
>>>>> +    depends on DRM_MSM
>>>>> +    select DRM_MSM_MDSS
>>>>> +    default y
>>>>> +    help
>>>>> +      Compile in support for the Mobile Display Processor v5 
>>>>> (MDP4) in
>>>>> +      the MSM DRM driver. It is the display controller found in 
>>>>> devices
>>>>> +      using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 
>>>>> platforms.
>>>>> +
>>>>> +config DRM_MSM_DPU
>>>>> +    bool "Enable DPU support in MSM DRM driver"
>>>>> +    depends on DRM_MSM
>>>>> +    select DRM_MSM_MDSS
>>>>> +    default y
>>>>> +    help
>>>>> +      Compile in support for the Display Processing Unit in
>>>>> +      the MSM DRM driver. It is the display controller found in 
>>>>> devices
>>>>> +      using e.g. SDM845 and newer platforms.
>>>>>   config DRM_MSM_DP
>>>>>       bool "Enable DisplayPort support in MSM DRM driver"
>>>>> @@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
>>>>>       help
>>>>>         Choose this option if DSI PHY on SM8150/SM8250/SC7280 is 
>>>>> used on
>>>>>         the platform.
>>>>> +
>>>>> +config DRM_MSM_HDMI
>>>>> +    bool "Enable HDMI support in MSM DRM driver"
>>>>> +    depends on DRM_MSM
>>>>> +    default y
>>>>> +    help
>>>>> +      Compile in support for the HDMI output MSM DRM driver. It can
>>>>> +      be a primary or a secondary display on device. Note that 
>>>>> this is used
>>>>> +      only for the direct HDMI output. If the device outputs HDMI 
>>>>> data
>>>>> +      throught some kind of DSI-to-HDMI bridge, this option can be 
>>>>> disabled.
>>>>> +
>>>>> +config DRM_MSM_HDMI_HDCP
>>>>> +    bool "Enable HDMI HDCP support in MSM DRM driver"
>>>>> +    depends on DRM_MSM && DRM_MSM_HDMI
>>>>> +    default y
>>>>> +    help
>>>>> +      Choose this option to enable HDCP state machine
>>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>>> b/drivers/gpu/drm/msm/Makefile
>>>>> index e76927b42033..5fe9c20ab9ee 100644
>>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>>> @@ -16,6 +16,8 @@ msm-y := \
>>>>>       adreno/a6xx_gpu.o \
>>>>>       adreno/a6xx_gmu.o \
>>>>>       adreno/a6xx_hfi.o \
>>>>> +
>>>>> +msm-$(CONFIG_DRM_MSM_HDMI) += \
>>>>>       hdmi/hdmi.o \
>>>>>       hdmi/hdmi_audio.o \
>>>>>       hdmi/hdmi_bridge.o \
>>>>> @@ -27,8 +29,8 @@ msm-y := \
>>>>>       hdmi/hdmi_phy_8x60.o \
>>>>>       hdmi/hdmi_phy_8x74.o \
>>>>>       hdmi/hdmi_pll_8960.o \
>>>>> -    disp/mdp_format.o \
>>>>> -    disp/mdp_kms.o \
>>>>> +
>>>>> +msm-$(CONFIG_DRM_MSM_MDP4) += \
>>>>>       disp/mdp4/mdp4_crtc.o \
>>>>>       disp/mdp4/mdp4_dtv_encoder.o \
>>>>>       disp/mdp4/mdp4_lcdc_encoder.o \
>>>>> @@ -37,6 +39,8 @@ msm-y := \
>>>>>       disp/mdp4/mdp4_irq.o \
>>>>>       disp/mdp4/mdp4_kms.o \
>>>>>       disp/mdp4/mdp4_plane.o \
>>>>> +
>>>>> +msm-$(CONFIG_DRM_MSM_MDP5) += \
>>>>>       disp/mdp5/mdp5_cfg.o \
>>>>>       disp/mdp5/mdp5_ctl.o \
>>>>>       disp/mdp5/mdp5_crtc.o \
>>>>> @@ -47,6 +51,8 @@ msm-y := \
>>>>>       disp/mdp5/mdp5_mixer.o \
>>>>>       disp/mdp5/mdp5_plane.o \
>>>>>       disp/mdp5/mdp5_smp.o \
>>>>> +
>>>>> +msm-$(CONFIG_DRM_MSM_DPU) += \
>>>>>       disp/dpu1/dpu_core_perf.o \
>>>>>       disp/dpu1/dpu_crtc.o \
>>>>>       disp/dpu1/dpu_encoder.o \
>>>>> @@ -69,6 +75,13 @@ msm-y := \
>>>>>       disp/dpu1/dpu_plane.o \
>>>>>       disp/dpu1/dpu_rm.o \
>>>>>       disp/dpu1/dpu_vbif.o \
>>>>> +
>>>>> +msm-$(CONFIG_DRM_MSM_MDSS) += \
>>>>> +    msm_mdss.o \
>>>>> +
>>>>> +msm-y += \
>>>>> +    disp/mdp_format.o \
>>>>> +    disp/mdp_kms.o \
>>>>>       disp/msm_disp_snapshot.o \
>>>>>       disp/msm_disp_snapshot_util.o \
>>>>>       msm_atomic.o \
>>>>> @@ -86,7 +99,6 @@ msm-y := \
>>>>>       msm_gpu_devfreq.o \
>>>>>       msm_io_utils.o \
>>>>>       msm_iommu.o \
>>>>> -    msm_mdss.o \
>>>>>       msm_perf.o \
>>>>>       msm_rd.o \
>>>>>       msm_ringbuffer.o \
>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>>>>> b/drivers/gpu/drm/msm/msm_drv.h
>>>>> index c1aaadfbea34..6bad7e7b479d 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>>> @@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct 
>>>>> drm_device *dev);
>>>>>   void msm_fbdev_free(struct drm_device *dev);
>>>>>   struct hdmi;
>>>>> +#ifdef CONFIG_DRM_MSM_HDMI
>>>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
>>>>>           struct drm_encoder *encoder);
>>>>>   void __init msm_hdmi_register(void);
>>>>>   void __exit msm_hdmi_unregister(void);
>>>>> +#else
>>>>> +static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct 
>>>>> drm_device *dev,
>>>>> +        struct drm_encoder *encoder)
>>>>> +{
>>>>> +    return -EINVAL;
>>>>> +}
>>>>> +static inline void __init msm_hdmi_register(void) {}
>>>>> +static inline void __exit msm_hdmi_unregister(void) {}
>>>>> +#endif
>>>>>   struct msm_dsi;
>>>>>   #ifdef CONFIG_DRM_MSM_DSI
>>>>> @@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct 
>>>>> msm_dp *dp_display,
>>>>>   #endif
>>>>> +#ifdef CONFIG_DRM_MSM_MDP4
>>>>>   void msm_mdp4_register(void);
>>>>>   void msm_mdp4_unregister(void);
>>>>> +#else
>>>>> +static inline void msm_mdp4_register(void) {}
>>>>> +static inline void msm_mdp4_unregister(void) {}
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>>>>   void msm_mdp_register(void);
>>>>>   void msm_mdp_unregister(void);
>>>>> +#else
>>>>> +static inline void msm_mdp_register(void) {}
>>>>> +static inline void msm_mdp_unregister(void) {}
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_DRM_MSM_DPU
>>>>>   void msm_dpu_register(void);
>>>>>   void msm_dpu_unregister(void);
>>>>> +#else
>>>>> +static inline void msm_dpu_register(void) {}
>>>>> +static inline void msm_dpu_unregister(void) {}
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_DRM_MSM_MDSS
>>>>>   void msm_mdss_register(void);
>>>>>   void msm_mdss_unregister(void);
>>>>> +#else
>>>>> +static inline void msm_mdss_register(void) {}
>>>>> +static inline void msm_mdss_unregister(void) {}
>>>>> +#endif
>>>>>   #ifdef CONFIG_DEBUG_FS
>>>>>   void msm_framebuffer_describe(struct drm_framebuffer *fb, struct 
>>>>> seq_file *m);
>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>>>>> b/drivers/gpu/drm/msm/msm_mdss.c
>>>>> index 4d25d8955301..66714b356762 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>>> @@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
>>>>>   static int find_mdp_node(struct device *dev, void *data)
>>>>>   {
>>>>> -    return of_match_node(dpu_dt_match, dev->of_node) ||
>>>>> -        of_match_node(mdp5_dt_match, dev->of_node);
>>>>> +#ifdef CONFIG_DRM_MSM_DPU
>>>>> +    if (of_match_node(dpu_dt_match, dev->of_node))
>>>>> +        return true;
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>>>> +    if (of_match_node(mdp5_dt_match, dev->of_node))
>>>>> +        return true;
>>>>> +#endif
>>>>> +
>>>>> +    return false;
>>>>>   }
>>>>>   static int mdss_probe(struct platform_device *pdev)
>>>
>>>
> 
> 


-- 
With best wishes
Dmitry
