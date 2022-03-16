Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 782784DA6CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 01:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238191AbiCPAWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 20:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235981AbiCPAW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 20:22:29 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40FC5D67C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 17:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647390075; x=1678926075;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bVOWByM7C7IZ2rI377WA8EgW3x+RSQjE9qUnwNrKcD0=;
  b=kagrd8+kbNrUqiELuMj2ETGaFGh9lhD4o4GtEa+cy9UE6YevHK2QnzD4
   QJ1I8u3xdQ56yJkZy2BkTWYkp23H4c6EFEEeLSxtp32NIHrY2rpkBJuHB
   sd4ubv0pDgLftYxMw3NDcwBEpDKiedccT+YCo2p/NSo8qSXv/jWeboe9S
   o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 17:21:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 17:21:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 17:20:54 -0700
Received: from [10.110.56.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 17:20:53 -0700
Message-ID: <a6d75f8d-5a85-ce79-c2fc-b887c0854b1e@quicinc.com>
Date:   Tue, 15 Mar 2022 17:20:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 4/5] drm/msm: stop using device's match data pointer
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
> Let's make the match's data pointer a (sub-)driver's private data. The
> only user currently is the msm_drm_init() function, using this data to
> select kms_init callback. Pass this callback through the driver's
> private data instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++---
>   drivers/gpu/drm/msm/msm_drv.c            | 38 ++++++------------------
>   drivers/gpu/drm/msm/msm_drv.h            |  5 +---
>   drivers/gpu/drm/msm/msm_kms.h            |  4 ---
>   drivers/gpu/drm/msm/msm_mdss.c           | 29 +++++++-----------
>   7 files changed, 42 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e29796c4f27b..38627ccf3068 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1172,7 +1172,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	return rc;
>   }
>   
> -struct msm_kms *dpu_kms_init(struct drm_device *dev)
> +static int dpu_kms_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
> @@ -1180,7 +1180,7 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
>   
>   	if (!dev) {
>   		DPU_ERROR("drm device node invalid\n");
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>   	}
>   
>   	priv = dev->dev_private;
> @@ -1189,11 +1189,11 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
>   	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
>   	if (irq < 0) {
>   		DPU_ERROR("failed to get irq: %d\n", irq);
> -		return ERR_PTR(irq);
> +		return irq;
>   	}
>   	dpu_kms->base.irq = irq;
>   
> -	return &dpu_kms->base;
> +	return 0;
>   }
>   
>   static int dpu_bind(struct device *dev, struct device *master, void *data)
> @@ -1204,6 +1204,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>   	struct dpu_kms *dpu_kms;
>   	int ret = 0;
>   
> +	priv->kms_init = dpu_kms_init;
> +
>   	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>   	if (!dpu_kms)
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index c5c0650414c5..2e5f6b6fd3c3 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -389,7 +389,7 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
>   	DRM_DEV_INFO(dev->dev, "MDP4 version v%d.%d", *major, *minor);
>   }
>   
> -struct msm_kms *mdp4_kms_init(struct drm_device *dev)
> +static int mdp4_kms_init(struct drm_device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev->dev);
>   	struct mdp4_platform_config *config = mdp4_get_config(pdev);
> @@ -403,8 +403,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
>   	if (!mdp4_kms) {
>   		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
> -		ret = -ENOMEM;
> -		goto fail;
> +		return -ENOMEM;
>   	}
>   
>   	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
> @@ -551,12 +550,13 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   	dev->mode_config.max_width = 2048;
>   	dev->mode_config.max_height = 2048;
>   
> -	return kms;
> +	return 0;
>   
>   fail:
>   	if (kms)
>   		mdp4_destroy(kms);
> -	return ERR_PTR(ret);
> +
> +	return ret;
>   }
>   
>   static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
> @@ -583,6 +583,8 @@ static int mdp4_probe(struct platform_device *pdev)
>   	if (!priv)
>   		return -ENOMEM;
>   
> +	priv->kms_init = mdp4_kms_init;
> +
>   	platform_set_drvdata(pdev, priv);
>   
>   	/*
> @@ -600,7 +602,7 @@ static int mdp4_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id mdp4_dt_match[] = {
> -	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> +	{ .compatible = "qcom,mdp4" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mdp4_dt_match);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3b92372e7bdf..0c78608832c3 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -544,7 +544,7 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
>   	return 0;
>   }
>   
> -struct msm_kms *mdp5_kms_init(struct drm_device *dev)
> +static int mdp5_kms_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct platform_device *pdev;
> @@ -558,7 +558,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>   	/* priv->kms would have been populated by the MDP5 driver */
>   	kms = priv->kms;
>   	if (!kms)
> -		return NULL;
> +		return -ENOMEM;
>   
>   	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
>   	pdev = mdp5_kms->pdev;
> @@ -637,11 +637,12 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>   	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
>   	dev->vblank_disable_immediate = true;
>   
> -	return kms;
> +	return 0;
>   fail:
>   	if (kms)
>   		mdp5_kms_destroy(kms);
> -	return ERR_PTR(ret);
> +
> +	return ret;
>   }
>   
>   static void mdp5_destroy(struct platform_device *pdev)
> @@ -803,6 +804,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	u32 major, minor;
>   	int ret;
>   
> +	priv->kms_init = mdp5_kms_init;
> +
>   	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
>   	if (!mdp5_kms) {
>   		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2f44df8c5585..16698c757d94 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -255,13 +255,6 @@ static int msm_drm_uninit(struct device *dev)
>   	return 0;
>   }
>   
> -static int get_mdp_ver(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -
> -	return (int) (unsigned long) of_device_get_match_data(dev);
> -}
> -
>   #include <linux/of_address.h>
>   
>   bool msm_use_mmu(struct drm_device *dev)
> @@ -348,7 +341,6 @@ static int msm_init_vram(struct drm_device *dev)
>   
>   static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   {
> -	struct platform_device *pdev = to_platform_device(dev);
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev;
>   	struct msm_kms *kms;
> @@ -393,30 +385,18 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	msm_gem_shrinker_init(ddev);
>   
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP4:
> -		kms = mdp4_kms_init(ddev);
> -		priv->kms = kms;
> -		break;
> -	case KMS_MDP5:
> -		kms = mdp5_kms_init(ddev);
> -		break;
> -	case KMS_DPU:
> -		kms = dpu_kms_init(ddev);
> -		priv->kms = kms;
> -		break;
> -	default:
> +	if (priv->kms_init) {
> +		ret = priv->kms_init(ddev);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev, "failed to load kms\n");
> +			priv->kms = NULL;
> +			goto err_msm_uninit;
> +		}
> +		kms = priv->kms;
> +	} else {
>   		/* valid only for the dummy headless case, where of_node=NULL */
>   		WARN_ON(dev->of_node);
>   		kms = NULL;
> -		break;
> -	}
> -
> -	if (IS_ERR(kms)) {
> -		DRM_DEV_ERROR(dev, "failed to load kms\n");
> -		ret = PTR_ERR(kms);
> -		priv->kms = NULL;
> -		goto err_msm_uninit;
>   	}
>   
>   	/* Enable normalization of plane zpos */
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2fdaf4a614cc..c1aaadfbea34 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -121,6 +121,7 @@ struct msm_drm_private {
>   	struct drm_device *dev;
>   
>   	struct msm_kms *kms;
> +	int (*kms_init)(struct drm_device *dev);
>   
>   	/* subordinate devices, if present: */
>   	struct platform_device *gpu_pdev;
> @@ -431,10 +432,6 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>   
>   #endif
>   
> -#define KMS_MDP4 4
> -#define KMS_MDP5 5
> -#define KMS_DPU  3
> -
>   void msm_mdp4_register(void);
>   void msm_mdp4_unregister(void);
>   void msm_mdp_register(void);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 13c2eb0b2bcf..1f571372e928 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -194,10 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
>   		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
>   }
>   
> -struct msm_kms *mdp4_kms_init(struct drm_device *dev);
> -struct msm_kms *mdp5_kms_init(struct drm_device *dev);
> -struct msm_kms *dpu_kms_init(struct drm_device *dev);
> -
>   extern const struct of_device_id dpu_dt_match[];
>   extern const struct of_device_id mdp5_dt_match[];
>   
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index c89de88ed2d1..4d25d8955301 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -301,13 +301,6 @@ static const struct dev_pm_ops mdss_pm_ops = {
>   	.complete = msm_pm_complete,
>   };
>   
> -static int get_mdp_ver(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -
> -	return (int) (unsigned long) of_device_get_match_data(dev);
> -}
> -
>   static int find_mdp_node(struct device *dev, void *data)
>   {
>   	return of_match_node(dpu_dt_match, dev->of_node) ||
> @@ -318,7 +311,7 @@ static int mdss_probe(struct platform_device *pdev)
>   {
>   	struct msm_mdss *mdss;
>   	struct msm_drm_private *priv;
> -	int mdp_ver = get_mdp_ver(pdev);
> +	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
>   	struct device *mdp_dev;
>   	struct device *dev = &pdev->dev;
>   	int ret;
> @@ -329,7 +322,7 @@ static int mdss_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, priv);
>   
> -	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +	mdss = msm_mdss_init(pdev, is_mdp5);
>   	if (IS_ERR(mdss)) {
>   		ret = PTR_ERR(mdss);
>   		platform_set_drvdata(pdev, NULL);
> @@ -392,15 +385,15 @@ static int mdss_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id mdss_dt_match[] = {
> -	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> -	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> -	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,mdss" },
> +	{ .compatible = "qcom,msm8998-mdss" },
> +	{ .compatible = "qcom,qcm2290-mdss" },
> +	{ .compatible = "qcom,sdm845-mdss" },
> +	{ .compatible = "qcom,sc7180-mdss" },
> +	{ .compatible = "qcom,sc7280-mdss" },
> +	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sm8150-mdss" },
> +	{ .compatible = "qcom,sm8250-mdss" },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, dt_match);
