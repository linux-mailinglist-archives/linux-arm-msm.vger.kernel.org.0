Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5F659C57E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237303AbiHVRxw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbiHVRxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:53:51 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3138617AB6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:53:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bq23so7304102lfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=g60UCB6/F9SZ5lw7gcfBX7OBKXE2WP3ZQdrtLF+aVgs=;
        b=jR7iiRjbfcBULFzVQ9ymOEseqdzg5pcykaK08MUBZbaV3/ra0ARGc/IQXri9M0jFRi
         RF+Ns8ZT5FhVDwXx4R+tFAD96pOZRNJqn9WmhIkkarErgmfrBMvXVMOtQ/fXpZRJpT37
         S1aSC4DlZy547fTE5RRXhOx4kwlr/WnyAIc+jE1ckwb8i69mKtQ+6G6R7VopZIqu9Wt3
         4eV6n3DyWMgldOfzbLdbtDXIZHJ/Cm7Jn+C3o9wCRCqUSar3orFPydToFg6RicLwKWdX
         iADtrzmvu9GbTtcalnP3qAXKLf3sgBlLCGO28UtVvjqngr+bRbzLPX53Gvtzv+sKUuDe
         2hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g60UCB6/F9SZ5lw7gcfBX7OBKXE2WP3ZQdrtLF+aVgs=;
        b=lPknzhzn5Xzw8vMWx1abiShvbXRGEVE/rWqDXdEs8fW1hlba3iPrd4ijlwi0MIKdYq
         FrikOxvYZuAIev9xkzHAxUBGZMkYGfYNsEitESeaFu+fM5ysdOMYQC9GSwwuErs6i81D
         XF0ZKF+NDVdG8/1EhzJF1xSV/WfbVhgCtGfMoCAkgFa8Vn4/aHXzqnhBl/+DbwRUwHFB
         gwEQK6F6ktzMp/lmC0nyFvBqNwHdFMMgFywUussMjPE4le5USnDlCU+MMfCBj7miF3p/
         5AzkkfvD2r/cAGYWSpbxMvC0SUNkzp3fadoFucpHInZVGBABeAnP/NSzh7py/j9FOVOH
         piBg==
X-Gm-Message-State: ACgBeo2x8Nc12HKMDORi7YNeQgI8km0oR8CxdsizW8J3mx1+UhMhN43C
        1GYhZkqtS/i6Xfd5J89q3g8Bh/dURzN/Ng==
X-Google-Smtp-Source: AA6agR6CusNJoAjglkJH4hW164MlsNX7KoLd+QiAowdGWz3Qby99VA7LSDgeUG459Tx4COvMTkqEqw==
X-Received: by 2002:a05:6512:10cd:b0:492:e84b:a809 with SMTP id k13-20020a05651210cd00b00492e84ba809mr1650155lfg.72.1661190827497;
        Mon, 22 Aug 2022 10:53:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w3-20020a05651234c300b0048b08124139sm2026265lfr.177.2022.08.22.10.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:53:46 -0700 (PDT)
Message-ID: <91f48744-a6fe-d448-4962-9a0d733f752d@linaro.org>
Date:   Mon, 22 Aug 2022 20:53:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [Freedreno] [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
 <99c1a222-5311-acff-6658-c09d41bd0013@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <99c1a222-5311-acff-6658-c09d41bd0013@quicinc.com>
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

On 15/07/2022 00:54, Abhinav Kumar wrote:
> 
> 
> On 7/12/2022 6:22 AM, Dmitry Baryshkov wrote:
>> Currently the DSI driver has two separate paths: one if the next device
>> in a chain is a bridge and another one if the panel is connected
>> directly to the DSI host. Simplify the code path by using panel-bridge
>> driver (already selected in Kconfig) and dropping support for
>> handling the panel directly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> I'm not sending this as a separate patchset (I'd like to sort out mdp5
>> first), but more of a preview of changes related to
>> msm_dsi_manager_ext_bridge_init().
>>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
>>   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
>>   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
>>   4 files changed, 36 insertions(+), 323 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 1625328fa430..4edb9167e600 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -6,14 +6,6 @@
>>   #include "dsi.h"
>>   #include "dsi_cfg.h"
>> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>> -{
>> -    if (!msm_dsi || !msm_dsi_device_connected(msm_dsi))
>> -        return NULL;
>> -
>> -    return msm_dsi->encoder;
>> -}
>> -
>>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>>   {
>>       unsigned long host_flags = 
>> msm_dsi_host_get_mode_flags(msm_dsi->host);
>> @@ -220,7 +212,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, 
>> struct drm_device *dev,
>>                struct drm_encoder *encoder)
>>   {
>>       struct msm_drm_private *priv;
>> -    struct drm_bridge *ext_bridge;
>>       int ret;
>>       if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
>> @@ -254,26 +245,10 @@ int msm_dsi_modeset_init(struct msm_dsi 
>> *msm_dsi, struct drm_device *dev,
>>           goto fail;
>>       }
>> -    /*
>> -     * check if the dsi encoder output is connected to a panel or an
>> -     * external bridge. We create a connector only if we're connected 
>> to a
>> -     * drm_panel device. When we're connected to an external bridge, we
>> -     * assume that the drm_bridge driver will create the connector 
>> itself.
>> -     */
>> -    ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>> -
>> -    if (ext_bridge)
>> -        msm_dsi->connector =
>> -            msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>> -    else
>> -        msm_dsi->connector =
>> -            msm_dsi_manager_connector_init(msm_dsi->id);
>> -
>> -    if (IS_ERR(msm_dsi->connector)) {
>> -        ret = PTR_ERR(msm_dsi->connector);
>> +    ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>> +    if (ret) {
>>           DRM_DEV_ERROR(dev->dev,
>>               "failed to create dsi connector: %d\n", ret);
>> -        msm_dsi->connector = NULL;
>>           goto fail;
>>       }
>> @@ -287,12 +262,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, 
>> struct drm_device *dev,
>>           msm_dsi->bridge = NULL;
>>       }
>> -    /* don't destroy connector if we didn't make it */
>> -    if (msm_dsi->connector && !msm_dsi->external_bridge)
>> -        msm_dsi->connector->funcs->destroy(msm_dsi->connector);
>> -
>> -    msm_dsi->connector = NULL;
> 
>  From what i can see all the usages of msm_dsi->connector are removed 
> after this change. So can we drop that?

The connector field is dropped from the msm_dsi struct. If you are 
asking about the msm_dsi_modeset_init(), we can not drop it since we 
require the DRM device with GEM being initialized in order to allocate 
DSI DMA buffer. We can think about moving DMA buffer allocation towards 
the usage point, however this is definitely a separate commit.

[skipped]

>> *msm_dsi_manager_ext_bridge_init(u8 id)
>>       ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
>>               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>       if (ret == -EINVAL) {
>> -        struct drm_connector *connector;
>> -        struct list_head *connector_list;
>> -
>> -        /* link the internal dsi bridge to the external bridge */
>> -        drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>> -
>>           /*
>> -         * we need the drm_connector created by the external bridge
>> -         * driver (or someone else) to feed it to our driver's
>> -         * priv->connector[] list, mainly for msm_fbdev_init()
>> +         * link the internal dsi bridge to the external bridge,
>> +         * connector is created by the next bridge.
>>            */
>> -        connector_list = &dev->mode_config.connector_list;
>> +        ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>> +        if (ret < 0)
>> +            return ret;
>> +    } else {
>> +        struct drm_connector *connector;
>> -        list_for_each_entry(connector, connector_list, head) {
>> -            if (drm_connector_has_possible_encoder(connector, encoder))
>> -                return connector;
>> +        /* We are in charge of the connector, create one now. */
>> +        connector = drm_bridge_connector_init(dev, encoder);
>> +        if (IS_ERR(connector)) {
>> +            DRM_ERROR("Unable to create bridge connector\n");
>> +            return PTR_ERR(connector);
>>           }
> 
> Ok, I understood now. We create the connector using 
> drm_bridge_connector_init() only when the brige doesnt create one already.
> 
> In both cases since now we are leaving the hpd handling to the next 
> bridge, like I was suggesting, the dsi_hpd_worker() etc can be dropped 
> now. Because anyway without setting the DRM_CONNECTOR_POLL_HPD, event 
> will not be sent to usermode.

I've submitted https://patchwork.freedesktop.org/series/107564/ as a 
separate change.

> 
>> -        return ERR_PTR(-ENODEV);
>> -    }
>> -
>> -    connector = drm_bridge_connector_init(dev, encoder);
>> -    if (IS_ERR(connector)) {
>> -        DRM_ERROR("Unable to create bridge connector\n");
>> -        return ERR_CAST(connector);
>> +        ret = drm_connector_attach_encoder(connector, encoder);
>> +        if (ret < 0)
>> +            return ret;
>>       }
>> -    drm_connector_attach_encoder(connector, encoder);
>> +    /* The pipeline is ready, ping encoders if necessary */
>> +    msm_dsi_manager_set_split_display(id);
>> -    return connector;
>> +    return 0;
>>   }
>>   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)

-- 
With best wishes
Dmitry

