Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74B74CE002
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 22:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiCDWAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 17:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiCDWAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 17:00:42 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B5227C7A3
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 13:59:53 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u10so12896547wra.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 13:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zflriaVvTYSYNPtodgEZPauntK24DoxfeXY16WMzGwY=;
        b=dT2dZ1/wSnojkl8Zw7kPpqROaD5fcMvakXBwKd+zgCM2GyCPJIDlGTlXQ3dg99722p
         1YUxagRguNJjLzu1khr3l2o1CpWmGwKKM1KL//TDAFJ6VFHkUbpfl4jz+ygSlC6xbdIQ
         up8LzHT5kVGSHEmbANwdld66JyeWPKcRcpihLLtl+E2w4mUB8bwEA1lQFl16Xz9iBUMq
         Kpjc1M25MfbHdR/vqCiOeWU34RM8PPFeWymDkxmHm6Srr9zCtKnyJ7PhZJfo1XruGy9F
         bazCg/Li8pfCQzJFXJaav7G63r0UkP0vuUxRocNJRgt4r6O6ebpFvBx1nq2F4rICRw6B
         0g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zflriaVvTYSYNPtodgEZPauntK24DoxfeXY16WMzGwY=;
        b=iCGwwZhr2Xeb+70AW1oZ9J5sfXDgcavM9YALmgrnUcALPJuCTCoU2wwmGQFUhTphSj
         K4k3NGSevRvdc2jZgvKPxtWWWwytxvXEwLTsUl0nwlkRgIuH48VTmTLlaPRO4SKfZlbb
         1oDaV8TqfIYcTUUBH+NwbxrLphUcJIDLCtHf9syhT52fZvP9//XpdRgvVLvGz1Tki+fT
         lq90LmULLPPMbwb8iMH5FXh+ikMmdhRYI5wHcn12W/3Q29QEQHX7enG83t1wi0AO49mQ
         5vDx2/+rnph22Etm3Ews7BD12gGe1hTD0qEGH42Y1vUqXXxizUGX5EOux3UxRXYRIutn
         mYgw==
X-Gm-Message-State: AOAM530qb2s+2Fu8iUGPuOAqoMo0FfPatLHBTPxnt+1mnM16UY+agked
        q6U+Ze7GH0jFH2oKb66iRhpgXGAZ2jxp3YHXn5g=
X-Google-Smtp-Source: ABdhPJxIFk7qOzEgLwDOTejmW+SPaocE47aR3qrjcBKQXCwzUnFfnM8bSCXV/WRAr+SRoBIycLw9lOdTaiHTeLhXau8=
X-Received: by 2002:a5d:4b85:0:b0:1f0:9661:9263 with SMTP id
 b5-20020a5d4b85000000b001f096619263mr508213wrt.574.1646431192439; Fri, 04 Mar
 2022 13:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 4 Mar 2022 14:00:22 -0800
Message-ID: <CAF6AEGvrL_ztO3MJU5Ys3V-1xbaNzZpLjmTU+++QQr9+qQxyww@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/msm: allow compile time selection of driver components
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 3, 2022 at 7:21 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> MSM DRM driver already allows one to compile out the DP or DSI support.
> Add support for disabling other features like MDP4/MDP5/DPU drivers or
> direct HDMI output support.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Kconfig    | 50 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/Makefile   | 18 ++++++++++--
>  drivers/gpu/drm/msm/msm_drv.h  | 33 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++--
>  4 files changed, 106 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 9b019598e042..3735fd41eb3b 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
>           Only use this if you are a driver developer.  This should *not*
>           be enabled for production kernels.  If unsure, say N.
>
> -config DRM_MSM_HDMI_HDCP
> -       bool "Enable HDMI HDCP support in MSM DRM driver"
> +config DRM_MSM_MDSS
> +       bool
> +       depends on DRM_MSM
> +       default n
> +
> +config DRM_MSM_MDP4
> +       bool "Enable MDP4 support in MSM DRM driver"
>         depends on DRM_MSM
>         default y
>         help
> -         Choose this option to enable HDCP state machine
> +         Compile in support for the Mobile Display Processor v4 (MDP4) in
> +         the MSM DRM driver. It is the older display controller found in
> +         devices using APQ8064/MSM8960/MSM8x60 platforms.
> +
> +config DRM_MSM_MDP5
> +       bool "Enable MDP5 support in MSM DRM driver"
> +       depends on DRM_MSM
> +       select DRM_MSM_MDSS
> +       default y
> +       help
> +         Compile in support for the Mobile Display Processor v5 (MDP4) in

drive-by nit: s/MDP4/MDP5/

BR,
-R

> +         the MSM DRM driver. It is the display controller found in devices
> +         using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 platforms.
> +
> +config DRM_MSM_DPU
> +       bool "Enable DPU support in MSM DRM driver"
> +       depends on DRM_MSM
> +       select DRM_MSM_MDSS
> +       default y
> +       help
> +         Compile in support for the Display Processing Unit in
> +         the MSM DRM driver. It is the display controller found in devices
> +         using e.g. SDM845 and newer platforms.
>
>  config DRM_MSM_DP
>         bool "Enable DisplayPort support in MSM DRM driver"
> @@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
>         help
>           Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
>           the platform.
> +
> +config DRM_MSM_HDMI
> +       bool "Enable HDMI support in MSM DRM driver"
> +       depends on DRM_MSM
> +       default y
> +       help
> +         Compile in support for the HDMI output MSM DRM driver. It can
> +         be a primary or a secondary display on device. Note that this is used
> +         only for the direct HDMI output. If the device outputs HDMI data
> +         throught some kind of DSI-to-HDMI bridge, this option can be disabled.
> +
> +config DRM_MSM_HDMI_HDCP
> +       bool "Enable HDMI HDCP support in MSM DRM driver"
> +       depends on DRM_MSM && DRM_MSM_HDMI
> +       default y
> +       help
> +         Choose this option to enable HDCP state machine
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index e76927b42033..5fe9c20ab9ee 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -16,6 +16,8 @@ msm-y := \
>         adreno/a6xx_gpu.o \
>         adreno/a6xx_gmu.o \
>         adreno/a6xx_hfi.o \
> +
> +msm-$(CONFIG_DRM_MSM_HDMI) += \
>         hdmi/hdmi.o \
>         hdmi/hdmi_audio.o \
>         hdmi/hdmi_bridge.o \
> @@ -27,8 +29,8 @@ msm-y := \
>         hdmi/hdmi_phy_8x60.o \
>         hdmi/hdmi_phy_8x74.o \
>         hdmi/hdmi_pll_8960.o \
> -       disp/mdp_format.o \
> -       disp/mdp_kms.o \
> +
> +msm-$(CONFIG_DRM_MSM_MDP4) += \
>         disp/mdp4/mdp4_crtc.o \
>         disp/mdp4/mdp4_dtv_encoder.o \
>         disp/mdp4/mdp4_lcdc_encoder.o \
> @@ -37,6 +39,8 @@ msm-y := \
>         disp/mdp4/mdp4_irq.o \
>         disp/mdp4/mdp4_kms.o \
>         disp/mdp4/mdp4_plane.o \
> +
> +msm-$(CONFIG_DRM_MSM_MDP5) += \
>         disp/mdp5/mdp5_cfg.o \
>         disp/mdp5/mdp5_ctl.o \
>         disp/mdp5/mdp5_crtc.o \
> @@ -47,6 +51,8 @@ msm-y := \
>         disp/mdp5/mdp5_mixer.o \
>         disp/mdp5/mdp5_plane.o \
>         disp/mdp5/mdp5_smp.o \
> +
> +msm-$(CONFIG_DRM_MSM_DPU) += \
>         disp/dpu1/dpu_core_perf.o \
>         disp/dpu1/dpu_crtc.o \
>         disp/dpu1/dpu_encoder.o \
> @@ -69,6 +75,13 @@ msm-y := \
>         disp/dpu1/dpu_plane.o \
>         disp/dpu1/dpu_rm.o \
>         disp/dpu1/dpu_vbif.o \
> +
> +msm-$(CONFIG_DRM_MSM_MDSS) += \
> +       msm_mdss.o \
> +
> +msm-y += \
> +       disp/mdp_format.o \
> +       disp/mdp_kms.o \
>         disp/msm_disp_snapshot.o \
>         disp/msm_disp_snapshot_util.o \
>         msm_atomic.o \
> @@ -86,7 +99,6 @@ msm-y := \
>         msm_gpu_devfreq.o \
>         msm_io_utils.o \
>         msm_iommu.o \
> -       msm_mdss.o \
>         msm_perf.o \
>         msm_rd.o \
>         msm_ringbuffer.o \
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index c1aaadfbea34..6bad7e7b479d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev);
>  void msm_fbdev_free(struct drm_device *dev);
>
>  struct hdmi;
> +#ifdef CONFIG_DRM_MSM_HDMI
>  int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
>                 struct drm_encoder *encoder);
>  void __init msm_hdmi_register(void);
>  void __exit msm_hdmi_unregister(void);
> +#else
> +static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
> +               struct drm_encoder *encoder)
> +{
> +       return -EINVAL;
> +}
> +static inline void __init msm_hdmi_register(void) {}
> +static inline void __exit msm_hdmi_unregister(void) {}
> +#endif
>
>  struct msm_dsi;
>  #ifdef CONFIG_DRM_MSM_DSI
> @@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>
>  #endif
>
> +#ifdef CONFIG_DRM_MSM_MDP4
>  void msm_mdp4_register(void);
>  void msm_mdp4_unregister(void);
> +#else
> +static inline void msm_mdp4_register(void) {}
> +static inline void msm_mdp4_unregister(void) {}
> +#endif
> +
> +#ifdef CONFIG_DRM_MSM_MDP5
>  void msm_mdp_register(void);
>  void msm_mdp_unregister(void);
> +#else
> +static inline void msm_mdp_register(void) {}
> +static inline void msm_mdp_unregister(void) {}
> +#endif
> +
> +#ifdef CONFIG_DRM_MSM_DPU
>  void msm_dpu_register(void);
>  void msm_dpu_unregister(void);
> +#else
> +static inline void msm_dpu_register(void) {}
> +static inline void msm_dpu_unregister(void) {}
> +#endif
> +
> +#ifdef CONFIG_DRM_MSM_MDSS
>  void msm_mdss_register(void);
>  void msm_mdss_unregister(void);
> +#else
> +static inline void msm_mdss_register(void) {}
> +static inline void msm_mdss_unregister(void) {}
> +#endif
>
>  #ifdef CONFIG_DEBUG_FS
>  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 4d25d8955301..66714b356762 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
>
>  static int find_mdp_node(struct device *dev, void *data)
>  {
> -       return of_match_node(dpu_dt_match, dev->of_node) ||
> -               of_match_node(mdp5_dt_match, dev->of_node);
> +#ifdef CONFIG_DRM_MSM_DPU
> +       if (of_match_node(dpu_dt_match, dev->of_node))
> +               return true;
> +#endif
> +
> +#ifdef CONFIG_DRM_MSM_MDP5
> +       if (of_match_node(mdp5_dt_match, dev->of_node))
> +               return true;
> +#endif
> +
> +       return false;
>  }
>
>  static int mdss_probe(struct platform_device *pdev)
> --
> 2.34.1
>
