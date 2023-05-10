Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D237C6FD711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 08:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbjEJGdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 02:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjEJGdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 02:33:43 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75F12716
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 23:33:40 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.225.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0221E201EC;
        Wed, 10 May 2023 08:33:37 +0200 (CEST)
Date:   Wed, 10 May 2023 08:33:36 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-09 15:06:50, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile         |  1 +
>  drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 69 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed..b814fc80e2d5 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -94,6 +94,7 @@ msm-y += \
>  	msm_atomic_tracepoints.o \
>  	msm_debugfs.o \
>  	msm_drv.o \
> +	msm_dsc_helper.o \
>  	msm_fb.o \
>  	msm_fence.o \
>  	msm_gem.o \
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
> new file mode 100644
> index 000000000000..29feb3e3b5a4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <linux/kernel.h>
> +#include <drm/drm_fixed.h>
> +
> +#include "msm_dsc_helper.h"
> +
> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
> +{
> +	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);

How about using dsc->slice_chunk_size?

> +}
> +
> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	u32 bytes_per_soft_slice;
> +	s64 bytes_per_soft_slice_fp;
> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
> +
> +	bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
> +	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
> +
> +	return bytes_per_soft_slice * slice_per_intf;
> +}
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..38f3651d0b79
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <linux/bug.h>
> +#include <linux/math.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +/*
> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> + * DSI, and DP.
> + */
> +
> +/**
> + * msm_dsc_get_bpp_int - get bits per pixel integer value

For all function docs, don't forget the trailing parenthesis after the
function name: msm_dsc_get_bpp_int()

https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation

> + * @dsc: Pointer to drm dsc config struct
> + * Returns: BPP integer value
> + */
> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
> +/**
> + * msm_dsc_get_slice_per_intf - get number of slices per interface
> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width
> + * Returns: Integer representing the slice per interface
> + */
> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);

Looks good.

> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
> + * @dsc: Pointer to drm dsc config struct
> + * Returns: Integer value representing pclk per interface
> + *
> + * Note: This value will then be passed along to DSI and DP for some more
> + * calculations. This is because DSI and DP divide the pclk_per_intf value
> + * by different values depending on if widebus is enabled.
> + */
> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
> +{
> +	return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * msm_dsc_get_bpp_int(dsc), 8);

dsc->slice_chunk_size * dsc->slice_count?

> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for dsc

Explain to the reader what a "soft" slice is?

- Marijn

> + * @dsc: Pointer to drm dsc config struct
> + * Returns: s31.32 fixed point value representing bytes per soft slice
> + */
> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
> +
> +/**
> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width
> + * Returns: u32 value representing bytes per interface
> + */
> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
> +
> +#endif /* MSM_DSC_HELPER_H_ */
> 
> -- 
> 2.40.1
> 
