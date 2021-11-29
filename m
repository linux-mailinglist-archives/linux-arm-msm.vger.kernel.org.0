Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0993461C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 17:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbhK2RC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 12:02:29 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:39503 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347599AbhK2RA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 12:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638205031; x=1669741031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OQTNBwyXrHTcWK966nUAlJ9/kkhL9qZbzrLErVRSaak=;
  b=bb1u6E1pJDcI1MRpZ/QD3IpfZflTYE0Bt6SSY+L3Ujt5o4E0KGD/tXB3
   Ajv8gbM+Ur0maY+YPrktUbXD2CYzLsbVev8rqVdr3BonVGhCJR73IJpC5
   RSmTc2BXRLMPjMr80dixaUT8YwyigVdEBepiM2A8SZ75wz9lqxbPiSfqf
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Nov 2021 08:57:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 08:57:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 08:57:09 -0800
Received: from [10.110.80.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 29 Nov
 2021 08:57:08 -0800
Message-ID: <91c46d6e-bbdb-52e4-8e50-9c96f2d1e029@quicinc.com>
Date:   Mon, 29 Nov 2021 08:57:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] drm/msm/dp: employ bridge mechanism for display enable
 and disable
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1637002123-18682-1-git-send-email-quic_khsieh@quicinc.com>
 <02b7b643-f6d4-aa5f-6e05-46aa7c3a81cb@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <02b7b643-f6d4-aa5f-6e05-46aa7c3a81cb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/24/2021 11:45 AM, Dmitry Baryshkov wrote:
> On 15/11/2021 21:48, Kuogee Hsieh wrote:
>> Currently the msm_dp_*** functions implement the same sequence which 
>> would
>> happen when drm_bridge is used. hence get rid of this intermediate layer
>> and align with the drm_bridge usage to avoid customized implementation.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>
>> Changes in v2:
>> -- revise commit text
>> -- rename dp_bridge to msm_dp_bridge
>> -- delete empty functions
>>
>> Changes in 3:
>> -- replace kzalloc() with devm_kzalloc()
>> -- replace __dp_display_enable() with dp_display_enable()
>> -- replace __dp_display_disable() with dp_display_disable()
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 -------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++
>>   drivers/gpu/drm/msm/dp/dp_display.c         |  4 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
>>   drivers/gpu/drm/msm/dp/dp_drm.c             | 91 
>> +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_drv.h               | 16 +++--
>>   6 files changed, 113 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 31050aa..c4e08c4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1003,9 +1003,6 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>>   -    if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
>> -        msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
>> -
>>       list_for_each_entry(conn_iter, connector_list, head)
>>           if (conn_iter->encoder == drm_enc)
>>               conn = conn_iter;
>> @@ -1181,14 +1178,6 @@ static void dpu_encoder_virt_enable(struct 
>> drm_encoder *drm_enc)
>>         _dpu_encoder_virt_enable_helper(drm_enc);
>>   -    if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -        ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
>> -        if (ret) {
>> -            DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
>> -                ret);
>> -            goto out;
>> -        }
>> -    }
>>       dpu_enc->enabled = true;
>>     out:
>> @@ -1214,11 +1203,6 @@ static void dpu_encoder_virt_disable(struct 
>> drm_encoder *drm_enc)
>>       /* wait for idle */
>>       dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
>>   -    if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -        if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
>> -            DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
>> -    }
>> -
>>       dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>>         for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> @@ -1243,11 +1227,6 @@ static void dpu_encoder_virt_disable(struct 
>> drm_encoder *drm_enc)
>>         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>>   -    if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
>> -        if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
>> -            DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
>> -    }
>> -
>>       mutex_unlock(&dpu_enc->enc_lock);
>>   }
>>   diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 27d98b5..d16337f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -557,6 +557,13 @@ static int 
>> _dpu_kms_initialize_displayport(struct drm_device *dev,
>>                     encoder->base.id, rc);
>>               return rc;
>>           }
>> +
>> +        rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);
>> +        if (rc) {
>> +            DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
>> +                encoder->base.id, rc);
>> +            return rc;
>> +        }
>
> There is no need to teach DPU driver about all the gory details of DP 
> internals. Move this call to the msm_dp_modeset_init().

This has been done at v4.

I will submit v5 to address other commands.

>
>>       }
>>         return rc;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 2f113ff..51770a4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1674,8 +1674,8 @@ int msm_dp_display_disable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>>   }
>>     void msm_dp_display_mode_set(struct msm_dp *dp, struct 
>> drm_encoder *encoder,
>> -                struct drm_display_mode *mode,
>> -                struct drm_display_mode *adjusted_mode)
>> +                const struct drm_display_mode *mode,
>> +                const struct drm_display_mode *adjusted_mode)
>>   {
>>       struct dp_display_private *dp_display;
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>> b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 76f45f9..2237e80 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -13,6 +13,7 @@
>>   struct msm_dp {
>>       struct drm_device *drm_dev;
>>       struct device *codec_dev;
>> +    struct drm_bridge *bridge;
>>       struct drm_connector *connector;
>>       struct drm_encoder *encoder;
>>       struct drm_panel *drm_panel;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index f33e315..b341f1f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -5,12 +5,21 @@
>>     #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic.h>
>> +#include <drm/drm_bridge.h>
>>   #include <drm/drm_crtc.h>
>>     #include "msm_drv.h"
>>   #include "msm_kms.h"
>>   #include "dp_drm.h"
>>   +
>> +struct msm_dp_bridge {
>> +    struct drm_bridge bridge;
>> +    struct msm_dp *dp_display;
>> +};
>> +
>> +#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, 
>> bridge)
>> +
>>   struct dp_connector {
>>       struct drm_connector base;
>>       struct msm_dp *dp_display;
>> @@ -162,3 +171,85 @@ struct drm_connector 
>> *dp_drm_connector_init(struct msm_dp *dp_display)
>>         return connector;
>>   }
>> +
>> +static int dp_bridge_attach(struct drm_bridge *drm_bridge,
>> +                enum drm_bridge_attach_flags flags)
>> +{
>> +    return 0;
>> +}
>
> As far as I see from drm_bridge_attach() there is no need to provide 
> stubs for attach callback. Please drop it.
>
>> +
>> +static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>> +                const struct drm_display_mode *mode,
>> +                const struct drm_display_mode *adjusted_mode)
>> +{
>> +    struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +    struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +    msm_dp_display_mode_set(dp_display, drm_bridge->encoder, mode, 
>> adjusted_mode);
>> +}
>> +
>> +static void dp_bridge_enable(struct drm_bridge *drm_bridge)
>> +{
>> +    struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +    struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +    msm_dp_display_enable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static void dp_bridge_disable(struct drm_bridge *drm_bridge)
>> +{
>> +    struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +    struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +    msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>> +{
>> +    struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
>> +    struct msm_dp *dp_display = dp_bridge->dp_display;
>> +
>> +    msm_dp_display_disable(dp_display, drm_bridge->encoder);
>> +}
>> +
>> +static const struct drm_bridge_funcs dp_bridge_ops = {
>> +    .attach       = dp_bridge_attach,
>> +    .mode_fixup   = NULL,
>> +    .pre_enable   = NULL,
>
> No need to initialize fields to default values (NULL). Drop these two 
> please.
>
>> +    .enable       = dp_bridge_enable,
>> +    .disable      = dp_bridge_disable,
>> +    .post_disable = dp_bridge_post_disable,
>> +    .mode_set     = dp_bridge_mode_set,
>> +};
>> +
>> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device 
>> *dev,
>> +            struct drm_encoder *encoder)
>> +{
>> +    int rc;
>> +    struct msm_drm_private *priv;
>> +    struct msm_dp_bridge *dp_bridge;
>> +    struct drm_bridge *bridge;
>> +
>> +    dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
>> +    if (!dp_bridge)
>> +        return -ENOMEM;
>> +
>> +    dp_bridge->dp_display = dp_display;
>> +
>> +    bridge = &dp_bridge->bridge;
>> +    bridge->funcs = &dp_bridge_ops;
>> +    bridge->encoder = encoder;
>> +
>> +    rc = drm_bridge_attach(encoder, bridge, NULL, 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +    if (rc) {
>> +        DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
>> +        kfree(dp_bridge);
>> +        return rc;
>> +    }
>> +
>> +    priv = dev->dev_private;
>> +    priv->bridges[priv->num_bridges++] = bridge;
>> +    dp_display->bridge = bridge;
>> +
>> +    return 0;
>> +} > diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
>> index 4bb797e..9a2092f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -388,8 +388,10 @@ int msm_dp_display_enable(struct msm_dp *dp, 
>> struct drm_encoder *encoder);
>>   int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder 
>> *encoder);
>>   int msm_dp_display_pre_disable(struct msm_dp *dp, struct 
>> drm_encoder *encoder);
>>   void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder 
>> *encoder,
>> -                struct drm_display_mode *mode,
>> -                struct drm_display_mode *adjusted_mode);
>> +                const struct drm_display_mode *mode,
>> +                const struct drm_display_mode *adjusted_mode);
>> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device 
>> *dev,
>> +            struct drm_encoder *encoder);
>>   void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct 
>> msm_dp *dp_display);
>>   @@ -426,10 +428,16 @@ static inline int 
>> msm_dp_display_pre_disable(struct msm_dp *dp,
>>   }
>>   static inline void msm_dp_display_mode_set(struct msm_dp *dp,
>>                   struct drm_encoder *encoder,
>> -                struct drm_display_mode *mode,
>> -                struct drm_display_mode *adjusted_mode)
>> +                const struct drm_display_mode *mode,
>> +                const struct drm_display_mode *adjusted_mode)
>>   {
>>   }
>> +static inline int msm_dp_bridge_init(struct msm_dp *dp_display,
>> +                struct drm_device *dev,
>> +                struct drm_encoder *encoder)
>> +{
>> +    return -EINVAL;
>> +}
>
> If msm_dp_bridge_init() becomes DP-internal function, this is 
> unnecessary.
>
>>     static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>   {
>>
>
>
