Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8FC4BC255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 22:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239001AbiBRVw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 16:52:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235061AbiBRVw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 16:52:58 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216823F884
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 13:52:40 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id c15so6160903ljf.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O4CsnBjYy03NrYURxvtz1s+vFa+ZGHorTAV/ULTGx+o=;
        b=yts1Vje/3ZqmS8WRYE1+0krC4ok8bChd+aSKmoTLV1pUUCUG2CQILVwTBjNgZU5DaU
         EzbLBHg/Cm0/e9CwdCsLx4fbhTzts+1Jk2Egi0DZjRv4csNR8xZH6WPMoA7BkyQBpfT8
         5zOpWpyFcuxiLE97AcwIAQ5E6th49sX0JaHZ3KnMRAo3GJZSJ+eMELkOc8n284zBaXIg
         WuwcHqspo8en6PF8KG3D8Bybiy16H5DXXclXIubOEiPL0Blwy7jDHE3pJpWrUZVmlw92
         q+gaXClXQ0fXaVjePXONxQiXADwuq4H6JIyo3R1UZF8ZLZJ5BY4HlOvF3NJzgJRBFNu7
         bpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O4CsnBjYy03NrYURxvtz1s+vFa+ZGHorTAV/ULTGx+o=;
        b=7yWDD8juuOTb42Jy1GPeFANoTgY1sinaGjROw5MEVwvXYKYpsRmtThstPM/RknZNlS
         F7D3XqMkkvyJrT66n/lQGHdtkCz+9GYIvB1M4+Y4o5oVdU0qXGsNXPALcKJdpxZH2WEI
         6UqAlRWj8o/tC7WZGPuAhauvoNppDPqg8wfSScTrlq98aZMd61TCvXDLod4ZgzukZleH
         a2syPxZgUtYVisNXOu4EC+msJwZ2sb6LxY7jOC1yO0du74a0smF5pLB+v0M2RNgbq1C3
         qqJcmnCHfMk6IQ36OijZZoKwVjB95+kTF4q5+4+NogM92dMwcgmmtWWrnh9QI7OyEs2n
         DOIQ==
X-Gm-Message-State: AOAM531PcQL3bauQSZiHUtLoOoZYvXFrj4bRRgCsobrTSfebYJhZ2iPw
        i5viozzbWT8eeZkBsSR5gTQ2Vg==
X-Google-Smtp-Source: ABdhPJyE66f/SQndtIl1uuz70XtwABe9awB7k+cnZicYMWXjL4GOkIiAAav9AwDKGw7n86qQ2feJVw==
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id w19-20020a2e3013000000b002462ca9365emr1229795ljw.291.1645221158445;
        Fri, 18 Feb 2022 13:52:38 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25sm380996lfs.213.2022.02.18.13.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 13:52:37 -0800 (PST)
Message-ID: <091d8484-b7a7-05da-65df-f99d0a9be3c5@linaro.org>
Date:   Sat, 19 Feb 2022 00:52:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/02/2022 00:31, Kuogee Hsieh wrote:
> 
> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
>> There is little point in having both connector and root bridge
>> implementation in the same driver. Move connector's functionality to the
>> bridge to let next bridge in chain to override it.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This patch break primary (edp) display
> 
> -- right half of screen garbled
> 
> -- screen shift vertically
> 
> below are error messages seen --
> 
> [   36.679216] panel-edp soc@0:edp_panel: No display modes
> [   36.687272] panel-edp soc@0:edp_panel: No display modes
> [   40.593709] panel-edp soc@0:edp_panel: No display modes
> [   40.600285] panel-edp soc@0:edp_panel: No display modes

Thanks for testing this series!

Could you please post the result of `modetest -c` after this patch?


> 
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  22 +++---
>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 113 ++++++++++------------------
>>   2 files changed, 52 insertions(+), 83 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 45f9a912ecc5..59e5e5b8e5b4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1501,6 +1501,17 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>       dp_display->encoder = encoder;
>> +    dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
>> +    if (IS_ERR(dp_display->bridge)) {
>> +        ret = PTR_ERR(dp_display->bridge);
>> +        DRM_DEV_ERROR(dev->dev,
>> +            "failed to create dp bridge: %d\n", ret);
>> +        dp_display->bridge = NULL;
>> +        return ret;
>> +    }
>> +
>> +    priv->bridges[priv->num_bridges++] = dp_display->bridge;
>> +
>>       dp_display->connector = dp_drm_connector_init(dp_display);
>>       if (IS_ERR(dp_display->connector)) {
>>           ret = PTR_ERR(dp_display->connector);
>> @@ -1514,17 +1525,6 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>       priv->connectors[priv->num_connectors++] = dp_display->connector;
>> -    dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
>> -    if (IS_ERR(dp_display->bridge)) {
>> -        ret = PTR_ERR(dp_display->bridge);
>> -        DRM_DEV_ERROR(dev->dev,
>> -            "failed to create dp bridge: %d\n", ret);
>> -        dp_display->bridge = NULL;
>> -        return ret;
>> -    }
>> -
>> -    priv->bridges[priv->num_bridges++] = dp_display->bridge;
>> -
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index 80f59cf99089..57800b865fe6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include "msm_drv.h"
>> @@ -20,24 +21,16 @@ struct msm_dp_bridge {
>>   #define to_dp_display(x)     container_of((x), struct msm_dp_bridge, 
>> bridge)
>> -struct dp_connector {
>> -    struct drm_connector base;
>> -    struct msm_dp *dp_display;
>> -};
>> -#define to_dp_connector(x) container_of(x, struct dp_connector, base)
>> -
>>   /**
>> - * dp_connector_detect - callback to determine if connector is connected
>> - * @conn: Pointer to drm connector structure
>> - * @force: Force detect setting from drm framework
>> - * Returns: Connector 'is connected' status
>> + * dp_bridge_detect - callback to determine if connector is connected
>> + * @bridge: Pointer to drm bridge structure
>> + * Returns: Bridge's 'is connected' status
>>    */
>> -static enum drm_connector_status dp_connector_detect(struct 
>> drm_connector *conn,
>> -        bool force)
>> +static enum drm_connector_status dp_bridge_detect(struct drm_bridge 
>> *bridge)
>>   {
>>       struct msm_dp *dp;
>> -    dp = to_dp_connector(conn)->dp_display;
>> +    dp = to_dp_display(bridge)->dp_display;
>>       DRM_DEBUG_DP("is_connected = %s\n",
>>           (dp->is_connected) ? "true" : "false");
>> @@ -47,11 +40,12 @@ static enum drm_connector_status 
>> dp_connector_detect(struct drm_connector *conn,
>>   }
>>   /**
>> - * dp_connector_get_modes - callback to add drm modes via 
>> drm_mode_probed_add()
>> + * dp_bridge_get_modes - callback to add drm modes via 
>> drm_mode_probed_add()
>> + * @bridge: Poiner to drm bridge
>>    * @connector: Pointer to drm connector structure
>>    * Returns: Number of modes added
>>    */
>> -static int dp_connector_get_modes(struct drm_connector *connector)
>> +static int dp_bridge_get_modes(struct drm_bridge *bridge, struct 
>> drm_connector *connector)
>>   {
>>       int rc = 0;
>>       struct msm_dp *dp;
>> @@ -61,7 +55,7 @@ static int dp_connector_get_modes(struct 
>> drm_connector *connector)
>>       if (!connector)
>>           return 0;
>> -    dp = to_dp_connector(connector)->dp_display;
>> +    dp = to_dp_display(bridge)->dp_display;
>>       dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
>>       if (!dp_mode)
>> @@ -102,18 +96,20 @@ static int dp_connector_get_modes(struct 
>> drm_connector *connector)
>>   }
>>   /**
>> - * dp_connector_mode_valid - callback to determine if specified mode 
>> is valid
>> - * @connector: Pointer to drm connector structure
>> + * dp_bridge_mode_valid - callback to determine if specified mode is 
>> valid
>> + * @bridge: Pointer to drm bridge structure
>> + * @info: display info
>>    * @mode: Pointer to drm mode structure
>>    * Returns: Validity status for specified mode
>>    */
>> -static enum drm_mode_status dp_connector_mode_valid(
>> -        struct drm_connector *connector,
>> -        struct drm_display_mode *mode)
>> +static enum drm_mode_status dp_bridge_mode_valid(
>> +        struct drm_bridge *bridge,
>> +        const struct drm_display_info *info,
>> +        const struct drm_display_mode *mode)
>>   {
>>       struct msm_dp *dp_disp;
>> -    dp_disp = to_dp_connector(connector)->dp_display;
>> +    dp_disp = to_dp_display(bridge)->dp_display;
>>       if ((dp_disp->max_pclk_khz <= 0) ||
>>               (dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
>> @@ -123,55 +119,6 @@ static enum drm_mode_status dp_connector_mode_valid(
>>       return dp_display_validate_mode(dp_disp, mode->clock);
>>   }
>> -static const struct drm_connector_funcs dp_connector_funcs = {
>> -    .detect = dp_connector_detect,
>> -    .fill_modes = drm_helper_probe_single_connector_modes,
>> -    .destroy = drm_connector_cleanup,
>> -    .reset = drm_atomic_helper_connector_reset,
>> -    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> -    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> -};
>> -
>> -static const struct drm_connector_helper_funcs 
>> dp_connector_helper_funcs = {
>> -    .get_modes = dp_connector_get_modes,
>> -    .mode_valid = dp_connector_mode_valid,
>> -};
>> -
>> -/* connector initialization */
>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>> -{
>> -    struct drm_connector *connector = NULL;
>> -    struct dp_connector *dp_connector;
>> -    int ret;
>> -
>> -    dp_connector = devm_kzalloc(dp_display->drm_dev->dev,
>> -                    sizeof(*dp_connector),
>> -                    GFP_KERNEL);
>> -    if (!dp_connector)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -    dp_connector->dp_display = dp_display;
>> -
>> -    connector = &dp_connector->base;
>> -
>> -    ret = drm_connector_init(dp_display->drm_dev, connector,
>> -            &dp_connector_funcs,
>> -            dp_display->connector_type);
>> -    if (ret)
>> -        return ERR_PTR(ret);
>> -
>> -    drm_connector_helper_add(connector, &dp_connector_helper_funcs);
>> -
>> -    /*
>> -     * Enable HPD to let hpd event is handled when cable is connected.
>> -     */
>> -    connector->polled = DRM_CONNECTOR_POLL_HPD;
>> -
>> -    drm_connector_attach_encoder(connector, dp_display->encoder);
>> -
>> -    return connector;
>> -}
>> -
>>   static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>>                   const struct drm_display_mode *mode,
>>                   const struct drm_display_mode *adjusted_mode)
>> @@ -211,6 +158,9 @@ static const struct drm_bridge_funcs dp_bridge_ops 
>> = {
>>       .disable      = dp_bridge_disable,
>>       .post_disable = dp_bridge_post_disable,
>>       .mode_set     = dp_bridge_mode_set,
>> +    .mode_valid   = dp_bridge_mode_valid,
>> +    .get_modes    = dp_bridge_get_modes,
>> +    .detect       = dp_bridge_detect,
>>   };
>>   struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, 
>> struct drm_device *dev,
>> @@ -228,7 +178,12 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>> msm_dp *dp_display, struct drm_devi
>>       bridge = &dp_bridge->bridge;
>>       bridge->funcs = &dp_bridge_ops;
>> -    bridge->encoder = encoder;
>> +    bridge->type = dp_display->connector_type;
>> +
>> +    bridge->ops =
>> +        DRM_BRIDGE_OP_DETECT |
>> +        DRM_BRIDGE_OP_HPD |
>> +        DRM_BRIDGE_OP_MODES;
>>       rc = drm_bridge_attach(encoder, bridge, NULL, 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>       if (rc) {
>> @@ -249,3 +204,17 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>> msm_dp *dp_display, struct drm_devi
>>       return bridge;
>>   }
>> +
>> +/* connector initialization */
>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>> +{
>> +    struct drm_connector *connector = NULL;
>> +
>> +    connector = drm_bridge_connector_init(dp_display->drm_dev, 
>> dp_display->encoder);
>> +    if (IS_ERR(connector))
>> +        return connector;
>> +
>> +    drm_connector_attach_encoder(connector, dp_display->encoder);
>> +
>> +    return connector;
>> +}


-- 
With best wishes
Dmitry
