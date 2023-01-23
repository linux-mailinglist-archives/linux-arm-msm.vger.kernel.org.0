Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B5D678A1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 23:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjAWWC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 17:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjAWWC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 17:02:27 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5BAB75B
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 14:02:24 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v13so16298590eda.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 14:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRRZ9iu+BHcSWA/hotzRklAk5CCbTpxpahdmfCzjm30=;
        b=bHiaYX46mWQ2nmSv34zqczHR8nFZhbbAO9SquzU461BMCAuqnwWbYU1bKvvzKdQCOz
         Kvcnkr+2OAGtzX+ZDvX/IqUee+Zdx2vwxuWSqzV8+mwjzPtH73s9QokvnVftmidDxsYf
         Qa9uv25fe5bzqYaM9of8kJa41kVLc9cRXDpoPb4x2y132FDuCc7lHmWsypTiXISdVCol
         svL7n/vlRDjC84WoB1kDmc62WeaFBxvK3GN47LrOVfRSn1Thvt1ZbaeTZNGI70XoZYAA
         elbl0mQSc4w0Zq2NUG/HgukMt+tWl4ByoSwuhqTMQndNUVm8h+GAB8RKwgWZVohSs6se
         LZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRRZ9iu+BHcSWA/hotzRklAk5CCbTpxpahdmfCzjm30=;
        b=MUkHiI8H1qFevSQ5Qtp7CL3cdl9OM+PrlQZYi91Tqt6EZejXxorMZHjNMhDuOF9yXF
         puGyOEQyOdhJloJrG0vFE9AKkPpQGLW4ncn+33Lng3Ndg7RpY3PDfakhDl6ZvFS/fM6L
         ei8Yg5e7QBe/WRUkfv0qmfK+4R3ksgPW/ly6BJJbX6e/WNOPh7D7jdcifwxG4SQqrRcu
         i888puBtQkAuAYXmr9EbhjYIAaaocADpspewJbQ7Nm5ojkSgWiTJtKIwDlgkEVGl3URp
         FxgTVL/sYNCiB+AWx1h7i/QTiEmSykvq4NYYTgtVuU8z4+WBwyVWzlBDqenKpKj1uBsW
         UMeg==
X-Gm-Message-State: AFqh2korVY2w8aL2ZIFpRg7GSPs9fM1FRgmkjkv9AUCwXh66eJBCif6v
        vVWaZsILHxU6GIAf6lXg1ZVYYw==
X-Google-Smtp-Source: AMrXdXvGxPQXWQmDiYR9iBrVqdQpTFLMgN32kQzSs4v9r0R0C/REdD9Jh1DFiLfpPQcF8jlAlYPG3Q==
X-Received: by 2002:a05:6402:18c:b0:48b:c8de:9d1a with SMTP id r12-20020a056402018c00b0048bc8de9d1amr26503647edv.37.1674511343036;
        Mon, 23 Jan 2023 14:02:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b12-20020aa7dc0c000000b00499e5659988sm240641edu.68.2023.01.23.14.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 14:02:22 -0800 (PST)
Message-ID: <4f78915e-61e4-f059-16f9-f677d3581023@linaro.org>
Date:   Tue, 24 Jan 2023 00:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 07/14] drm/msm/dp: add dsc helper functions
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-8-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-8-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> Add DSC related supporting functions to calculate DSC related parameters.
> In addition, DSC hardware encoder customized configuration parameters are
> also included. Algorithms used to perform calculation are derived from
> system engineer spreadsheet.

Overall impression. First rewrite this patch to use existing data 
structures and helpers. Then move the remnants to the 
drm/display/drm_dsc_helper.c.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 537 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  25 ++
>   drivers/gpu/drm/msm/msm_drv.h                  |   4 +
>   4 files changed, 567 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c412..28cf52b 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
>   	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_dsc_helper.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> new file mode 100644
> index 00000000..48cef23
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> @@ -0,0 +1,537 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2012-2023 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
> +#include "dpu_hw_dsc.h"
> +#include "dpu_dsc_helper.h"
> +
> +
> +#define DPU_DSC_PPS_SIZE       128

doesn't sizeof(drm_dsc_picture_parameter_set) work instead?

> +
> +enum dpu_dsc_ratio_type {
> +	DSC_V11_8BPC_8BPP,
> +	DSC_V11_10BPC_8BPP,
> +	DSC_V11_10BPC_10BPP,
> +	DSC_V11_SCR1_8BPC_8BPP,
> +	DSC_V11_SCR1_10BPC_8BPP,
> +	DSC_V11_SCR1_10BPC_10BPP,
> +	DSC_V12_444_8BPC_8BPP = DSC_V11_SCR1_8BPC_8BPP,
> +	DSC_V12_444_10BPC_8BPP = DSC_V11_SCR1_10BPC_8BPP,
> +	DSC_V12_444_10BPC_10BPP = DSC_V11_SCR1_10BPC_10BPP,
> +	DSC_V12_422_8BPC_7BPP,
> +	DSC_V12_422_8BPC_8BPP,
> +	DSC_V12_422_10BPC_7BPP,
> +	DSC_V12_422_10BPC_10BPP,
> +	DSC_V12_420_8BPC_6BPP,
> +	DSC_V12_420_10BPC_6BPP,
> +	DSC_V12_420_10BPC_7_5BPP,
> +	DSC_RATIO_TYPE_MAX
> +};
> +
> +
> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> +		0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
> +		0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> +};
> +
> +/*
> + * Rate control - Min QP values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
> +	{0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
> +	{0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> +	{0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
> +	{0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
> +	{0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> +	/* DSC v1.2 YUV422 */
> +	{0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 11},
> +	{0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 10},
> +	{0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> +	{0, 2, 3, 4, 5, 5, 5, 6, 6, 7, 8, 8, 9, 11, 12},
> +	/* DSC v1.2 YUV420 */
> +	{0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 10},
> +	{0, 2, 3, 4, 6, 7, 7, 7, 7, 7, 9, 9, 9, 11, 14},
> +	{0, 2, 3, 4, 5, 5, 5, 6, 6, 7, 8, 8, 9, 11, 12},
> +};
> +
> +/*
> + * Rate control - Max QP values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_max_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15},
> +	{4, 8, 9, 10, 11, 11, 11, 12, 13, 14, 15, 16, 17, 17, 19},
> +	{7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> +	{4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13},
> +	{8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17},
> +	{7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
> +	/* DSC v1.2 YUV422 */
> +	{3, 4, 5, 6, 7, 7, 7, 8, 9, 9, 10, 10, 11, 11, 12},
> +	{2, 4, 5, 6, 7, 7, 7, 8, 8, 9, 9, 9, 9, 10, 11},
> +	{7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
> +	{2, 5, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 13},
> +	/* DSC v1.2 YUV420 */
> +	{2, 4, 5, 6, 7, 7, 7, 8, 8, 9, 9, 9, 9, 10, 12},
> +	{2, 5, 7, 8, 9, 10, 11, 12, 12, 13, 13, 13, 13, 14, 15},
> +	{2, 5, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 13},
> +	};
> +
> +/*
> + * Rate control - bpg offset values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_bpg[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +	/* DSC v1.1 SCR and DSC V1.2 RGB 444 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +	/* DSC v1.2 YUV422 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +	{10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12},
> +	/* DSC v1.2 YUV420 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12},
> +};
> +
> +static struct dpu_dsc_rc_init_params_lut {
> +	u32 rc_quant_incr_limit0;
> +	u32 rc_quant_incr_limit1;
> +	u32 initial_fullness_offset;
> +	u32 initial_xmit_delay;
> +	u32 second_line_bpg_offset;
> +	u32 second_line_offset_adj;
> +	u32 flatness_min_qp;
> +	u32 flatness_max_qp;
> +}  dpu_dsc_rc_init_param_lut[] = {
> +	/* DSC v1.1 */
> +	{11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V11_8BPC_8BPP */
> +	{15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V11_10BPC_8BPP */
> +	{15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V11_10BPC_10BPP */
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> +	{11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V12_444_8BPC_8BPP or DSC_V11_SCR1_8BPC_8BPP */
> +	{15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_8BPP or DSC_V11_SCR1_10BPC_8BPP */
> +	{15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_10BPP or DSC_V11_SCR1_10BPC_10BPP */
> +	/* DSC v1.2 YUV422 */
> +	{11, 11, 5632, 410, 0, 0, 3, 12}, /* DSC_V12_422_8BPC_7BPP */
> +	{11, 11, 2048, 341, 0, 0, 3, 12}, /* DSC_V12_422_8BPC_8BPP */
> +	{15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V12_422_10BPC_7BPP */
> +	{15, 15, 2048, 273, 0, 0, 7, 16}, /* DSC_V12_422_10BPC_10BPP */
> +	/* DSC v1.2 YUV420 */
> +	{11, 11, 5632, 410, 0, 0, 3, 12},    /* DSC_V12_422_8BPC_7BPP */
> +	{11, 11, 2048, 341, 12, 512, 3, 12}, /* DSC_V12_420_8BPC_6BPP */
> +	{15, 15, 2048, 341, 12, 512, 7, 16}, /* DSC_V12_420_10BPC_6BPP */
> +	{15, 15, 2048, 256, 12, 512, 7, 16}, /* DSC_V12_420_10BPC_7_5BPP */
> +};
> +
> +/**
> + * Maps to lookup the dpu_dsc_ratio_type index used in rate control tables
> + */
> +static struct dpu_dsc_table_index_lut {
> +	u32 fmt;
> +	u32 scr_ver;
> +	u32 minor_ver;
> +	u32 bpc;
> +	u32 bpp;
> +	u32 type;
> +} dpu_dsc_index_map[] = {
> +	/* DSC 1.1 formats - scr version is considered */
> +	{MSM_CHROMA_444, 0, 1, 8, 8, DSC_V11_8BPC_8BPP},
> +	{MSM_CHROMA_444, 0, 1, 10, 8, DSC_V11_10BPC_8BPP},
> +	{MSM_CHROMA_444, 0, 1, 10, 10, DSC_V11_10BPC_10BPP},
> +
> +	{MSM_CHROMA_444, 1, 1, 8, 8, DSC_V11_SCR1_8BPC_8BPP},
> +	{MSM_CHROMA_444, 1, 1, 10, 8, DSC_V11_SCR1_10BPC_8BPP},
> +	{MSM_CHROMA_444, 1, 1, 10, 10, DSC_V11_SCR1_10BPC_10BPP},
> +
> +	/* DSC 1.2 formats - scr version is no-op */

Such distinctions begs to split this table into a pair or three of them.

> +	{MSM_CHROMA_444, -1, 2, 8, 8, DSC_V12_444_8BPC_8BPP},
> +	{MSM_CHROMA_444, -1, 2, 10, 8, DSC_V12_444_10BPC_8BPP},
> +	{MSM_CHROMA_444, -1, 2, 10, 10, DSC_V12_444_10BPC_10BPP},
> +
> +	{MSM_CHROMA_422, -1, 2, 8, 7, DSC_V12_422_8BPC_7BPP},
> +	{MSM_CHROMA_422, -1, 2, 8, 8, DSC_V12_422_8BPC_8BPP},
> +	{MSM_CHROMA_422, -1, 2, 10, 7, DSC_V12_422_10BPC_7BPP},
> +	{MSM_CHROMA_422, -1, 2, 10, 10, DSC_V12_422_10BPC_10BPP},
> +
> +	{MSM_CHROMA_420, -1, 2, 8, 6, DSC_V12_420_8BPC_6BPP},
> +	{MSM_CHROMA_420, -1, 2, 10, 6, DSC_V12_420_10BPC_6BPP},
> +};
> +
> +static int _get_rc_table_index(struct drm_dsc_config *dsc, int scr_ver)
> +{
> +	u32 bpp, bpc, i, fmt = MSM_CHROMA_444;
> +
> +	if (dsc->dsc_version_major != 0x1) {
> +		DPU_ERROR("unsupported major version %d\n",
> +				dsc->dsc_version_major);
> +		return -EINVAL;
> +	}
> +
> +	bpc = dsc->bits_per_component;
> +	bpp = DSC_BPP(*dsc);
> +
> +	if (dsc->native_422)
> +		fmt = MSM_CHROMA_422;
> +	else if (dsc->native_420)
> +		fmt = MSM_CHROMA_420;
> +
> +
> +	for (i = 0; i < ARRAY_SIZE(dpu_dsc_index_map); i++) {
> +		if (dsc->dsc_version_minor == dpu_dsc_index_map[i].minor_ver &&
> +				fmt ==  dpu_dsc_index_map[i].fmt &&
> +				bpc == dpu_dsc_index_map[i].bpc &&
> +				bpp == dpu_dsc_index_map[i].bpp &&
> +				(dsc->dsc_version_minor != 0x1 ||
> +					scr_ver == dpu_dsc_index_map[i].scr_ver))
> +			return dpu_dsc_index_map[i].type;
> +	}
> +
> +	DPU_ERROR("unsupported DSC v%d.%dr%d, bpc:%d, bpp:%d, fmt:0x%x\n",
> +			dsc->dsc_version_major, dsc->dsc_version_minor,
> +			scr_ver, bpc, bpp, fmt);
> +	return -EINVAL;
> +}
> +
> +u8 _get_dsc_v1_2_bpg_offset(struct drm_dsc_config *dsc)
> +{
> +	u8 bpg_offset = 0;
> +	u8 uncompressed_bpg_rate;
> +	u8 bpp = DSC_BPP(*dsc);
> +
> +	if (dsc->slice_height < 8)
> +		bpg_offset = 2 * (dsc->slice_height - 1);
> +	else if (dsc->slice_height < 20)
> +		bpg_offset = 12;
> +	else if (dsc->slice_height <= 30)
> +		bpg_offset = 13;
> +	else if (dsc->slice_height < 42)
> +		bpg_offset = 14;
> +	else
> +		bpg_offset = 15;
> +
> +	if (dsc->native_422)
> +		uncompressed_bpg_rate = 3 * bpp * 4;
> +	else if (dsc->native_420)
> +		uncompressed_bpg_rate = 3 * bpp;
> +	else
> +		uncompressed_bpg_rate = (3 * bpp + 2) * 3;
> +
> +	if (bpg_offset < (uncompressed_bpg_rate - (3 * bpp)))
> +		return bpg_offset;
> +	else
> +		return (uncompressed_bpg_rate - (3 * bpp));
> +}
> +
> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_ver)
> +{
> +	int bpp, bpc;
> +	int groups_per_line, groups_total;
> +	int min_rate_buffer_size;
> +	int hrd_delay;
> +	int pre_num_extra_mux_bits, num_extra_mux_bits;
> +	int slice_bits;
> +	int data;
> +	int final_value, final_scale;
> +	struct dpu_dsc_rc_init_params_lut *rc_param_lut;
> +	u32 slice_width_mod;
> +	int i, ratio_idx;

We just got rid of a duplicate of drm_dsc_compute_rc_parameters(), so we 
are not going to introduce another one. Please use that function to 
compute relevant parameters.

> +
> +	dsc->rc_model_size = 8192;
> +
> +	if ((dsc->dsc_version_major == 0x1) &&
> +			(dsc->dsc_version_minor == 0x1)) {
> +		if (scr_ver == 0x1)
> +			dsc->first_line_bpg_offset = 15;
> +		else
> +			dsc->first_line_bpg_offset = 12;
> +	} else if (dsc->dsc_version_minor == 0x2) {
> +		dsc->first_line_bpg_offset = _get_dsc_v1_2_bpg_offset(dsc);
> +	}
> +
> +	dsc->rc_edge_factor = 6;
> +	dsc->rc_tgt_offset_high = 3;
> +	dsc->rc_tgt_offset_low = 3;
> +	dsc->simple_422 = 0;
> +	dsc->convert_rgb = !(dsc->native_422 | dsc->native_420);
> +	dsc->vbr_enable = 0;
> +
> +	bpp = DSC_BPP(*dsc);
> +	bpc = dsc->bits_per_component;
> +
> +	ratio_idx = _get_rc_table_index(dsc, scr_ver);
> +	if ((ratio_idx < 0) || (ratio_idx >= DSC_RATIO_TYPE_MAX))
> +		return -EINVAL;
> +
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++)
> +		dsc->rc_buf_thresh[i] = dpu_dsc_rc_buf_thresh[i];
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		dsc->rc_range_params[i].range_min_qp =
> +			dpu_dsc_rc_range_min_qp[ratio_idx][i];
> +		dsc->rc_range_params[i].range_max_qp =
> +			dpu_dsc_rc_range_max_qp[ratio_idx][i];
> +		dsc->rc_range_params[i].range_bpg_offset =
> +			dpu_dsc_rc_range_bpg[ratio_idx][i];
> +	}
> +
> +	rc_param_lut = &dpu_dsc_rc_init_param_lut[ratio_idx];
> +	dsc->rc_quant_incr_limit0 = rc_param_lut->rc_quant_incr_limit0;
> +	dsc->rc_quant_incr_limit1 = rc_param_lut->rc_quant_incr_limit1;
> +	dsc->initial_offset = rc_param_lut->initial_fullness_offset;
> +	dsc->initial_xmit_delay = rc_param_lut->initial_xmit_delay;
> +	dsc->second_line_bpg_offset = rc_param_lut->second_line_bpg_offset;
> +	dsc->second_line_offset_adj = rc_param_lut->second_line_offset_adj;
> +	dsc->flatness_min_qp = rc_param_lut->flatness_min_qp;
> +	dsc->flatness_max_qp = rc_param_lut->flatness_max_qp;
> +
> +	slice_width_mod = dsc->slice_width;
> +	if (dsc->native_422 || dsc->native_420) {
> +		slice_width_mod = dsc->slice_width / 2;
> +		bpp = bpp * 2;
> +	}
> +
> +	dsc->line_buf_depth = bpc + 1;
> +	dsc->mux_word_size = bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC : DSC_MUX_WORD_SIZE_8_10_BPC;
> +
> +	if ((dsc->dsc_version_minor == 0x2) && (dsc->native_420))
> +		dsc->nsl_bpg_offset = (2048 * (DIV_ROUND_UP(dsc->second_line_bpg_offset,
> +				(dsc->slice_height - 1))));
> +
> +	groups_per_line = DIV_ROUND_UP(slice_width_mod, 3);
> +
> +	dsc->slice_chunk_size = slice_width_mod * bpp / 8;
> +	if ((slice_width_mod * bpp) % 8)
> +		dsc->slice_chunk_size++;
> +
> +	/* rbs-min */
> +	min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> +			dsc->initial_xmit_delay * bpp +
> +			groups_per_line * dsc->first_line_bpg_offset;
> +
> +	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
> +
> +	dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
> +
> +	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> +			(dsc->rc_model_size - dsc->initial_offset);
> +
> +	slice_bits = 8 * dsc->slice_chunk_size * dsc->slice_height;
> +
> +	groups_total = groups_per_line * dsc->slice_height;
> +
> +	data = dsc->first_line_bpg_offset * 2048;
> +
> +	dsc->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->slice_height - 1));
> +
> +	if (dsc->native_422)
> +		pre_num_extra_mux_bits = 4 * dsc->mux_word_size + (4 * bpc + 4) + (3 * 4 * bpc) - 2;
> +	else if (dsc->native_420)
> +		pre_num_extra_mux_bits = 3 * dsc->mux_word_size + (4 * bpc + 4) + (2 * 4 * bpc) - 2;
> +	else
> +		pre_num_extra_mux_bits = 3 * (dsc->mux_word_size + (4 * bpc + 4) - 2);
> +
> +	num_extra_mux_bits = pre_num_extra_mux_bits - (dsc->mux_word_size -
> +		((slice_bits - pre_num_extra_mux_bits) % dsc->mux_word_size));
> +
> +	data = 2048 * (dsc->rc_model_size - dsc->initial_offset
> +		+ num_extra_mux_bits);
> +	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> +
> +	data = dsc->initial_xmit_delay * bpp;
> +	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> +
> +	final_scale = 8 * dsc->rc_model_size /
> +		(dsc->rc_model_size - final_value);
> +
> +	dsc->final_offset = final_value;
> +
> +	data = (final_scale - 9) * (dsc->nfl_bpg_offset +
> +		dsc->slice_bpg_offset);
> +	dsc->scale_increment_interval = (2048 * dsc->final_offset) / data;
> +
> +	dsc->scale_decrement_interval = groups_per_line /
> +		(dsc->initial_scale_value - 8);
> +
> +	return 0;
> +}
> +
> +bool dpu_dsc_ich_reset_override_needed(bool pu_en,
> +		struct msm_display_dsc_info *dsc_info)
> +{
> +	/*
> +	 * As per the DSC spec, ICH_RESET can be either end of the slice line
> +	 * or at the end of the slice. HW internally generates ich_reset at
> +	 * end of the slice line if DSC_MERGE is used or encoder has two
> +	 * soft slices. However, if encoder has only 1 soft slice and DSC_MERGE
> +	 * is not used then it will generate ich_reset at the end of slice.
> +	 *
> +	 * Now as per the spec, during one PPS session, position where
> +	 * ich_reset is generated should not change. Now if full-screen frame
> +	 * has more than 1 soft slice then HW will automatically generate
> +	 * ich_reset at the end of slice_line. But for the same panel, if
> +	 * partial frame is enabled and only 1 encoder is used with 1 slice,
> +	 * then HW will generate ich_reset at end of the slice. This is a
> +	 * mismatch. Prevent this by overriding HW's decision.
> +	 */
> +	return pu_en && dsc_info && (dsc_info->drm_dsc.slice_count > 1) &&
> +		(dsc_info->drm_dsc.slice_width == dsc_info->drm_dsc.pic_width);
> +}
> +
> +int dpu_dsc_initial_line_calc(struct msm_display_dsc_info *dsc_info,
> +				int enc_ip_width, int dsc_cmn_mode)
> +{
> +	int max_ssm_delay, max_se_size, max_muxword_size;
> +	int compress_bpp_group, obuf_latency, input_ssm_out_latency;
> +	int base_hs_latency, chunk_bits, ob_data_width;
> +	int output_rate_extra_budget_bits, multi_hs_extra_budget_bits;
> +	int multi_hs_extra_latency,  mux_word_size;
> +	int ob_data_width_4comps, ob_data_width_3comps;
> +	int output_rate_ratio_complement, container_slice_width;
> +	int rtl_num_components, multi_hs_c, multi_hs_d;
> +
> +	int bpc = dsc_info->drm_dsc.bits_per_component;
> +	int bpp = DSC_BPP(dsc_info->drm_dsc);
> +	bool native_422 = dsc_info->drm_dsc.native_422;
> +	bool native_420 = dsc_info->drm_dsc.native_420;
> +
> +	/* Hardent core config */
> +	int multiplex_mode_enable = 0, split_panel_enable = 0;
> +	int rtl_max_bpc = 10, rtl_output_data_width = 64;
> +	int pipeline_latency = 28;
> +
> +	if (dsc_cmn_mode & DSC_MODE_MULTIPLEX)
> +		multiplex_mode_enable = 1;
> +	if (dsc_cmn_mode & DSC_MODE_SPLIT_PANEL)
> +		split_panel_enable = 1;
> +	container_slice_width = (native_422 ?
> +			dsc_info->drm_dsc.slice_width / 2 : dsc_info->drm_dsc.slice_width);
> +	max_muxword_size = (rtl_max_bpc >= 12) ? 64 : 48;
> +	max_se_size = 4 * (rtl_max_bpc + 1);
> +	max_ssm_delay = max_se_size + max_muxword_size - 1;
> +	mux_word_size = (bpc >= 12) ? 64 : 48;
> +	compress_bpp_group = native_422 ? (2 * bpp) : bpp;
> +	input_ssm_out_latency = pipeline_latency + 3 * (max_ssm_delay + 2)
> +			* dsc_info->num_active_ss_per_enc;
> +	rtl_num_components = (native_420 || native_422) ? 4 : 3;
> +	ob_data_width_4comps = (rtl_output_data_width >= (2 *
> +			max_muxword_size)) ?
> +			rtl_output_data_width :
> +			(2 * rtl_output_data_width);
> +	ob_data_width_3comps = (rtl_output_data_width >= max_muxword_size) ?
> +			rtl_output_data_width : 2 * rtl_output_data_width;
> +	ob_data_width = (rtl_num_components == 4) ?
> +			ob_data_width_4comps : ob_data_width_3comps;
> +	obuf_latency = DIV_ROUND_UP((9 * ob_data_width + mux_word_size),
> +			compress_bpp_group) + 1;
> +	base_hs_latency = dsc_info->drm_dsc.initial_xmit_delay +
> +		input_ssm_out_latency + obuf_latency;
> +	chunk_bits = 8 * dsc_info->drm_dsc.slice_chunk_size;
> +	output_rate_ratio_complement = ob_data_width - compress_bpp_group;
> +	output_rate_extra_budget_bits =
> +		(output_rate_ratio_complement * chunk_bits) >>
> +		((ob_data_width == 128) ? 7 : 6);
> +	multi_hs_c = split_panel_enable * multiplex_mode_enable;
> +	multi_hs_d = (dsc_info->num_active_ss_per_enc > 1) * (ob_data_width > compress_bpp_group);
> +	multi_hs_extra_budget_bits = multi_hs_c ?
> +				chunk_bits : (multi_hs_d ? chunk_bits :
> +					output_rate_extra_budget_bits);
> +	multi_hs_extra_latency = DIV_ROUND_UP(multi_hs_extra_budget_bits,
> +			compress_bpp_group);
> +	dsc_info->initial_lines = DIV_ROUND_UP((base_hs_latency +
> +				multi_hs_extra_latency),
> +			container_slice_width);
> +
> +	return 0;
> +}
> +
> +int dpu_dsc_populate_dsc_private_params(struct msm_display_dsc_info *dsc_info,
> +					int intf_width)
> +{
> +	int  mod_offset;
> +	int slice_per_pkt, slice_per_intf;
> +	int bytes_in_slice, total_bytes_per_intf;
> +	u16 bpp;
> +	u32 bytes_in_dsc_pair;
> +	u32 total_bytes_in_dsc_pair;
> +
> +	if (!dsc_info || !dsc_info->drm_dsc.slice_width ||
> +			!dsc_info->drm_dsc.slice_height ||
> +			intf_width < dsc_info->drm_dsc.slice_width) {
> +		DPU_ERROR("invalid input, intf_width=%d slice_width=%d\n",
> +			intf_width, dsc_info ? dsc_info->drm_dsc.slice_width :
> +			-1);
> +		return -EINVAL;
> +	}
> +
> +	mod_offset = dsc_info->drm_dsc.slice_width % 3;
> +
> +
> +	switch (mod_offset) {
> +	case 0:
> +		dsc_info->slice_last_group_size = 2;
> +		break;
> +	case 1:
> +		dsc_info->slice_last_group_size = 0;
> +		break;
> +	case 2:
> +		dsc_info->slice_last_group_size = 1;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	dsc_info->det_thresh_flatness =
> +		2 << (dsc_info->drm_dsc.bits_per_component - 8);
> +
> +	slice_per_pkt = dsc_info->slice_per_pkt;
> +	slice_per_intf = DIV_ROUND_UP(intf_width,
> +			dsc_info->drm_dsc.slice_width);
> +
> +
> +	/*
> +	 * If slice_per_pkt is greater than slice_per_intf then default to 1.
> +	 * This can happen during partial update.
> +	 */
> +	if (slice_per_pkt > slice_per_intf)
> +		slice_per_pkt = 1;
> +
> +	bpp = DSC_BPP(dsc_info->drm_dsc);
> +	bytes_in_slice = DIV_ROUND_UP(dsc_info->drm_dsc.slice_width * bpp, 8);
> +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> +
> +
> +	dsc_info->eol_byte_num = total_bytes_per_intf % 3;
> +	dsc_info->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +	dsc_info->bytes_in_slice = bytes_in_slice;
> +	dsc_info->bytes_per_pkt = bytes_in_slice * slice_per_pkt;
> +	dsc_info->pkt_per_line = slice_per_intf / slice_per_pkt;
> +
> +
> +	bytes_in_dsc_pair = DIV_ROUND_UP(bytes_in_slice * 2, 3);
> +	if (bytes_in_dsc_pair % 8) {
> +		dsc_info->dsc_4hsmerge_padding = 8 - (bytes_in_dsc_pair % 8);
> +		total_bytes_in_dsc_pair = bytes_in_dsc_pair +
> +				dsc_info->dsc_4hsmerge_padding;
> +		if (total_bytes_in_dsc_pair % 16)
> +			dsc_info->dsc_4hsmerge_alignment = 16 -
> +					(total_bytes_in_dsc_pair % 16);
> +	}
> +
> +	return 0;
> +}
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> new file mode 100644
> index 00000000..9f26455
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020 - 2023 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef __DPU_DSC_HELPER_H__
> +#define __DPU_DSC_HELPER_H__
> +
> +#include "msm_drv.h"
> +
> +#define DSC_1_1_PPS_PARAMETER_SET_ELEMENTS   88

Where is this used?

> +
> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_ver);
> +
> +int dpu_dsc_populate_dsc_private_params(struct msm_display_dsc_info *dsc_info,
> +					int intf_width);
> +
> +bool dpu_dsc_ich_reset_override_needed(bool pu_en, struct msm_display_dsc_info *dsc);
> +
> +int dpu_dsc_initial_line_calc(struct msm_display_dsc_info *dsc,
> +				int enc_ip_width, int dsc_cmn_mode);
> +
> +#endif /* __DPU_DSC_HELPER_H__ */
> +
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index f155803..cf4eb8d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -57,6 +57,10 @@ struct msm_disp_state;
>   #define MAX_CRTCS      8
>   #define MAX_BRIDGES    8
>   
> +#define MSM_CHROMA_444 0x0
> +#define MSM_CHROMA_422 0x1
> +#define MSM_CHROMA_420 0x2

enum?

> +
>   #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
>   
>   enum msm_dp_controller {

-- 
With best wishes
Dmitry

