Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B744CC5A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 20:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbiCCTI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 14:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiCCTIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 14:08:55 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAB814A6C8;
        Thu,  3 Mar 2022 11:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646334487; x=1677870487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5qU//5jB/NrUYdXujw/I7ybBxHL49NmQM5NZeQZJIC0=;
  b=gFCfcCLK27sViZG4SjLdtTE5MrxMnKn3+qfE93KDbJlgbEw/9skDBv5w
   ZjLD7mz55aPbyxMQ3p3n6erfajdvXmdKFmtm79OvvxmTq5VBGlIJ0WYKz
   L0ingktO/zwrpDi42FaF+QhGSElehuJIEatZ5nVQfh40lDrSH4r8TSSy3
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Mar 2022 11:08:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 11:08:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 11:08:05 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 11:08:04 -0800
Message-ID: <0b977692-3128-d3ab-d8f3-fa423bd31884@quicinc.com>
Date:   Thu, 3 Mar 2022 11:08:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 02/13] drm/msm/dsi: Pass DSC params to drm_panel
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
CC:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav Kumar" <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-3-vkoul@kernel.org>
 <813297ce-c0fa-e805-eec9-1dbc31860f8f@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <813297ce-c0fa-e805-eec9-1dbc31860f8f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/21/2022 4:37 AM, Dmitry Baryshkov wrote:
> On 10/02/2022 13:34, Vinod Koul wrote:
>> When DSC is enabled, we need to pass the DSC parameters to panel driver
>> as well, so add a dsc parameter in panel and set it when DSC is enabled
>>
>> Also, fetch and pass DSC configuration for DSI panels to DPU encoder,
>> which will enable and configure DSC hardware blocks accordingly.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
>>   drivers/gpu/drm/msm/dsi/dsi.c           |  5 +++++
>>   drivers/gpu/drm/msm/dsi/dsi.h           |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c      | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>>   include/drm/drm_panel.h                 |  7 +++++++
>>   6 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 47fe11a84a77..ef6ddac22767 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -578,6 +578,8 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>               MSM_DISPLAY_CAP_CMD_MODE :
>>               MSM_DISPLAY_CAP_VID_MODE;
>> +        info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
>> +
>>           if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>>               rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
>>               if (rc) {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 052548883d27..3aeac15e7421 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -20,6 +20,11 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>>       return !(host_flags & MIPI_DSI_MODE_VIDEO);
>>   }
>> +struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi 
>> *msm_dsi)
>> +{
>> +    return msm_dsi_host_get_dsc_config(msm_dsi->host);
>> +}
>> +
>>   static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>   {
>>       struct platform_device *pdev = msm_dsi->pdev;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index c8dedc95428c..16cd9b2fce86 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -152,6 +152,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi);
>>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi);
>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct 
>> mipi_dsi_host *host);
>>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>> +struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct 
>> mipi_dsi_host *host);
>>   /* dsi phy */
>>   struct msm_dsi_phy;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 27553194f9fa..7e9913eff724 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -2059,9 +2059,24 @@ int msm_dsi_host_modeset_init(struct 
>> mipi_dsi_host *host,
>>   {
>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>> +    struct drm_panel *panel;
>>       int ret;
>>       msm_host->dev = dev;
>> +    panel = msm_dsi_host_get_panel(&msm_host->base);
>> +
>> +    if (panel && panel->dsc) {
>> +        struct msm_display_dsc_config *dsc = msm_host->dsc;
>> +
>> +        if (!dsc) {
>> +            dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), 
>> GFP_KERNEL);
>> +            if (!dsc)
>> +                return -ENOMEM;
>> +            dsc->drm = panel->dsc;
>> +            msm_host->dsc = dsc;
>> +        }
>> +    }
>> +
>>       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>       if (ret) {
>>           pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
>> @@ -2626,3 +2641,10 @@ void msm_dsi_host_test_pattern_en(struct 
>> mipi_dsi_host *host)
>>           dsi_write(msm_host, 
>> REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER,
>>                   DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
>>   }
>> +
>> +struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct 
>> mipi_dsi_host *host)
>> +{
>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> +
>> +    return msm_host->dsc;
>> +}
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index 384f9bad4760..e7a312edfe67 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -119,6 +119,7 @@ struct msm_display_topology {
>>    *                      based on num_of_h_tiles
>>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
>>    *                 used instead of panel TE in cmd mode panels
>> + * @dsc:        DSC configuration data for DSC-enabled displays
>>    */
>>   struct msm_display_info {
>>       int intf_type;
>> @@ -126,6 +127,7 @@ struct msm_display_info {
>>       uint32_t num_of_h_tiles;
>>       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>>       bool is_te_using_watchdog_timer;
>> +    struct msm_display_dsc_config *dsc;
>>   };
>>   /* Commit/Event thread specific structure */
>> @@ -365,6 +367,7 @@ void msm_dsi_snapshot(struct msm_disp_state 
>> *disp_state, struct msm_dsi *msm_dsi
>>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>> +struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi 
>> *msm_dsi);
>>   #else
>>   static inline void __init msm_dsi_register(void)
>>   {
>> @@ -393,6 +396,11 @@ static inline bool msm_dsi_is_master_dsi(struct 
>> msm_dsi *msm_dsi)
>>   {
>>       return false;
>>   }
>> +
>> +static inline struct msm_display_dsc_config 
>> *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>> +{
>> +    return NULL;
>> +}
>>   #endif
>>   #ifdef CONFIG_DRM_MSM_DP
>> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
>> index 4602f833eb51..eb8ae9bf32ed 100644
>> --- a/include/drm/drm_panel.h
>> +++ b/include/drm/drm_panel.h
>> @@ -171,6 +171,13 @@ struct drm_panel {
>>        * Panel entry in registry.
>>        */
>>       struct list_head list;
>> +
>> +    /**
>> +     * @dsc:
>> +     *
>> +     * Panel DSC pps payload to be sent
>> +     */
>> +    struct drm_dsc_config *dsc;
> 
> This is not a blocker or a request for a change, just a kind of thought:
> 
> I've been looking onto this change for a while from the following point 
> of view. I'd like to switch DSI driver to use panel 
> bridge/drm_bridge_connector(). This simplifies handling of DRM bridge 
> chains.
> 
> Also since DSC can be consumed not by the panel itself, but by the next 
> bridge in chain (e.g. it's supported on the DSI input by the ANX7625 
> bridge), using drm_panel doesn't look completely correct.
> 
> So, I have been looking for a better way to pass DSC configuration.
> 
> For DSI we can use struct mipi_dsi_device (together with the rest of 
> data we are passing from DSI device driver to DSI host). This would 
> allow both DSI panels and DSI bridges to pass the DSC config to the 
> previous deivce in chain (DSI host).
> 
> Any comments/thoughs?
> 
> Note, for DP this problem doesn't exist. The DSC config is a part of 
> DPDC, so it will be parsed by the msm/dp driver in a natural way.
>

Yes, i do agree that in case of bridges in between , drm_panel is not 
necessarily the best place to do it and mipi_dsi_device is better.

However, I also think we can do this post the cleanup fo move to panel 
bridge.

> 
>>   };
>>   void drm_panel_init(struct drm_panel *panel, struct device *dev,
> 
> 
