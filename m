Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20265B56C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 10:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiILIw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 04:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiILIw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 04:52:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D134D2BB35
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 01:52:55 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CB0559D;
        Mon, 12 Sep 2022 10:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662972773;
        bh=sNITFgQ0rgV4FAUjAUR+07fQo7pA+DburyZCyggqXC0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=f7fD2JWrLOQY9+sbuciZ5VlZWskDUxhc2iwFBOARcJpu0wk/niIhJTRBXIRpt64IX
         WJ6v/rUzxxwtYdGUQtzKXzomYxzSO/8VGGxNtj0bA/T0sU3Imn//fxJfQxr9E1gakJ
         sViA3rj2Z1qJZenvRg0YE3vg8CDt8oWidV8nCUw4=
Message-ID: <34103b0a-567c-5315-6dab-c0002e23450a@ideasonboard.com>
Date:   Mon, 12 Sep 2022 11:52:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 7/7] drm/bridge_connector: drop
 drm_bridge_connector_en/disable_hpd()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
 <20220429185157.3673633-8-dmitry.baryshkov@linaro.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220429185157.3673633-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2022 21:51, Dmitry Baryshkov wrote:
> Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
> drm_bridge_connector_disable_hpd() it is safe to remove them complelely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_bridge_connector.c | 25 -------------------------
>   include/drm/drm_bridge_connector.h     |  2 --
>   2 files changed, 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1592da3b9403..d9c1f61b6fb6 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -128,18 +128,6 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>   	drm_kms_helper_hotplug_event(dev);
>   }
>   
> -/**
> - * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
> - * @connector: The DRM bridge connector
> - *
> - * This function enables hot-plug detection for the given bridge connector.
> - * This is typically used by display drivers in their resume handler.
> - */
> -void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
> -{
> -}
> -EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
> -
>   static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)

Here (and for _drm_bridge_connector_disable_hpd) you could remove the 
prefix underscore.

  Tomi
