Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E4F437F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 22:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbhJVUEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 16:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbhJVUEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 16:04:51 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15F8C061766;
        Fri, 22 Oct 2021 13:02:32 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C6A9583178;
        Fri, 22 Oct 2021 22:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634932949;
        bh=LvTOOeRAv/khzIytVw36PjPaHd1n/KPKj62DMIdK7/Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=0Eo2PWoSjGfwdUrKY13nHIrUnz1LBo9OgX9hETDoVdtwktvZFYUKh2bK0Imin8xPe
         ZWB6iSmcsCYAVto+kn4LMKAL7ZUKvLJfUPfJlpzyTkO8D7arI4STRO+u8OxaWeN/AT
         tmxar9kHU8e4h/s/hX1WuNm0cM07t/M1YDwmFSilDW+X+QKyuH1bdG0Q+qb9UsgXlN
         0HUVo25EngKCvBX8v4Ms0c8pBKFe2QIQBy3IaruKslJzIiZnHcQhCkJdJgLulh4KhA
         MYXnsYubSdJlirldCLFYIb3MUykEDPf4jjjx/u+ckfHRswAudDW5Ii2rWwJC/M0zjK
         aHP6rk519hpZw==
Subject: Re: [PATCH v5 13/21] drm/bridge: sn65dsi83: Fix bridge removal
To:     Maxime Ripard <maxime@cerno.tech>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno@lists.freedesktop.org,
        Chen Feng <puck.chen@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        dri-devel@lists.freedesktop.org
References: <20211021073947.499373-1-maxime@cerno.tech>
 <20211021073947.499373-14-maxime@cerno.tech>
From:   Marek Vasut <marex@denx.de>
Message-ID: <ecbad89b-f849-6725-98de-3b405890d96c@denx.de>
Date:   Fri, 22 Oct 2021 22:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211021073947.499373-14-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/21/21 9:39 AM, Maxime Ripard wrote:
> Commit 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach
> callback") moved the unregistration of the bridge DSI device and bridge
> itself to the detach callback.
> 
> While this is correct for the DSI device detach and unregistration, the
> bridge is added in the driver probe, and should thus be removed as part
> of its remove callback.
> 
> Cc: Marek Vasut <marex@denx.de>
> Fixes: 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach callback")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 52030a82f3e1..3bfd07caf8d7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -297,7 +297,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
>   
>   	mipi_dsi_detach(ctx->dsi);
>   	mipi_dsi_device_unregister(ctx->dsi);
> -	drm_bridge_remove(&ctx->bridge);
>   	ctx->dsi = NULL;
>   }
>   
> @@ -693,6 +692,7 @@ static int sn65dsi83_remove(struct i2c_client *client)
>   {
>   	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
>   
> +	drm_bridge_remove(&ctx->bridge);
>   	of_node_put(ctx->host_node);
>   
>   	return 0;

Yes, the above is correct, thanks.

Reviewed-by: Marek Vasut <marex@denx.de>
