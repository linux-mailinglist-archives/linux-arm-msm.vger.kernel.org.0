Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47020524BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 13:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353294AbiELLmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 07:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351802AbiELLmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 07:42:01 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0637837BFD
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 04:42:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 4so6100635ljw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=6T9T68NcFc0952zVBrDOq932Pet+Nc2yVT/DrOYRhBM=;
        b=MfrdMblJoJMaGsS9/wwW7IgEQsVP493T0B1dVe/hcRSHQa2qJJK6zLDzIs6XqgyR6m
         QqfINpCdr9iBM3iCKd6TTUo+pAsGqLKef6QAyAc2K2RmGJWUjCdnSU07euRA2Bw8FRUT
         JltbqrXpIvCr0205WJ2tqiIoa6maS5A7zmw3V0Dc+Wp8gy8e0p3dQILf38H0rBWeoICh
         2ssSozJzebsLnI83/u/dfjW67b84Qn85zVECo/1GsKsGpu6Kj5AdvifWajNp1Dc5eSST
         rH7y5LadelaqdTVMbl7zqeWBMMyQF4+5YWG92akdBoS/xu+I6Wo3NhiBepyPZYFpP9Z9
         sWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=6T9T68NcFc0952zVBrDOq932Pet+Nc2yVT/DrOYRhBM=;
        b=6Sx8TqAo4FcjD+GIL0tdsRDj8Wmyg40DhvfZkPTb3bCOvJgCpt7p2BiR1AjDHF41xt
         MY68fryWp3fxCAcCaT2BnVcrcdths910yTWj+cJrVh7SHIgLAscZhM48m+9sBpjOUwV4
         B2OYP7LYTKOz6yHYo3beDrK794k2WaQoCwRlhWSPy9bGf9P60kwYp1ActFBCpbttFZmf
         xgRzHxr6myox50BwWQ8hCvzaXJ+h1cYx7xIS4erwo/XORVS2PEJHcAKoGwi+DB4CicEC
         uacOllSaQc1HkUIcOmcREwt0cTLbwn2yyv37VWg60TlGFOOENEfyYuh6LFWVNPHR/uaB
         hZQw==
X-Gm-Message-State: AOAM531p8H4H8XEErLxtLtyO5amIwt8RlWO/9Kmk7Z2UZV7fykJiALPD
        nbjaPsjqjJbOV0o+Gg4p0LEOgVoW2otnbg==
X-Google-Smtp-Source: ABdhPJwrvrRsnMiVU5z5IvyBoA7401rH8GIZeABVb/kiO4ZTWHWXkyItgblVBRrywExalFEcfqjYCg==
X-Received: by 2002:a2e:b0fc:0:b0:24f:1050:ff61 with SMTP id h28-20020a2eb0fc000000b0024f1050ff61mr20342984ljl.290.1652355718324;
        Thu, 12 May 2022 04:41:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f4a000000b0047255d210f0sm753651lfz.31.2022.05.12.04.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 04:41:57 -0700 (PDT)
Message-ID: <d589845f-e85c-5dcb-28cf-ac08eb7c1a8e@linaro.org>
Date:   Thu, 12 May 2022 14:41:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Gracious ping regarding this series. It went for two weeks w/o review.

Few additional points 'pro':
- It makes it possible to handle hpd enablement in cases where the 
driver uses a mixture of drm_bridge_connector and old connectors (msm)
- It makes it possible for other connectors to also implement dynamic 
hpd enablement/disablement in a standard way

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
>   drivers/gpu/drm/drm_bridge_connector.c   | 23 +++----------
>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  4 ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>   include/drm/drm_bridge_connector.h       |  2 --
>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>   8 files changed, 58 insertions(+), 80 deletions(-)
> 


-- 
With best wishes
Dmitry
