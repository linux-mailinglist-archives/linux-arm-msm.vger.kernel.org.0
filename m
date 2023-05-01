Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9316F3ACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 01:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjEAXM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 19:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjEAXM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 19:12:57 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06C42D63;
        Mon,  1 May 2023 16:12:54 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 341Mqo9Q022066;
        Mon, 1 May 2023 23:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fzOMxhZClhwuOc1U1n70HlkYPu1h23rCNf2GSW7X1fA=;
 b=ZQlfD5OuhbHvs7nCa5bB/OhnfSo+0we+g9xEpYVVblqkG4XeI1JFxyKWl/gjxDqhS/EN
 V8C6V+bL5hDtBbSI8x08fCxScYLpHCW8H51QvNkK0Shdo8CPQLSV2N6pwtdEeVPaZZZR
 X7/2sYoAnwIv4ZPYwCzSnrEQTfAcp+UutmkVxXxUsRWt2RXqwwFToy8ZUkVdOlw+fUbu
 Y2hKjMgJWQXGMxfdvSDLZVhLvYRqiAYHIBCxXDCMuu7qFUDTNYuP/n/TnH863zyFx0ge
 O3GHdCN8PRNfzUt1bLto0T43S6BnYfAmaCz5axNA2Sh7tzifz0+OsXkHSzozXMlgkYB4 Tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qaj3wggpy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 May 2023 23:12:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 341NCfSr003000
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 1 May 2023 23:12:41 GMT
Received: from [10.134.70.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 16:12:40 -0700
Message-ID: <38d6de06-77c0-5c87-86fb-010954e06a63@quicinc.com>
Date:   Mon, 1 May 2023 16:12:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/7] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-2-git-send-email-quic_khsieh@quicinc.com>
 <e5d2bf3f-d578-2206-49a4-7105ca810f6c@linaro.org>
 <c28c9bca-ef9c-30ef-e3e2-2a2307b3d280@quicinc.com>
 <f183bed1-76d4-abb2-49d0-f40da65fcf75@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <f183bed1-76d4-abb2-49d0-f40da65fcf75@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eOAHsM5R2-r4fZB2PQGTdqw-3o3cp5PE
X-Proofpoint-ORIG-GUID: eOAHsM5R2-r4fZB2PQGTdqw-3o3cp5PE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_14,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010187
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/1/2023 1:50 PM, Dmitry Baryshkov wrote:
> On 01/05/2023 23:40, Kuogee Hsieh wrote:
>>
>> On 4/28/2023 5:30 PM, Dmitry Baryshkov wrote:
>>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>>> Add support for DSC 1.2 by providing the necessary hooks to program
>>>> the DPU DSC 1.2 encoder.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> What exactly was reported?
>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/Makefile                   |   1 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  34 ++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  14 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 335 
>>>> +++++++++++++++++++++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>>>>   5 files changed, 387 insertions(+), 4 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>> b/drivers/gpu/drm/msm/Makefile
>>>> index b814fc8..b9af5e4 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>>       disp/dpu1/dpu_hw_catalog.o \
>>>>       disp/dpu1/dpu_hw_ctl.o \
>>>>       disp/dpu1/dpu_hw_dsc.o \
>>>> +    disp/dpu1/dpu_hw_dsc_1_2.o \
>>>>       disp/dpu1/dpu_hw_interrupts.o \
>>>>       disp/dpu1/dpu_hw_intf.o \
>>>>       disp/dpu1/dpu_hw_lm.o \
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index 71584cd..fc87db1 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -1,6 +1,6 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>   /*
>>>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>>    * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights 
>>>> reserved.
>>>>    */
>>>>   @@ -241,12 +241,20 @@ enum {
>>>>   };
>>>>     /**
>>>> - * DSC features
>>>> + * DSC sub-blocks/features
>>>>    * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
>>>>    *                            the pixel output from this DSC.
>>>> + * @DPU_DSC_HW_REV_1_1        DSC block supports dsc 1.1 only
>>>> + * @DPU_DSC_HW_REV_1_2        DSC block supports dsc 1.1 and 1.2
>>>> + * @DPU_DSC_NATIVE_422_EN     Supports native422 and native420 
>>>> encoding
>>>> + * @DPU_DSC_MAX
>>>>    */
>>>>   enum {
>>>>       DPU_DSC_OUTPUT_CTRL = 0x1,
>>>> +    DPU_DSC_HW_REV_1_1,
>>>> +    DPU_DSC_HW_REV_1_2,
>>>> +    DPU_DSC_NATIVE_422_EN,
>>>> +    DPU_DSC_MAX
>>>>   };
>>>>     /**
>>>> @@ -311,6 +319,14 @@ struct dpu_pp_blk {
>>>>   };
>>>>     /**
>>>> + * struct dpu_dsc_blk - DSC Encoder sub-blk information
>>>> + * @info:   HW register and features supported by this sub-blk
>>>> + */
>>>> +struct dpu_dsc_blk {
>>>> +    DPU_HW_SUBBLK_INFO;
>>>> +};
>>>> +
>>>> +/**
>>>>    * enum dpu_qos_lut_usage - define QoS LUT use cases
>>>>    */
>>>>   enum dpu_qos_lut_usage {
>>>> @@ -459,6 +475,17 @@ struct dpu_pingpong_sub_blks {
>>>>   };
>>>>     /**
>>>> + * struct dpu_dsc_sub_blks - DSC sub-blks
>>>> + * @enc: DSC encoder sub block
>>>> + * @ctl: DSC controller sub block
>>>> + *
>>>> + */
>>>> +struct dpu_dsc_sub_blks {
>>>> +    struct dpu_dsc_blk enc;
>>>> +    struct dpu_dsc_blk ctl;
>>>> +};
>>>> +
>>>> +/**
>>>>    * dpu_clk_ctrl_type - Defines top level clock control signals
>>>>    */
>>>>   enum dpu_clk_ctrl_type {
>>>> @@ -612,10 +639,13 @@ struct dpu_merge_3d_cfg  {
>>>>    * struct dpu_dsc_cfg - information of DSC blocks
>>>>    * @id                 enum identifying this block
>>>>    * @base               register offset of this block
>>>> + * @len:               length of hardware block
>>>>    * @features           bit mask identifying sub-blocks/features
>>>> + * @sblk               sub-blocks information
>>>>    */
>>>>   struct dpu_dsc_cfg {
>>>>       DPU_HW_BLK_INFO;
>>>> +    const struct dpu_dsc_sub_blks *sblk;
>>>>   };
>>>>     /**
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>>> index 287ec5f..e11240a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>>> @@ -1,5 +1,8 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>> -/* Copyright (c) 2020-2022, Linaro Limited */
>>>> +/*
>>>> + * Copyright (c) 2020-2022, Linaro Limited
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>>     #ifndef _DPU_HW_DSC_H
>>>>   #define _DPU_HW_DSC_H
>>>> @@ -70,6 +73,15 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct 
>>>> dpu_dsc_cfg *cfg,
>>>>           void __iomem *addr);
>>>>     /**
>>>> + * dpu_hw_dsc_init_1_2 - initializes the v1.2 DSC hw driver block
>>>> + * @cfg:  DSC catalog entry for which driver object is required
>>>> + * @addr: Mapped register io address of MDP
>>>> + * Returns: Error code or allocated dpu_hw_dsc context
>>>> + */
>>>> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
>>>> +        void __iomem *addr);
>>>> +
>>>> +/**
>>>>    * dpu_hw_dsc_destroy - destroys dsc driver context
>>>>    * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>>>>    */
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>>> new file mode 100644
>>>> index 00000000..a777c7b
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>>> @@ -0,0 +1,335 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights 
>>>> reserved.
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>> +
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +
>>>> +#include "dpu_kms.h"
>>>> +#include "dpu_hw_catalog.h"
>>>> +#include "dpu_hwio.h"
>>>> +#include "dpu_hw_mdss.h"
>>>> +#include "dpu_hw_dsc.h"
>>>> +
>>>> +
>>>
>>> Unused empty line
>>>
>>>> +#define DSC_CMN_MAIN_CNF 0x00
>>>> +
>>>> +/* DPU_DSC_ENC register offsets */
>>>> +#define ENC_DF_CTRL                0x00
>>>> +#define ENC_GENERAL_STATUS         0x04
>>>> +#define ENC_HSLICE_STATUS          0x08
>>>> +#define ENC_OUT_STATUS             0x0C
>>>> +#define ENC_INT_STAT               0x10
>>>> +#define ENC_INT_CLR                0x14
>>>> +#define ENC_INT_MASK               0x18
>>>> +#define DSC_MAIN_CONF              0x30
>>>> +#define DSC_PICTURE_SIZE           0x34
>>>> +#define DSC_SLICE_SIZE             0x38
>>>> +#define DSC_MISC_SIZE              0x3C
>>>> +#define DSC_HRD_DELAYS             0x40
>>>> +#define DSC_RC_SCALE               0x44
>>>> +#define DSC_RC_SCALE_INC_DEC       0x48
>>>> +#define DSC_RC_OFFSETS_1           0x4C
>>>> +#define DSC_RC_OFFSETS_2           0x50
>>>> +#define DSC_RC_OFFSETS_3           0x54
>>>> +#define DSC_RC_OFFSETS_4           0x58
>>>> +#define DSC_FLATNESS_QP            0x5C
>>>> +#define DSC_RC_MODEL_SIZE          0x60
>>>> +#define DSC_RC_CONFIG              0x64
>>>> +#define DSC_RC_BUF_THRESH_0        0x68
>>>> +#define DSC_RC_MIN_QP_0            0x78
>>>> +#define DSC_RC_MAX_QP_0            0x84
>>>> +#define DSC_RC_RANGE_BPG_OFFSETS_0 0x90
>>>> +
>>>> +/* DPU_DSC_CTL register offsets */
>>>> +#define DSC_CTL                    0x00
>>>> +#define DSC_CFG                    0x04
>>>> +#define DSC_DATA_IN_SWAP           0x08
>>>> +#define DSC_CLK_CTRL               0x0C
>>>> +
>>>> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, 
>>>> int num_ss, bool native_422)
>>>> +{
>>>> +    int max_addr = 2400 / num_ss;
>>>> +
>>>> +    if ((hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN)) && 
>>>> native_422)
>>>> +        max_addr /= 2;
>>>> +
>>>> +    return max_addr - 1;
>>>> +};
>>>> +
>>>> +static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *hw;
>>>> +    u32 offset;
>>>> +
>>>> +    if (!hw_dsc)
>>>> +        return;
>>>> +
>>>> +    hw = &hw_dsc->hw;
>>>> +    offset = hw_dsc->caps->sblk->ctl.base;
>>>> +    DPU_REG_WRITE(hw, offset + DSC_CFG, 0);
>>>> +
>>>> +    offset = hw_dsc->caps->sblk->enc.base;
>>>> +    DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, 0);
>>>> +    DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, 0);
>>>> +}
>>>> +
>>>> +static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
>>>> +                  struct drm_dsc_config *dsc,
>>>> +                  u32 mode,
>>>> +                  u32 initial_lines)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *hw;
>>>> +    u32 offset;
>>>> +    u32 data = 0;
>>>> +    u32 det_thresh_flatness;
>>>> +    u32 num_active_ss_per_enc;
>>>> +    u32 bpp;
>>>> +
>>>> +    if (!hw_dsc || !dsc)
>>>> +        return;
>>>> +
>>>> +    hw = &hw_dsc->hw;
>>>> +
>>>> +    offset = hw_dsc->caps->sblk->enc.base;
>>>> +
>>>> +    if (mode & DSC_MODE_SPLIT_PANEL)
>>>> +        data |= BIT(0);
>>>> +
>>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>>> +        data |= BIT(1);
>>>> +
>>>> +    num_active_ss_per_enc = dsc->slice_count;
>>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>>> +        num_active_ss_per_enc = dsc->slice_count >> 1;
>>>> +
>>>> +    data |= (num_active_ss_per_enc & 0x3) << 7;
>>>> +
>>>> +    DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
>>>> +
>>>> +    data = (initial_lines & 0xff);
>>>> +
>>>> +    if (mode & DSC_MODE_VIDEO)
>>>> +        data |= BIT(9);
>>>> +
>>>> +    data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_ss_per_enc, 
>>>> dsc->native_422) << 18);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, data);
>>>> +
>>>> +    data = (dsc->dsc_version_minor & 0xf) << 28;
>>>> +    if (dsc->dsc_version_minor == 0x2) {
>>>> +        if (dsc->native_422)
>>>> +            data |= BIT(22);
>>>> +        if (dsc->native_420)
>>>> +            data |= BIT(21);
>>>> +    }
>>>> +
>>>> +    bpp = dsc->bits_per_pixel;
>>>> +    /* as per hw requirement bpp should be programmed
>>>> +     * twice the actual value in case of 420 or 422 encoding
>>>> +     */
>>>> +    if (dsc->native_422 || dsc->native_420)
>>>> +        bpp = 2 * bpp;
>>>> +    data |= (dsc->block_pred_enable ? 1 : 0) << 20;
>>>> +    data |= bpp << 10;
>>>> +    data |= (dsc->line_buf_depth & 0xf) << 6;
>>>> +    data |= dsc->convert_rgb << 4;
>>>> +    data |= dsc->bits_per_component & 0xf;
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, data);
>>>> +
>>>> +    data = (dsc->pic_width & 0xffff) |
>>>> +        ((dsc->pic_height & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_PICTURE_SIZE, data);
>>>> +
>>>> +    data = (dsc->slice_width & 0xffff) |
>>>> +        ((dsc->slice_height & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_SLICE_SIZE, data);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_MISC_SIZE,
>>>> +            (dsc->slice_chunk_size) & 0xffff);
>>>> +
>>>> +    data = (dsc->initial_xmit_delay & 0xffff) |
>>>> +        ((dsc->initial_dec_delay & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_HRD_DELAYS, data);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_SCALE,
>>>> +            dsc->initial_scale_value & 0x3f);
>>>> +
>>>> +    data = (dsc->scale_increment_interval & 0xffff) |
>>>> +        ((dsc->scale_decrement_interval & 0x7ff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_SCALE_INC_DEC, data);
>>>> +
>>>> +    data = (dsc->first_line_bpg_offset & 0x1f) |
>>>> +        ((dsc->second_line_bpg_offset & 0x1f) << 5);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_1, data);
>>>> +
>>>> +    data = (dsc->nfl_bpg_offset & 0xffff) |
>>>> +        ((dsc->slice_bpg_offset & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_2, data);
>>>> +
>>>> +    data = (dsc->initial_offset & 0xffff) |
>>>> +        ((dsc->final_offset & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_3, data);
>>>> +
>>>> +    data = (dsc->nsl_bpg_offset & 0xffff) |
>>>> +        ((dsc->second_line_offset_adj & 0xffff) << 16);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_4, data);
>>>> +
>>>> +    data = (dsc->flatness_min_qp & 0x1f);
>>>> +    data |= (dsc->flatness_max_qp & 0x1f) << 5;
>>>> +
>>>> +    det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
>>>> +    data |= (det_thresh_flatness & 0xff) << 10;
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_FLATNESS_QP, data);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_MODEL_SIZE,
>>>> +            (dsc->rc_model_size) & 0xffff);
>>>> +
>>>> +    data = dsc->rc_edge_factor & 0xf;
>>>> +    data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
>>>> +    data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
>>>> +    data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
>>>> +    data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_CONFIG, data);
>>>> +
>>>> +    /* program the dsc wrapper */
>>>> +    offset = hw_dsc->caps->sblk->ctl.base;
>>>> +
>>>> +    data = BIT(0); /* encoder enable */
>>>> +    if (dsc->native_422)
>>>> +        data |= BIT(8);
>>>> +    else if (dsc->native_420)
>>>> +        data |= BIT(9);
>>>> +    if (!dsc->convert_rgb)
>>>> +        data |= BIT(10);
>>>> +    if (dsc->bits_per_component == 8)
>>>> +        data |= BIT(11);
>>>> +    if (mode & DSC_MODE_SPLIT_PANEL)
>>>> +        data |= BIT(12);
>>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>>> +        data |= BIT(13);
>>>> +    if (!(mode & DSC_MODE_VIDEO))
>>>> +        data |= BIT(17);
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_CFG, data);
>>>> +}
>>>> +
>>>> +static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
>>>> +                    struct drm_dsc_config *dsc)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *hw;
>>>> +    u32 offset, off;
>>>> +    int i, j = 0;
>>>> +    struct drm_dsc_rc_range_parameters *rc;
>>>> +    u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
>>>> +
>>>> +    if (!hw_dsc || !dsc)
>>>> +        return;
>>>> +
>>>> +    offset = hw_dsc->caps->sblk->enc.base;
>>>> +
>>>> +    hw = &hw_dsc->hw;
>>>> +
>>>> +    rc = dsc->rc_range_params;
>>>> +
>>>> +    /*
>>>> +     * With BUF_THRESH -- 14 in total
>>>> +     * each register contains 4 thresh values with the last register
>>>> +     * containing only 2 thresh values
>>>> +     */
>>>> +    off = 0;
>>>> +    for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>>>> +        data |= dsc->rc_buf_thresh[i] << (8 * j);
>>>> +        j++;
>>>> +        if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
>>>> +            DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0 + off, 
>>>> data);
>>>> +            off += 4;
>>>> +            j = 0;
>>>> +            data = 0;
>>>> +        }
>>>> +    }
>>>
>>> This is barely understandable code. The following line is much better:
>>>
>>> DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0,
>>>     (dsc->rc_buf_thresh[0] << 0) |
>>>     (dsc->rc_buf_thresh[1] << 8) |
>>>     (dsc->rc_buf_thresh[2] << 16) |
>>>     (dsc->rc_buf_thresh[3] << 24));
>>>
>>> etc.
>>>
>>> Please unroll both loops.
>>>
>>>> +
>>>> +
>>>> +    /*
>>>> +     * with min/max_QP -- 5 bits each
>>>> +     * each register contains 5 min_qp or max_qp for total of 15
>>>> +     *
>>>> +     * With BPG_OFFSET -- 6 bits each
>>>> +     * each register contains 5 BPG_offset for total of 15
>>>> +     */
>>>> +    off = 0;
>>>> +    for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>>>> +        min_qp |= rc[i].range_min_qp << (5 * j);
>>>> +        max_qp |= rc[i].range_max_qp << (5 * j);
>>>> +        bpg_off |= rc[i].range_bpg_offset << (6 * j);
>>>> +        j++;
>>>> +        if (j == 5) {
>>>> +            DPU_REG_WRITE(hw, offset + DSC_RC_MIN_QP_0 + off, 
>>>> min_qp);
>>>> +            DPU_REG_WRITE(hw, offset + DSC_RC_MAX_QP_0 + off, 
>>>> max_qp);
>>>> +            DPU_REG_WRITE(hw, offset + DSC_RC_RANGE_BPG_OFFSETS_0 
>>>> + off, bpg_off);
>>>> +            off += 4;
>>>> +            j = 0;
>>>> +            min_qp = 0;
>>>> +            max_qp = 0;
>>>> +            bpg_off = 0;
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +static void dpu_hw_dsc_bind_pingpong_blk_1_2(
>>>> +        struct dpu_hw_dsc *hw_dsc,
>>>> +        bool enable,
>>>> +        const enum dpu_pingpong pp)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *hw;
>>>> +    int offset;
>>>> +    int mux_cfg = 0xf; /* Disabled */
>>>> +
>>>> +    offset = hw_dsc->caps->sblk->ctl.base;
>>>> +
>>>> +    hw = &hw_dsc->hw;
>>>> +    if (enable)
>>>> +        mux_cfg = (pp - PINGPONG_0) & 0x7;
>>>> +
>>>> +    DPU_REG_WRITE(hw, offset + DSC_CTL, mux_cfg);
>>>> +}
>>>
>>> Please refactor the existing bind_pingpong_blk() semantics to accept 
>>> either a valid PINGPONG_n, or PINGPONG_NONE to disable the binding.
>>
>> Could you please give me more details for this comment.
>>
>> both dsc_1_1 and dsc_1_2 are required to select and set mux bits of 
>> mux_cfg to binding dsc and  pingpong together.
>
> Yes. I was refererring to the function interface. You pass both `bool 
> enable` and PP index. The index doesn't make sense for 'disable' case. 
> So we can use a single argument of `enum dpu_pingpong` type. Pass 
> PINGPONG_n for binding it. Pass PINGPONG_NONE for removing the binding.
ok, i will add an patch for this since it will touch dpu_encoder.c and 
dpu_hw_dsc.c
>
>>
>
