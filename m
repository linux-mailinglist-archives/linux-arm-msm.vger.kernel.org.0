Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5BA67923A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 08:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjAXHoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 02:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbjAXHo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 02:44:29 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290AE3D915
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 23:44:25 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id v5so17326755edc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjIThixiJeO6OJ9mpZ0EjXRWMd2Y1ppwgyKgk0hOSA8=;
        b=HbdZ15K0hCvSI0rEIdSQbhJmxjP56sjnC/yhldPnNP9C/xw/beTlqmKEYzRdAHIkYg
         lL5Vf1tgw64nKoXSOVd9lRO7yhvga9zSalQ90PKKTavtBKntLWzhOGrJCGkIm5ryEQWt
         DmeItUMyWkmVOO6Wyi7vV/dKWKniF6mUpoVoLFFS6zjsGEfOwmOI94q/mdjDSHWPtfs0
         I6apH0SuoQaEnW6QxsRHjGEj71upKGDVGVMyJ8T01xe1sf0Z6PH/br8mwbyTmMM5N+hD
         QjLrHTpNsclHSBZOF/mEJLAIzvKdEDBh83HWONVn6gTSYXwYfBimPK381We4CJgiCOEz
         YSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjIThixiJeO6OJ9mpZ0EjXRWMd2Y1ppwgyKgk0hOSA8=;
        b=WCUgbY6edWHAjI1Qg8L8b7ocucSZg77oX2LcUZW8WugKFbf9MDTGrf6E9M5R21jTJS
         Al2DKu6O0EBKxENr+VrLuR1JzaQBZl1rQtH3O0keAvjPYdzhz67iDTZmjOy/kFATtEu+
         BvFRhh3YnpOgpvTSbkThwQU0RaOIdCejy61SmN7bBIVPDWywysDlEjwszApMLspb87EY
         xYDihtHe+p2p3VgxWkfcVffORtf9dD+WkbQaOa/MBKFyDSpxQ5DE4CRUa+B5fdN7/xbs
         85YZ9nDNiES2rfeuUyd7AaMHqGlG6Hrgo1dTINdQ/Kv7eYXPtJsyZDVJrOfbK08gpIsO
         1eVQ==
X-Gm-Message-State: AFqh2krDBM1xoCVjAzhJAlCxBkAin/8foAwag5CkH06vL7jRaGT92wBX
        ZtjOuvFCZE0RLkof5xxzRFW4vpi5QBH4MGylp58=
X-Google-Smtp-Source: AMrXdXtwzZbCQLPwUuwseDJYFgSTZMNMqpYPdylyEGO8TqmVrWyLcnDMPz2waMvBvv1PeWTvgLnjKg==
X-Received: by 2002:a05:6402:1cb2:b0:49e:f052:d9d3 with SMTP id cz18-20020a0564021cb200b0049ef052d9d3mr12822829edb.15.1674546263390;
        Mon, 23 Jan 2023 23:44:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id i24-20020aa7c9d8000000b00482b3d0e1absm684553edt.87.2023.01.23.23.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:44:22 -0800 (PST)
Message-ID: <68ae4ebd-025e-18ff-ba62-331892b5ccc3@linaro.org>
Date:   Tue, 24 Jan 2023 09:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 10/14] drm/msm/disp/dpu: add supports of DSC encoder
 v1.2 engine
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
 <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> DSC V1.2 encoder engine is newly added hardware module. This patch
> add support functions to configure and enable DSC V1.2 encoder engine.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  60 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 371 +++++++++++++++++++++++++
>   6 files changed, 463 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 28cf52b..271c29a15 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
>   	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_hw_dsc_1_2.o \
>   	disp/dpu1/dpu_dsc_helper.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7f4a439..901e317 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1821,7 +1821,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   				     u32 initial_lines)
>   {
>   	if (hw_dsc->ops.dsc_config)
> -		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines);
> +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines, false);
>   
>   	if (hw_dsc->ops.dsc_config_thresh)
>   		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 978e3bd..7b0b092 100644
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
> @@ -11,6 +11,7 @@
>   #include <linux/bug.h>
>   #include <linux/bitmap.h>
>   #include <linux/err.h>
> +#include "dpu_hw_mdss.h"
>   
>   /**
>    * Max hardware block count: For ex: max 12 SSPP pipes or
> @@ -182,6 +183,7 @@ enum {
>    * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> + * @DPU_PINGPONG_DSC,       Display stream compression blocks
>    * @DPU_PINGPONG_DITHER,    Dither blocks
>    * @DPU_PINGPONG_MAX
>    */
> @@ -190,10 +192,32 @@ enum {
>   	DPU_PINGPONG_TE2,
>   	DPU_PINGPONG_SPLIT,
>   	DPU_PINGPONG_SLAVE,
> +	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_DITHER,
>   	DPU_PINGPONG_MAX
>   };
>   
> +
> +/** DSC sub-blocks/features
> + * @DPU_DSC_OUTPUT_CTRL         Supports the control of the pp id which gets
> + *                              the pixel output from this DSC.
> + * @DPU_DSC_HW_REV_1_1          dsc block supports dsc 1.1 only
> + * @DPU_DSC_HW_REV_1_2          dsc block supports dsc 1.1 and 1.2
> + * @DPU_DSC_NATIVE_422_EN,      Supports native422 and native420 encoding
> + * @DPU_DSC_ENC,                DSC encoder sub block
> + * @DPU_DSC_CTL,                DSC ctl sub block
> + * @DPU_DSC_MAX
> + */
> +enum {
> +	DPU_DSC_OUTPUT_CTRL = 0x1,
> +	DPU_DSC_HW_REV_1_1,
> +	DPU_DSC_HW_REV_1_2,
> +	DPU_DSC_NATIVE_422_EN,
> +	DPU_DSC_ENC,
> +	DPU_DSC_CTL,
> +	DPU_DSC_MAX
> +};
> +
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> @@ -276,15 +300,6 @@ enum {
>   };
>   
>   /**
> - * DSC features
> - * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
> - *                            the pixel output from this DSC.
> - */
> -enum {
> -	DPU_DSC_OUTPUT_CTRL = 0x1,
> -};
> -

Any reason for this move?

> -/**
>    * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
>    * @name:              string name for debug purposes
>    * @id:                enum identifying this block
> @@ -346,6 +361,14 @@ struct dpu_pp_blk {
>   };
>   
>   /**
> + * struct dpu_dsc_blk : DSC Encoder sub-blk information
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
> @@ -403,6 +426,7 @@ struct dpu_rotation_cfg {
>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>    * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
> + * @max_dsc_width      max dsc line width support.
>    */
>   struct dpu_caps {
>   	u32 max_mixer_width;
> @@ -419,6 +443,7 @@ struct dpu_caps {
>   	u32 pixel_ram_size;
>   	u32 max_hdeci_exp;
>   	u32 max_vdeci_exp;
> +	u32 max_dsc_width;
>   };
>   
>   /**
> @@ -494,9 +519,20 @@ struct dpu_dspp_sub_blks {
>   struct dpu_pingpong_sub_blks {
>   	struct dpu_pp_blk te;
>   	struct dpu_pp_blk te2;
> +	struct dpu_pp_blk dsc;
>   	struct dpu_pp_blk dither;
>   };
>   
> +
> +/**
> + * struct dpu_dsc_sub_blks : DSC sub-blks
> + *
> + */
> +struct dpu_dsc_sub_blks {
> +	struct dpu_dsc_blk enc;
> +	struct dpu_dsc_blk ctl;
> +};
> +
>   /**
>    * dpu_clk_ctrl_type - Defines top level clock control signals
>    */
> @@ -641,10 +677,14 @@ struct dpu_merge_3d_cfg  {
>    * struct dpu_dsc_cfg - information of DSC blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> + * @len:               length of hardware block
>    * @features           bit mask identifying sub-blocks/features
> + * @dsc_pair_mask:     Bitmask of DSCs that can be controlled by same CTL
>    */
>   struct dpu_dsc_cfg {
>   	DPU_HW_BLK_INFO;
> +	DECLARE_BITMAP(dsc_pair_mask, DSC_MAX);

Please change this from the bitmap to enum dpu_dsc instance

> +	const struct dpu_dsc_sub_blks *sblk;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926d..51e8890 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2020-2022, Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #include "dpu_kms.h"
> @@ -41,10 +42,11 @@ static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
>   static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   			      struct drm_dsc_config *dsc,
>   			      u32 mode,
> -			      u32 initial_lines)
> +			      u32 initial_lines,
> +			      bool ich_reset_override)
>   {
>   	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> -	u32 data;
> +	u32 data, lsb, bpp;
>   	u32 slice_last_group_size;
>   	u32 det_thresh_flatness;
>   	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
> @@ -58,7 +60,14 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	data = (initial_lines << 20);
>   	data |= ((slice_last_group_size - 1) << 18);
>   	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> -	data |= (dsc->bits_per_pixel << 8);
> +	data |= dsc->bits_per_pixel << 12;
> +	lsb = dsc->bits_per_pixel % 4;
> +	bpp = dsc->bits_per_pixel / 4;
> +	bpp *= 4;
> +	bpp <<= 4;
> +	bpp |= lsb;
> +

NAK. This was changed by the commit d3c1a8663d0d ("drm/msm/dpu1: Account 
for DSC's bits_per_pixel having 4 fractional bits"). It removed the code 
that you are trying to bring back.

> +	data |= bpp << 8;
>   	data |= (dsc->block_pred_enable << 7);
>   	data |= (dsc->line_buf_depth << 3);
>   	data |= (dsc->simple_422 << 2);
> @@ -221,7 +230,13 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>   
>   	c->idx = idx;
>   	c->caps = cfg;
> -	_setup_dsc_ops(&c->ops, c->caps->features);
> +
> +	if (test_bit(DPU_DSC_HW_REV_1_1, &c->caps->features))
> +		_setup_dsc_ops(&c->ops, c->caps->features);
> +	else if (test_bit(DPU_DSC_HW_REV_1_2, &c->caps->features))
> +		dpu_dsc_1_2_setup_ops(&c->ops, c->caps->features);
> +	else
> +		_setup_dsc_ops(&c->ops, c->caps->features);

Can we handle this in a more sensible way, please. E.g. let RM check the 
flags and then call either dpu_hw_dsc_1_1_init() or dpu_hw_dsc_1_2_init()?

Granted that to generations of DSC blocks are _that_ different it might 
even make sense to handle them separately in the HW catalog too, but I 
wouldn't insist on that.

>   
>   	return c;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index ae9b5db..a48f572 100644
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
> @@ -33,7 +36,8 @@ struct dpu_hw_dsc_ops {
>   	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
>   			   struct drm_dsc_config *dsc,
>   			   u32 mode,
> -			   u32 initial_lines);
> +			   u32 initial_lines,
> +			   bool ich_reset_override);

Documentation?

>   
>   	/**
>   	 * dsc_config_thresh - programs panel thresholds
> @@ -43,6 +47,12 @@ struct dpu_hw_dsc_ops {
>   	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
>   				  struct drm_dsc_config *dsc);
>   
> +	/**
> +	 * bind_pingpong_blk - enable/disable the connection with pp
> +	 * @hw_dsc: Pointer to dsc context
> +	 * @enable: enable/disable connection
> +	 * @pp: pingpong blk id
> +	 */
>   	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
>   				  bool enable,
>   				  enum dpu_pingpong pp);
> @@ -51,6 +61,7 @@ struct dpu_hw_dsc_ops {
>   struct dpu_hw_dsc {
>   	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
> +	struct dpu_hw_ctl *hw_ctl;

Why? This is not used by the rest of the patch.

>   
>   	/* dsc */
>   	enum dpu_dsc idx;
> @@ -76,9 +87,17 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>    */
>   void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
>   
> +/**
> + * dpu_hw_dsc - convert base object dpu_hw_base to container
> + * @hw: Pointer to base hardware block
> + * return: Pointer to hardware block container
> + */

You are adding docs for the obvious items (which is unnecessary and just 
clobbers the code), but leaving out important items (for which docs 
might be necessary).

>   static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
>   {
>   	return container_of(hw, struct dpu_hw_dsc, base);
>   }
>   
> +void dpu_dsc_1_2_setup_ops(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features);
> +
>   #endif /* _DPU_HW_DSC_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> new file mode 100644
> index 00000000..2be74ae
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
> +
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
> +#define DSC_RC_BUF_THRESH_1        0x6C
> +#define DSC_RC_BUF_THRESH_2        0x70
> +#define DSC_RC_BUF_THRESH_3        0x74
> +#define DSC_RC_MIN_QP_0            0x78
> +#define DSC_RC_MIN_QP_1            0x7C
> +#define DSC_RC_MIN_QP_2            0x80
> +#define DSC_RC_MAX_QP_0            0x84
> +#define DSC_RC_MAX_QP_1            0x88
> +#define DSC_RC_MAX_QP_2             0x8C
> +#define DSC_RC_RANGE_BPG_OFFSETS_0  0x90
> +#define DSC_RC_RANGE_BPG_OFFSETS_1  0x94
> +#define DSC_RC_RANGE_BPG_OFFSETS_2  0x98
> +
> +/* DPU_DSC_CTL register offsets */
> +#define DSC_CTL                    0x00
> +#define DSC_CFG                    0x04
> +#define DSC_DATA_IN_SWAP           0x08
> +#define DSC_CLK_CTRL               0x0C
> +
> +
> +static int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)
> +{
> +	enum dpu_dsc idx;
> +
> +	idx = hw_dsc->idx;
> +
> +	if (!(hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))) {
> +		if (num_ss == 1)
> +			return 2399;
> +		else if (num_ss == 2)
> +			return 1199;
> +	} else {
> +		if (num_ss == 1)
> +			return 1199;
> +		else if (num_ss == 2)
> +			return 599;
> +	}
> +	return 0;

int max_addr = 2400 / num_ss;
if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))
     max_addr /= 2;

return max_addr -1;

Isn't this nicer?

> +}
> +
> +static inline int _dsc_subblk_offset(struct dpu_hw_dsc *hw_dsc, int s_id,
> +		u32 *idx)
> +{
> +	const struct dpu_dsc_sub_blks *sblk;
> +
> +	if (!hw_dsc)
> +		return -EINVAL;
> +
> +	*idx = 0;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	switch (s_id) {
> +
> +	case DPU_DSC_ENC:
> +		*idx = sblk->enc.base;
> +		break;
> +	case DPU_DSC_CTL:
> +		*idx = sblk->ctl.base;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 idx;
> +
> +	if (!hw_dsc)
> +		return;
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +	DPU_REG_WRITE(hw, DSC_CFG + idx, 0);
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	DPU_REG_WRITE(hw, ENC_DF_CTRL + idx, 0);
> +	DPU_REG_WRITE(hw, DSC_MAIN_CONF + idx, 0);
> +}
> +
> +static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
> +		struct drm_dsc_config *dsc, u32 mode,
> +		u32 initial_lines, bool ich_reset_override)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	struct msm_display_dsc_info *dsc_info;
> +	u32 idx;
> +	u32 data = 0;
> +	u32 bpp;
> +	void __iomem *off;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	dsc_info = to_msm_dsc_info(dsc);
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(0);
> +
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(1);
> +
> +	data |= (dsc_info->num_active_ss_per_enc & 0x3) << 7;
> +
> +	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
> +
> +	data = (dsc_info->initial_lines & 0xff);
> +	data |= ((mode & DSC_MODE_VIDEO) ? 1 : 0) << 9;
> +	if (ich_reset_override)
> +		data |= 0xC00; // set bit 10 and 11

Comment style is wrong. The comment is useless: from 0xc00 we see which 
bits are being set. We'd better know why. Please add corresponding 
defines to the bits and bitfields in these function.

> +	data |= (_dsc_calc_ob_max_addr(hw_dsc, dsc_info->num_active_ss_per_enc) << 18);
> +
> +	DPU_REG_WRITE(hw, ENC_DF_CTRL + idx, data);
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
> +	data |= (bpp << 10);
> +	data |= (dsc->line_buf_depth & 0xf) << 6;
> +	data |= dsc->convert_rgb << 4;
> +	data |= dsc->bits_per_component & 0xf;
> +
> +	DPU_REG_WRITE(hw, DSC_MAIN_CONF + idx, data);
> +
> +	data = (dsc->pic_width & 0xffff) |
> +		((dsc->pic_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_PICTURE_SIZE + idx, data);
> +
> +	data = (dsc->slice_width & 0xffff) |
> +		((dsc->slice_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_SLICE_SIZE + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_MISC_SIZE + idx,
> +			(dsc->slice_chunk_size) & 0xffff);
> +
> +	data = (dsc->initial_xmit_delay & 0xffff) |
> +		((dsc->initial_dec_delay & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_HRD_DELAYS + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_SCALE + idx,
> +			dsc->initial_scale_value & 0x3f);
> +
> +	data = (dsc->scale_increment_interval & 0xffff) |
> +		((dsc->scale_decrement_interval & 0x7ff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_SCALE_INC_DEC + idx, data);
> +
> +	data = (dsc->first_line_bpg_offset & 0x1f) |
> +		((dsc->second_line_bpg_offset & 0x1f) << 5);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_1 + idx, data);
> +
> +	data = (dsc->nfl_bpg_offset & 0xffff) |
> +		((dsc->slice_bpg_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_2 + idx, data);
> +
> +	data = (dsc->initial_offset & 0xffff) |
> +		((dsc->final_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_3 + idx, data);
> +
> +	data = (dsc->nsl_bpg_offset & 0xffff) |
> +		((dsc->second_line_offset_adj & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_4 + idx, data);
> +
> +	data = (dsc->flatness_min_qp & 0x1f);
> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
> +	data |= (dsc_info->det_thresh_flatness & 0xff) << 10;
> +
> +	DPU_REG_WRITE(hw, DSC_FLATNESS_QP + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_MODEL_SIZE + idx,
> +			(dsc->rc_model_size) & 0xffff);
> +
> +	data = dsc->rc_edge_factor & 0xf;
> +	data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
> +	data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
> +	data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
> +	data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
> +
> +	DPU_REG_WRITE(hw, DSC_RC_CONFIG + idx, data);
> +
> +	/* program the dsc wrapper */
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;
> +
> +	off = hw->blk_addr + idx;
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
> +	if (dsc_info->dsc_4hsmerge_en) {
> +		data |= dsc_info->dsc_4hsmerge_padding << 18;
> +		data |= dsc_info->dsc_4hsmerge_alignment << 22;
> +		data |= BIT(16);
> +	}
> +
> +	DPU_REG_WRITE(hw, DSC_CFG + idx, data);
> +
> +//	DPU_REG_WRITE(hw, DSC_DATA_IN_SWAP + idx, 0x14e5);

Is this necessary or not? If not, please drop it.

> +}
> +
> +static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
> +		struct drm_dsc_config *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	struct msm_display_dsc_info *dsc_info;
> +	u32 idx, off;
> +	int i, j = 0;
> +	struct drm_dsc_rc_range_parameters *rc;
> +	u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	dsc_info = to_msm_dsc_info(dsc);
> +
> +	rc = dsc->rc_range_params;
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> +		data |= dsc->rc_buf_thresh[i] << (8*j);
> +		j++;
> +		if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
> +			DPU_REG_WRITE(hw, DSC_RC_BUF_THRESH_0 + idx + off,
> +					data);
> +			off += 4;
> +			j = 0;
> +			data = 0;
> +		}
> +	}
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		min_qp |= (rc[i].range_min_qp & 0x1f) << 5*j;
> +		max_qp |= (rc[i].range_max_qp & 0x1f) << 5*j;
> +		bpg_off |= (rc[i].range_bpg_offset & 0x3f) << 6*j;
> +		j++;
> +		if (j == 5) {
> +			DPU_REG_WRITE(hw, DSC_RC_MIN_QP_0 + idx + off,
> +					min_qp);
> +			DPU_REG_WRITE(hw, DSC_RC_MAX_QP_0 + idx + off,
> +					max_qp);
> +			DPU_REG_WRITE(hw,
> +					DSC_RC_RANGE_BPG_OFFSETS_0 + idx + off,
> +					bpg_off);
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
> +	int idx;
> +	int mux_cfg = 0xF; /* Disabled */
> +
> +	if (!hw_dsc)
> +		return;
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +	if (enable)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DPU_REG_WRITE(hw, DSC_CTL + idx, mux_cfg);
> +}
> +
> +void dpu_dsc_1_2_setup_ops(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
> +	ops->dsc_config = dpu_hw_dsc_config_1_2;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
> +	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
> +}

-- 
With best wishes
Dmitry

