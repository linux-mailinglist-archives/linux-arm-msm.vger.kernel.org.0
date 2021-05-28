Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E143940E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 12:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236568AbhE1KbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 06:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhE1KbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 06:31:08 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D1AC061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:29:30 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v5so4577921ljg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ihXEYhpgTCex2ac96hSXhXN91FZkCiFJjGAA6In4z7w=;
        b=ThI/ksUwN5kBa3Wuh6yx13E7Bwuc4vse+1pl8RAoJiQsMOb2RATAU4MDFUITRwi2Cg
         3q+p5mvFTG7u7eUCEpDmq39aGtBSL+o1sdXpov4Ultf/tWVBMlB/KuVONCxxuk9ld8Xs
         izTuP53+qz5qMGoaiMVxw6zE3j6Lw8mz2k39FiJQlIQqJx7uIiCSvcsAmaHvCX6GiNHs
         WjaMAW9ikMcaw4lxJ0PJ09YNxwSHXNrleFCMxFOjugiyOzAyHivTot6pRrYFPsiJx/BO
         gZtbcGFI6xU1++ziUpqW6gpFZd5MHuaOEU7zIHo9MWAnM45Kq3ABbpQAvajuEmaV+p8s
         ZofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ihXEYhpgTCex2ac96hSXhXN91FZkCiFJjGAA6In4z7w=;
        b=mcq3vhCF0or5f2exqLDVuH2GLRHkxFTIs99Os7Ux4BprGJMRRQZxUm6T1QTC3siJHc
         Mb7AX18Ohv7cIIF9Gs8fFL+1AZjF7f6JGYOx/2jgpnFyDqNB6dkdhLae+BJ3P6d7GYK+
         53q9zvKm0FmLQW/+OOdfe0+Oif1RGojll3H3dSAfPf9mt6tf4PElwCELqXcrOPMQgzze
         n8IDQ6qYaNWRASdKgXOoeM/HxfrZvFGWvlCA7Vdor4heSkQuVR+/5f6xLK0WmIFe7jfk
         Mz1/px3CBnHzjgF4avjxjeRkD15WSvahSXl5hd5AqYpts8dijvX9mjB6VJ1NF/mveXxk
         cPqw==
X-Gm-Message-State: AOAM532pZC8fQSXwMikddJT3fOlsO3e7nhz0QtVYF6rLHuFKF4hk0gMT
        unlpv6RmXoG5LsgiyUDVPW/+DA==
X-Google-Smtp-Source: ABdhPJwblsEL2vRG0EgWYnXVZlgWTXvCo9e5pn8T67R1rgdC5WBe8cpGdD0KnXY5uj/S6NXqfCRosQ==
X-Received: by 2002:a05:651c:c8:: with SMTP id 8mr6122359ljr.274.1622197768677;
        Fri, 28 May 2021 03:29:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g20sm513159lja.2.2021.05.28.03.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 03:29:28 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] drm/msm/dsi: add support for dsc data
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-5-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <31b06821-a25d-7864-4e6e-448710203bef@linaro.org>
Date:   Fri, 28 May 2021 13:29:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-5-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2021 15:49, Vinod Koul wrote:
> DSC needs some configuration from device tree, add support to read and
> store these params and add DSC structures in msm_drv
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 170 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
>   2 files changed, 202 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8a10e4343281..864d3c655e73 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -156,6 +156,7 @@ struct msm_dsi_host {
>   	struct regmap *sfpb;
>   
>   	struct drm_display_mode *mode;
> +	struct msm_display_dsc_config *dsc;
>   
>   	/* connected device info */
>   	struct device_node *device_node;
> @@ -1744,6 +1745,168 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   	return -EINVAL;
>   }
>   
> +static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> +	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
> +	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> +};

I think we should move this table to a generic place. AMD and Intel DSC 
code uses the same table, shifted by 6 (and both of those drivers shift 
it before writing to the HW). Intel modifies this table for 6bpp case. 
AMD seems to use it as is.

> +
> +/* only 8bpc, 8bpp added */
> +static char min_qp[DSC_NUM_BUF_RANGES] = {
> +	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
> +};
> +
> +static char max_qp[DSC_NUM_BUF_RANGES] = {
> +	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
> +};
> +
> +static char bpg_offset[DSC_NUM_BUF_RANGES] = {
> +	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +};

And these parameters seem to be generic too. Intel DSC code contains 
them in a bit different form. Should we probably move them to the 
drm_dsc.c and use the tables the generic location?

AMD drivers uses a bit different values at the first glance, so let's 
stick with Intel version.

> +
> +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
> +{
> +	int i;
> +
> +	dsc->drm.rc_model_size = 8192;
> +	dsc->drm.first_line_bpg_offset = 15;
> +	dsc->drm.rc_edge_factor = 6;
> +	dsc->drm.rc_tgt_offset_high = 3;
> +	dsc->drm.rc_tgt_offset_low = 3;
> +	dsc->drm.simple_422 = 0;
> +	dsc->drm.convert_rgb = 1;
> +	dsc->drm.vbr_enable = 0;
> +
> +	/* handle only bpp = bpc = 8 */
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> +		dsc->drm.rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		dsc->drm.rc_range_params[i].range_min_qp = min_qp[i];
> +		dsc->drm.rc_range_params[i].range_max_qp = max_qp[i];
> +		dsc->drm.rc_range_params[i].range_bpg_offset = bpg_offset[i];
> +	}
> +
> +	dsc->drm.initial_offset = 6144;
> +	dsc->drm.initial_xmit_delay = 512;
> +	dsc->drm.initial_scale_value = 32;
> +	dsc->drm.first_line_bpg_offset = 12;
> +	dsc->drm.line_buf_depth = dsc->drm.bits_per_component + 1;
> +
> +	/* bpc 8 */
> +	dsc->drm.flatness_min_qp = 3;
> +	dsc->drm.flatness_max_qp = 12;
> +	dsc->det_thresh_flatness = 7;
> +	dsc->drm.rc_quant_incr_limit0 = 11;
> +	dsc->drm.rc_quant_incr_limit1 = 11;
> +	dsc->drm.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +
> +	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> +	 * params are calculated
> +	 */
> +
> +	i = dsc->drm.slice_width % 3;
> +	switch (i) {
> +	case 0:
> +		dsc->slice_last_group_size = 2;
> +		break;
> +
> +	case 1:
> +		dsc->slice_last_group_size = 0;
> +		break;
> +
> +	case 2:
> +		dsc->slice_last_group_size = 0;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +


-- 
With best wishes
Dmitry
