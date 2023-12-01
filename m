Return-Path: <linux-arm-msm+bounces-2941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84653801393
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 20:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276531F2091B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 19:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221C84F205;
	Fri,  1 Dec 2023 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GDo4RUKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429EA128
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 11:30:04 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1EVxGt011762;
	Fri, 1 Dec 2023 19:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=N84de2MHRo6tyIG6ZYUk0SSFSWC1/MQ0EPJXcmVfTOg=;
 b=GDo4RUKOovXC32KFWlF2YoKle05b4W8UkyWy1n7HyljMbXGgOI0wSkXF9CdNedhmYivk
 CeCyZBBJeS5mx09lEXbWDxWUiL0oFRrC1z2YZRfEB5TIps5OHitgXI4sqEYvX71L1N2x
 SMKnm9Z8HOVLu8pr69/nPcOAouynx6wDIg39OZGVM/uxnlZe0LDcKXIjBRt0LS1rHwpN
 rlVF23JsLMpzhjtaba03F1bomE5nvXDnuFFKCVc6/Z20ilalZOSBx3pxzgS8kmqg5G32
 94D87cOZQMNBw9cqxAxtdchjebBoX43ZFNf3L62RYGASd3887OWKnv56UEHy3ml0INsM kQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq2kpasr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 19:29:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1JTSir025621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 19:29:28 GMT
Received: from [10.71.109.160] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:29:27 -0800
Message-ID: <058baeae-acf9-4120-8c78-d64d41a33f30@quicinc.com>
Date: Fri, 1 Dec 2023 11:29:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] drm/msm/dpu: use drmm-managed allocation for
 dpu_encoder_virt
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-14-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230730011920.354575-14-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tbx5afCCN0MXa_t8PBJjG4kKpBKJxmwZ
X-Proofpoint-GUID: tbx5afCCN0MXa_t8PBJjG4kKpBKJxmwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010124



On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
> It is incorrect to use devm-managed memory allocations for DRM data
> structures exposed to userspace. They should use drmm_ allocations.
> Change struct dpu_encoder allocation to use drmm_encoder_alloc(). This
> removes the need to perform any actions on encoder destruction.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 50 +++++----------------
>   1 file changed, 10 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2b94ff3d08a1..6d9ec3ac065c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -443,23 +443,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
>   	return linecount;
>   }
>   
> -static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
> -{
> -	struct dpu_encoder_virt *dpu_enc = NULL;
> -	int i = 0;
> -
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	DPU_DEBUG_ENC(dpu_enc, "\n");
> -
> -	drm_encoder_cleanup(drm_enc);
> -	mutex_destroy(&dpu_enc->enc_lock);
> -}
> -
>   void dpu_encoder_helper_split_config(
>   		struct dpu_encoder_phys *phys_enc,
>   		enum dpu_intf interface)
> @@ -2381,7 +2364,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   };
>   
>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> -		.destroy = dpu_encoder_destroy,
>   		.late_register = dpu_encoder_late_register,
>   		.early_unregister = dpu_encoder_early_unregister,
>   };
> @@ -2392,20 +2374,13 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> -	struct drm_encoder *drm_enc = NULL;
> -	struct dpu_encoder_virt *dpu_enc = NULL;
> -	int ret = 0;
> +	struct dpu_encoder_virt *dpu_enc;
> +	int ret;
>   
> -	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
> -	if (!dpu_enc)
> -		return ERR_PTR(-ENOMEM);
> -
> -	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> -			       drm_enc_mode, NULL);
> -	if (ret) {
> -		devm_kfree(dev->dev, dpu_enc);
> -		return ERR_PTR(ret);
> -	}
> +	dpu_enc = drmm_encoder_alloc(dev, struct dpu_encoder_virt, base,
> +				     &dpu_encoder_funcs, drm_enc_mode, NULL);
> +	if (IS_ERR(dpu_enc))
> +		return ERR_CAST(dpu_enc);
>   
>   	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
>   
> @@ -2415,8 +2390,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	mutex_init(&dpu_enc->rc_lock);
>   
>   	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> -	if (ret)
> -		goto fail;
> +	if (ret) {
> +		DPU_ERROR("failed to setup encoder\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
>   
>   	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
>   	timer_setup(&dpu_enc->frame_done_timer,
> @@ -2442,13 +2419,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	DPU_DEBUG_ENC(dpu_enc, "created\n");
>   
>   	return &dpu_enc->base;
> -
> -fail:
> -	DPU_ERROR("failed to create encoder\n");
> -	if (drm_enc)
> -		dpu_encoder_destroy(drm_enc);
> -
> -	return ERR_PTR(ret);
>   }
>   
>   int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
> -- 
> 2.39.2
> 

