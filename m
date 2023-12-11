Return-Path: <linux-arm-msm+bounces-4271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F324780DCC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF741C20282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1555B54BE7;
	Mon, 11 Dec 2023 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HZKwN9dB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D68BDC;
	Mon, 11 Dec 2023 13:16:22 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBLBeB9010925;
	Mon, 11 Dec 2023 21:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2qwVnVRGiEz/dK94uWiVqAw4mV6RqHCm04gqd/tWgq4=; b=HZ
	KwN9dB7BeT11lSZUyYqf/a3AzIVBFZXcwbJ/GfgYao+iECrqGjQF9ihdFdXjhWqj
	MMVTdYB/rTJriUzs5QIUJ3ZBZ28hNdhLemaFvLhpE/g19UfvWWgPZ7cAegzWX/Ea
	+WwCzCySJS4qQkrkiKu2sZzmIJ6LKj7Fxr1OutFKrpuDlPSOyJy570FreuREuizI
	wXGJmymEpgVdHbQZ9nk50B8K1VQVzpqg+KQ4BhpzOiBFqCNZU/+pHI9pMsOU134H
	FloY2TLTJmu1YRPAeq5p3sQMqQb0NbuifswmMUlEw9JPokKpA9bLlRBaZu9tmYjz
	Wu2SUmsfGPHGYzaMQKcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux6530kbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:16:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLGEhF001383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:16:14 GMT
Received: from [10.110.62.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:16:11 -0800
Message-ID: <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
Date: Mon, 11 Dec 2023 13:16:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280
 dpu_hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
 <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _IdRM85cYEHTaM5NNQCQj9nhy5luii2s
X-Proofpoint-GUID: _IdRM85cYEHTaM5NNQCQj9nhy5luii2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110175



On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
>> YUV format output from writeback block.
>>
>> changes in v2:
>>          - remove explicit zero assignment for features
>>          - move sc7280_cdm to dpu_hw_catalog from the sc7280
>>            catalog file as its definition can be re-used
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>>   4 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 209675de6742..19c2b7454796 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>          .mdss_ver = &sc7280_mdss_ver,
>>          .caps = &sc7280_dpu_caps,
>>          .mdp = &sc7280_mdp,
>> +       .cdm = &sc7280_cdm,
>>          .ctl_count = ARRAY_SIZE(sc7280_ctl),
>>          .ctl = sc7280_ctl,
>>          .sspp_count = ARRAY_SIZE(sc7280_sspp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index d52aae54bbd5..1be3156cde05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>          .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>>   };
>>
>> +/*************************************************************
>> + * CDM sub block config
> 
> Nit: it is not a subblock config.
> 

Ack.

>> + *************************************************************/
>> +static const struct dpu_cdm_cfg sc7280_cdm = {
> 
> I know that I have r-b'ed this patch. But then one thing occurred to
> me. If this definition is common to all (or almost all) platforms, can
> we just call it dpu_cdm or dpu_common_cdm?
> 
>> +       .name = "cdm_0",
>> +       .id = CDM_0,
>> +       .len = 0x228,
>> +       .base = 0x79200,
>> +};

hmmm .... almost common but not entirely ... msm8998's CDM has a shorter 
len of 0x224 :(

>> +
>>   /*************************************************************
>>    * VBIF sub blocks config
>>    *************************************************************/
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index e3c0d007481b..ba82ef4560a6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
>>          u32 memtype[MAX_XIN_COUNT];
>>   };
>>
>> +/**
>> + * struct dpu_cdm_cfg - information of chroma down blocks
>> + * @name               string name for debug purposes
>> + * @id                 enum identifying this block
>> + * @base               register offset of this block
>> + * @features           bit mask identifying sub-blocks/features
>> + */
>> +struct dpu_cdm_cfg {
>> +       DPU_HW_BLK_INFO;
>> +};
>> +
>>   /**
>>    * Define CDP use cases
>>    * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
>> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
>>          u32 wb_count;
>>          const struct dpu_wb_cfg *wb;
>>
>> +       const struct dpu_cdm_cfg *cdm;
>> +
>>          u32 ad_count;
>>
>>          u32 dspp_count;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index a6702b2bfc68..f319c8232ea5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -185,6 +185,11 @@ enum dpu_dsc {
>>          DSC_MAX
>>   };
>>
>> +enum dpu_cdm {
>> +       CDM_0 = 1,
>> +       CDM_MAX
>> +};
>> +
>>   enum dpu_pingpong {
>>          PINGPONG_NONE,
>>          PINGPONG_0,
>> --
>> 2.40.1
>>
> 
> 

