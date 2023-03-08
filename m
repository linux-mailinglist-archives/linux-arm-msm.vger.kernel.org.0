Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0508F6B03F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCHKVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjCHKUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:20:51 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A33B5B6E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:20:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B4A73CE1F0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 10:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DF2C433D2;
        Wed,  8 Mar 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678270847;
        bh=dYw3bdt8OjkT1450pHMtn1/VHR8mYUBh6b33Wlzd3XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MFEL2qBiZBurw4QDN9H95DGzJWDBWsf9UdBA2S/YKVnvXd0M7FCQgvFjGO69Dks6H
         EcRYmvLx1nCsWAErtohgslo3ST41Uy7bEwZS7rImsNYHWWf4l5Sn/3OSnfeP+xp9cV
         kGUt+e9jBgsWhF+c6NwwovRSEq49ioFeKAXjQ4z2kmwgamea630Ge2E0PZ7ZaJfNDf
         nEaZq4SOgWb1sB6iO7QIsxlw1XCF9Z0v+jDZPvVNCcJIXHrA/SoSRp/bO9qwz4j2qC
         FNLYRH8UiyMg8RHwuuPy3l/JFbpJPPuJnqm1a0QIhP3GS/z75Bl1HrudJOeUJqmvQ7
         zKxys6vO/s5IA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pZqvM-0005Xx-0H; Wed, 08 Mar 2023 11:21:32 +0100
Date:   Wed, 8 Mar 2023 11:21:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
Message-ID: <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 02, 2022 at 09:07:03PM +0300, Dmitry Baryshkov wrote:
> The functionality of drm_bridge_connector_enable_hpd() and
> drm_bridge_connector_disable_hpd() is provided automatically by the
> drm_kms_poll helpers. Stop calling these functions manually.

I stumbled over this one when investigating a hotplug-related crash in
the MSM DRM driver which this series prevents by moving hotplug
notification enable to drm_kms_helper_poll_enable().

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 93fe61b86967..a540c45d4fd3 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>  		goto fail;
>  	}
>  
> -	drm_bridge_connector_enable_hpd(hdmi->connector);
> -
>  	ret = msm_hdmi_hpd_enable(hdmi->bridge);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);

It looks like you are now enabling hotplug events before the DRM driver
is ready to receive them (i.e. msm_hdmi_hpd_enable() is called before
drm_bridge_connector_enable_hpd()).

Could this not lead to missed events or is the state being setup
correctly somewhere else?

Shouldn't the call to msm_hdmi_hpd_enable() be moved to when HPD is
enabled either way (e.g. by being converted to a hpd_enable callback)?

Johan
