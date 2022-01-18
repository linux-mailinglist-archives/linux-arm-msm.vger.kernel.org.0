Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85146492E7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 20:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348234AbiART3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 14:29:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24531 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbiART3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 14:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642534148; x=1674070148;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bEMMLlmMbyWzU4UZdHnOFBqnLQ0rE14bEpnmUI13jd8=;
  b=QVBZHTbjBb9awZ0K7WaYtmpC/QTg5Dn97wOD4tjCQGiQQLmbTBgFLL46
   OF/jXr0pzOTNPsnzjEqkjHSTuAJ4njbz5QVYkq7KASSRU7WfywKu9WcYl
   aY+6vanU5KMbH0tJsPKC7qo/ByE61ivOPmL8ICoi4b3rMzejx9pJcAPxa
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 18 Jan 2022 11:29:08 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 11:29:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 11:29:07 -0800
Received: from [10.111.164.20] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 18 Jan
 2022 11:29:04 -0800
Message-ID: <9fc8d452-7541-cbc5-57ca-96d1e480150c@quicinc.com>
Date:   Tue, 18 Jan 2022 11:29:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/2021 2:29 PM, Dmitry Baryshkov wrote:
> The DSI subsystem does not fully fall into the pre-enable/enable system
> of callbacks, since typically DSI device bridge drivers expect to be
> able to communicate with DSI devices at the pre-enable() callback. The
> reason is that for some DSI hosts enabling the video stream would
> prevent other drivers from sending DSI commands. For example see the
> panel-bridge driver, which does drm_panel_prepare() from the
> pre_enable() callback (which would be called before our pre_enable()
> callback, resulting in panel preparation failures as the link is not yet
> ready).
> 
> Therewere several attempts to solve this issue, but currently the best
> approach is to power up the DSI link from the mode_set() callback,
> allowing next bridge/panel to use DSI transfers in the pre_enable()
> time. Follow this approach.
> 
Change looks okay. As per the programming guideline, we should set the 
VIDEO_MODE_EN register in the DSI controller followed by enabling the 
timing engine which will still happen even now because we will do it in 
modeset instead of the pre_enable().
But, this can potentially increase the delay between VIDEO_MODE_EN
and TIMING_ENGINE_EN. I dont see anything in the programming guide 
against this but since this is a change from the original flow, I would 
like to do one test before acking this. Can you please try adding a huge 
delay like 200-300ms between VIDEO_MODE_EN and timing engine enable to 
make sure there are no issues? You can do that here:

int msm_dsi_host_enable(struct mipi_dsi_host *host)
{
     struct msm_dsi_host *msm_host = to_msm_dsi_host(host);

     dsi_op_mode_config(msm_host,
         !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO), true);

     msleep(300);
}
	

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
>   1 file changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 681ca74fe410..497719efb9e9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
>   	return msm_dsi_get_encoder(msm_dsi);
>   }
>   
> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> +static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>   {
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> -	struct drm_panel *panel = msm_dsi->panel;
>   	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
>   	bool is_bonded_dsi = IS_BONDED_DSI();
>   	int ret;
> @@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (is_bonded_dsi && msm_dsi1)
>   		msm_dsi_host_enable_irq(msm_dsi1->host);
>   
> +	return;
> +
> +host1_on_fail:
> +	msm_dsi_host_power_off(host);
> +host_on_fail:
> +	dsi_mgr_phy_disable(id);
> +phy_en_fail:
> +	return;
> +}
> +
> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	int id = dsi_mgr_bridge_get_id(bridge);
> +	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> +	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> +	struct mipi_dsi_host *host = msm_dsi->host;
> +	struct drm_panel *panel = msm_dsi->panel;
> +	bool is_bonded_dsi = IS_BONDED_DSI();
> +	int ret;
> +
> +	DBG("id=%d", id);
> +	if (!msm_dsi_device_connected(msm_dsi))
> +		return;
> +
> +	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> +		return;
> +
>   	/* Always call panel functions once, because even for dual panels,
>   	 * there is only one drm_panel instance.
>   	 */
> @@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (panel)
>   		drm_panel_unprepare(panel);
>   panel_prep_fail:
> -	msm_dsi_host_disable_irq(host);
> -	if (is_bonded_dsi && msm_dsi1)
> -		msm_dsi_host_disable_irq(msm_dsi1->host);
>   
> -	if (is_bonded_dsi && msm_dsi1)
> -		msm_dsi_host_power_off(msm_dsi1->host);
> -host1_on_fail:
> -	msm_dsi_host_power_off(host);
> -host_on_fail:
> -	dsi_mgr_phy_disable(id);
> -phy_en_fail:
>   	return;
>   }
>   
> @@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   	msm_dsi_host_set_display_mode(host, adjusted_mode);
>   	if (is_bonded_dsi && other_dsi)
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
> +
> +	dsi_mgr_bridge_power_on(bridge);
>   }
>   
>   static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
