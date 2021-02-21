Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36355320C82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Feb 2021 19:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhBUSWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Feb 2021 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhBUSWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Feb 2021 13:22:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A75C061574;
        Sun, 21 Feb 2021 10:21:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59FA7EF;
        Sun, 21 Feb 2021 19:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613931694;
        bh=GrTgQ2aab5eBCzMDahXFKzsgqhR0cCzd4d93CPbsd74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S7py4GN1+mpKFxaItm5BBufzjOGkqLdjNQ2MgSfbxdQj+51l9D2t3BC2YyeQEmWI7
         XeNseMhQGrt8folLYb5Ub+y60aver4uMxtfEEWxsp3I0QdkeEcogpgL/qx0R3cZL50
         Jf4yp7Vzr3b+VPBGRGqLdh/UMEIwSFyVwm8rczfQ=
Date:   Sun, 21 Feb 2021 20:21:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Eryk Brol <eryk.brol@amd.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Chris Park <Chris.Park@amd.com>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Torsten Duwe <duwe@lst.de>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Joe Perches <joe@perches.com>, Icenowy Zheng <icenowy@aosc.io>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 15/30] drm/dp: Add backpointer to drm_device in drm_dp_aux
Message-ID: <YDKklI3grZjn3dde@pendragon.ideasonboard.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-16-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219215326.2227596-16-lyude@redhat.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lyude,

Thank you for the patch.

On Fri, Feb 19, 2021 at 04:53:11PM -0500, Lyude Paul wrote:
> This is something that we've wanted for a while now: the ability to
> actually look up the respective drm_device for a given drm_dp_aux struct.
> This will also allow us to transition over to using the drm_dbg_*() helpers
> for debug message printing, as we'll finally have a drm_device to reference
> for doing so.

Isn't it better to use the existing dev field ? If you have multiple DP
outputs for one DRM device, using the DRM device name in debug messages
won't tell which output the message corresponds to.

> Note that there is one limitation with this - because some DP AUX adapters
> exist as platform devices which are initialized independently of their
> respective DRM devices, one cannot rely on drm_dp_aux->drm_dev to always be
> non-NULL until drm_dp_aux_register() has been called. We make sure to point
> this out in the documentation for struct drm_dp_aux.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 | 1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 1 +
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 1 +
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 1 +
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c       | 1 +
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      | 1 +
>  drivers/gpu/drm/bridge/tc358767.c                        | 1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 1 +
>  drivers/gpu/drm/drm_dp_aux_dev.c                         | 6 ++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c                    | 1 +
>  drivers/gpu/drm/i915/display/intel_dp_aux.c              | 1 +
>  drivers/gpu/drm/msm/edp/edp.h                            | 3 +--
>  drivers/gpu/drm/msm/edp/edp_aux.c                        | 5 +++--
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                       | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c              | 1 +
>  drivers/gpu/drm/radeon/atombios_dp.c                     | 1 +
>  drivers/gpu/drm/tegra/dpaux.c                            | 1 +
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                         | 1 +
>  include/drm/drm_dp_helper.h                              | 9 ++++++++-
>  19 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index a3ba9ca11e98..6d35da65e09f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -188,6 +188,7 @@ void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
>  {
>  	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
>  	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> +	amdgpu_connector->ddc_bus->aux.drm_dev = amdgpu_connector->base.dev;
>  	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
>  	amdgpu_connector->ddc_bus->has_aux = true;
>  }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 41b09ab22233..163641b44339 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -431,6 +431,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  			  link_index);
>  	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
>  	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> +	aconnector->dm_dp_aux.aux.drm_dev = dm->ddev;
>  
>  	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index aa6cda458eb9..e33cd077595a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -537,6 +537,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>  	/* Register aux channel */
>  	anx6345->aux.name = "DP-AUX";
>  	anx6345->aux.dev = &anx6345->client->dev;
> +	anx6345->aux.drm_dev = bridge->dev;
>  	anx6345->aux.transfer = anx6345_aux_transfer;
>  
>  	err = drm_dp_aux_register(&anx6345->aux);
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index f20558618220..5e6a0ed39199 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -905,6 +905,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>  	/* Register aux channel */
>  	anx78xx->aux.name = "DP-AUX";
>  	anx78xx->aux.dev = &anx78xx->client->dev;
> +	anx78xx->aux.drm_dev = bridge->dev;
>  	anx78xx->aux.transfer = anx78xx_aux_transfer;
>  
>  	err = drm_dp_aux_register(&anx78xx->aux);
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f115233b1cb9..550814ca2139 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1765,6 +1765,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  	dp->aux.name = "DP-AUX";
>  	dp->aux.transfer = analogix_dpaux_transfer;
>  	dp->aux.dev = dp->dev;
> +	dp->aux.drm_dev = drm_dev;
>  
>  	ret = drm_dp_aux_register(&dp->aux);
>  	if (ret)
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d966a33743b5..fe821ad628ec 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1674,6 +1674,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  
>  	dev_dbg(mhdp->dev, "%s\n", __func__);
>  
> +	mhdp->aux.drm_dev = bridge->dev;
>  	ret = drm_dp_aux_register(&mhdp->aux);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index da89922721ed..23a6f90b694b 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1414,6 +1414,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>  		return 0;
>  
> +	tc->aux.drm_dev = drm;
>  	ret = drm_dp_aux_register(&tc->aux);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 88df4dd0f39d..8e24272bbf00 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -362,6 +362,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> +	pdata->aux.drm_dev = bridge->dev;
>  	ret = drm_dp_aux_register(&pdata->aux);
>  	if (ret < 0) {
>  		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
> diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
> index e25181bf2c48..06b374cae956 100644
> --- a/drivers/gpu/drm/drm_dp_aux_dev.c
> +++ b/drivers/gpu/drm/drm_dp_aux_dev.c
> @@ -278,6 +278,12 @@ void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
>  	if (!aux_dev) /* attach must have failed */
>  		return;
>  
> +	/*
> +	 * As some AUX adapters may exist as platform devices which outlive their respective DRM
> +	 * devices, we clear drm_dev to ensure that we never accidentally reference a stale pointer
> +	 */
> +	aux->drm_dev = NULL;
> +
>  	mutex_lock(&aux_idr_mutex);
>  	idr_remove(&aux_idr, aux_dev->index);
>  	mutex_unlock(&aux_idr_mutex);
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 932c4641ec3e..cf4f2f85711e 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2349,6 +2349,7 @@ drm_dp_mst_add_port(struct drm_device *dev,
>  	port->aux.is_remote = true;
>  
>  	/* initialize the MST downstream port's AUX crc work queue */
> +	port->aux.drm_dev = dev;
>  	drm_dp_remote_aux_init(&port->aux);
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index eaebf123310a..0571c0794226 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -675,6 +675,7 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
>  	else
>  		intel_dp->get_aux_send_ctl = g4x_get_aux_send_ctl;
>  
> +	intel_dp->aux.drm_dev = &dev_priv->drm;
>  	drm_dp_aux_init(&intel_dp->aux);
>  
>  	/* Failure to allocate our preferred name is not critical */
> diff --git a/drivers/gpu/drm/msm/edp/edp.h b/drivers/gpu/drm/msm/edp/edp.h
> index eb34243dad53..8590f2ce274d 100644
> --- a/drivers/gpu/drm/msm/edp/edp.h
> +++ b/drivers/gpu/drm/msm/edp/edp.h
> @@ -46,8 +46,7 @@ void edp_bridge_destroy(struct drm_bridge *bridge);
>  struct drm_connector *msm_edp_connector_init(struct msm_edp *edp);
>  
>  /* AUX */
> -void *msm_edp_aux_init(struct device *dev, void __iomem *regbase,
> -			struct drm_dp_aux **drm_aux);
> +void *msm_edp_aux_init(struct msm_edp *edp, void __iomem *regbase, struct drm_dp_aux **drm_aux);
>  void msm_edp_aux_destroy(struct device *dev, struct edp_aux *aux);
>  irqreturn_t msm_edp_aux_irq(struct edp_aux *aux, u32 isr);
>  void msm_edp_aux_ctrl(struct edp_aux *aux, int enable);
> diff --git a/drivers/gpu/drm/msm/edp/edp_aux.c b/drivers/gpu/drm/msm/edp/edp_aux.c
> index df10a0196d94..e3d85c622cfb 100644
> --- a/drivers/gpu/drm/msm/edp/edp_aux.c
> +++ b/drivers/gpu/drm/msm/edp/edp_aux.c
> @@ -184,9 +184,9 @@ static ssize_t edp_aux_transfer(struct drm_dp_aux *drm_aux,
>  	return ret;
>  }
>  
> -void *msm_edp_aux_init(struct device *dev, void __iomem *regbase,
> -	struct drm_dp_aux **drm_aux)
> +void *msm_edp_aux_init(struct msm_edp *edp, void __iomem *regbase, struct drm_dp_aux **drm_aux)
>  {
> +	struct device *dev = &edp->pdev->dev;
>  	struct edp_aux *aux = NULL;
>  	int ret;
>  
> @@ -201,6 +201,7 @@ void *msm_edp_aux_init(struct device *dev, void __iomem *regbase,
>  
>  	aux->drm_aux.name = "msm_edp_aux";
>  	aux->drm_aux.dev = dev;
> +	aux->drm_aux.drm_dev = edp->dev;
>  	aux->drm_aux.transfer = edp_aux_transfer;
>  	ret = drm_dp_aux_register(&aux->drm_aux);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 0d9657cc70db..57af3d8b6699 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1153,7 +1153,7 @@ int msm_edp_ctrl_init(struct msm_edp *edp)
>  	}
>  
>  	/* Init aux and phy */
> -	ctrl->aux = msm_edp_aux_init(dev, ctrl->base, &ctrl->drm_aux);
> +	ctrl->aux = msm_edp_aux_init(edp, ctrl->base, &ctrl->drm_aux);
>  	if (!ctrl->aux || !ctrl->drm_aux) {
>  		pr_err("%s:failed to init aux\n", __func__);
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index bfce762adcf0..d1b49508ecb9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1355,6 +1355,7 @@ nouveau_connector_create(struct drm_device *dev,
>  	case DRM_MODE_CONNECTOR_DisplayPort:
>  	case DRM_MODE_CONNECTOR_eDP:
>  		nv_connector->aux.dev = connector->kdev;
> +		nv_connector->aux.drm_dev = dev;
>  		nv_connector->aux.transfer = nouveau_connector_aux_xfer;
>  		snprintf(aux_name, sizeof(aux_name), "sor-%04x-%04x",
>  			 dcbe->hasht, dcbe->hashm);
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
> index 15b00a347560..c50c504bad50 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -232,6 +232,7 @@ void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
>  
>  	radeon_connector->ddc_bus->rec.hpd = radeon_connector->hpd.hpd;
>  	radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
> +	radeon_connector->ddc_bus->aux.drm_dev = radeon_connector->base.dev;
>  	if (ASIC_IS_DCE5(rdev)) {
>  		if (radeon_auxch)
>  			radeon_connector->ddc_bus->aux.transfer = radeon_dp_aux_transfer_native;
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index ea56c6ec25e4..7d7cc90b6fc9 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -719,6 +719,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
>  	unsigned long timeout;
>  	int err;
>  
> +	aux->drm_dev = output->connector.dev;
>  	err = drm_dp_aux_register(aux);
>  	if (err < 0)
>  		return err;
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 99158ee67d02..8272eee03adc 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1069,6 +1069,7 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
>  
>  	dp->aux.name = "ZynqMP DP AUX";
>  	dp->aux.dev = dp->dev;
> +	dp->aux.drm_dev = dp->drm;
>  	dp->aux.transfer = zynqmp_dp_aux_transfer;
>  
>  	return drm_dp_aux_register(&dp->aux);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index b35a1c1339e8..45ec74862212 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1833,13 +1833,19 @@ struct drm_dp_aux_cec {
>   * @name: user-visible name of this AUX channel and the I2C-over-AUX adapter
>   * @ddc: I2C adapter that can be used for I2C-over-AUX communication
>   * @dev: pointer to struct device that is the parent for this AUX channel
> + * @drm_dev: pointer to the &drm_device that owns this AUX channel. Beware, this may be %NULL
> + * before drm_dp_aux_register() has been called.
>   * @crtc: backpointer to the crtc that is currently using this AUX channel
>   * @hw_mutex: internal mutex used for locking transfers
>   * @crc_work: worker that captures CRCs for each frame
>   * @crc_count: counter of captured frame CRCs
>   * @transfer: transfers a message representing a single AUX transaction
>   *
> - * The @dev field should be set to a pointer to the device that implements the AUX channel.
> + * The @dev field should be set to a pointer to the device that implements the AUX channel. As well,
> + * the @drm_dev field should be set to the &drm_device that will be using this AUX channel as early
> + * as possible. For many graphics drivers this should happen before drm_dp_aux_init(), however it's
> + * perfectly fine to set this field later so long as it's assigned before calling
> + * drm_dp_aux_register().
>   *
>   * The @name field may be used to specify the name of the I2C adapter. If set to %NULL, dev_name()
>   * of @dev will be used.
> @@ -1866,6 +1872,7 @@ struct drm_dp_aux {
>  	const char *name;
>  	struct i2c_adapter ddc;
>  	struct device *dev;
> +	struct drm_device *drm_dev;
>  	struct drm_crtc *crtc;
>  	struct mutex hw_mutex;
>  	struct work_struct crc_work;

-- 
Regards,

Laurent Pinchart
