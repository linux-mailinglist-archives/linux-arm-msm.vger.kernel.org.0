Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772E8670E42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjAQX57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjAQX5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:57:19 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FA44DE0D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 15:10:39 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HKdR6J008685;
        Tue, 17 Jan 2023 23:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Kq4QTOw6JsPonbbZhmW9Co89yNppmOZX9p8vxzArv/Y=;
 b=Am9tMQHFbGXKntink20eUTTonIvqfaxmvcAhtKlZWhwRlLK2GG1anGZx0FmY1fXhiblh
 ZkaWsPokEgdFJlZE4FFNkgbKJ/bEAtdu/evPpGSmadEH5vkOQtqqFGKOYWNfkznPRKwK
 k185j9sQrgim+fJipBsihINDM/+bcNW73wZL3aCMqiF54DoWCodf8+T+bILCvr1hi2Qn
 9oZFYvIHFAzYf7gJF/WFdbVS8S888tww7YHq8VIDbRpZKalTU1FYwvVwyBogwE5iG8Oo
 RNJtrxXyWba7e5c1P0WOEjxTz9UigI19XGYlTdXtsj/rFczVD/771sXwOSrZd/AETzQU GA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n3mm9xkdx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 23:10:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30HNAV0J000861
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 23:10:31 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 15:10:30 -0800
Message-ID: <9bf93afc-c54d-bd1d-2c85-548202e7d29f@quicinc.com>
Date:   Tue, 17 Jan 2023 15:10:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RUDZ_zeBkrafzxgiV_q3x4rY4wrVpxev
X-Proofpoint-ORIG-GUID: RUDZ_zeBkrafzxgiV_q3x4rY4wrVpxev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170185
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/15/2023 7:44 PM, Dmitry Baryshkov wrote:
> According to the vendor dts files, both sc7180 and sc7280 support the
> source split mode (using two LMs for a single output). Change these two
> platforms to use MIXER_SDM845_MASK, which includes
> DPU_MIXER_SOURCESPLIT. Rename MIXER_SC7180_MASK to MIXER_QCM2290_MASK,
> since this platform doesn't seem to support source split mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Names are getting confusing with mask name re-uses, till the hw catalog 
split have to live with it I guess.

I need to double-check about QCM 2290, but since this change is keeping 
current masks for it and just renaming,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 22ad996e9014..835d6d2c4115 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -56,7 +56,7 @@
>   #define MIXER_SDM845_MASK \
>   	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
> -#define MIXER_SC7180_MASK \
> +#define MIXER_QCM2290_MASK \
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
>   #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> @@ -1464,9 +1464,9 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>   };
>   
>   static const struct dpu_lm_cfg sc7180_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>   		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>   		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>   };
>   
> @@ -1499,11 +1499,11 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   };
>   
>   static const struct dpu_lm_cfg sc7280_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>   		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>   		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
>   		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>   };
>   
> @@ -1518,7 +1518,7 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>   };
>   
>   static const struct dpu_lm_cfg qcm2290_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
>   		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
>   };
>   
