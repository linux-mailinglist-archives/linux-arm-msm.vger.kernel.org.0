Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0156F219C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 02:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347032AbjD2Aa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 20:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbjD2Aa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 20:30:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407303AB6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 17:30:55 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f182d745deso2925695e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 17:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682728254; x=1685320254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTDO+mRAQ6uSjw58ytYqiX+MtT/f3Lu3qMBouPaYyAE=;
        b=GFnHXh+yxfwmTs2MrIwQ/joPZf/d92F9LwHs2pmx4DtZKHpIJYshPeCGucvRnT0wYt
         fhxuze3QNmMAiYhuRAVC091ErFZESonnU1O84OwMX73G8QplU7A1bAXZ7wgRAzUcYTgW
         OYXXhk+mC83UB7qoeQ77I8zVQLxb6ygL1kZijPSYm7vtEH8lOWsGyoykjwM8cwwhRbbL
         Ex7exqsKtUjoV3hZr4pbT6IhcAQ86OjwMvyNNXWFkqdwXggp4gXMWkAr3tVOrFECXZgP
         alTxq0nn5UjbbDtAOxeFp/iblsY4R+bhinv1rbkWAQkNfpOgNaDygY8Iu/ki0dTWJQNq
         iP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682728254; x=1685320254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTDO+mRAQ6uSjw58ytYqiX+MtT/f3Lu3qMBouPaYyAE=;
        b=JEwPlyRDpmD53aKfIWDaVT+X1Af4QESiZhM69bywcmXx5JrUI0sP/ZtoZohD5vOKBa
         0AT0WtA7hwb9KSAi2+X1b1otTiGL7vSMBuF8hPLSeKRqcGMfcxtXyNkHcn5JF2rlGUib
         EPhMSKBytqyJURs/0ENxXWWhmUE1WTfccaLXxXy3ubRIgld+QUXmWf9+BWOaVr6PJcoy
         INjejfjfELSa1bn77RvCznG3QtaQQQjhOZY7Ox9gJY4z4rFEvvqnwJBcHF1LHPWVuHnD
         Oj1TbJnX+S57n2DWcTOw6+BHfGmBZYI5ZWjgV8b8vdp2Ml6M2xrVLHjFvIqN49in5Qcx
         onKg==
X-Gm-Message-State: AC+VfDx9I/YpLqq0kVI6+EZcynz2BrM13yJUCjLanLihBEvVPUiXUNLF
        kBf9RdQYGUOM60YK/MSssDPfIA==
X-Google-Smtp-Source: ACHHUZ4sjYWV1DYfkbQWxgMSywUB269gSNc1DKiTjIA5QncBu5jpSU8XIFHR3GbF9sJnhhTAg5V/MQ==
X-Received: by 2002:a05:600c:b49:b0:3f1:8c59:4713 with SMTP id k9-20020a05600c0b4900b003f18c594713mr5177032wmr.12.1682728253525;
        Fri, 28 Apr 2023 17:30:53 -0700 (PDT)
Received: from [10.6.147.212] ([212.140.138.218])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b003f18992079dsm26513660wmo.42.2023.04.28.17.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 17:30:53 -0700 (PDT)
Message-ID: <e5d2bf3f-d578-2206-49a4-7105ca810f6c@linaro.org>
Date:   Sat, 29 Apr 2023 03:30:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/7] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682725511-18185-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2023 02:45, Kuogee Hsieh wrote:
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
> 
> Reported-by: kernel test robot <lkp@intel.com>

What exactly was reported?

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  34 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  14 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 335 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>   5 files changed, 387 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b814fc8..b9af5e4 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
>   	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_hw_dsc_1_2.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd..fc87db1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>    */
>   
> @@ -241,12 +241,20 @@ enum {
>   };
>   
>   /**
> - * DSC features
> + * DSC sub-blocks/features
>    * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
>    *                            the pixel output from this DSC.
> + * @DPU_DSC_HW_REV_1_1        DSC block supports dsc 1.1 only
> + * @DPU_DSC_HW_REV_1_2        DSC block supports dsc 1.1 and 1.2
> + * @DPU_DSC_NATIVE_422_EN     Supports native422 and native420 encoding
> + * @DPU_DSC_MAX
>    */
>   enum {
>   	DPU_DSC_OUTPUT_CTRL = 0x1,
> +	DPU_DSC_HW_REV_1_1,
> +	DPU_DSC_HW_REV_1_2,
> +	DPU_DSC_NATIVE_422_EN,
> +	DPU_DSC_MAX
>   };
>   
>   /**
> @@ -311,6 +319,14 @@ struct dpu_pp_blk {
>   };
>   
>   /**
> + * struct dpu_dsc_blk - DSC Encoder sub-blk information
> + * @info:   HW register and features supported by this sub-blk
> + */
> +struct dpu_dsc_blk {
> +	DPU_HW_SUBBLK_INFO;
> +};
> +
> +/**
>    * enum dpu_qos_lut_usage - define QoS LUT use cases
>    */
>   enum dpu_qos_lut_usage {
> @@ -459,6 +475,17 @@ struct dpu_pingpong_sub_blks {
>   };
>   
>   /**
> + * struct dpu_dsc_sub_blks - DSC sub-blks
> + * @enc: DSC encoder sub block
> + * @ctl: DSC controller sub block
> + *
> + */
> +struct dpu_dsc_sub_blks {
> +	struct dpu_dsc_blk enc;
> +	struct dpu_dsc_blk ctl;
> +};
> +
> +/**
>    * dpu_clk_ctrl_type - Defines top level clock control signals
>    */
>   enum dpu_clk_ctrl_type {
> @@ -612,10 +639,13 @@ struct dpu_merge_3d_cfg  {
>    * struct dpu_dsc_cfg - information of DSC blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> + * @len:               length of hardware block
>    * @features           bit mask identifying sub-blocks/features
> + * @sblk               sub-blocks information
>    */
>   struct dpu_dsc_cfg {
>   	DPU_HW_BLK_INFO;
> +	const struct dpu_dsc_sub_blks *sblk;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 287ec5f..e11240a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -1,5 +1,8 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2020-2022, Linaro Limited */
> +/*
> + * Copyright (c) 2020-2022, Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
>   
>   #ifndef _DPU_HW_DSC_H
>   #define _DPU_HW_DSC_H
> @@ -70,6 +73,15 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
>   		void __iomem *addr);
>   
>   /**
> + * dpu_hw_dsc_init_1_2 - initializes the v1.2 DSC hw driver block
> + * @cfg:  DSC catalog entry for which driver object is required
> + * @addr: Mapped register io address of MDP
> + * Returns: Error code or allocated dpu_hw_dsc context
> + */
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
> +		void __iomem *addr);
> +
> +/**
>    * dpu_hw_dsc_destroy - destroys dsc driver context
>    * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>    */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> new file mode 100644
> index 00000000..a777c7b
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
> +

Unused empty line

> +#define DSC_CMN_MAIN_CNF           0x00
> +
> +/* DPU_DSC_ENC register offsets */
> +#define ENC_DF_CTRL                0x00
> +#define ENC_GENERAL_STATUS         0x04
> +#define ENC_HSLICE_STATUS          0x08
> +#define ENC_OUT_STATUS             0x0C
> +#define ENC_INT_STAT               0x10
> +#define ENC_INT_CLR                0x14
> +#define ENC_INT_MASK               0x18
> +#define DSC_MAIN_CONF              0x30
> +#define DSC_PICTURE_SIZE           0x34
> +#define DSC_SLICE_SIZE             0x38
> +#define DSC_MISC_SIZE              0x3C
> +#define DSC_HRD_DELAYS             0x40
> +#define DSC_RC_SCALE               0x44
> +#define DSC_RC_SCALE_INC_DEC       0x48
> +#define DSC_RC_OFFSETS_1           0x4C
> +#define DSC_RC_OFFSETS_2           0x50
> +#define DSC_RC_OFFSETS_3           0x54
> +#define DSC_RC_OFFSETS_4           0x58
> +#define DSC_FLATNESS_QP            0x5C
> +#define DSC_RC_MODEL_SIZE          0x60
> +#define DSC_RC_CONFIG              0x64
> +#define DSC_RC_BUF_THRESH_0        0x68
> +#define DSC_RC_MIN_QP_0            0x78
> +#define DSC_RC_MAX_QP_0            0x84
> +#define DSC_RC_RANGE_BPG_OFFSETS_0 0x90
> +
> +/* DPU_DSC_CTL register offsets */
> +#define DSC_CTL                    0x00
> +#define DSC_CFG                    0x04
> +#define DSC_DATA_IN_SWAP           0x08
> +#define DSC_CLK_CTRL               0x0C
> +
> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss, bool native_422)
> +{
> +	int max_addr = 2400 / num_ss;
> +
> +	if ((hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN)) && native_422)
> +		max_addr /= 2;
> +
> +	return max_addr - 1;
> +};
> +
> +static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 offset;
> +
> +	if (!hw_dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +	offset = hw_dsc->caps->sblk->ctl.base;
> +	DPU_REG_WRITE(hw, offset + DSC_CFG, 0);
> +
> +	offset = hw_dsc->caps->sblk->enc.base;
> +	DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, 0);
> +	DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, 0);
> +}
> +
> +static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
> +			      struct drm_dsc_config *dsc,
> +			      u32 mode,
> +			      u32 initial_lines)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 offset;
> +	u32 data = 0;
> +	u32 det_thresh_flatness;
> +	u32 num_active_ss_per_enc;
> +	u32 bpp;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	offset = hw_dsc->caps->sblk->enc.base;
> +
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(0);
> +
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(1);
> +
> +	num_active_ss_per_enc = dsc->slice_count;
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		num_active_ss_per_enc = dsc->slice_count >> 1;
> +
> +	data |= (num_active_ss_per_enc & 0x3) << 7;
> +
> +	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
> +
> +	data = (initial_lines & 0xff);
> +
> +	if (mode & DSC_MODE_VIDEO)
> +		data |= BIT(9);
> +
> +	data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_ss_per_enc, dsc->native_422) << 18);
> +
> +	DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, data);
> +
> +	data = (dsc->dsc_version_minor & 0xf) << 28;
> +	if (dsc->dsc_version_minor == 0x2) {
> +		if (dsc->native_422)
> +			data |= BIT(22);
> +		if (dsc->native_420)
> +			data |= BIT(21);
> +	}
> +
> +	bpp = dsc->bits_per_pixel;
> +	/* as per hw requirement bpp should be programmed
> +	 * twice the actual value in case of 420 or 422 encoding
> +	 */
> +	if (dsc->native_422 || dsc->native_420)
> +		bpp = 2 * bpp;
> +	data |= (dsc->block_pred_enable ? 1 : 0) << 20;
> +	data |= bpp << 10;
> +	data |= (dsc->line_buf_depth & 0xf) << 6;
> +	data |= dsc->convert_rgb << 4;
> +	data |= dsc->bits_per_component & 0xf;
> +
> +	DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, data);
> +
> +	data = (dsc->pic_width & 0xffff) |
> +		((dsc->pic_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_PICTURE_SIZE, data);
> +
> +	data = (dsc->slice_width & 0xffff) |
> +		((dsc->slice_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_SLICE_SIZE, data);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_MISC_SIZE,
> +			(dsc->slice_chunk_size) & 0xffff);
> +
> +	data = (dsc->initial_xmit_delay & 0xffff) |
> +		((dsc->initial_dec_delay & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_HRD_DELAYS, data);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_SCALE,
> +			dsc->initial_scale_value & 0x3f);
> +
> +	data = (dsc->scale_increment_interval & 0xffff) |
> +		((dsc->scale_decrement_interval & 0x7ff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_SCALE_INC_DEC, data);
> +
> +	data = (dsc->first_line_bpg_offset & 0x1f) |
> +		((dsc->second_line_bpg_offset & 0x1f) << 5);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_1, data);
> +
> +	data = (dsc->nfl_bpg_offset & 0xffff) |
> +		((dsc->slice_bpg_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_2, data);
> +
> +	data = (dsc->initial_offset & 0xffff) |
> +		((dsc->final_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_3, data);
> +
> +	data = (dsc->nsl_bpg_offset & 0xffff) |
> +		((dsc->second_line_offset_adj & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_4, data);
> +
> +	data = (dsc->flatness_min_qp & 0x1f);
> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
> +
> +	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
> +	data |= (det_thresh_flatness & 0xff) << 10;
> +
> +	DPU_REG_WRITE(hw, offset + DSC_FLATNESS_QP, data);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_MODEL_SIZE,
> +			(dsc->rc_model_size) & 0xffff);
> +
> +	data = dsc->rc_edge_factor & 0xf;
> +	data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
> +	data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
> +	data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
> +	data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
> +
> +	DPU_REG_WRITE(hw, offset + DSC_RC_CONFIG, data);
> +
> +	/* program the dsc wrapper */
> +	offset = hw_dsc->caps->sblk->ctl.base;
> +
> +	data = BIT(0); /* encoder enable */
> +	if (dsc->native_422)
> +		data |= BIT(8);
> +	else if (dsc->native_420)
> +		data |= BIT(9);
> +	if (!dsc->convert_rgb)
> +		data |= BIT(10);
> +	if (dsc->bits_per_component == 8)
> +		data |= BIT(11);
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(12);
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(13);
> +	if (!(mode & DSC_MODE_VIDEO))
> +		data |= BIT(17);
> +
> +	DPU_REG_WRITE(hw, offset + DSC_CFG, data);
> +}
> +
> +static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
> +					struct drm_dsc_config *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 offset, off;
> +	int i, j = 0;
> +	struct drm_dsc_rc_range_parameters *rc;
> +	u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	offset = hw_dsc->caps->sblk->enc.base;
> +
> +	hw = &hw_dsc->hw;
> +
> +	rc = dsc->rc_range_params;
> +
> +	/*
> +	 * With BUF_THRESH -- 14 in total
> +	 * each register contains 4 thresh values with the last register
> +	 * containing only 2 thresh values
> +	 */
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> +		data |= dsc->rc_buf_thresh[i] << (8 * j);
> +		j++;
> +		if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
> +			DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0 + off, data);
> +			off += 4;
> +			j = 0;
> +			data = 0;
> +		}
> +	}

This is barely understandable code. The following line is much better:

DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0,
     (dsc->rc_buf_thresh[0] << 0) |
     (dsc->rc_buf_thresh[1] << 8) |
     (dsc->rc_buf_thresh[2] << 16) |
     (dsc->rc_buf_thresh[3] << 24));

etc.

Please unroll both loops.

> +
> +
> +	/*
> +	 * with min/max_QP -- 5 bits each
> +	 * each register contains 5 min_qp or max_qp for total of 15
> +	 *
> +	 * With BPG_OFFSET -- 6 bits each
> +	 * each register contains 5 BPG_offset for total of 15
> +	 */
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		min_qp |= rc[i].range_min_qp << (5 * j);
> +		max_qp |= rc[i].range_max_qp << (5 * j);
> +		bpg_off |= rc[i].range_bpg_offset << (6 * j);
> +		j++;
> +		if (j == 5) {
> +			DPU_REG_WRITE(hw, offset + DSC_RC_MIN_QP_0 + off, min_qp);
> +			DPU_REG_WRITE(hw, offset + DSC_RC_MAX_QP_0 + off, max_qp);
> +			DPU_REG_WRITE(hw, offset + DSC_RC_RANGE_BPG_OFFSETS_0 + off, bpg_off);
> +			off += 4;
> +			j = 0;
> +			min_qp = 0;
> +			max_qp = 0;
> +			bpg_off = 0;
> +		}
> +	}
> +}
> +
> +static void dpu_hw_dsc_bind_pingpong_blk_1_2(
> +		struct dpu_hw_dsc *hw_dsc,
> +		bool enable,
> +		const enum dpu_pingpong pp)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	int offset;
> +	int mux_cfg = 0xf; /* Disabled */
> +
> +	offset = hw_dsc->caps->sblk->ctl.base;
> +
> +	hw = &hw_dsc->hw;
> +	if (enable)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DPU_REG_WRITE(hw, offset + DSC_CTL, mux_cfg);
> +}

Please refactor the existing bind_pingpong_blk() semantics to accept 
either a valid PINGPONG_n, or PINGPONG_NONE to disable the binding.

> +
> +static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
> +	ops->dsc_config = dpu_hw_dsc_config_1_2;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
> +	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
> +}

Please inline the function.

> +
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
> +				   void __iomem *addr)
> +{
> +	struct dpu_hw_dsc *c;
> +
> +	c = kzalloc(sizeof(*c), GFP_KERNEL);
> +	if (!c)
> +		return ERR_PTR(-ENOMEM);
> +
> +	c->hw.blk_addr = addr + cfg->base;
> +	c->hw.log_mask = DPU_DBG_MASK_DSC;
> +
> +	c->idx = cfg->id;
> +	c->caps = cfg;
> +	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
> +
> +	return c;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 3452f88..b2f618f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> @@ -250,7 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		struct dpu_hw_dsc *hw;
>   		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>   
> -		hw = dpu_hw_dsc_init(dsc, mmio);
> +		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
> +			hw = dpu_hw_dsc_init_1_2(dsc, mmio);
> +		else
> +			hw = dpu_hw_dsc_init(dsc, mmio);
> +
>   		if (IS_ERR_OR_NULL(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed dsc object creation: err %d\n", rc);

-- 
With best wishes
Dmitry

