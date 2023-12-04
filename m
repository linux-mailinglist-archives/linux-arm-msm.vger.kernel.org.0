Return-Path: <linux-arm-msm+bounces-3369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4EE80411F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 22:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D50B20ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 21:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E38039FCD;
	Mon,  4 Dec 2023 21:47:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138CDC4
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 13:47:02 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4F1B01FC57;
	Mon,  4 Dec 2023 22:46:57 +0100 (CET)
Date: Mon, 4 Dec 2023 22:46:55 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
Message-ID: <ghozqqj3ka6ntbofbpol2zf6sa7lt5ppqnsmnqbvqr5nwgx4ox@5kndla2nf54n>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-3-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>

On 2023-11-14 17:58:30, Jonathan Marek wrote:
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
> 
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Conditional r-b assuming this will be submitted to mesa, otherwise it'll
disappear when the next person updates and regenerates these bindings.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 2a7d980e12c3..f0b3cdc020a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
>  #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
>  #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
>  #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
> +#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
>  
>  #define REG_DSI_VID_CFG1					0x0000001c
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index deeecdfd6c4e..f2c1cbd08d4d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -745,6 +745,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>  		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
>  		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
>  		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
> +		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
> +			data |= DSI_VID_CFG0_DATABUS_WIDEN;
>  		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
>  
>  		/* Do not swap RGB colors */
> -- 
> 2.26.1
> 

