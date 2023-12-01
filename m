Return-Path: <linux-arm-msm+bounces-2939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C3801371
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 20:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B541C20952
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 19:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C47495EF;
	Fri,  1 Dec 2023 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YAgLtlv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C73B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 11:12:44 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1JCA0I023415;
	Fri, 1 Dec 2023 19:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=s6vS/rgSL5c9OO8rwV+0Cc4CwHNP+lYmF+3lWE3XMjw=;
 b=YAgLtlv+iO/JsZFT1+R+cacI6GGN77P6/x/c+tk8dEzDWXtXup3Kk5cFro7hx+k4fDmF
 ORU9x0J/uDmADIPm7XfkB4HQlzOdO973ubojvuztSoNCrZ1xYezOYEBSkBjdcgAQN1pn
 xa2eQORtBWUhzPWvwts9EZCr/1kUBLOQqTRVpFmBABxzvyedYWYdMXaOJjpDhlGirg90
 m1V1b/kCA43slpRZYYmRDlYtbp77RACa91A4mynvOI2PIRaYHaEYbNbJSSeMewzAOrz+
 Jg0d2Aw/V94yzLbF3iEYgyqwfUJB0awzlSGVcrozKH+4+vmnK2r/57/5Gs6oEl5uzCgB dQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqcm69kp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 19:12:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1JCMls007400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 19:12:22 GMT
Received: from [10.71.109.160] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:12:22 -0800
Message-ID: <0a25f36e-5bf0-4539-ab80-dfa61872018a@quicinc.com>
Date: Fri, 1 Dec 2023 11:12:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH v3 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init
 error path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "Daniel Vetter" <daniel@ffwll.ch>, David Airlie
	<airlied@gmail.com>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-2-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230730011920.354575-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 54HIiZdqoho5kM5Xfb89jdLFMUx7n-9a
X-Proofpoint-ORIG-GUID: 54HIiZdqoho5kM5Xfb89jdLFMUx7n-9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010123



On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
> It was noticed that dpu_kms_hw_init()'s error path contains several
> labels which point to the same code path. Replace all of them with a
> single label.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 31782a6d821f..77a79bc42492 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1077,7 +1077,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	if (!dpu_kms->catalog) {
>   		DPU_ERROR("device config not known!\n");
>   		rc = -EINVAL;
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	/*
> @@ -1087,13 +1087,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	rc = _dpu_kms_mmu_init(dpu_kms);
>   	if (rc) {
>   		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>   	if (rc) {
>   		DPU_ERROR("rm init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	dpu_kms->rm_init = true;
> @@ -1105,7 +1105,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		rc = PTR_ERR(dpu_kms->hw_mdp);
>   		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>   		dpu_kms->hw_mdp = NULL;
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> @@ -1116,7 +1116,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
> -			goto power_error;
> +			goto err_pm_put;
>   		}
>   
>   		dpu_kms->hw_vbif[vbif->id] = hw;
> @@ -1132,7 +1132,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>   	if (rc) {
>   		DPU_ERROR("failed to init perf %d\n", rc);
> -		goto perf_err;
> +		goto err_pm_put;
>   	}
>   
>   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> @@ -1140,7 +1140,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		rc = PTR_ERR(dpu_kms->hw_intr);
>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
>   		dpu_kms->hw_intr = NULL;
> -		goto hw_intr_init_err;
> +		goto err_pm_put;
>   	}
>   
>   	dev->mode_config.min_width = 0;
> @@ -1165,7 +1165,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	rc = _dpu_kms_drm_obj_init(dpu_kms);
>   	if (rc) {
>   		DPU_ERROR("modeset init failed: %d\n", rc);
> -		goto drm_obj_init_err;
> +		goto err_pm_put;
>   	}
>   
>   	dpu_vbif_init_memtypes(dpu_kms);
> @@ -1174,10 +1174,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	return 0;
>   
> -drm_obj_init_err:
> -hw_intr_init_err:
> -perf_err:
> -power_error:
> +err_pm_put:
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   error:
>   	_dpu_kms_hw_destroy(dpu_kms);
> -- 
> 2.39.2
> 

