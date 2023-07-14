Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E501D75445C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 23:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjGNVn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 17:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGNVn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 17:43:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C13335A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jul 2023 14:43:27 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EJSfBl032586;
        Fri, 14 Jul 2023 21:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OijH2qoTfDgbBGa6my3tyv/hSd15pOzhysEuvVl4SwY=;
 b=OyHreV9Z7hruDRfENlHnGIZ+b1mBg0KycFR9wW3syHJLzJdKZI486k5Mq4ELvoLNpvCE
 iS2KCnL4h9WfnWI8EAOBHRho5eIvJTPznEYWJd9S/qzoLv93ABjANuxnpdcQOC7hyb10
 4sP7XDAJ3KM64RbnpnTlfc5RehCR+nIAoUiGkOYdcqv4S6C90yz2VEqMz3YdNEfI9H0d
 j7GZazVatLLcVLdry5XsmDZJvz98opizEQNIg1nZVJ56zl/19RX0dhKHzTRZVsW0Y804
 IeZBWnuRfn0tzT/8Ilguq6/RHHqXYk0DWBpdtXO7eaNwiSNJsJ5XqseWcn7oKeLoe9eW vw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpujtu69-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 21:43:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36ELhGAQ020206
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 21:43:16 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 14:43:15 -0700
Message-ID: <c1582144-38c2-78ee-2808-d4595aa17264@quicinc.com>
Date:   Fri, 14 Jul 2023 14:43:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
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
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-2-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LamJjYvi-HRrH6yCp4lpBdEz_wK4kir3
X-Proofpoint-ORIG-GUID: LamJjYvi-HRrH6yCp4lpBdEz_wK4kir3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140199
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> It was noticed that dpu_kms_hw_init()'s error path contains several
> labels which point to the same code path. Replace all of them with a
> single label.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c11b3ab572ab..e7ac02e92f42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	if (!dpu_kms->catalog) {
>   		DPU_ERROR("device config not known!\n");
>   		rc = -EINVAL;
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	/*
> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		rc = PTR_ERR(dpu_kms->hw_mdp);
>   		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>   		dpu_kms->hw_mdp = NULL;
> -		goto power_error;
> +		goto err_pm_put;
>   	}
>   
>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
> -			goto power_error;
> +			goto err_pm_put;
>   		}
>   
>   		dpu_kms->hw_vbif[vbif->id] = hw;
> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>   	if (rc) {
>   		DPU_ERROR("failed to init perf %d\n", rc);
> -		goto perf_err;
> +		goto err_pm_put;
>   	}
>   
>   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		rc = PTR_ERR(dpu_kms->hw_intr);
>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
>   		dpu_kms->hw_intr = NULL;
> -		goto hw_intr_init_err;
> +		goto err_pm_put;
>   	}
>   
>   	dev->mode_config.min_width = 0;
> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	rc = _dpu_kms_drm_obj_init(dpu_kms);
>   	if (rc) {
>   		DPU_ERROR("modeset init failed: %d\n", rc);
> -		goto drm_obj_init_err;
> +		goto err_pm_put;
>   	}
>   
>   	dpu_vbif_init_memtypes(dpu_kms);
> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	return 0;
>   
> -drm_obj_init_err:

Hey Dmitry,

The change itself LGTM -- however, it seems that there's a dependency on 
the core perf cleanup series that wasn't listed in the cover letter.

Thanks,

Jessica Zhang

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
