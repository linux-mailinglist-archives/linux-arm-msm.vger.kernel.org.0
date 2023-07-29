Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEA2767A6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 02:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbjG2A6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 20:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236527AbjG2A5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 20:57:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB6B11D
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 17:56:45 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T0hgnP030928;
        Sat, 29 Jul 2023 00:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JKFTYckktWClfCmCT4qhJawAMcB5T9YHJCzrIqytmV0=;
 b=aBIP61Gqxdt+LBBYuyfXQfXJwBmAm5yYhryJaTM2cuokgCpk0qbAHrioWW+1TzMHBFBn
 8j7Xre7mjocKC/8RB0udFpsAo7oq+yU1ZYefcMkxxnTOsiKVwR1dsAcE9ECypUlFOAwY
 B26odTJ4HqeDc6R4LnH/+lhq9FJ/hJlshjiMUgJCNZ5UINA+Cl4Mqf9zRyDB7E2ftTmT
 PR52kW8zYcUuMLc194wnRPHQQn1LAM8bkgQBouMF1304lz9Hh9WfhrMoPpgYFTZZXs6m
 GV3GOokRcCDBcaGFR+fGSZ+Y6R4jE87o2CTQS+qGxFK4KU+hb0yoksOUYMZ9pEgOHRzp yQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4rfmr0j0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 00:55:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36T0tb63009894
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 00:55:37 GMT
Received: from [10.110.51.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 17:55:36 -0700
Message-ID: <defef5d7-fa21-89ab-d2fa-32145d565a06@quicinc.com>
Date:   Fri, 28 Jul 2023 17:55:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] drm/msm/dpu: use drmm-managed allocation for
 dpu_crtc
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-11-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rx32EyiJ-B-dNzgCLbGa-obg2JSJb4w2
X-Proofpoint-GUID: rx32EyiJ-B-dNzgCLbGa-obg2JSJb4w2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290007
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
> This removes the need to perform any actions on CRTC destruction.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++-----------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 214229d11e3e..a1fcb690c687 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
>   	return to_dpu_kms(priv->kms);
>   }
>   
> -static void dpu_crtc_destroy(struct drm_crtc *crtc)
> -{
> -	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> -
> -	if (!crtc)
> -		return;
> -
> -	drm_crtc_cleanup(crtc);
> -	kfree(dpu_crtc);
> -}
> -
>   static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> @@ -1433,7 +1422,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
>   
>   static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.set_config = drm_atomic_helper_set_config,
> -	.destroy = dpu_crtc_destroy,
>   	.page_flip = drm_atomic_helper_page_flip,
>   	.reset = dpu_crtc_reset,
>   	.atomic_duplicate_state = dpu_crtc_duplicate_state,
> @@ -1467,9 +1455,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   	struct dpu_crtc *dpu_crtc = NULL;
>   	int i, ret;
>   
> -	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
> -	if (!dpu_crtc)
> -		return ERR_PTR(-ENOMEM);
> +	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
> +					       plane, cursor,
> +					       &dpu_crtc_funcs,
> +					       NULL);
> +
> +	if (IS_ERR(dpu_crtc))
> +		return ERR_CAST(dpu_crtc);
>   
>   	crtc = &dpu_crtc->base;
>   	crtc->dev = dev;
> @@ -1489,9 +1481,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   				dpu_crtc_frame_event_work);
>   	}
>   
> -	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
> -				NULL);
> -
>   	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>   
>   	if (dpu_kms->catalog->dspp_count)
> -- 
> 2.39.2
> 
