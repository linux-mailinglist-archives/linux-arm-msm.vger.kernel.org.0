Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207C45B56B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 10:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiILIvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 04:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiILIvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 04:51:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7789E2C12D
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 01:51:21 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1AC359D;
        Mon, 12 Sep 2022 10:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662972678;
        bh=Od/d6LlBW2xnygl0iW1ZsBhY+OTpV2C+JIgmzV9Gc7s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Rid4kBnbJuvDOmk0F8kB4FS8PIwA7Cgs/BfZN/e8B58pecCJpnvVGO1cU4E4quMDQ
         Xv+K7YygTYWAnNM8yo+K67jQVcrbEEY5oz/TA6MwO7QQUZzOUxFPpU8Hman4qBMXi9
         9MuWQYEI9+5ebkg95AGME9CC2ac1+15Dgqo9j5ZU=
Message-ID: <87f178f6-0abe-7e5c-5a70-05c2bab94991@ideasonboard.com>
Date:   Mon, 12 Sep 2022 11:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/7] drm/bridge_connector: perform HPD enablement
 automatically
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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

Hi,

On 29/04/2022 21:51, Dmitry Baryshkov wrote:
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

09077bc3116581f4d1cb961ec359ad56586e370b ("drm/bridge_connector: enable 
HPD by default if supported") was merged in March, but I think that one 
is  bit broken 
(https://lore.kernel.org/all/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/). 
To get omapdrm work without WARNs we could just revert that commit, but 
I think this series makes things cleaner.

There's one small problem with this series: in drm_bridge_connector.c 
the drm_bridge_hpd_disable() function is called from 
_drm_bridge_connector_disable_hpd() and from 
drm_bridge_connector_destroy(). This causes two hpd_disable calls when 
removing the driver modules. I think the call from 
drm_bridge_connector_destroy() could be removed, as 
_drm_bridge_connector_disable_hpd() should always get called when 
removing the drivers.

Dmitry, are you still interested in this series? Can you rebase on top 
of current upstream, and revert 09077bc3116581f4d1cb961ec359ad56586e370b 
first?

  Tomi
