Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31856D3792
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjDBLVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 07:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDBLV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 07:21:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B54CA26
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 04:21:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id br6so34495588lfb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680434485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJnS95iSg5T+2CA5mB5x+69zJTEDFHzQva24ij5VuJ8=;
        b=LzkVWWzqdLB39ZQSzL4mr3kxjS5sY9LOHMh7nQ/sCg7Ny8/pHDl0f+xAw8K7E50pY9
         8+kiT3d12cnXFDBNhsAFn8Ja21lAruHdG7jEiqlZJX8y7eMSbpk37ADMeIjYx4KW+hd9
         8VjkBXVDicSZbxJbhUpymTp+RPr8ngRQrP07jiGDYm3O2n5KvMltJaLg6UafFFSN4YR8
         gZzhFuP6nCQyFWU9Cq/Dlotx3H9+9Tp6w3UUr+8yNmRCztI82MyELv3JvZEFKRvrhGeu
         zUpsl96tqWfhw1SydWP9oRDV0ctERirqiwSXzOAItO4dzaru48vxcsEcpv1Sqeb415x0
         x2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680434485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJnS95iSg5T+2CA5mB5x+69zJTEDFHzQva24ij5VuJ8=;
        b=L0x8Hj5Bk2PE0UxYoK04c8nju/Yu2yNaZiLs05Dv/mT1lGu+soeTFEA4I7w87HGWZa
         6DL0ZugPTigMZy4Fkcn5SdGJoAjqyrY5FmhkGmX2guQMhShe99D5gvdCD86g2LLL6fCJ
         Q6A15D6+FxQEhLTJ5o9j3seadGDiKbE2yg31+b3l9NxER+AaTRQgoC03C7Ir2vd2gBgV
         Vck9T9QeJ9Zbb/cW6W9hSv8B4LrV4zT0W0G/zzwYqLBExYuTnG1LStOe37chRGLJbNhN
         iAjjQYTSqF4673U+c8okYyquPF8Rowomf/rbjk+3sfUSWHmF7fAybvY1JFlVdSn0J425
         Ri5Q==
X-Gm-Message-State: AAQBX9cwT79cFivRB4EYoNWxceTdenRbcSu2ZT0FCsu8Auyhwp4fD1Co
        XygRX8kvO14KLohDDYVSWvLmr4rVv4QGvTK7AxNwwQ==
X-Google-Smtp-Source: AKy350aXPpSoj4v8WHbVPE6+HrNms5A92+KabT/kmWenskMpZRsouRllfhpgpFU8tBMLJK4CrGgbTw==
X-Received: by 2002:ac2:4358:0:b0:4ea:e262:e551 with SMTP id o24-20020ac24358000000b004eae262e551mr8943108lfl.31.1680434485521;
        Sun, 02 Apr 2023 04:21:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q28-20020ac25a1c000000b004db1a7e6decsm1237576lfn.205.2023.04.02.04.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 04:21:25 -0700 (PDT)
Message-ID: <5b4a3305-1e26-220d-a770-1f6945fbac7a@linaro.org>
Date:   Sun, 2 Apr 2023 14:21:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 2/6] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 21:49, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Changes in v2:
> - Moved files up to msm/ directory
> - Dropped get_comp_ratio() helper
> - Used drm_int2fixp() to convert to integers to fp
> - Style changes to improve readability
> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
> - Changed msm_dsc_get_slice_per_intf() to a static inline method
> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>    method name accordingly
> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
> - Fixed some math issues caused by passing in incorrect types to
>    drm_fixed methods in get_bytes_per_soft_slice()
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile         |  1 +
>   drivers/gpu/drm/msm/msm_dsc_helper.c | 53 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_dsc_helper.h | 42 ++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed..b814fc80e2d5 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -94,6 +94,7 @@ msm-y += \
>   	msm_atomic_tracepoints.o \
>   	msm_debugfs.o \
>   	msm_drv.o \
> +	msm_dsc_helper.o \
>   	msm_fb.o \
>   	msm_fence.o \
>   	msm_gem.o \
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
> new file mode 100644
> index 000000000000..60b73e17e6eb
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <drm/drm_fixed.h>
> +
> +#include "msm_drv.h"
> +#include "msm_dsc_helper.h"
> +
> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)

intf_width is unused

> +{
> +	int bpp = msm_dsc_get_bpp_int(dsc);
> +	s64 numerator_fp, denominator_fp;
> +	s64 comp_ratio_fp = drm_fixp_from_fraction(src_bpp, bpp);
> +
> +	numerator_fp = drm_int2fixp(dsc->slice_width * 3);

You have lost dsc->bits_per_component here.

> +	denominator_fp = drm_fixp_from_fraction(comp_ratio_fp * 8, drm_int2fixp(bpp));

denominator_fp = drm_fixp_from_fraction(src_bpp * 8, bpp);

> +
> +	return drm_fixp_div(numerator_fp, denominator_fp);
> +}
> +
> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
> +{
> +	u32 bytes_per_soft_slice, extra_eol_bytes, bytes_per_intf;
> +	s64 bytes_per_soft_slice_fp;
> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
> +
> +	bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc, intf_width, src_bpp);
> +	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
> +
> +	bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
> +	extra_eol_bytes = bytes_per_intf % 3;
> +	if (extra_eol_bytes != 0)
> +		extra_eol_bytes = 3 - extra_eol_bytes;

I become confused here when I checked eol_bytes in the display techpack.

I see that for DP the dp_panel_dsc_pclk_param_calc() calculates 
dsc->eol_bytes_num in this way, the size to pad dsc_byte_count * 
slice_per_intf to 3 bytes.

However, for DSI this is a simple as total_bytes_per_intf % 3 , so it is 
not a padding, but a length of the last chunk.

Could you please clarify? If the techpack code is correct, I'd prefer if 
we return last chunk size here and calculate the padding length in the 
DP driver.

> +
> +	return extra_eol_bytes;
> +}
> +
> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)

Basing on Abhinav's description ("pclk_per_line can be only per 
interface") would it better be named as 
msm_dsc_get_uncompressed_pclk_per_intf() ? or 
msm_dsc_get_uncompressed_pclk_for_intf() ?

BTW: if get_bytes_per_soft_slice() doesn't use intf_width, we can 
probably drop it here too.

> +{
> +	s64 data_width;
> +
> +	if (!dsc->slice_width || (intf_width < dsc->slice_width))
> +		return -EINVAL;

Error code is not validated at dsi_timing_setup. I'd suggest moving 
error checks there and dropping the error handling here. If 
dsc->slice_width is not set, we should stop much earlier than 
drm_bridge's pre_enable() callback.

> +
> +	data_width = drm_fixp_mul(dsc->slice_count,
> +			get_bytes_per_soft_slice(dsc, intf_width, src_bpp));
> +
> +	return drm_fixp2int_ceil(data_width);
> +}
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..743cd324b7d9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_modes.h>
> +
> +/*
> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> + * DSI, and DP.
> + */
> +
> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> +}
> +
> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
> +}
> +
> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width);
> +
> +/* Calculate uncompressed pclk per line. This value will then be passed along to
> + * DSI and DP to calculate pclk_per_line. This is because DSI and DP divide the
> + * uncompressed pclk_per_line by different values depending on if widebus is enabled.
> + */
> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc,
> +		int intf_width, u32 src_bpp);
> +#endif /* MSM_DSC_HELPER_H_ */
> 

-- 
With best wishes
Dmitry

