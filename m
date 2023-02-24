Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408946A2229
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 20:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjBXTLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 14:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBXTLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 14:11:35 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2D91ACD0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 11:11:34 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OFZa6Y015746;
        Fri, 24 Feb 2023 19:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mdHVdMj46sv8mUoUjRsTd0agqwrhohqNfq/IjS3RwYc=;
 b=LgP+6QWjytPveJBLHlLf4bYUvZo3nJpS/CcwJ6o/swR3p+itsuUAfmtOuSOFLKEEoCgl
 BM2UQQ3JHWMqXoyfviBlDfs3mYXlUKcrl5NfqchIJxRFbHLPfRVkFJMH3u06Y5mYRsvS
 YtdmeWaAU/cq9J9BAEY3yRep3pt7cN+l4Lsh5V31runaKMPtQFJO2e9uolWH1C5z8LM2
 ySoP7VI87fRfXpzBhkgsVVrBIgkDdbQA9vcJrc7gJTN+3tZiAbmWcDoKnjZ3p3qXydb5
 VTb2eL6BCmnYj1+MClol5M1MaT0CP7Z8Kpp6C1yM2cKPcyxzA3bdmud877lU+EcsZmMT Yw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwybwnkqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 19:11:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OJBRJn025425
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 19:11:27 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 11:11:26 -0800
Message-ID: <c4fd1c77-dd0e-43b4-8a45-444a40767a5f@quicinc.com>
Date:   Fri, 24 Feb 2023 11:11:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 05/50] drm/msm/dpu: fix sm6115 and qcm2290 mixer width
 limits
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230211231259.1308718-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dlibuNjRM94Z6zqfUXGuvAHs44yPAqc1
X-Proofpoint-ORIG-GUID: dlibuNjRM94Z6zqfUXGuvAHs44yPAqc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=849 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240152
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2023 3:12 PM, Dmitry Baryshkov wrote:
> According to vendor DTS files both sm6116 and qcm2290 should have
> max_mixer_width set to 2048 (DEFAULT_DPU_LINE_WIDTH). Correct it.

sm6116 ---> sm6115

> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With that nit fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One more comment below but for a separate change.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 47de609e2279..192fff9238f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -318,7 +318,7 @@ static const struct dpu_caps msm8998_dpu_caps = {
>   };
>   
>   static const struct dpu_caps qcm2290_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x4,
>   	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>   	.has_dim_layer = true,
> @@ -356,7 +356,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
>   };
>   
>   static const struct dpu_caps sm6115_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x4,
>   	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
>   	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> @@ -1520,7 +1520,7 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>   /* QCM2290 */
>   
>   static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
> -	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxwidth = DEFAULT_DPU_LINE_WIDTH,

This looks like another cleanup idea. Since the lm_sub_blk already has a 
maxwidth doe we need to have max_mixer_width too? It seems like we can 
drop one of them.

>   	.maxblendstages = 4, /* excluding base layer */
>   	.blendstage_base = { /* offsets relative to mixer base */
>   		0x20, 0x38, 0x50, 0x68
