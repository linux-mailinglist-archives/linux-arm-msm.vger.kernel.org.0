Return-Path: <linux-arm-msm+bounces-2780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546E7FFFCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 00:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1238B20BA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 23:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B008E5954C;
	Thu, 30 Nov 2023 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ax6goS4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F16133;
	Thu, 30 Nov 2023 15:58:35 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUNPUni017996;
	Thu, 30 Nov 2023 23:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yguVhYhaPgaT56vaA4oIRBB9Et0MyAZJozsteXHD2Tg=;
 b=Ax6goS4mIlbn31BCIec2U0RmoMNh9mH/QKGWa1hnT/Qbf+gnVqKijITsItiSUdqniFws
 /ExBT2lHyfHs/uNoIBE8IgPKjIXoNQRB4xFaFE0WlKmRiY11p1uC1KZhyH2wVoQc3s5a
 UOZBbgrA10fuOZR4XnK3FeuPZsGz0Y4Ufz9uYD8AScA8k1xr/dG4ARj+j89nlcjIRhxQ
 BIw2rQJMIMHcLlj5GXnbyNf8TqYYoIvqSDMhfTdo7q3KcOXk5NM1sFzSK9PGZN26b6kV
 CHEPjeEl2rlR4rzWFiFyUM28jr/UYP9kvminQJL2YFMwzWQWyBeHuTxw7qCW3OVGgtmz zQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upvm1saq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:58:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUNwPgD027040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:58:25 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 15:58:24 -0800
Message-ID: <5c16e398-4010-718b-d91d-5fc3781b9c0a@quicinc.com>
Date: Thu, 30 Nov 2023 15:58:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-11-quic_abhinavk@quicinc.com>
 <CAA8EJpoUDjTEytGnx0NUKD_grY=azoXgm_sqwNBJVTD7LwCe0g@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoUDjTEytGnx0NUKD_grY=azoXgm_sqwNBJVTD7LwCe0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XJaikXbEGvVeE-34BnxXxws-Mk3ba9PJ
X-Proofpoint-GUID: XJaikXbEGvVeE-34BnxXxws-Mk3ba9PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=826
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300177



On 8/30/2023 5:14 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> In preparation of setting up CDM block, add the logic to disable it
>> properly during encoder cleanup.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 8 ++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 2 ++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 582680804016..1b1e07292a9e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -26,6 +26,7 @@
>>   #include "dpu_hw_dspp.h"
>>   #include "dpu_hw_dsc.h"
>>   #include "dpu_hw_merge3d.h"
>> +#include "dpu_hw_cdm.h"
>>   #include "dpu_formats.h"
>>   #include "dpu_encoder_phys.h"
>>   #include "dpu_crtc.h"
>> @@ -2097,6 +2098,13 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>                                          phys_enc->hw_pp->merge_3d->idx);
>>          }
>>
>> +       if (phys_enc->hw_cdm && phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp) {
>> +               phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
>> +                                                       false, phys_enc->hw_pp->idx);
> 
> But it was already bound in the cdm->enable, wasn't it?
> 

This is disable. I think you missed the "false" parameter.

> Also the update_pending_flush_cdm should be called even for DPU < 5.0,
> where there should be no bind_pingpong_blk callback.
> 

Ack. This is a good catch!

>> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
>> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl);
>> +       }
>> +
>>          if (dpu_enc->dsc) {
>>                  dpu_encoder_unprep_dsc(dpu_enc);
>>                  dpu_enc->dsc = NULL;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 24dbc28be4f8..510c1c41ddbc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -150,6 +150,7 @@ enum dpu_intr_idx {
>>    * @hw_pp:             Hardware interface to the ping pong registers
>>    * @hw_intf:           Hardware interface to the intf registers
>>    * @hw_wb:             Hardware interface to the wb registers
>> + * @hw_cdm:            Hardware interface to the CDM registers
>>    * @dpu_kms:           Pointer to the dpu_kms top level
>>    * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
>>    * @enabled:           Whether the encoder has enabled and running a mode
>> @@ -178,6 +179,7 @@ struct dpu_encoder_phys {
>>          struct dpu_hw_pingpong *hw_pp;
>>          struct dpu_hw_intf *hw_intf;
>>          struct dpu_hw_wb *hw_wb;
>> +       struct dpu_hw_cdm *hw_cdm;
>>          struct dpu_kms *dpu_kms;
>>          struct drm_display_mode cached_mode;
>>          enum dpu_enc_split_role split_role;
>> --
>> 2.40.1
>>
> 
> 

