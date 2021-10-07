Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB35425EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbhJGVbs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Thu, 7 Oct 2021 17:31:48 -0400
Received: from aposti.net ([89.234.176.197]:46020 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230120AbhJGVbs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:31:48 -0400
Date:   Thu, 07 Oct 2021 22:29:42 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 15/34] drm/ingenic: Migrate to aggregate driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Message-Id: <IDMM0R.KPFO72NRAH8T2@crapouillou.net>
In-Reply-To: <20211006193819.2654854-16-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
        <20211006193819.2654854-16-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Le mer., oct. 6 2021 at 12:38:00 -0700, Stephen Boyd 
<swboyd@chromium.org> a écrit :
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to 
> all
> the component devices that make up the aggregate device.
> 
> TODO: Move the helpers to PM in aggregate driver hooks.
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24 
> +++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cd..058b7bfe5610 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device 
> *dev, bool has_components)
>  	return ret;
>  }
> 
> -static int ingenic_drm_bind_with_components(struct device *dev)
> +static int ingenic_drm_bind_with_components(struct aggregate_device 
> *adev)
>  {
> +	struct device *dev = adev->parent;
> +
>  	return ingenic_drm_bind(dev, true);
>  }
> 
> @@ -1174,9 +1176,19 @@ static void ingenic_drm_unbind(struct device 
> *dev)
>  	drm_atomic_helper_shutdown(&priv->drm);
>  }
> 
> -static const struct component_master_ops ingenic_master_ops = {
> -	.bind = ingenic_drm_bind_with_components,
> -	.unbind = ingenic_drm_unbind,
> +static void ingenic_aggregate_remove(struct aggregate_device *adev)
> +{
> +	struct device *dev = adev->parent;

Space here.

With that:

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> +	ingenic_drm_unbind(dev);
> +}
> +
> +static struct aggregate_driver ingenic_aggregate_driver = {
> +	.probe = ingenic_drm_bind_with_components,
> +	.remove = ingenic_aggregate_remove,
> +	.driver = {
> +		.name = "ingenic_drm",
> +		.owner = THIS_MODULE,
> +	},
>  };
> 
>  static int ingenic_drm_probe(struct platform_device *pdev)
> @@ -1196,7 +1208,7 @@ static int ingenic_drm_probe(struct 
> platform_device *pdev)
>  	drm_of_component_match_add(dev, &match, compare_of, np);
>  	of_node_put(np);
> 
> -	return component_master_add_with_match(dev, &ingenic_master_ops, 
> match);
> +	return component_aggregate_register(dev, &ingenic_aggregate_driver, 
> match);
>  }
> 
>  static int ingenic_drm_remove(struct platform_device *pdev)
> @@ -1206,7 +1218,7 @@ static int ingenic_drm_remove(struct 
> platform_device *pdev)
>  	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		ingenic_drm_unbind(dev);
>  	else
> -		component_master_del(dev, &ingenic_master_ops);
> +		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
> 
>  	return 0;
>  }
> --
> https://chromeos.dev
> 


