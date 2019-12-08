Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FAE116141
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 10:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfLHJb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 04:31:58 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:58452 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLHJb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 04:31:57 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C4ED58063C;
        Sun,  8 Dec 2019 10:31:51 +0100 (CET)
Date:   Sun, 8 Dec 2019 10:31:50 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/4] drm/of: add support to find any enabled endpoint
Message-ID: <20191208093150.GA21141@ravnborg.org>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207203553.286017-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
        a=e5mUnYsNAAAA:8 a=AkfTbbr1AOnX2gBTQ4oA:9 a=CjuIK1q_8ugA:10
        a=xmb-EsYY8bH0VWELuYED:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob.

Patch looks good, one small improvement proposal.

On Sat, Dec 07, 2019 at 12:35:51PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> To handle the case where there are multiple panel endpoints, only one of
> which is enabled/installed, add support for a wildcard endpoint value to
> request finding whichever endpoint is enabled.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_of.c | 41 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 0ca58803ba46..2baf44e401b8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -219,11 +219,44 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>  
> +static int find_enabled_endpoint(const struct device_node *node, u32 port)
> +{
> +	struct device_node *endpoint_node, *remote;
> +	u32 endpoint = 0;
> +
> +	for (endpoint = 0; ; endpoint++) {
> +		endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);
> +		if (!endpoint_node) {
> +			pr_debug("No more endpoints!\n");
> +			return -ENODEV;
> +		}
> +
> +		remote = of_graph_get_remote_port_parent(endpoint_node);
> +		of_node_put(endpoint_node);
> +		if (!remote) {
> +			pr_debug("no valid remote node\n");
> +			continue;
> +		}
> +
> +		if (!of_device_is_available(remote)) {
> +			pr_debug("not available for remote node\n");
> +			of_node_put(remote);
> +			continue;
> +		}
> +
> +		pr_debug("found enabled endpoint %d for %s\n", endpoint, remote->name);
> +		of_node_put(remote);
> +		return endpoint;
> +	}
> +
> +	return -ENODEV;
> +}
This function seems pretty generic. Should this be part of
drivers/of/property.c - as others may have the same need?

> +
>  /**
>   * drm_of_find_panel_or_bridge - return connected panel or bridge device
>   * @np: device tree node containing encoder output ports
>   * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> + * @endpoint: endpoint in the device tree node, or -1 to find an enabled endpoint
>   * @panel: pointer to hold returned drm_panel
>   * @bridge: pointer to hold returned drm_bridge

Introducing a define would make it easier to use this function in the
right way.
For example:
#define OF_ENDPOINT_FIRST	-1


Then we would see this code in the user side:
+       ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1,
					  OF_ENDPOINT_FIRST,
					  &pdata->panel, NULL);

Or something like this.

	Sam


>   *
> @@ -246,6 +279,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	if (panel)
>  		*panel = NULL;
>  
> +	if (endpoint == -1) {
> +		endpoint = find_enabled_endpoint(np, port);
> +		if (endpoint < 0)
> +			return endpoint;
> +	}
> +
>  	remote = of_graph_get_remote_node(np, port, endpoint);
>  	if (!remote)
>  		return -ENODEV;
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
