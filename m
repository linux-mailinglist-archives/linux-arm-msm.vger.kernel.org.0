Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EC3489752
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jan 2022 12:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239620AbiAJLX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jan 2022 06:23:56 -0500
Received: from mga06.intel.com ([134.134.136.31]:48884 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244635AbiAJLXy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jan 2022 06:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641813834; x=1673349834;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=5FKGGuHZO0C6k1n4LzoMsAmNJBJp1CJVtRjeeFRRNQw=;
  b=IMDPShTx8RvQh3u7xRqWUOgdBszexoLTm6y/rRdK5iMi0manRQP/NxWo
   Z00pRyuh+1O08tukDQysmr1IToRIDUrYoF6nQNIX5J2qMm88qBURHqO8M
   KMMD2Je60vbzRiCqEk43ex8RF3UT/sbC25d8KEdCM7EtXUapVsWJSited
   FzoOoGrrz9bAToCSIp3sWnMjSDhTHMEcv5gR8M5LAsUJAAfyAkBj+eM1i
   /qgYfPeaTbchJgvM2zbYQ9cuSxrvi8vwxgf6ie8lzoLVYuBe5zmZ1wgYV
   wmswKtTrPtKDPIUgxHBxo3f0e4raBSsulPAi6uIugGPQD30vhZcCmzttd
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="303945754"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="303945754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 03:23:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="557954576"
Received: from bdoyle2-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.26.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 03:23:49 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        freedreno@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v5 03/32] component: Move struct aggregate_device out to
 header file
In-Reply-To: <CAE-0n53yT2D7q7gXCPq19EGUqN8NRLYq9WUd=wPPR8JY9SSqoQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-4-swboyd@chromium.org> <87pmp3lmmo.fsf@intel.com>
 <CAE-0n53yT2D7q7gXCPq19EGUqN8NRLYq9WUd=wPPR8JY9SSqoQ@mail.gmail.com>
Date:   Mon, 10 Jan 2022 13:23:46 +0200
Message-ID: <87a6g3al6l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 07 Jan 2022, Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Jani Nikula (2022-01-07 05:07:59)
>> On Thu, 06 Jan 2022, Stephen Boyd <swboyd@chromium.org> wrote:
>> > This allows aggregate driver writers to use the device passed to their
>> > probe/remove/shutdown functions properly instead of treating it as an
>> > opaque pointer.
>>
>> You say it like having opaque pointers with interfaces instead of
>> exposed data is a bad thing.
>
> I didn't intend to convey that message at all and in fact I didn't write
> that opaque pointers are a bad thing.
>
>>
>> Data is not an interface. IMO if you can get by with keeping the types
>> private, go for it. Unless I'm missing something, you only need the
>> parent dev pointer. Maybe add a helper function for it?
>
> Sure I'll add a function for that.
>
>>
>> It's trivial to expose the guts like this, but it's usually a lot of
>> hard work to go the other way. Look at the dependencies of component.h
>> now. To keep it self-contained, i.e. buildable without implicit
>> dependencies, you'd need to add #include <device.h>, which goes on to
>> include the world. Then have a look at [1].
>>
>> Please at least let's not do this lightly.
>>
>
> Got it. Thanks! How does this look?

Thanks, I think this is better.

BR,
Jani.

>
> ---8<---
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index cd50137753b4..e8f09945c261 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -56,6 +56,27 @@ struct component_match {
>  	struct component_match_array *compare;
>  };
>
> +struct aggregate_device {
> +	const struct component_master_ops *ops;
> +	struct device *parent;
> +	struct device dev;
> +	struct component_match *match;
> +	struct aggregate_driver *adrv;
> +
> +	int id;
> +};
> +
> +static inline struct aggregate_device *to_aggregate_device(struct device *d)
> +{
> +	return container_of(d, struct aggregate_device, dev);
> +}
> +
> +struct device *aggregate_device_parent(struct aggregate_device *adev)
> +{
> +	return adev->parent;
> +}
> +EXPORT_SYMBOL_GPL(aggregate_device_parent);
> +
>  struct component {
>  	struct list_head node;
>  	struct aggregate_device *adev;
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index 0463386a6ed2..5fa868cf9825 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -27,7 +27,7 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
>
>  static void komeda_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>
>  	if (!mdrv)
> @@ -48,7 +48,7 @@ static void komeda_unbind(struct aggregate_device *adev)
>
>  static int komeda_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct komeda_drv *mdrv;
>  	int err;
>
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 5c03eb98d814..e3ed925797d5 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -272,7 +272,7 @@ static const struct drm_driver hdlcd_driver = {
>
>  static int hdlcd_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm;
>  	struct hdlcd_drm_private *hdlcd;
>  	int ret;
> @@ -347,7 +347,7 @@ static int hdlcd_drm_bind(struct aggregate_device *adev)
>
>  static void hdlcd_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct hdlcd_drm_private *hdlcd = drm->dev_private;
>
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index e6ee4d1e3bb8..7b946b962b22 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -704,7 +704,7 @@ static int malidp_runtime_pm_resume(struct device *dev)
>
>  static int malidp_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct resource *res;
>  	struct drm_device *drm;
>  	struct malidp_drm *malidp;
> @@ -897,7 +897,7 @@ static int malidp_bind(struct aggregate_device *adev)
>
>  static void malidp_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct malidp_drm *malidp = drm->dev_private;
>  	struct malidp_hw_device *hwdev = malidp->dev;
> diff --git a/drivers/gpu/drm/armada/armada_drv.c
> b/drivers/gpu/drm/armada/armada_drv.c
> index b3559363ea43..27739cbe2291 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -62,7 +62,7 @@ static const struct drm_mode_config_funcs
> armada_drm_mode_config_funcs = {
>
>  static int armada_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct armada_private *priv;
>  	struct resource *mem = NULL;
>  	int ret, n;
> @@ -162,7 +162,7 @@ static int armada_drm_bind(struct aggregate_device *adev)
>
>  static void armada_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct armada_private *priv = drm_to_armada_dev(drm);
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 95d1e518ff13..2ea655fd7a70 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -496,7 +496,7 @@ static const struct drm_driver etnaviv_drm_driver = {
>   */
>  static int etnaviv_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct etnaviv_drm_private *priv;
>  	struct drm_device *drm;
>  	int ret;
> @@ -555,7 +555,7 @@ static int etnaviv_bind(struct aggregate_device *adev)
>
>  static void etnaviv_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct etnaviv_drm_private *priv = drm->dev_private;
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index dcb52ec2bd35..f58c3069b591 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -255,7 +255,7 @@ static struct component_match
> *exynos_drm_match_add(struct device *dev)
>
>  static int exynos_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct exynos_drm_private *private;
>  	struct drm_encoder *encoder;
>  	struct drm_device *drm;
> @@ -333,7 +333,7 @@ static int exynos_drm_bind(struct aggregate_device *adev)
>
>  static void exynos_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm);
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 00d47c784cbb..338077908177 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -219,7 +219,7 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
>
>  static int kirin_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct kirin_drm_data *driver_data;
>  	struct drm_device *drm_dev;
>  	int ret;
> @@ -256,7 +256,7 @@ static int kirin_drm_bind(struct aggregate_device *adev)
>
>  static void kirin_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm_dev);
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c
> b/drivers/gpu/drm/imx/imx-drm-core.c
> index 9e28bb16364c..82645e42b7d3 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -198,7 +198,7 @@ static int compare_of(struct device *dev, void *data)
>
>  static int imx_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm;
>  	int ret;
>
> @@ -267,7 +267,7 @@ static int imx_drm_bind(struct aggregate_device *adev)
>
>  static void imx_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm);
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index d5330fb486e8..db61efc35b2d 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1152,7 +1152,7 @@ static int ingenic_drm_bind(struct device *dev,
> bool has_components)
>
>  static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>
>  	return ingenic_drm_bind(dev, true);
>  }
> @@ -1178,7 +1178,7 @@ static void ingenic_drm_unbind(struct device *dev)
>
>  static void ingenic_aggregate_remove(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>
>  	ingenic_drm_unbind(dev);
>  }
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index 1652f9e0601d..b8479355844e 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -217,7 +217,7 @@ static const struct drm_driver mcde_drm_driver = {
>
>  static int mcde_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	int ret;
>
> @@ -250,7 +250,7 @@ static int mcde_drm_bind(struct aggregate_device *adev)
>
>  static void mcde_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a3f27b8c9769..af0dda5e45bf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -350,7 +350,7 @@ static int compare_of(struct device *dev, void *data)
>
>  static int mtk_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>  	struct drm_device *drm;
>  	int ret;
> @@ -383,7 +383,7 @@ static int mtk_drm_bind(struct aggregate_device *adev)
>
>  static void mtk_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(private->drm);
> diff --git a/drivers/gpu/drm/meson/meson_drv.c
> b/drivers/gpu/drm/meson/meson_drv.c
> index 3028f2a45f66..426caea3d570 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -358,14 +358,14 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
>
>  static int meson_drv_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>
>  	return meson_drv_bind_master(dev, true);
>  }
>
>  static void meson_drv_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct meson_drm *priv = dev_get_drvdata(dev);
>  	struct drm_device *drm = priv->drm;
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f6e9b0d318f5..b2735355ea81 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1362,17 +1362,19 @@ static int add_gpu_components(struct device *dev,
>
>  static int msm_drm_bind(struct aggregate_device *adev)
>  {
> -	return msm_drm_init(adev->parent, &msm_driver);
> +	return msm_drm_init(aggregate_device_parent(adev), &msm_driver);
>  }
>
>  static void msm_drm_unbind(struct aggregate_device *adev)
>  {
> -	msm_drm_uninit(adev->parent);
> +	msm_drm_uninit(aggregate_device_parent(adev));
>  }
>
>  static void msm_drm_shutdown(struct aggregate_device *adev)
>  {
> -	struct drm_device *drm =
> platform_get_drvdata(to_platform_device(adev->parent));
> +	const struct device *parent = aggregate_device_parent(adev);
> +	const struct platform_device *pdev = to_platform_device(parent);
> +	struct drm_device *drm = platform_get_drvdata(pdev);
>  	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
>
>  	if (!priv || !priv->kms)
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c
> b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 9328d97f19ab..6226ef389694 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1306,7 +1306,7 @@ static const struct soc_device_attribute
> dss_soc_devices[] = {
>
>  static int dss_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct dss_device *dss = dev_get_drvdata(dev);
>  	struct platform_device *drm_pdev;
>  	struct dss_pdata pdata;
> @@ -1333,7 +1333,7 @@ static int dss_bind(struct aggregate_device *adev)
>
>  static void dss_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct dss_device *dss = dev_get_drvdata(dev);
>
>  	platform_device_unregister(dss->drm_pdev);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 6c755361d376..5179ca899dbb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -111,7 +111,7 @@ static void rockchip_iommu_cleanup(struct
> drm_device *drm_dev)
>
>  static int rockchip_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm_dev;
>  	struct rockchip_drm_private *private;
>  	int ret;
> @@ -186,7 +186,7 @@ static int rockchip_drm_bind(struct aggregate_device *adev)
>
>  static void rockchip_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm_dev);
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index b277cc679154..958db315d547 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -184,7 +184,7 @@ static void sti_cleanup(struct drm_device *ddev)
>
>  static int sti_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *ddev;
>  	int ret;
>
> @@ -219,7 +219,7 @@ static int sti_bind(struct aggregate_device *adev)
>
>  static void sti_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *ddev = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(ddev);
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
> b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index 700f5e32eaf7..35c5e575132f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -58,7 +58,7 @@ static const struct drm_driver sun4i_drv_driver = {
>
>  static int sun4i_drv_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm;
>  	struct sun4i_drv *drv;
>  	int ret;
> @@ -128,7 +128,7 @@ static int sun4i_drv_bind(struct aggregate_device *adev)
>
>  static void sun4i_drv_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 92ff516fb6de..c12c579ce66f 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -531,14 +531,14 @@ static const struct dev_pm_ops tilcdc_pm_ops = {
>   */
>  static int tilcdc_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>
>  	return tilcdc_init(&tilcdc_driver, dev);
>  }
>
>  static void tilcdc_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *ddev = dev_get_drvdata(dev);
>
>  	/* Check if a subcomponent has already triggered the unloading. */
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 82a44ebf9121..297ecddea5fb 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -214,7 +214,7 @@ static void vc4_match_add_drivers(struct device *dev,
>
>  static int vc4_drm_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct drm_device *drm;
>  	struct vc4_dev *vc4;
> @@ -287,7 +287,7 @@ static int vc4_drm_bind(struct aggregate_device *adev)
>
>  static void vc4_drm_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_device *drm = dev_get_drvdata(dev);
>
>  	drm_dev_unregister(drm);
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 064fd4f4eade..125be5819c42 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -96,7 +96,7 @@ static inline void release_of(struct device *dev, void *data)
>
>  static inline int mtk_iommu_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>
>  	return component_bind_all(dev, &data->larb_imu);
> @@ -104,7 +104,7 @@ static inline int mtk_iommu_bind(struct
> aggregate_device *adev)
>
>  static inline void mtk_iommu_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>
>  	component_unbind_all(dev, &data->larb_imu);
> diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
> index ae903a09fb06..3c6e4e3bf212 100644
> --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> +++ b/drivers/misc/mei/hdcp/mei_hdcp.c
> @@ -734,7 +734,7 @@ static const struct i915_hdcp_component_ops mei_hdcp_ops = {
>
>  static int mei_hdcp_aggregate_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mei_cl_device *cldev = to_mei_cl_device(dev);
>  	struct i915_hdcp_comp_master *comp_master =
>  						mei_cldev_get_drvdata(cldev);
> @@ -752,7 +752,7 @@ static int mei_hdcp_aggregate_bind(struct
> aggregate_device *adev)
>
>  static void mei_hdcp_aggregate_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mei_cl_device *cldev = to_mei_cl_device(dev);
>  	struct i915_hdcp_comp_master *comp_master =
>  						mei_cldev_get_drvdata(cldev);
> diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
> index 7b7bd7c0e8b1..887e43e6ba5f 100644
> --- a/drivers/misc/mei/pxp/mei_pxp.c
> +++ b/drivers/misc/mei/pxp/mei_pxp.c
> @@ -85,7 +85,7 @@ static const struct i915_pxp_component_ops mei_pxp_ops = {
>
>  static int mei_pxp_aggregate_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mei_cl_device *cldev = to_mei_cl_device(dev);
>  	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
>  	int ret;
> @@ -101,7 +101,7 @@ static int mei_pxp_aggregate_bind(struct
> aggregate_device *adev)
>
>  static void mei_pxp_aggregate_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct mei_cl_device *cldev = to_mei_cl_device(dev);
>  	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
>
> diff --git a/drivers/power/supply/ab8500_charger.c
> b/drivers/power/supply/ab8500_charger.c
> index 52d4105e28f2..e1e5c9387b57 100644
> --- a/drivers/power/supply/ab8500_charger.c
> +++ b/drivers/power/supply/ab8500_charger.c
> @@ -3314,7 +3314,7 @@ static const struct power_supply_desc
> ab8500_usb_chg_desc = {
>
>  static int ab8500_charger_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct ab8500_charger *di = dev_get_drvdata(dev);
>  	int ch_stat;
>  	int ret;
> @@ -3357,7 +3357,7 @@ static int ab8500_charger_bind(struct
> aggregate_device *adev)
>
>  static void ab8500_charger_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct ab8500_charger *di = dev_get_drvdata(dev);
>  	int ret;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index f12663c39ceb..0bdb9f909992 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -1069,7 +1069,7 @@ static int dss_video_pll_probe(struct
> platform_device *pdev)
>  /* DSS HW IP initialisation */
>  static int dss_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct resource *dss_mem;
>  	u32 rev;
> @@ -1170,7 +1170,7 @@ static int dss_bind(struct aggregate_device *adev)
>
>  static void dss_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct platform_device *pdev = to_platform_device(dev);
>
>  	dss_initialized = false;
> diff --git a/include/linux/component.h b/include/linux/component.h
> index 07fe481d4e3b..7c86f4cc718e 100644
> --- a/include/linux/component.h
> +++ b/include/linux/component.h
> @@ -8,6 +8,8 @@
>  struct component_match;
>  struct aggregate_device;
>
> +struct device *aggregate_device_parent(struct aggregate_device *adev);
> +
>  /**
>   * struct component_ops - callbacks for component drivers
>   *
> @@ -63,20 +65,6 @@ void component_del(struct device *, const struct
> component_ops *);
>  int component_bind_all(struct device *master, void *master_data);
>  void component_unbind_all(struct device *master, void *master_data);
>
> -struct aggregate_device {
> -	struct device *parent;
> -	struct device dev;
> -	struct component_match *match;
> -	struct aggregate_driver *adrv;
> -
> -	int id;
> -};
> -
> -static inline struct aggregate_device *to_aggregate_device(struct device *d)
> -{
> -	return container_of(d, struct aggregate_device, dev);
> -}
> -
>  /**
>   * struct aggregate_driver - Aggregate driver (made up of other drivers)
>   * @driver: device driver
> diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
> index 9e4dab97f485..4ec5d9bf8533 100644
> --- a/sound/hda/hdac_component.c
> +++ b/sound/hda/hdac_component.c
> @@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_acomp_get_eld);
>
>  static int hdac_component_master_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_audio_component *acomp = hdac_get_acomp(dev);
>  	int ret;
>
> @@ -225,7 +225,7 @@ static int hdac_component_master_bind(struct
> aggregate_device *adev)
>
>  static void hdac_component_master_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct drm_audio_component *acomp = hdac_get_acomp(dev);
>
>  	if (acomp->audio_ops && acomp->audio_ops->master_unbind)
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index f44f5d41bfdb..6edb040d0639 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -4318,7 +4318,7 @@ static struct snd_soc_dai_driver wcd938x_dais[] = {
>
>  static int wcd938x_bind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
>  	int ret;
>
> @@ -4403,7 +4403,7 @@ static int wcd938x_bind(struct aggregate_device *adev)
>
>  static void wcd938x_unbind(struct aggregate_device *adev)
>  {
> -	struct device *dev = adev->parent;
> +	struct device *dev = aggregate_device_parent(adev);
>  	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
>
>  	device_link_remove(dev, wcd938x->txdev);

-- 
Jani Nikula, Intel Open Source Graphics Center
