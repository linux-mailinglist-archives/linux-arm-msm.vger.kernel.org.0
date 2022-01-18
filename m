Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6705D492FDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 22:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349468AbiARVDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 16:03:05 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:24381 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349473AbiARVDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 16:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642539785; x=1674075785;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tggm5gnESDm+jKKXgKOyjeSoHgHViF3SwJtMVG7MtTQ=;
  b=NW4GCHPe8HJF6c4i6m1kObJ37AtaNBsZc3jM9WQ41/Tl5NY6AJRx0ixB
   fUwcJJRGWMRwwbSpVpcnBEDuZkOpsWQ8amJmgBu309F0T1DJq3KoN0/eY
   QR/I+e2Vki+8ENV3UBCCUkkCERmQXOYBbuMC6xCJo5fR60XpWWXpvF0Mq
   g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jan 2022 13:03:04 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 13:03:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 13:03:03 -0800
Received: from [10.111.164.20] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 18 Jan
 2022 13:03:01 -0800
Message-ID: <8393c4d1-3342-ab0e-8a83-4a9f681b38f9@quicinc.com>
Date:   Tue, 18 Jan 2022 13:02:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-3-dmitry.baryshkov@linaro.org>
 <a6b371ae-5672-d3ef-1a48-cffdf7722674@quicinc.com>
 <CAA8EJpr0V2inSn9NJGJegv3tKw8HgmRZD-5G43jdMJcgXv=shw@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpr0V2inSn9NJGJegv3tKw8HgmRZD-5G43jdMJcgXv=shw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/18/2022 12:01 PM, Dmitry Baryshkov wrote:
> On Tue, 18 Jan 2022 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/7/2021 2:29 PM, Dmitry Baryshkov wrote:
>>> Currently the DSI driver has two separate paths: one if the next device
>>> in a chain is a bridge and another one if the panel is connected
>>> directly to the DSI host. Simplify the code path by using panel-bridge
>>> driver (already selected in Kconfig) and dropping support for
>>> handling the panel directly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi.c         |  32 +---
>>>    drivers/gpu/drm/msm/dsi/dsi.h         |  10 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_host.c    |  20 +-
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 257 +++-----------------------
>>>    4 files changed, 32 insertions(+), 287 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>>> index 9670e548b3e9..b61f451a282e 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>> @@ -208,7 +208,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                         struct drm_encoder *encoder)
>>>    {
>>>        struct msm_drm_private *priv;
>>> -     struct drm_bridge *ext_bridge;
>>> +     struct drm_connector *connector;
>>>        int ret;
>>>
>>>        if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
>>> @@ -238,31 +238,17 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                goto fail;
>>>        }
>>>
>>> -     /*
>>> -      * check if the dsi encoder output is connected to a panel or an
>>> -      * external bridge. We create a connector only if we're connected to a
>>> -      * drm_panel device. When we're connected to an external bridge, we
>>> -      * assume that the drm_bridge driver will create the connector itself.
>>> -      */
>>> -     ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>>> -
>>> -     if (ext_bridge)
>>> -             msm_dsi->connector =
>>> -                     msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> -     else
>>> -             msm_dsi->connector =
>>> -                     msm_dsi_manager_connector_init(msm_dsi->id);
>>> -
>>> -     if (IS_ERR(msm_dsi->connector)) {
>>> -             ret = PTR_ERR(msm_dsi->connector);
>>> +     connector = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> +
>>> +     if (IS_ERR(connector)) {
>>> +             ret = PTR_ERR(connector);
>>>                DRM_DEV_ERROR(dev->dev,
>>>                        "failed to create dsi connector: %d\n", ret);
>>> -             msm_dsi->connector = NULL;
>>>                goto fail;
>>>        }
>>          Please correct my understanding if incorrect. Here you are expecting
>> that the existing panels/bridges have already used
>> drm_panel_bridge_add_typed add the bridge? Otherwise we will goto the
>> fail goto?
> 
> No.
> 
>>
>> @@ -727,8 +509,11 @@  struct drm_connector
>> *msm_dsi_manager_ext_bridge_init(u8 id)
>>          int ret;
>>
>>          int_bridge = msm_dsi->bridge;
>> -       ext_bridge = msm_dsi->external_bridge =
>> -                       msm_dsi_host_get_bridge(msm_dsi->host);
>> +       ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>> +       if (IS_ERR(ext_bridge))
>> +               return ERR_PTR(PTR_ERR(ext_bridge));
>> +
>> +       msm_dsi->external_bridge = ext_bridge;
>>
>> Does that mean you plan to migrate the existing msm panels/bridges to
>> use devm_drm_panel_bridge_add_typed?
> 
> No. panel-bridge.c/devm_drm_of_get_bridge() does that in a transparent
> way. It calls devm_drm_panel_bridge_add() on it's own.
Ah okay, got it, Thanks.
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>>
>>>        priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>>> -     priv->connectors[priv->num_connectors++] = msm_dsi->connector;
>>> +     priv->connectors[priv->num_connectors++] = connector;
>>>
>>>        return 0;
>>>    fail:
>>> @@ -272,12 +258,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>>                msm_dsi->bridge = NULL;
>>>        }
>>>
>>> -     /* don't destroy connector if we didn't make it */
>>> -     if (msm_dsi->connector && !msm_dsi->external_bridge)
>>> -             msm_dsi->connector->funcs->destroy(msm_dsi->connector);
>>> -
>>> -     msm_dsi->connector = NULL;
>>> -
>>>        return ret;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>>> index f46df52c6985..7eb778070a8c 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>> @@ -49,8 +49,6 @@ struct msm_dsi {
>>>        struct drm_device *dev;
>>>        struct platform_device *pdev;
>>>
>>> -     /* connector managed by us when we're connected to a drm_panel */
>>> -     struct drm_connector *connector;
>>>        /* internal dsi bridge attached to MDP interface */
>>>        struct drm_bridge *bridge;
>>>
>>> @@ -58,10 +56,8 @@ struct msm_dsi {
>>>        struct msm_dsi_phy *phy;
>>>
>>>        /*
>>> -      * panel/external_bridge connected to dsi bridge output, only one of the
>>> -      * two can be valid at a time
>>> +      * external_bridge connected to dsi bridge output
>>>         */
>>> -     struct drm_panel *panel;
>>>        struct drm_bridge *external_bridge;
>>>
>>>        struct device *phy_dev;
>>> @@ -76,7 +72,6 @@ struct msm_dsi {
>>>    /* dsi manager */
>>>    struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>>>    void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>>> -struct drm_connector *msm_dsi_manager_connector_init(u8 id);
>>>    struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
>>>    int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>>>    bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>>> @@ -88,7 +83,7 @@ void msm_dsi_manager_tpg_enable(void);
>>>    /* msm dsi */
>>>    static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
>>>    {
>>> -     return msm_dsi->panel || msm_dsi->external_bridge;
>>> +     return msm_dsi->external_bridge;
>>>    }
>>>
>>>    struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
>>> @@ -115,7 +110,6 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>>    int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>>>    int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>>                                  const struct drm_display_mode *mode);
>>> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>>>    unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>>>    struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
>>>    int msm_dsi_host_register(struct mipi_dsi_host *host);
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 5b4bb722f750..58bd48d4ec03 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -159,7 +159,6 @@ struct msm_dsi_host {
>>>        struct drm_display_mode *mode;
>>>
>>>        /* connected device info */
>>> -     struct device_node *device_node;
>>>        unsigned int channel;
>>>        unsigned int lanes;
>>>        enum mipi_dsi_pixel_format format;
>>> @@ -1604,8 +1603,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
>>>
>>>        dsi_dev_detach(msm_host->pdev);
>>>
>>> -     msm_host->device_node = NULL;
>>> -
>>>        DBG("id=%d", msm_host->id);
>>>        if (msm_host->dev)
>>>                queue_work(msm_host->workqueue, &msm_host->hpd_work);
>>> @@ -1745,16 +1742,6 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>>>                goto err;
>>>        }
>>>
>>> -     /* Get panel node from the output port's endpoint data */
>>> -     device_node = of_graph_get_remote_node(np, 1, 0);
>>> -     if (!device_node) {
>>> -             DRM_DEV_DEBUG(dev, "%s: no valid device\n", __func__);
>>> -             ret = -ENODEV;
>>> -             goto err;
>>> -     }
>>> -
>>> -     msm_host->device_node = device_node;
>>> -
>>>        if (of_property_read_bool(np, "syscon-sfpb")) {
>>>                msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>>>                                        "syscon-sfpb");
>>> @@ -2405,11 +2392,6 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>>        return 0;
>>>    }
>>>
>>> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
>>> -{
>>> -     return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
>>> -}
>>> -
>>>    unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
>>>    {
>>>        return to_msm_dsi_host(host)->mode_flags;
>>> @@ -2419,7 +2401,7 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>>>    {
>>>        struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>
>>> -     return of_drm_find_bridge(msm_host->device_node);
>>> +     return devm_drm_of_get_bridge(&msm_host->pdev->dev, msm_host->pdev->dev.of_node, 1, 0);
>>>    }
>>>
>>>    void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host)
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 497719efb9e9..43b8a1268c4b 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -188,39 +188,26 @@ static void dsi_mgr_phy_disable(int id)
>>>        }
>>>    }
>>>
>>> -struct dsi_connector {
>>> -     struct drm_connector base;
>>> -     int id;
>>> -};
>>> -
>>>    struct dsi_bridge {
>>>        struct drm_bridge base;
>>>        int id;
>>>    };
>>>
>>> -#define to_dsi_connector(x) container_of(x, struct dsi_connector, base)
>>>    #define to_dsi_bridge(x) container_of(x, struct dsi_bridge, base)
>>>
>>> -static inline int dsi_mgr_connector_get_id(struct drm_connector *connector)
>>> -{
>>> -     struct dsi_connector *dsi_connector = to_dsi_connector(connector);
>>> -     return dsi_connector->id;
>>> -}
>>> -
>>>    static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
>>>    {
>>>        struct dsi_bridge *dsi_bridge = to_dsi_bridge(bridge);
>>>        return dsi_bridge->id;
>>>    }
>>>
>>> -static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>>> +static void msm_dsi_manager_set_split_display(u8 id)
>>>    {
>>> -     struct msm_drm_private *priv = conn->dev->dev_private;
>>> -     struct msm_kms *kms = priv->kms;
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>>> +     struct msm_drm_private *priv = msm_dsi->dev->dev_private;
>>> +     struct msm_kms *kms = priv->kms;
>>>        struct msm_dsi *master_dsi, *slave_dsi;
>>> -     struct drm_panel *panel;
>>>
>>>        if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
>>>                master_dsi = other_dsi;
>>> @@ -230,88 +217,29 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>>>                slave_dsi = other_dsi;
>>>        }
>>>
>>> -     /*
>>> -      * There is only 1 panel in the global panel list for bonded DSI mode.
>>> -      * Therefore slave dsi should get the drm_panel instance from master
>>> -      * dsi.
>>> -      */
>>> -     panel = msm_dsi_host_get_panel(master_dsi->host);
>>> -     if (IS_ERR(panel)) {
>>> -             DRM_ERROR("Could not find panel for %u (%ld)\n", msm_dsi->id,
>>> -                       PTR_ERR(panel));
>>> -             return PTR_ERR(panel);
>>> -     }
>>> -
>>> -     if (!panel || !IS_BONDED_DSI())
>>> -             goto out;
>>> -
>>> -     drm_object_attach_property(&conn->base,
>>> -                                conn->dev->mode_config.tile_property, 0);
>>> +     if (!msm_dsi->external_bridge || !IS_BONDED_DSI())
>>> +             return;
>>>
>>>        /*
>>>         * Set split display info to kms once bonded DSI panel is connected to
>>>         * both hosts.
>>>         */
>>> -     if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
>>> +     if (other_dsi && other_dsi->external_bridge && kms->funcs->set_split_display) {
>>>                kms->funcs->set_split_display(kms, master_dsi->encoder,
>>>                                              slave_dsi->encoder,
>>>                                              msm_dsi_is_cmd_mode(msm_dsi));
>>>        }
>>> -
>>> -out:
>>> -     msm_dsi->panel = panel;
>>> -     return 0;
>>> -}
>>> -
>>> -static enum drm_connector_status dsi_mgr_connector_detect(
>>> -             struct drm_connector *connector, bool force)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -
>>> -     return msm_dsi->panel ? connector_status_connected :
>>> -             connector_status_disconnected;
>>> -}
>>> -
>>> -static void dsi_mgr_connector_destroy(struct drm_connector *connector)
>>> -{
>>> -     struct dsi_connector *dsi_connector = to_dsi_connector(connector);
>>> -
>>> -     DBG("");
>>> -
>>> -     drm_connector_cleanup(connector);
>>> -
>>> -     kfree(dsi_connector);
>>> -}
>>> -
>>> -static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     int num;
>>> -
>>> -     if (!panel)
>>> -             return 0;
>>> -
>>> -     /*
>>> -      * In bonded DSI mode, we have one connector that can be
>>> -      * attached to the drm_panel.
>>> -      */
>>> -     num = drm_panel_get_modes(panel, connector);
>>> -     if (!num)
>>> -             return 0;
>>> -
>>> -     return num;
>>>    }
>>>
>>> -static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
>>> -                             struct drm_display_mode *mode)
>>> +static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>> +                             const struct drm_display_info *info,
>>> +                             const struct drm_display_mode *mode)
>>>    {
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> +     int id = dsi_mgr_bridge_get_id(bridge);
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
>>> -     struct msm_drm_private *priv = connector->dev->dev_private;
>>> +     struct drm_device *dev = msm_dsi->dev;
>>> +     struct msm_drm_private *priv = dev->dev_private;
>>>        struct msm_kms *kms = priv->kms;
>>>        long actual, requested;
>>>
>>> @@ -326,16 +254,6 @@ static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *c
>>>        return MODE_OK;
>>>    }
>>>
>>> -static struct drm_encoder *
>>> -dsi_mgr_connector_best_encoder(struct drm_connector *connector)
>>> -{
>>> -     int id = dsi_mgr_connector_get_id(connector);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -
>>> -     DBG("");
>>> -     return msm_dsi_get_encoder(msm_dsi);
>>> -}
>>> -
>>>    static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>    {
>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>> @@ -398,7 +316,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>        int ret;
>>>
>>> @@ -410,18 +327,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>        if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>>                return;
>>>
>>> -     /* Always call panel functions once, because even for dual panels,
>>> -      * there is only one drm_panel instance.
>>> -      */
>>> -     if (panel) {
>>> -             ret = drm_panel_prepare(panel);
>>> -             if (ret) {
>>> -                     pr_err("%s: prepare panel %d failed, %d\n", __func__,
>>> -                                                             id, ret);
>>> -                     goto panel_prep_fail;
>>> -             }
>>> -     }
>>> -
>>>        ret = msm_dsi_host_enable(host);
>>>        if (ret) {
>>>                pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
>>> @@ -441,9 +346,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>    host1_en_fail:
>>>        msm_dsi_host_disable(host);
>>>    host_en_fail:
>>> -     if (panel)
>>> -             drm_panel_unprepare(panel);
>>> -panel_prep_fail:
>>>
>>>        return;
>>>    }
>>> @@ -461,62 +363,12 @@ void msm_dsi_manager_tpg_enable(void)
>>>        }
>>>    }
>>>
>>> -static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
>>> -{
>>> -     int id = dsi_mgr_bridge_get_id(bridge);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     bool is_bonded_dsi = IS_BONDED_DSI();
>>> -     int ret;
>>> -
>>> -     DBG("id=%d", id);
>>> -     if (!msm_dsi_device_connected(msm_dsi))
>>> -             return;
>>> -
>>> -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> -             return;
>>> -
>>> -     if (panel) {
>>> -             ret = drm_panel_enable(panel);
>>> -             if (ret) {
>>> -                     pr_err("%s: enable panel %d failed, %d\n", __func__, id,
>>> -                                                                     ret);
>>> -             }
>>> -     }
>>> -}
>>> -
>>> -static void dsi_mgr_bridge_disable(struct drm_bridge *bridge)
>>> -{
>>> -     int id = dsi_mgr_bridge_get_id(bridge);
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>> -     bool is_bonded_dsi = IS_BONDED_DSI();
>>> -     int ret;
>>> -
>>> -     DBG("id=%d", id);
>>> -     if (!msm_dsi_device_connected(msm_dsi))
>>> -             return;
>>> -
>>> -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> -             return;
>>> -
>>> -     if (panel) {
>>> -             ret = drm_panel_disable(panel);
>>> -             if (ret)
>>> -                     pr_err("%s: Panel %d OFF failed, %d\n", __func__, id,
>>> -                                                                     ret);
>>> -     }
>>> -}
>>> -
>>>    static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>>>    {
>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>        int ret;
>>>
>>> @@ -543,13 +395,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>>>                        pr_err("%s: host1 disable failed, %d\n", __func__, ret);
>>>        }
>>>
>>> -     if (panel) {
>>> -             ret = drm_panel_unprepare(panel);
>>> -             if (ret)
>>> -                     pr_err("%s: Panel %d unprepare failed,%d\n", __func__,
>>> -                                                             id, ret);
>>> -     }
>>> -
>>>        msm_dsi_host_disable_irq(host);
>>>        if (is_bonded_dsi && msm_dsi1)
>>>                msm_dsi_host_disable_irq(msm_dsi1->host);
>>> @@ -594,76 +439,13 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>>>        dsi_mgr_bridge_power_on(bridge);
>>>    }
>>>
>>> -static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
>>> -     .detect = dsi_mgr_connector_detect,
>>> -     .fill_modes = drm_helper_probe_single_connector_modes,
>>> -     .destroy = dsi_mgr_connector_destroy,
>>> -     .reset = drm_atomic_helper_connector_reset,
>>> -     .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>> -     .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> -};
>>> -
>>> -static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
>>> -     .get_modes = dsi_mgr_connector_get_modes,
>>> -     .mode_valid = dsi_mgr_connector_mode_valid,
>>> -     .best_encoder = dsi_mgr_connector_best_encoder,
>>> -};
>>> -
>>>    static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>>>        .pre_enable = dsi_mgr_bridge_pre_enable,
>>> -     .enable = dsi_mgr_bridge_enable,
>>> -     .disable = dsi_mgr_bridge_disable,
>>>        .post_disable = dsi_mgr_bridge_post_disable,
>>>        .mode_set = dsi_mgr_bridge_mode_set,
>>> +     .mode_valid = dsi_mgr_bridge_mode_valid,
>>>    };
>>>
>>> -/* initialize connector when we're connected to a drm_panel */
>>> -struct drm_connector *msm_dsi_manager_connector_init(u8 id)
>>> -{
>>> -     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> -     struct drm_connector *connector = NULL;
>>> -     struct dsi_connector *dsi_connector;
>>> -     int ret;
>>> -
>>> -     dsi_connector = kzalloc(sizeof(*dsi_connector), GFP_KERNEL);
>>> -     if (!dsi_connector)
>>> -             return ERR_PTR(-ENOMEM);
>>> -
>>> -     dsi_connector->id = id;
>>> -
>>> -     connector = &dsi_connector->base;
>>> -
>>> -     ret = drm_connector_init(msm_dsi->dev, connector,
>>> -                     &dsi_mgr_connector_funcs, DRM_MODE_CONNECTOR_DSI);
>>> -     if (ret)
>>> -             return ERR_PTR(ret);
>>> -
>>> -     drm_connector_helper_add(connector, &dsi_mgr_conn_helper_funcs);
>>> -
>>> -     /* Enable HPD to let hpd event is handled
>>> -      * when panel is attached to the host.
>>> -      */
>>> -     connector->polled = DRM_CONNECTOR_POLL_HPD;
>>> -
>>> -     /* Display driver doesn't support interlace now. */
>>> -     connector->interlace_allowed = 0;
>>> -     connector->doublescan_allowed = 0;
>>> -
>>> -     drm_connector_attach_encoder(connector, msm_dsi->encoder);
>>> -
>>> -     ret = msm_dsi_manager_panel_init(connector, id);
>>> -     if (ret) {
>>> -             DRM_DEV_ERROR(msm_dsi->dev->dev, "init panel failed %d\n", ret);
>>> -             goto fail;
>>> -     }
>>> -
>>> -     return connector;
>>> -
>>> -fail:
>>> -     connector->funcs->destroy(msm_dsi->connector);
>>> -     return ERR_PTR(ret);
>>> -}
>>> -
>>>    bool msm_dsi_manager_validate_current_config(u8 id)
>>>    {
>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>> @@ -727,8 +509,11 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>        int ret;
>>>
>>>        int_bridge = msm_dsi->bridge;
>>> -     ext_bridge = msm_dsi->external_bridge =
>>> -                     msm_dsi_host_get_bridge(msm_dsi->host);
>>> +     ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>>> +     if (IS_ERR(ext_bridge))
>>> +             return ERR_PTR(PTR_ERR(ext_bridge));
>>> +
>>> +     msm_dsi->external_bridge = ext_bridge;
>>>
>>>        encoder = msm_dsi->encoder;
>>>
>>> @@ -755,7 +540,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>
>>>                list_for_each_entry(connector, connector_list, head) {
>>>                        if (drm_connector_has_possible_encoder(connector, encoder))
>>> -                             return connector;
>>> +                             goto out;
>>>                }
>>>
>>>                return ERR_PTR(-ENODEV);
>>> @@ -769,6 +554,10 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>>>
>>>        drm_connector_attach_encoder(connector, encoder);
>>>
>>> +out:
>>> +     /* The pipeline is ready, ping encoders if necessary */
>>> +     msm_dsi_manager_set_split_display(id);
>>> +
>>>        return connector;
>>>    }
>>>
> 
> 
> 
