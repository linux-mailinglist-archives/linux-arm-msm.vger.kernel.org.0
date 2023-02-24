Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7626A2531
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Feb 2023 00:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBXXwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 18:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjBXXwF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 18:52:05 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC00C58B77;
        Fri, 24 Feb 2023 15:52:03 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OFjTmJ022181;
        Fri, 24 Feb 2023 23:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d42jxn4vwd+Zm9lEuRqTKzLpZzbCJs7/0GmtWqpiUhk=;
 b=gHdwXtBmtjFK//QkhGJxwTip4wk7YXQgrZeXjMo59ODgQlR2Y4HCgxlZ28mmTjVPuDFM
 Hd9ssPhyygFWrpZAMFlxDJ3LVc+jSGl/BUPp1ZikOyp3JWlvR7kQH0/wAUAN2dxS5kkz
 lTIlunmuucN+RGKczQaXhcaUyrV3/HJsveUZoEsQzkMNlm5E0jI13tCeRBFx2ROuhG8f
 9RuliaE713rTnOCXdMWSb/3EdOJ3yR7ZBcn4wwOPEWKuxbFns0x720gAIlmrQZ+uKH88
 fnRi/DbCqdWeMBSuM4Hejh8iz+LMVrnnyYR7oedl3ai/8SAJVLCK3pf4EqYOBrRNnEnM nQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny05ms7eq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 23:51:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31ONpoge031079
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 23:51:50 GMT
Received: from [10.110.47.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 15:51:48 -0800
Message-ID: <1b5afec9-454d-e1b9-0274-f0476edb4d21@quicinc.com>
Date:   Fri, 24 Feb 2023 15:51:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HCe9CtFqUbclEZRyBtgmERzKHazF3ckW
X-Proofpoint-ORIG-GUID: HCe9CtFqUbclEZRyBtgmERzKHazF3ckW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_17,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240193
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>> Add DSC helper functions based on DSC configuration profiles to produce
>> DSC related runtime parameters through both table look up and runtime
>> calculation to support DSC on DPU.
>>
>> There are 6 different DSC configuration profiles are supported 
>> currently.
>> DSC configuration profiles are differiented by 5 keys, DSC version 
>> (V1.1),
>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>
>> Only DSC version V1.1 added and V1.2 will be added later.
>
> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
> Also please check that they can be used for i915 or for amdgpu 
> (ideally for both of them).
>
> I didn't check the tables against the standard (or against the current 
> source code), will do that later.
>
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile                   |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 209 
>> +++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  34 ++++
>>   3 files changed, 244 insertions(+)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 7274c412..28cf52b 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>       disp/dpu1/dpu_hw_catalog.o \
>>       disp/dpu1/dpu_hw_ctl.o \
>>       disp/dpu1/dpu_hw_dsc.o \
>> +    disp/dpu1/dpu_dsc_helper.o \
>>       disp/dpu1/dpu_hw_interrupts.o \
>>       disp/dpu1/dpu_hw_intf.o \
>>       disp/dpu1/dpu_hw_lm.o \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>> new file mode 100644
>> index 00000000..88207e9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>> @@ -0,0 +1,209 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#include <drm/display/drm_dsc_helper.h>
>> +#include "msm_drv.h"
>> +#include "dpu_kms.h"
>> +#include "dpu_hw_dsc.h"
>> +#include "dpu_dsc_helper.h"
>> +
>> +
>
> Extra empty line
>
>> +#define DPU_DSC_PPS_SIZE       128
>> +
>> +enum dpu_dsc_ratio_type {
>> +    DSC_V11_8BPC_8BPP,
>> +    DSC_V11_10BPC_8BPP,
>> +    DSC_V11_10BPC_10BPP,
>> +    DSC_V11_SCR1_8BPC_8BPP,
>> +    DSC_V11_SCR1_10BPC_8BPP,
>> +    DSC_V11_SCR1_10BPC_10BPP,
>> +    DSC_RATIO_TYPE_MAX
>> +};
>> +
>> +
>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>> +        0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>> +        0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>
> Weird indentation
>
>> +};
>> +
>> +/*
>> + * Rate control - Min QP values for each ratio type in 
>> dpu_dsc_ratio_type
>> + */
>> +static char 
>> dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
>> +    /* DSC v1.1 */
>> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
>> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
>> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
>> +    /* DSC v1.1 SCR and DSC v1.2 RGB 444 */
>
> What is SCR? Is there any reason to use older min/max Qp params 
> instead of always using the ones from the VESA-DSC-1.1 standard?

Standards change request, some vendors may use scr to work with their panel.

These table value are provided by system team.

>
>> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
>> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
>> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
>> +};
>> +
>> +/*
>> + * Rate control - Max QP values for each ratio type in 
>> dpu_dsc_ratio_type
>> + */
>> +static char 
>> dpu_dsc_rc_range_max_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
>> +    /* DSC v1.1 */
>> +    {4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15},
>> +    {4, 8, 9, 10, 11, 11, 11, 12, 13, 14, 15, 16, 17, 17, 19},
>> +    {7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
>> +    /* DSC v1.1 SCR and DSC v1.2 RGB 444 */
>> +    {4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13},
>> +    {8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17},
>> +    {7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
>> +};
>> +
>> +/*
>> + * Rate control - bpg offset values for each ratio type in 
>> dpu_dsc_ratio_type
>> + */
>> +static char 
>> dpu_dsc_rc_range_bpg[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
>> +    /* DSC v1.1 */
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
>> +    /* DSC v1.1 SCR and DSC V1.2 RGB 444 */
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
>> +    {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
>> +};
>> +
>> +static struct dpu_dsc_rc_init_params_lut {
>> +    u32 rc_quant_incr_limit0;
>> +    u32 rc_quant_incr_limit1;
>> +    u32 initial_fullness_offset;
>> +    u32 initial_xmit_delay;
>> +    u32 second_line_bpg_offset;
>> +    u32 second_line_offset_adj;
>> +    u32 flatness_min_qp;
>> +    u32 flatness_max_qp;
>> +}  dpu_dsc_rc_init_param_lut[] = {
>> +    /* DSC v1.1 */
>> +    {11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V11_8BPC_8BPP */
>> +    {15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V11_10BPC_8BPP */
>> +    {15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V11_10BPC_10BPP */
>> +    /* DSC v1.1 SCR and DSC v1.2 RGB 444 */
>> +    {11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V12_444_8BPC_8BPP or 
>> DSC_V11_SCR1_8BPC_8BPP */
>> +    {15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_8BPP or 
>> DSC_V11_SCR1_10BPC_8BPP */
>> +    {15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_10BPP or 
>> DSC_V11_SCR1_10BPC_10BPP */
>> +};
>> +
>> +/**
>> + * Maps to lookup the dpu_dsc_ratio_type index used in rate control 
>> tables
>> + */
>> +static struct dpu_dsc_table_index_lut {
>> +    u32 fmt;
>> +    u32 scr_ver;
>> +    u32 minor_ver;
>> +    u32 bpc;
>> +    u32 bpp;
>> +    u32 type;
>> +} dpu_dsc_index_map[] = {
>> +    /* DSC 1.1 formats - scr version is considered */
>> +    {DPU_DSC_CHROMA_444, 0, 1, 8, 8, DSC_V11_8BPC_8BPP},
>> +    {DPU_DSC_CHROMA_444, 0, 1, 10, 8, DSC_V11_10BPC_8BPP},
>> +    {DPU_DSC_CHROMA_444, 0, 1, 10, 10, DSC_V11_10BPC_10BPP},
>> +    {DPU_DSC_CHROMA_444, 1, 1, 8, 8, DSC_V11_SCR1_8BPC_8BPP},
>> +    {DPU_DSC_CHROMA_444, 1, 1, 10, 8, DSC_V11_SCR1_10BPC_8BPP},
>> +    {DPU_DSC_CHROMA_444, 1, 1, 10, 10, DSC_V11_SCR1_10BPC_10BPP},
>> +};
>> +
>> +static int _get_rc_table_index(struct drm_dsc_config *dsc, int scr_ver)
>> +{
>> +    u32 bpp, bpc, i, fmt = DPU_DSC_CHROMA_444;
>> +
>> +    if (dsc->dsc_version_major != 0x1) {
>> +        DPU_ERROR("unsupported major version %d\n",
>> +                dsc->dsc_version_major);
>> +        return -EINVAL;
>> +    }
>> +
>> +    bpc = dsc->bits_per_component;
>> +    bpp = DSC_BPP(*dsc);
>
> Just inline the macro.
>
>> +
>> +    if (dsc->native_422)
>> +        fmt = DPU_DSC_CHROMA_422;
>> +    else if (dsc->native_420)
>> +        fmt = DPU_DSC_CHROMA_420;
>> +
>> +
>> +    for (i = 0; i < ARRAY_SIZE(dpu_dsc_index_map); i++) {
>> +        if (dsc->dsc_version_minor == dpu_dsc_index_map[i].minor_ver &&
>> +                fmt ==  dpu_dsc_index_map[i].fmt &&
>> +                bpc == dpu_dsc_index_map[i].bpc &&
>> +                bpp == dpu_dsc_index_map[i].bpp &&
>> +                (dsc->dsc_version_minor != 0x1 ||
>> +                    scr_ver == dpu_dsc_index_map[i].scr_ver))
>> +            return dpu_dsc_index_map[i].type;
>> +    }
>> +
>> +    DPU_ERROR("unsupported DSC v%d.%dr%d, bpc:%d, bpp:%d, fmt:0x%x\n",
>> +            dsc->dsc_version_major, dsc->dsc_version_minor,
>> +            scr_ver, bpc, bpp, fmt);
>> +    return -EINVAL;
>> +}
>> +
>> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int 
>> scr_ver)
>> +{
>> +    int bpp, bpc;
>> +    struct dpu_dsc_rc_init_params_lut *rc_param_lut;
>> +    int i, ratio_idx;
>> +
>> +    dsc->rc_model_size = 8192;
>> +
>> +    if ((dsc->dsc_version_major == 0x1) &&
>> +            (dsc->dsc_version_minor == 0x1)) {
>
> indent to the opening bracket please, so that '(dsc' on both lines 
> start on the same position.
>
>> +        if (scr_ver == 0x1)
>> +            dsc->first_line_bpg_offset = 15;
>> +        else
>> +            dsc->first_line_bpg_offset = 12;
>> +    }
>> +
>> +    dsc->rc_edge_factor = 6;
>> +    dsc->rc_tgt_offset_high = 3;
>> +    dsc->rc_tgt_offset_low = 3;
>> +    dsc->simple_422 = 0;
>> +    dsc->convert_rgb = !(dsc->native_422 | dsc->native_420);
>> +    dsc->vbr_enable = 0;
>> +
>> +    bpp = DSC_BPP(*dsc);
>
> inline the macro.
>
>> +    bpc = dsc->bits_per_component;
>> +
>> +    ratio_idx = _get_rc_table_index(dsc, scr_ver);
>> +    if ((ratio_idx < 0) || (ratio_idx >= DSC_RATIO_TYPE_MAX))
>> +        return -EINVAL;
>> +
>> +
>> +    for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++)
>> +        dsc->rc_buf_thresh[i] = dpu_dsc_rc_buf_thresh[i];
>
> Can we use memcpy?
>
>> +
>> +    for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>> +        dsc->rc_range_params[i].range_min_qp =
>> +            dpu_dsc_rc_range_min_qp[ratio_idx][i];
>> +        dsc->rc_range_params[i].range_max_qp =
>> +            dpu_dsc_rc_range_max_qp[ratio_idx][i];
>> +        dsc->rc_range_params[i].range_bpg_offset =
>> +            dpu_dsc_rc_range_bpg[ratio_idx][i];
>> +    }
>> +
>> +    rc_param_lut = &dpu_dsc_rc_init_param_lut[ratio_idx];
>> +    dsc->rc_quant_incr_limit0 = rc_param_lut->rc_quant_incr_limit0;
>> +    dsc->rc_quant_incr_limit1 = rc_param_lut->rc_quant_incr_limit1;
>> +    dsc->initial_offset = rc_param_lut->initial_fullness_offset;
>> +    dsc->initial_xmit_delay = rc_param_lut->initial_xmit_delay;
>> +    dsc->second_line_bpg_offset = rc_param_lut->second_line_bpg_offset;
>> +    dsc->second_line_offset_adj = rc_param_lut->second_line_offset_adj;
>> +    dsc->flatness_min_qp = rc_param_lut->flatness_min_qp;
>> +    dsc->flatness_max_qp = rc_param_lut->flatness_max_qp;
>> +
>> +
>> +    dsc->line_buf_depth = bpc + 1;
>> +    dsc->mux_word_size = bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC : 
>> DSC_MUX_WORD_SIZE_8_10_BPC;
>> +
>> +    dsc->initial_scale_value = 8 * dsc->rc_model_size /
>> +            (dsc->rc_model_size - dsc->initial_offset);
>> +
>> +        return drm_dsc_compute_rc_parameters(dsc);
>
> Indentation is wrong
>
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>> new file mode 100644
>> index 00000000..4a23e02
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#ifndef __DPU_DSC_HELPER_H__
>> +#define __DPU_DSC_HELPER_H__
>> +
>> +#include "msm_drv.h"
>> +
>> +#define DSC_1_1_PPS_PARAMETER_SET_ELEMENTS   88
>
> What is this? Does it need to be global?
>
>> +
>> +/**
>> + * Bits/pixel target >> 4  (removing the fractional bits)
>> + * returns the integer bpp value from the drm_dsc_config struct
>> + */
>> +#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
>> +
>> +enum dpu_dsc_chroma {
>> +    DPU_DSC_CHROMA_444,
>> +    DPU_DSC_CHROMA_422,
>> +    DPU_DSC_CHROMA_420,
>> +};
>
> I think this enum is also not used outside of your helpers.
>
>> +
>> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int 
>> scr_ver);
>> +
>> +bool dpu_dsc_ich_reset_override_needed(bool pu_en, struct 
>> drm_dsc_config *dsc);
>
> Unused
>
>> +
>> +int dpu_dsc_initial_line_calc( u32 num_active_ss_per_enc,
>> +                struct drm_dsc_config *dsc,
>> +                int enc_ip_width, int dsc_cmn_mode);
>
> Unused
>
>> +
>> +#endif /* __DPU_DSC_HELPER_H__ */
>> +
>
