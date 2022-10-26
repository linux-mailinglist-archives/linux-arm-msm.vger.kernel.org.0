Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514C760DF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 13:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiJZLYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 07:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiJZLYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 07:24:05 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2131DC8220
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:24:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b8so14679086ljf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdM68UP4J380cFfJCck4+2zTIv1FinWj9xtR9Ddn7GY=;
        b=O3C/bJqGTm06zSL1cRtfNR8GOY5qPOb7Mg9LJpvMgQH/IMrwcUH2dwYjo3R92t0amB
         I6KdB7WrugytX+99V5g18tVODPiS53vQPng+J+Jp9EGncIXgc8unKvvb1KkYeF3KQhUZ
         amQcuy6Hpu1CsbzVxj0hJqkAsYWD7U4xin9erf2LxvUhQW0HIjTnIN1oqYu2h/q4Ftmx
         yvrjc9FVx8nHgqEQrKvF+OFUPZ8YaYP74oRpGVruotkkeAS2YMAdIiw8DSTn5Aif7Rt+
         EDj7BHVrU7DdQ3PHs0/tzSZnl4zaWAmgJpzrqT6w4NH4HDJWtvCE+1nyDKJFZOG6KkG/
         6xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdM68UP4J380cFfJCck4+2zTIv1FinWj9xtR9Ddn7GY=;
        b=m6R4R2iJv05EiO/oVIEGV29dj4go/FAt3IMQiOhfmO/iXqdCYdqfOa3XMNF0Sc5/5h
         EHLt22dwIJJRfysyAznFi2gauMCBuv7kjAQtrWTfTweiT71NvWoHLfjbVL5j7oSYdWl8
         5OMco0WOdqHhswyH1+wjwXi1vrZ0PxTCqv/tZkiqmbNNkBBks2sHPBBY7AjA6ZrlPQEx
         zgiq8OgVeCgGLRZkVeKrPkjoQ5NF3qFHNzqVemDi9cqv1kyhGypeLwLYF+e1krULpnr4
         Ot+hQpHT7IEubgH0Ib65jXuwFKz4TK2bB8OV6MDWz2IHwpIsfVBTNYlzAogQ68EOKWga
         30Uw==
X-Gm-Message-State: ACrzQf1ZoI3I0Z6TFbU8sREyMI/XZekoPdyMRfzfj5OUyLeAqF2y8lkx
        ABa26psOldS8Wa/ZuXDmLOOJOw==
X-Google-Smtp-Source: AMsMyM4sW/B/UAv17zfdOj0B5Fs8l76Zd6KnGTfJd/WIp5VwQlqroX/C254V236i0uZZ9whZ7/y8UA==
X-Received: by 2002:a2e:938b:0:b0:26d:fd3d:4b5c with SMTP id g11-20020a2e938b000000b0026dfd3d4b5cmr15375528ljh.12.1666783442388;
        Wed, 26 Oct 2022 04:24:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u27-20020a2e141b000000b0026df5232c7fsm907675ljd.42.2022.10.26.04.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 04:24:02 -0700 (PDT)
Message-ID: <058c990c-655b-be3b-703f-9adff71fbc8c@linaro.org>
Date:   Wed, 26 Oct 2022 14:24:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
 <bfb23b03-1270-b196-3379-85ff5a55b02b@ideasonboard.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bfb23b03-1270-b196-3379-85ff5a55b02b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/10/2022 14:21, Tomi Valkeinen wrote:
> On 24/10/2022 18:39, Dmitry Baryshkov wrote:
>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>> DRM driver do a proper work of calling
>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>> teaching each and every driver how to properly handle
>> drm_bridge_connector's HPD, make that automatic.
>>
>> Add two additional drm_connector helper funcs: enable_hpd() and
>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>> is the time where the drm_bridge_connector's functions are called by the
>> drivers too).
>>
>> Changes since v1:
>>   - Rebased on top of v6.1-rc1
>>   - Removed the drm_bridge_connector_enable_hpd() from
>>     drm_bridge_connector_init()
>>   - Removed extra underscore prefix from
>>     drm_bridge_connector_en/disable_hpd() helpers
>>
>> Dmitry Baryshkov (7):
>>    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>>    drm/probe-helper: enable and disable HPD on connectors
>>    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>>    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
>>
>>   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>>   include/drm/drm_bridge_connector.h       |  2 --
>>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>>   8 files changed, 59 insertions(+), 81 deletions(-)
>>
> 
> For the series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> This fixes the issue (WARN for "Hot plug detection already enabled") 
> introduced by 09077bc3116581f4d1cb961ec359ad56586e370b, which you revert 
> in the third patch. You could mention this, maybe as a fixes tag and a 
> mention in the description.

I'll add it to the description. However I don't think it's a good idea 
to add Fixes tag. It increases the chances of picking up this single 
patch for the stable tree, which would disable the HPD notifications for 
the non OMAP/iMX boards.


-- 
With best wishes
Dmitry

