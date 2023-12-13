Return-Path: <linux-arm-msm+bounces-4604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC69081206B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A337928284A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BE57F540;
	Wed, 13 Dec 2023 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pl8HpSRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA70AA7;
	Wed, 13 Dec 2023 13:08:09 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDKqJia025058;
	Wed, 13 Dec 2023 21:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=MWm7tzurxgeiJoaSE+I268+LOHO4skJBzQp0NjH29OU=; b=pl
	8HpSRrb1dsT3nemjvK4UWCmHvnPht4pC8ANPCHwoZOOgJcLDOjEECIM/jaNk7ICv
	ZPp1EjhfDVobvy19jHVTgeohQeoR98hdjYZNYalPr1tR9JgFn7hhqZTdMj3Ko/+w
	DaG6YFydiv+rxUoBI865WArKO1R74K/6n3XyikoaT/6NUUNsk8wUSjJ/XiMEN4bp
	uvO7qSuMwfGKff3IJh8R1cB6UTb3UJOP47SivHeBmJAc4xAsmHFR4prVfoYW9F/1
	F2Nd4vcLg/7u2Kzg2XUS/4dHL9Kwt+ppe92ynt8OoJ05IHsXtncVrDICT4DxV8Vi
	7b7yVerVtS7Up6YGREkw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tu28ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:08:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDL81Fo005785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:08:01 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:07:59 -0800
Message-ID: <0b5c9970-3690-4198-97c5-f78c04d7ea91@quicinc.com>
Date: Wed, 13 Dec 2023 13:07:58 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Drop enable and frame_count
 parameters from dpu_hw_setup_misr()
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
 <20231213-encoder-fixup-v2-2-b11a4ad35e5e@quicinc.com>
 <baa5a4b3-ec91-dbb7-5d03-ffb2098cbda4@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <baa5a4b3-ec91-dbb7-5d03-ffb2098cbda4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Tn-DDeqSZXEdt2bCmbrvlpSxZWl_7bbw
X-Proofpoint-GUID: Tn-DDeqSZXEdt2bCmbrvlpSxZWl_7bbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130149



On 12/13/2023 1:00 PM, Abhinav Kumar wrote:
> 
> 
> On 12/13/2023 12:51 PM, Jessica Zhang wrote:
>> Drop the enable and frame_count parameters from dpu_hw_setup_misr() as 
>> they
>> are always set to the same values.
>>
>> In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
>> frame_count is always set to the same value.
>>
>> Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 26 
>> ++++++++------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
>>   8 files changed, 25 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 8ebed048a193..555182201b8e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -114,7 +114,7 @@ static void dpu_crtc_setup_lm_misr(struct 
>> dpu_crtc_state *crtc_state)
>>               continue;
>>           /* Calculate MISR over 1 frame */
>> -        m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
>> +        m->hw_lm->ops.setup_misr(m->hw_lm);
>>       }
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index aa1a1646b322..1d8eb3b509b4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * Copyright (C) 2013 Red Hat
>>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All 
>> rights reserved.
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    *
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>> @@ -258,7 +258,7 @@ void dpu_encoder_setup_misr(const struct 
>> drm_encoder *drm_enc)
>>           if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>>               continue;
>> -        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf);
>>       }
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 226133af7840..6bba531d6dc4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>> @@ -320,9 +320,9 @@ static u32 dpu_hw_intf_get_line_count(struct 
>> dpu_hw_intf *intf)
>>       return DPU_REG_READ(c, INTF_LINE_COUNT);
>>   }
>> -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool 
>> enable, u32 frame_count)
>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>>   {
>> -    dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 
>> 0x1);
>> +    dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, 0x1);
>>   }
>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 
>> *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 215401bb042e..0bd57a32144a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>> @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
>>       void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>>               const enum dpu_pingpong pp);
>> -    void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 
>> frame_count);
>> +    void (*setup_misr)(struct dpu_hw_intf *intf);
>>       int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>>       // Tearcheck on INTF since DPU 5.0.0
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index bbc9756ecde9..1d3ccf3228c6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>>    */
>> @@ -83,9 +83,9 @@ static void dpu_hw_lm_setup_border_color(struct 
>> dpu_hw_mixer *ctx,
>>       }
>>   }
>> -static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool 
>> enable, u32 frame_count)
>> +static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>>   {
>> -    dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
>> +    dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
>>   }
>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 
>> *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
>> index 8835fd106413..0a3381755249 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>>    */
>> @@ -57,7 +58,7 @@ struct dpu_hw_lm_ops {
>>       /**
>>        * setup_misr: Enable/disable MISR
>>        */
>> -    void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 
>> frame_count);
>> +    void (*setup_misr)(struct dpu_hw_mixer *ctx);
>>       /**
>>        * collect_misr: Read MISR signature
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> index 87716a60332e..3b33a60c5c6b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -476,9 +476,7 @@ void _dpu_hw_setup_qos_lut(struct 
>> dpu_hw_blk_reg_map *c, u32 offset,
>>   }
>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>> -        u32 misr_ctrl_offset,
>> -        bool enable, u32 frame_count,
>> -        u32 input_sel)
>> +        u32 misr_ctrl_offset, u32 input_sel)
> 
> I thought input_sel is going to be u8 now?

Ah, thanks for catching this -- had it as u32 in an older version and 
forgot to change to u8. Will push a v3.

Thanks,

Jessica Zhang

> 
>>   {
>>       u32 config = 0;
>> @@ -487,20 +485,12 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map 
>> *c,
>>       /* Clear old MISR value (in case it's read before a new value is 
>> calculated)*/
>>       wmb();
>> -    if (enable) {
>> -        /*
>> -         * note: Aside from encoders, input_sel should be
>> -         * set to 0x0 by default
>> -         */
>> -        config = (frame_count & MISR_FRAME_COUNT_MASK) |
>> -            MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
>> -            ((input_sel & 0xF) << 24);
>> -
>> -        DPU_REG_WRITE(c, misr_ctrl_offset, config);
>> -    } else {
>> -        DPU_REG_WRITE(c, misr_ctrl_offset, 0);
>> -    }
>> -
>> +    /*
>> +     * note: Aside from encoders, input_sel should be set to 0x0 by 
>> default
>> +     */
>> +    config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | 
>> MISR_CTRL_FREE_RUN_MASK |
>> +        ((input_sel & 0xF) << 24);
>> +    DPU_REG_WRITE(c, misr_ctrl_offset, config);
>>   }
>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> index 761056be272b..a561720f827d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>>    */
>> @@ -13,7 +13,7 @@
>>   #include "dpu_hw_catalog.h"
>>   #define REG_MASK(n)                     ((BIT(n)) - 1)
>> -#define MISR_FRAME_COUNT_MASK           0xFF
>> +#define MISR_FRAME_COUNT                0x1
>>   #define MISR_CTRL_ENABLE                BIT(8)
>>   #define MISR_CTRL_STATUS                BIT(9)
>>   #define MISR_CTRL_STATUS_CLEAR          BIT(10)
>> @@ -355,10 +355,7 @@ void _dpu_hw_setup_qos_lut(struct 
>> dpu_hw_blk_reg_map *c, u32 offset,
>>                  const struct dpu_hw_qos_cfg *cfg);
>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>> -        u32 misr_ctrl_offset,
>> -        bool enable,
>> -        u32 frame_count,
>> -        u32 input_sel);
>> +        u32 misr_ctrl_offset, u32 input_sel);
>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>>           u32 misr_ctrl_offset,
>>

