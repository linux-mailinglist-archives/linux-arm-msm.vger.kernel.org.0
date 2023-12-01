Return-Path: <linux-arm-msm+bounces-2936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978E80127D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 19:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F93D2814DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 18:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1F44F1E5;
	Fri,  1 Dec 2023 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PufYrtDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7FA10D;
	Fri,  1 Dec 2023 10:19:18 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1Bx5NC030847;
	Fri, 1 Dec 2023 18:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mc2V1YfEh3jnPXjQqhsXUs8wKgzOL+Hei8oywWvK9Vk=;
 b=PufYrtDvNh5mzk/EuZVAxv4FiQ1bH6tjvLErQ9546h10aV9SyqanE8Mvil44snZih59g
 QL5jW/4JmXGmRYXx5rq/ZoxF7cqNikXomqMwoH/rW9vyIniD7z/Ez4LgHXmD0Bg5UE+X
 BKJIA/ss+hwuyUDv9oBFp1rhDXY/0UuKNDr3VpofiOuZzzXWVev2qysASLfMEZaO4/r3
 kUqNEDuiNogVn7jaAtbCohPdjmzwbd/hlMMwtFu5bA1TZ+3orYZHMOIDUuGjYR1CvHVC
 Bbn9BqZUgp3curiNwpT1U6m0ClWf98k57GnF7Pc0BPoCDlWHELw77hikfhc4/bpI2bmq +g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uprhdvdw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 18:19:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1IJ9gH002635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 18:19:09 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 10:19:08 -0800
Message-ID: <b0396be7-24ab-1596-4c14-f33ce0ba1a20@quicinc.com>
Date: Fri, 1 Dec 2023 10:19:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/16] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM
 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-7-quic_abhinavk@quicinc.com>
 <CAA8EJpowk1veNE1z_gwzkF2o9whz7XjCViTaXKR36nu9Gkc+OQ@mail.gmail.com>
 <98d13044-06d2-7752-b08c-e2c322534025@quicinc.com>
 <CAA8EJponr1khFMivD_RuK_V6sO9+OPz+LaaBMM4yc6iBNaK62w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJponr1khFMivD_RuK_V6sO9+OPz+LaaBMM4yc6iBNaK62w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jS6cMFsVKD0PlEjVmTZ6P1eXYo-7i50L
X-Proofpoint-GUID: jS6cMFsVKD0PlEjVmTZ6P1eXYo-7i50L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_16,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010120



On 11/30/2023 11:05 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 8/30/2023 5:00 PM, Dmitry Baryshkov wrote:
>>> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> CDM block comes with its own set of registers and operations
>>>> which can be done. In-line with other hardware sub-blocks, this
>>>> change adds the dpu_hw_cdm abstraction for the CDM block.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/Makefile                |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 272 ++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 135 ++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
>>>>    4 files changed, 409 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>>> index 8d02d8c33069..2010cb1ca995 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -63,6 +63,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>>           disp/dpu1/dpu_encoder_phys_wb.o \
>>>>           disp/dpu1/dpu_formats.o \
>>>>           disp/dpu1/dpu_hw_catalog.o \
>>>> +       disp/dpu1/dpu_hw_cdm.o \
>>>>           disp/dpu1/dpu_hw_ctl.o \
>>>>           disp/dpu1/dpu_hw_dsc.o \
>>>>           disp/dpu1/dpu_hw_dsc_1_2.o \
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>>>> new file mode 100644
>>>> index 000000000000..a2f7ee8f54e4
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>>>> @@ -0,0 +1,272 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include "dpu_hw_mdss.h"
>>>> +#include "dpu_hw_util.h"
>>>> +#include "dpu_hw_catalog.h"
>>>> +#include "dpu_hw_cdm.h"
>>>> +#include "dpu_kms.h"
>>>> +
>>>> +#define CDM_CSC_10_OPMODE                  0x000
>>>> +#define CDM_CSC_10_BASE                    0x004
>>>> +
>>>> +#define CDM_CDWN2_OP_MODE                  0x100
>>>> +#define CDM_CDWN2_CLAMP_OUT                0x104
>>>> +#define CDM_CDWN2_PARAMS_3D_0              0x108
>>>> +#define CDM_CDWN2_PARAMS_3D_1              0x10C
>>>> +#define CDM_CDWN2_COEFF_COSITE_H_0         0x110
>>>> +#define CDM_CDWN2_COEFF_COSITE_H_1         0x114
>>>> +#define CDM_CDWN2_COEFF_COSITE_H_2         0x118
>>>> +#define CDM_CDWN2_COEFF_OFFSITE_H_0        0x11C
>>>> +#define CDM_CDWN2_COEFF_OFFSITE_H_1        0x120
>>>> +#define CDM_CDWN2_COEFF_OFFSITE_H_2        0x124
>>>> +#define CDM_CDWN2_COEFF_COSITE_V           0x128
>>>> +#define CDM_CDWN2_COEFF_OFFSITE_V          0x12C
>>>> +#define CDM_CDWN2_OUT_SIZE                 0x130
>>>> +
>>>> +#define CDM_HDMI_PACK_OP_MODE              0x200
>>>> +#define CDM_CSC_10_MATRIX_COEFF_0          0x004
>>>> +
>>>> +#define CDM_MUX                            0x224
>>>> +
>>>> +/**
>>>> + * Horizontal coefficients for cosite chroma downscale
>>>> + * s13 representation of coefficients
>>>> + */
>>>> +static u32 cosite_h_coeff[] = {0x00000016, 0x000001cc, 0x0100009e};
>>>> +
>>>> +/**
>>>> + * Horizontal coefficients for offsite chroma downscale
>>>> + */
>>>> +static u32 offsite_h_coeff[] = {0x000b0005, 0x01db01eb, 0x00e40046};
>>>> +
>>>> +/**
>>>> + * Vertical coefficients for cosite chroma downscale
>>>> + */
>>>> +static u32 cosite_v_coeff[] = {0x00080004};
>>>> +/**
>>>> + * Vertical coefficients for offsite chroma downscale
>>>> + */
>>>> +static u32 offsite_v_coeff[] = {0x00060002};
>>>> +
>>>> +static int dpu_hw_cdm_setup_csc_10bit(struct dpu_hw_cdm *ctx, struct dpu_csc_cfg *data)
>>>> +{
>>>> +       dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, data, true);
>>>
>>> Where was this defined?
>>>
>>
>> Its in this file itself
>>
>> +#define CDM_CSC_10_MATRIX_COEFF_0          0x004
>>
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cfg)
>>>> +{
>>>> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>>> +       u32 opmode = 0;
>>>> +       u32 out_size = 0;
>>>> +
>>>> +       if (cfg->output_bit_depth == CDM_CDWN_OUTPUT_10BIT)
>>>> +               opmode &= ~BIT(7);
>>>> +       else
>>>> +               opmode |= BIT(7);
>>>> +
>>>> +       /* ENABLE DWNS_H bit */
>>>> +       opmode |= BIT(1);
>>>> +
>>>> +       switch (cfg->h_cdwn_type) {
>>>> +       case CDM_CDWN_DISABLE:
>>>> +               /* CLEAR METHOD_H field */
>>>> +               opmode &= ~(0x18);
>>>> +               /* CLEAR DWNS_H bit */
>>>> +               opmode &= ~BIT(1);
>>>> +               break;
>>>> +       case CDM_CDWN_PIXEL_DROP:
>>>> +               /* Clear METHOD_H field (pixel drop is 0) */
>>>> +               opmode &= ~(0x18);
>>>> +               break;
>>>> +       case CDM_CDWN_AVG:
>>>> +               /* Clear METHOD_H field (Average is 0x1) */
>>>> +               opmode &= ~(0x18);
>>>> +               opmode |= (0x1 << 0x3);
>>>> +               break;
>>>> +       case CDM_CDWN_COSITE:
>>>> +               /* Clear METHOD_H field (Average is 0x2) */
>>>> +               opmode &= ~(0x18);
>>>> +               opmode |= (0x2 << 0x3);
>>>> +               /* Co-site horizontal coefficients */
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_0,
>>>> +                               cosite_h_coeff[0]);
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_1,
>>>> +                               cosite_h_coeff[1]);
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_2,
>>>> +                               cosite_h_coeff[2]);
>>>> +               break;
>>>> +       case CDM_CDWN_OFFSITE:
>>>> +               /* Clear METHOD_H field (Average is 0x3) */
>>>> +               opmode &= ~(0x18);
>>>> +               opmode |= (0x3 << 0x3);
>>>> +
>>>> +               /* Off-site horizontal coefficients */
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_0,
>>>> +                               offsite_h_coeff[0]);
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_1,
>>>> +                               offsite_h_coeff[1]);
>>>> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_2,
>>>> +                               offsite_h_coeff[2]);
>>>> +               break;
>>>> +       default:
>>>> +               pr_err("%s invalid horz down sampling type\n", __func__);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       /* ENABLE DWNS_V bit */
>>>> +       opmode |= BIT(2);
>>>> +
>>>> +       switch (cfg->v_cdwn_type) {
>>>> +       case CDM_CDWN_DISABLE:
>>>> +               /* CLEAR METHOD_V field */
>>>> +               opmode &= ~(0x60);
>>>
>>> #define, GENMASK
>>>
>>>> +               /* CLEAR DWNS_V bit */
>>>> +               opmode &= ~BIT(2);
>>>> +               break;
>>>> +       case CDM_CDWN_PIXEL_DROP:
>>>> +               /* Clear METHOD_V field (pixel drop is 0) */
>>>> +               opmode &= ~(0x60);
>>>> +               break;
>>>> +       case CDM_CDWN_AVG:
>>>> +               /* Clear METHOD_V field (Average is 0x1) */
>>>> +               opmode &= ~(0x60);
>>>> +               opmode |= (0x1 << 0x5);
>>>
>>> #define
>>>
>>>> +               break;
>>>> +       case CDM_CDWN_COSITE:
>>>> +               /* Clear METHOD_V field (Average is 0x2) */
>>>> +               opmode &= ~(0x60);
>>>> +               opmode |= (0x2 << 0x5);
>>>> +               /* Co-site vertical coefficients */
>>>> +               DPU_REG_WRITE(c,
>>>> +                               CDM_CDWN2_COEFF_COSITE_V,
>>>> +                               cosite_v_coeff[0]);
>>>
>>> align to opening bracket
>>>
>>>> +               break;
>>>> +       case CDM_CDWN_OFFSITE:
>>>> +               /* Clear METHOD_V field (Average is 0x3) */
>>>> +               opmode &= ~(0x60);
>>>> +               opmode |= (0x3 << 0x5);
>>>> +
>>>> +               /* Off-site vertical coefficients */
>>>> +               DPU_REG_WRITE(c,
>>>> +                               CDM_CDWN2_COEFF_OFFSITE_V,
>>>> +                               offsite_v_coeff[0]);
>>>
>>> align to opening bracket
>>>
>>>> +               break;
>>>> +       default:
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       if (cfg->v_cdwn_type || cfg->h_cdwn_type)
>>>> +               opmode |= BIT(0); /* EN CDWN module */
>>>
>>> #define
>>>
>>
>> Ack to all comments about GENMASK and #define
>>
>>>> +       else
>>>> +               opmode &= ~BIT(0);
>>>> +
>>>> +       out_size = (cfg->output_width & 0xFFFF) |
>>>> +               ((cfg->output_height & 0xFFFF) << 16);
>>>> +       DPU_REG_WRITE(c, CDM_CDWN2_OUT_SIZE, out_size);
>>>> +       DPU_REG_WRITE(c, CDM_CDWN2_OP_MODE, opmode);
>>>> +       DPU_REG_WRITE(c, CDM_CDWN2_CLAMP_OUT,
>>>> +                       ((0x3FF << 16) | 0x0));
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
>>>> +{
>>>> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>>> +       const struct dpu_format *fmt;
>>>> +       u32 opmode = 0;
>>>> +       u32 csc = 0;
>>>> +
>>>> +       if (!ctx || !cdm)
>>>> +               return -EINVAL;
>>>> +
>>>> +       fmt = cdm->output_fmt;
>>>> +
>>>> +       if (!DPU_FORMAT_IS_YUV(fmt))
>>>> +               return -EINVAL;
>>>> +
>>>> +       if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
>>>> +               if (fmt->chroma_sample != DPU_CHROMA_H1V2)
>>>> +                       return -EINVAL; /*unsupported format */
>>>> +               opmode = BIT(0);
>>>> +               opmode |= (fmt->chroma_sample << 1);
>>>> +       }
>>>> +
>>>> +       csc |= BIT(2);
>>>> +       csc &= ~BIT(1);
>>>> +       csc |= BIT(0);
>>>
>>> Can we get some sensible #defines for all this magic, please?
>>>
>>
>> Ack, will do.
>>
>>>> +
>>>> +       if (ctx && ctx->ops.bind_pingpong_blk)
>>>> +               ctx->ops.bind_pingpong_blk(ctx, true,
>>>> +                               cdm->pp_id);
>>>> +
>>>> +       DPU_REG_WRITE(c, CDM_CSC_10_OPMODE, csc);
>>>> +       DPU_REG_WRITE(c, CDM_HDMI_PACK_OP_MODE, opmode);
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
>>>> +{
>>>> +       if (!ctx)
>>>> +               return;
>>>> +
>>>> +       if (ctx && ctx->ops.bind_pingpong_blk)
>>>> +               ctx->ops.bind_pingpong_blk(ctx, false, 0);
>>>
>>> PINGPONG_NONE.
>>>
>>>> +}
>>>> +
>>>> +static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, bool enable,
>>>> +                                        const enum dpu_pingpong pp)
>>>> +{
>>>> +       struct dpu_hw_blk_reg_map *c;
>>>> +       int mux_cfg = 0xF;
>>>> +
>>>> +       if (!ctx || (enable && (pp < PINGPONG_0 || pp >= PINGPONG_MAX)))
>>>> +               return;
>>>
>>> I'd say, this is useless. We don't have such checks in other
>>> bind_pingpong_blk() callbacks.
>>>
>>> Also there should be a guarding check for DPU >= 5.0 either here or at
>>> the ops init.
>>>
>>
>> Will add it at ops init
>>
>>>> +
>>>> +       c = &ctx->hw;
>>>> +
>>>> +       if (enable)
>>>> +               mux_cfg = (pp - PINGPONG_0) & 0x7;
>>>> +
>>>> +       DPU_REG_WRITE(c, CDM_MUX, mux_cfg);
>>>> +}
>>>> +
>>>> +static void _setup_cdm_ops(struct dpu_hw_cdm_ops *ops, unsigned long features)
>>>
>>> Please inline
>>>
>>
>> OK
>>
>>>> +{
>>>> +       ops->setup_csc_data = dpu_hw_cdm_setup_csc_10bit;
>>>> +       ops->setup_cdwn = dpu_hw_cdm_setup_cdwn;
>>>> +       ops->enable = dpu_hw_cdm_enable;
>>>> +       ops->disable = dpu_hw_cdm_disable;
>>>> +       ops->bind_pingpong_blk = dpu_hw_cdm_bind_pingpong_blk;
>>>
>>> As you seem to call this function directly, we might as well drop the
>>> callback from the ops.
>>>
>>
>> There are two paths for the bind_pingpong_blk(). One is absorbed within
>> cdm_enable and cdm_disable calls to bind and unbind the pingpong resp.
>> And yes, for that we dont need a separate ops as its within the same file.
>>
>> This will handle cases where we transition from YUV to non-YUV cases and
>> vice-versa without an encoder disable in between which I believe happens
>> in the IGT cases.
>>
>> But the dpu_encoder_helper_phys_cleanup() path is only in the encoder
>> disable() path without a non-YUV frame in the middle so lets say we were
>> in YUV mode but then just disabled the encoder we do need the cleanup
>> there and since thats outside of the dpu_hw_cdm, we do need this op.
>>
>> I agree we need to protect this with the DPU revision check.
>>
>>>> +}
>>>> +
>>>> +struct dpu_hw_cdm *dpu_hw_cdm_init(const struct dpu_cdm_cfg *cfg, void __iomem *addr)
>>>> +{
>>>> +       struct dpu_hw_cdm *c;
>>>> +
>>>> +       c = kzalloc(sizeof(*c), GFP_KERNEL);
>>>> +       if (!c)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       c->hw.blk_addr = addr + cfg->base;
>>>> +       c->hw.log_mask = DPU_DBG_MASK_CDM;
>>>> +
>>>> +       /* Assign ops */
>>>> +       c->idx = cfg->id;
>>>> +       c->caps = cfg;
>>>> +       _setup_cdm_ops(&c->ops, c->caps->features);
>>>> +
>>>> +       return c;
>>>> +}
>>>> +
>>>> +void dpu_hw_cdm_destroy(struct dpu_hw_cdm *cdm)
>>>> +{
>>>> +       kfree(cdm);
>>>
>>> I'd prefer not to introduce another manual kzalloc/kfree pair, see
>>> https://patchwork.freedesktop.org/series/120366/
>>>
>>
>> I recall I did not want to have a manual kzalloc/kfree pair. But the
>> issue was I think this series was not merged that time (and is isnt
>> merged now either)
> 
> No response, no reviews since 15th August. Today is the 1st of December.
> 
> I'm close to deciding that unreviewed series have no issues and start
> showing them to -next after a grace period of 1 month.
> 
>> and this is the one which passes drm_dev to
>> dpu_rm_init. I thought maybe it was easier for you to absorb this change
>> into that series instead of me pulling that whole series to make this
>> one compile as we will not be adding new HW blocks after this for the
>> next 2 cycles. It will only be using existing ones.
>>
>> If its too much trouble for you, I will rebase on top of that series but
>> I am pretty sure you will have to rebase and post that again anyway on
>> top of the current msm-next.
>>
>> I am also going to do the same thing now with this series.
>>

There were 4 patches in that series which didnt get a R-b. Perhaps 
jessica can finish the reviews which she started on that one.

Leaving her a note on IRC would not have hurt like its a common practice 
sometimes with other reviewers.

Now, do you want to rebase this on msm-next and re-send so that I can 
rebase on top of yours?

>> So we can just decide that in whose rebase we will handle it.
>>
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>>>> new file mode 100644
>>>> index 000000000000..da60893a5c02
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
>>>> @@ -0,0 +1,135 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef _DPU_HW_CDM_H
>>>> +#define _DPU_HW_CDM_H
>>>> +
>>>> +#include "dpu_hw_mdss.h"
>>>> +#include "dpu_hw_top.h"
>>>> +
>>>> +struct dpu_hw_cdm;
>>>> +
>>>> +struct dpu_hw_cdm_cfg {
>>>> +       u32 output_width;
>>>> +       u32 output_height;
>>>> +       u32 output_bit_depth;
>>>> +       u32 h_cdwn_type;
>>>> +       u32 v_cdwn_type;
>>>> +       const struct dpu_format *output_fmt;
>>>> +       u32 output_type;
>>>> +       int pp_id;
>>>> +};
>>>> +
>>>> +enum dpu_hw_cdwn_type {
>>>> +       CDM_CDWN_DISABLE,
>>>> +       CDM_CDWN_PIXEL_DROP,
>>>> +       CDM_CDWN_AVG,
>>>> +       CDM_CDWN_COSITE,
>>>> +       CDM_CDWN_OFFSITE,
>>>> +};
>>>> +
>>>> +enum dpu_hw_cdwn_output_type {
>>>> +       CDM_CDWN_OUTPUT_HDMI,
>>>> +       CDM_CDWN_OUTPUT_WB,
>>>> +};
>>>> +
>>>> +enum dpu_hw_cdwn_output_bit_depth {
>>>> +       CDM_CDWN_OUTPUT_8BIT,
>>>> +       CDM_CDWN_OUTPUT_10BIT,
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct dpu_hw_cdm_ops : Interface to the chroma down Hw driver functions
>>>> + *                         Assumption is these functions will be called after
>>>> + *                         clocks are enabled
>>>> + *  @setup_csc:            Programs the csc matrix
>>>> + *  @setup_cdwn:           Sets up the chroma down sub module
>>>> + *  @enable:               Enables the output to interface and programs the
>>>> + *                         output packer
>>>> + *  @disable:              Puts the cdm in bypass mode
>>>> + *  @bind_pingpong_blk:    enable/disable the connection with pingpong which
>>>> + *                         will feed pixels to this cdm
>>>> + */
>>>> +struct dpu_hw_cdm_ops {
>>>> +       /**
>>>> +        * Programs the CSC matrix for conversion from RGB space to YUV space,
>>>> +        * it is optional to call this function as this matrix is automatically
>>>> +        * set during initialization, user should call this if it wants
>>>> +        * to program a different matrix than default matrix.
>>>> +        * @cdm:          Pointer to the chroma down context structure
>>>> +        * @data          Pointer to CSC configuration data
>>>> +        * return:        0 if success; error code otherwise
>>>> +        */
>>>> +       int (*setup_csc_data)(struct dpu_hw_cdm *cdm, struct dpu_csc_cfg *data);
>>>> +
>>>> +       /**
>>>> +        * Programs the Chroma downsample part.
>>>> +        * @cdm         Pointer to chroma down context
>>>> +        * @cfg         Pointer to the cdm configuration data
>>>> +        */
>>>> +       int (*setup_cdwn)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
>>>> +
>>>> +       /**
>>>> +        * Enable the CDM module
>>>> +        * @cdm         Pointer to chroma down context
>>>> +        */
>>>> +       int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
>>>> +
>>>> +       /**
>>>> +        * Disable the CDM module
>>>> +        * @cdm         Pointer to chroma down context
>>>> +        */
>>>> +       void (*disable)(struct dpu_hw_cdm *cdm);
>>>> +
>>>> +       /**
>>>> +        * Enable/disable the connection with pingpong
>>>> +        * @cdm         Pointer to chroma down context
>>>> +        * @enable      Enable/disable control
>>>> +        * @pp          pingpong block id.
>>>> +        */
>>>> +       void (*bind_pingpong_blk)(struct dpu_hw_cdm *cdm, bool enable,
>>>> +                                 const enum dpu_pingpong pp);
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct dpu_hw_cdm - cdm description
>>>> + * @base: Hardware block base structure
>>>> + * @hw: Block hardware details
>>>> + * @idx: CDM index
>>>> + * @caps: Pointer to cdm_cfg
>>>> + * @ops: handle to operations possible for this CDM
>>>> + */
>>>> +struct dpu_hw_cdm {
>>>> +       struct dpu_hw_blk base;
>>>> +       struct dpu_hw_blk_reg_map hw;
>>>> +
>>>> +       /* chroma down */
>>>> +       const struct dpu_cdm_cfg *caps;
>>>> +       enum  dpu_cdm  idx;
>>>> +
>>>> +       /* ops */
>>>> +       struct dpu_hw_cdm_ops ops;
>>>> +};
>>>> +
>>>> +/**
>>>> + * dpu_hw_cdm_init - initializes the cdm hw driver object.
>>>> + * should be called once before accessing every cdm.
>>>> + * @cdm: CDM catalog entry for which driver object is required
>>>> + * @addr :   mapped register io address of MDSS
>>>> + */
>>>> +struct dpu_hw_cdm *dpu_hw_cdm_init(const struct dpu_cdm_cfg *cdm, void __iomem *addr);
>>>> +
>>>> +/**
>>>> + * dpu_hw_cdm_destroy - destroys cdm driver context
>>>> + * @cdm:   Pointer to cdm driver context returned by dpu_hw_cdm_init
>>>> + */
>>>> +void dpu_hw_cdm_destroy(struct dpu_hw_cdm *cdm);
>>>> +
>>>> +static inline struct dpu_hw_cdm *to_dpu_hw_cdm(struct dpu_hw_blk *hw)
>>>> +{
>>>> +       return container_of(hw, struct dpu_hw_cdm, base);
>>>> +}
>>>> +
>>>> +#endif /*_DPU_HW_CDM_H */
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> index 4d6dba18caf0..34f943102499 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> @@ -463,6 +463,7 @@ struct dpu_mdss_color {
>>>>    #define DPU_DBG_MASK_ROT      (1 << 9)
>>>>    #define DPU_DBG_MASK_DSPP     (1 << 10)
>>>>    #define DPU_DBG_MASK_DSC      (1 << 11)
>>>> +#define DPU_DBG_MASK_CDM      (1 << 12)
>>>>
>>>>    /**
>>>>     * struct dpu_hw_tear_check - Struct contains parameters to configure
>>>> --
>>>> 2.40.1
>>>>
>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 

