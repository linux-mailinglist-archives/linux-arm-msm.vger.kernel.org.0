Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F1C60DF6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 13:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbiJZLVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 07:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbiJZLVp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 07:21:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30ACD748C8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:21:45 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E4954F8;
        Wed, 26 Oct 2022 13:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666783303;
        bh=PpVmlenQ+CMuWL3zwLvdKEcuBas1L9UczdLVyFuhKYo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Zw34wbL6Gr5dBUlpOHhvtsz/ivfRPKdJr+1zcQaXxYQl/fNnKT5T0+u5v4jaHxaia
         6qgzTknGYO9g8n5SUNyW5S6+WiJbQLmdPQaIVcywr6+27PBbwy4gkMIyoPLQHAcLIT
         IIYNyoUv12ttSOcDza/jXJIWDgaaLpMB+JXAwLAA=
Message-ID: <bfb23b03-1270-b196-3379-85ff5a55b02b@ideasonboard.com>
Date:   Wed, 26 Oct 2022 14:21:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 18:39, Dmitry Baryshkov wrote:
>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> DRM driver do a proper work of calling
> drm_bridge_connector_en/disable_hpd() in right places. Rather than
> teaching each and every driver how to properly handle
> drm_bridge_connector's HPD, make that automatic.
> 
> Add two additional drm_connector helper funcs: enable_hpd() and
> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> is the time where the drm_bridge_connector's functions are called by the
> drivers too).
> 
> Changes since v1:
>   - Rebased on top of v6.1-rc1
>   - Removed the drm_bridge_connector_enable_hpd() from
>     drm_bridge_connector_init()
>   - Removed extra underscore prefix from
>     drm_bridge_connector_en/disable_hpd() helpers
> 
> Dmitry Baryshkov (7):
>    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>    drm/probe-helper: enable and disable HPD on connectors
>    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
> 
>   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>   include/drm/drm_bridge_connector.h       |  2 --
>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>   8 files changed, 59 insertions(+), 81 deletions(-)
> 

For the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This fixes the issue (WARN for "Hot plug detection already enabled") 
introduced by 09077bc3116581f4d1cb961ec359ad56586e370b, which you revert 
in the third patch. You could mention this, maybe as a fixes tag and a 
mention in the description.

  Tomi

