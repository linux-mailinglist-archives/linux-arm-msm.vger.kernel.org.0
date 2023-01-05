Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C795D65EE63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 15:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbjAEOJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 09:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjAEOJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 09:09:55 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE082F7AF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 06:09:53 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so1388648wmk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 06:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1d2K6EBLa0i9DYaOKFUZQuPA0/Q9AJBs0TBBGG9+5A=;
        b=fn3+0a53GsD702FNVt2A2IeOlAl+jUqW5lYG0rbNJBErCRhu8dhmNB5chNV3Z712bV
         evZ5jv/7fR2HkKkAntN+zVrbFkzu/MaVYym+TPJ50CEOasGEQyb96g6Amhyf/78faxft
         STG1mF8FmnAIVNyfzx+ckQAtTWDHok66ImQccOLaAnIl/oN71WSFJox0EVFLkvyDe8KZ
         KCuyruYiVt43gKRVz5kBurjPIQ7Etd8uN6xzvDptt41Kubux6E824NBRMF1vJCXoTCxl
         bI8x2lG56dXPQ8+3SFa2zWVUtowN4qSUWIG6lF+EXSGg7sxT0WV7SttZ7grcxk1FFydf
         B/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1d2K6EBLa0i9DYaOKFUZQuPA0/Q9AJBs0TBBGG9+5A=;
        b=0sXVp68+WkOhMFT9mPYRgbhY1qtMauF88+HsdlJ3lhFCmwTXT/q15zr6bSmH6N3odP
         j4uMXgczgai6Hy2+d3JEc8qoQHYg1JS3MNMFvmd2r0tXSGQrSImBmRlpC98FRTcRPUMT
         ENgiNLzncEP2QHqo9GrsQgPm7d2nECcQRXqY7dEteWEp3WGLN9XtfEjSlMZ5tdueA+FF
         qYn/Qk96vNCZHdLYl+e+3UD5vfGqhie+2d0rD3HBXLoNhx5J2c6EK250IBnhMiTTw7cE
         Jlc0+CTHlmYVNB1yyhyf+k4ZXm/+juI1zTGZ8NnXrZsRBDMT5vC39NQ16XFufCSsjUxh
         3FlQ==
X-Gm-Message-State: AFqh2kpq5MWGtLVK/4QGYiZ9m0ENJ0WJ2etPY7mWiFHWhpmTZftZlvPE
        5nWncHnTX9Ye21W8glK078pJNQ==
X-Google-Smtp-Source: AMrXdXthpMyfs3cO+WKLMQ4K1r95WyC+VFsKtEiWz6BGuZw4n1JeOQmBiUhRbgIDSc9jVBl8lIuWcw==
X-Received: by 2002:a05:600c:4b1b:b0:3d2:1d51:2477 with SMTP id i27-20020a05600c4b1b00b003d21d512477mr44697947wmp.11.1672927792485;
        Thu, 05 Jan 2023 06:09:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003d98a7aa12csm2914216wmg.16.2023.01.05.06.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 06:09:52 -0800 (PST)
Message-ID: <36ea5022-f915-11d5-068a-e5680faf67ba@linaro.org>
Date:   Thu, 5 Jan 2023 15:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/7] drm/imx/dcss: stop using
 drm_bridge_connector_en/disable_hpd()
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-5-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221102180705.459294-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/11/2022 19:07, Dmitry Baryshkov wrote:
> The functionality of drm_bridge_connector_enable_hpd() and
> drm_bridge_connector_disable_hpd() is provided automatically by the
> drm_kms_poll helpers. Stop calling these functions manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 ----
>   drivers/gpu/drm/imx/dcss/dcss-kms.c | 2 --
>   2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index 3f5750cc2673..0d8e44f20ec4 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -257,8 +257,6 @@ int dcss_dev_suspend(struct device *dev)
>   	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
>   	int ret;
>   
> -	drm_bridge_connector_disable_hpd(kms->connector);
> -
>   	drm_mode_config_helper_suspend(ddev);
>   
>   	if (pm_runtime_suspended(dev))
> @@ -292,8 +290,6 @@ int dcss_dev_resume(struct device *dev)
>   
>   	drm_mode_config_helper_resume(ddev);
>   
> -	drm_bridge_connector_enable_hpd(kms->connector);
> -
>   	return 0;
>   }
>   #endif /* CONFIG_PM_SLEEP */
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index b4f82ebca532..16ef8aa6da37 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -151,7 +151,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
>   	return kms;
>   
>   cleanup_crtc:
> -	drm_bridge_connector_disable_hpd(kms->connector);
>   	drm_kms_helper_poll_fini(drm);
>   	dcss_crtc_deinit(crtc, drm);
>   
> @@ -167,7 +166,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
>   	struct drm_device *drm = &kms->base;
>   
>   	drm_dev_unregister(drm);
> -	drm_bridge_connector_disable_hpd(kms->connector);
>   	drm_kms_helper_poll_fini(drm);
>   	drm_atomic_helper_shutdown(drm);
>   	drm_crtc_vblank_off(&kms->crtc.base);


I get:
/drivers/gpu/drm/imx/dcss/dcss-dev.c: In function ‘dcss_dev_suspend’:
/drivers/gpu/drm/imx/dcss/dcss-dev.c:256:23: warning: unused variable ‘kms’ [-Wunused-variable]
   256 |  struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
       |                       ^~~
/drivers/gpu/drm/imx/dcss/dcss-dev.c: In function ‘dcss_dev_resume’:
/drivers/gpu/drm/imx/dcss/dcss-dev.c:277:23: warning: unused variable ‘kms’ [-Wunused-variable]
   277 |  struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
       |                       ^~~

I'll fix while applying,

Neil
