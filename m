Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2C17475D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 18:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjGDQAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 12:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjGDQAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 12:00:48 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3F2B2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 09:00:47 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3647fq4i026251;
        Tue, 4 Jul 2023 16:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FfJmuiv//B9Ey4spwjNOq9qVFQogiEOMCMGlfq5iLe8=;
 b=GVAKhcQAf3K2ujknXCwA+JCL9MyoxZxV24xlIGMSGJFCSc3dCiZlRM3BRhHPjuCzVzr6
 XiEsEuM/s6fL2/pV6ViL34ULg9S+5NomOFQQY8ij8KwlwpZ2fZnTwLw4oHieqA8KE8iP
 ZfCwKUgif2WX+odMcuPLvYaCO2kVJx2xJtO+UjqibkULolPSFTL/p0iXuOMG4+pVG51M
 73lJ5+TKcUiDbCwBcp32hEMnq2QsIYKU51eZzGVgyCSd5ozp7RuZ+VbqW+UFPPT6j5Dj
 jJBudPt9tC24/OW6/RVVv+2aaeebWQ9CzxkRmtlPJpPauMgSk5p9ekm/H5g99k3vhl+Z 1g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkwepkcgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 16:00:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 364G0TRh016890
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Jul 2023 16:00:29 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 09:00:27 -0700
Message-ID: <694033b9-31ef-3394-fbfe-2dbba6754692@quicinc.com>
Date:   Tue, 4 Jul 2023 09:00:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 14/14] drm/msm/dpu: drop dpu_core_perf_destroy()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-15-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230704150354.159882-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lCu8zaiTOKEbTQRJKRUBz7qm7kXCrclN
X-Proofpoint-GUID: lCu8zaiTOKEbTQRJKRUBz7qm7kXCrclN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_10,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040138
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> This function does nothing, just clears several data pointers. Drop it
> now.
> 

Now, it doesnt even do that. Just resets the clk_rate to 0.

> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
>   3 files changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 608c915a2cab..4b8127932e13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -408,16 +408,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   }
>   #endif
>   
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> -{
> -	if (!perf) {
> -		DPU_ERROR("invalid parameters\n");
> -		return;
> -	}
> -
> -	perf->max_core_clk_rate = 0;
> -}
> -
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		const struct dpu_perf_cfg *perf_cfg,
>   		unsigned long max_core_clk_rate)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index df1fcf28f2a9..a5a9c3389718 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -66,12 +66,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>    */
>   void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>   
> -/**
> - * dpu_core_perf_destroy - destroy the given core performance context
> - * @perf: Pointer to core performance context
> - */
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> -
>   /**
>    * dpu_core_perf_init - initialize the given core performance context
>    * @perf: Pointer to core performance context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f01b2278c01a..44b0daf70c4e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1171,7 +1171,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	return 0;
>   
>   drm_obj_init_err:
> -	dpu_core_perf_destroy(&dpu_kms->perf);
>   hw_intr_init_err:
>   perf_err:
>   power_error:
