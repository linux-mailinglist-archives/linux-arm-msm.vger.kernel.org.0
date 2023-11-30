Return-Path: <linux-arm-msm+bounces-2777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0B7FFFB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 00:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27BAA1C20A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 23:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBE35954F;
	Thu, 30 Nov 2023 23:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQ6SkW9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9BE129;
	Thu, 30 Nov 2023 15:47:18 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUNI8w0021764;
	Thu, 30 Nov 2023 23:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lxW79dI4+P97r0m0FHTUU4gvHh/DLugORShLU26ncss=;
 b=DQ6SkW9f1jkR/VoZXDdVBqkkaGsj48Y0x4jma1V/VKnoEvpnzSMgaDP7iKcDXA2Zz/1n
 AA7ByzrgNMo4Sv/dcgS9/RzFXszzaJoUNKvOGGHxRSGIN4HvllxtMDs26mKo/zB7EenP
 IAbaDAYpD6NCwqarwQazPV3q+l1A/UzHqWQbUl0lWUgI71LjG3dqeFOWqdLOMG1nBSCx
 bFLdgvAfp7/rSsO/ukJRyJ6fq1VrEopIzXeVlewEPYvEPBhE/DIu9O5Hj1O5uC0QHux6
 XqmwwT/LFUEO+JplEF91KHokHR4GTRwaTBAimCtQeDK4LlTE7j3hKRfZ+0EypdPJLwpw xA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjsqtu1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:47:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUNlAIJ011085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:47:10 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 15:47:09 -0800
Message-ID: <5bcbb092-1d29-f795-3be4-5ab1c708cba0@quicinc.com>
Date: Thu, 30 Nov 2023 15:47:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
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
 <20230830224910.8091-8-quic_abhinavk@quicinc.com>
 <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p3fqZW7eERaVsTSvkgJn4Bg0019wcEz_
X-Proofpoint-ORIG-GUID: p3fqZW7eERaVsTSvkgJn4Bg0019wcEz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=891 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300176



On 8/30/2023 4:48 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Add the RM APIs necessary to initialize and allocate CDM
>> blocks by the rest of the DPU pipeline.
> 
> ... to be used by the rest?
> 

Yes, thanks.


>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index f9215643c71a..7b6444a3fcb1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -8,6 +8,7 @@
>>   #include "dpu_kms.h"
>>   #include "dpu_hw_lm.h"
>>   #include "dpu_hw_ctl.h"
>> +#include "dpu_hw_cdm.h"
>>   #include "dpu_hw_pingpong.h"
>>   #include "dpu_hw_sspp.h"
>>   #include "dpu_hw_intf.h"
>> @@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>                  }
>>          }
>>
>> +       if (rm->cdm_blk)
>> +               dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
>> +
>>          for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
>>                  dpu_hw_wb_destroy(rm->hw_wb[i]);
>>
>> @@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                  rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
>>          }
>>
>> +       if (cat->cdm) {
>> +               struct dpu_hw_cdm *hw;
>> +
>> +               hw = dpu_hw_cdm_init(cat->cdm, mmio);
>> +               /* CDM is optional so no need to bail out */
>> +               if (IS_ERR(hw)) {
>> +                       rc = PTR_ERR(hw);
>> +                       DPU_DEBUG("failed cdm object creation: err %d\n", rc);
> 
> No. If it is a part of the catalog, we should fail here as we do in other cases.
> 

I guess, the only reason for not failing here was other hw blocks are 
needed even for basic display to come up but cdm is only for YUV formats.

Thats the only reason to mark this a failure which is "OK" to ignore.

But I see your point that if someone is listing this in the catalog but 
still RM fails thats an error.

Hence, ack.

> 
>> +               } else {
>> +                       rm->cdm_blk = &hw->base;
>> +               }
>> +       }
>> +
>>          return 0;
>>
>>   fail:
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index 2b551566cbf4..29b221491926 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -22,6 +22,7 @@ struct dpu_global_state;
>>    * @hw_wb: array of wb hardware resources
>>    * @dspp_blks: array of dspp hardware resources
>>    * @hw_sspp: array of sspp hardware resources
>> + * @cdm_blk: cdm hardware resource
>>    */
>>   struct dpu_rm {
>>          struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>> @@ -33,6 +34,7 @@ struct dpu_rm {
>>          struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>>          struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>>          struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
>> +       struct dpu_hw_blk *cdm_blk;
> 
> struct dpu_hw_cdm *cdm (or cdm_blk), please.

Ack.

> 
>>   };
>>
>>   /**
>> --
>> 2.40.1
>>
> 
> 
> --
> With best wishes
> Dmitry

