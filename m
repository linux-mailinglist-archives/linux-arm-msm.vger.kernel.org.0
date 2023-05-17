Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B23917075C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 01:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjEQXBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 19:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjEQXBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 19:01:37 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44DF526E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 16:01:28 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B82542048D;
        Thu, 18 May 2023 01:01:26 +0200 (CEST)
Date:   Thu, 18 May 2023 01:01:25 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v12 5/9] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <pzqbkdgpiilcaqm2qezqp6qrmybt2d2wmiqifcq77h3i2uhjzf@pc5aeykhxknh>
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-5-9cdb7401f614@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-5-9cdb7401f614@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-17 15:27:18, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..c7d7ed026368
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + *
> + * Helper methods for MSM-specific DSC calculations that are common between timing engine,
> + * DSI, and DP.
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <linux/math.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +/**
> + * msm_dsc_calculate_slices_per_intf() - get number of slices per interface

Oh no, we just went to get to match the function below, and now this is
back at calculate.  My bad, I wasn't clear enough in previous review: I
meant the ext after the -, so "get number of" -> "calculate number of".

Sorry!

> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width in pixels
> + * Returns: Integer representing the number of slices for the given interface
> + */
> +static inline u32 msm_dsc_calculate_slices_per_intf(const struct drm_dsc_config *dsc, int intf_width)

u32... also for intf_width?

- Marijn

> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_line() - calculate bytes per line
> + * @dsc: Pointer to drm dsc config struct
> + * Returns: Integer value representing bytes per line. DSI and DP need
> + *          to perform further calculations to turn this into pclk_per_intf,
> + *          such as dividing by different values depending on if widebus is enabled.
> + */
> +static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
> +{
> +	return dsc->slice_count * dsc->slice_chunk_size;
> +}
> +
> +#endif /* MSM_DSC_HELPER_H_ */
> 
> -- 
> 2.40.1
> 
