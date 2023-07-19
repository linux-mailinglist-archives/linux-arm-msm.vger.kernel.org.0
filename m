Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340F0758A99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 03:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjGSBDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 21:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGSBDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 21:03:45 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446A3E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 18:03:44 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J0L1D1023152;
        Wed, 19 Jul 2023 01:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AeX70cdt0y8MSGwVG8x+r1Q6VYXuJQEpC5swKUsDcx8=;
 b=m4IolxCTYG2RAcI3XXtuJoQz0WxP5LLXfHJpuCftr+JoeIUTWeZhp2Ac/1xcgj2Zkn+s
 y7SyxLUiwrlTMQ5FilI4CIMgOG1RNd+jEzniksFK8sZReu40MLUxDbCPK9ozwt30Gfy9
 3qaWbrDsDEsKJAXzVcXO8f1IF8adGNIauk2adjevoSFRU7CPQS9YtaynD/BA6b4TuVfA
 oy4z/WrFQlpoZdlVYKptAJGq2kjt7Caucht0iykcYmK3L377mzYU0+9qrDogFSclRaZ1
 JThe/gfFd243at8d8zLd0sN9ti2mVFTS9VtMEieqLsg3rLYa5ZIJj+LYVfMHIGHTtWt4 zw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwfj7aunm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 01:03:34 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36J13XeW001315
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 01:03:33 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 18:03:32 -0700
Message-ID: <d7ba22ec-fa87-2071-ee18-3fdfb872f731@quicinc.com>
Date:   Tue, 18 Jul 2023 18:03:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] drm/msm/dpu: use devres-managed allocation for
 VBIF data
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
 <20230707231251.3849701-5-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g3czxT4KVIP-3ARat7KE9iLqOR8n2IE-
X-Proofpoint-ORIG-GUID: g3czxT4KVIP-3ARat7KE9iLqOR8n2IE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_19,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=920 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190007
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Use devm_kzalloc to create VBIF data structure. This allows us to
> remove corresponding kfree and drop dpu_hw_intr_destroy() function.

Hi Dmitry,

Nit: I think you mean dpu_hw_vbif_destroy() here.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 14 ++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 11 +++--------
>   3 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index a5121a50b2bb..98e34afde2d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -2,6 +2,8 @@
>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
> +#include <drm/drm_managed.h>
> +
>   #include "dpu_hwio.h"
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_vbif.h"
> @@ -211,12 +213,13 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
>   	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
>   }
>   
> -struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
> -		void __iomem *addr)
> +struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
> +				     const struct dpu_vbif_cfg *cfg,
> +				     void __iomem *addr)
>   {
>   	struct dpu_hw_vbif *c;
>   
> -	c = kzalloc(sizeof(*c), GFP_KERNEL);
> +	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
>   	if (!c)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -234,8 +237,3 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
>   
>   	return c;
>   }
> -
> -void dpu_hw_vbif_destroy(struct dpu_hw_vbif *vbif)
> -{
> -	kfree(vbif);
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
> index 7e10d2a172b4..e2b4307500e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
> @@ -108,12 +108,12 @@ struct dpu_hw_vbif {
>   /**
>    * dpu_hw_vbif_init() - Initializes the VBIF driver for the passed
>    * VBIF catalog entry.
> + * @dev:  Corresponding device for devres management
>    * @cfg:  VBIF catalog entry for which driver object is required
>    * @addr: Mapped register io address of MDSS
>    */
> -struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
> -		void __iomem *addr);
> -
> -void dpu_hw_vbif_destroy(struct dpu_hw_vbif *vbif);
> +struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
> +				     const struct dpu_vbif_cfg *cfg,
> +				     void __iomem *addr);
>   
>   #endif /*_DPU_HW_VBIF_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ef232dc838c7..f7723f89cbbc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -812,13 +812,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   	/* safe to call these more than once during shutdown */
>   	_dpu_kms_mmu_destroy(dpu_kms);
>   
> -	if (dpu_kms->catalog) {
> -		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> -			if (dpu_kms->hw_vbif[i]) {
> -				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
> -				dpu_kms->hw_vbif[i] = NULL;
> -			}
> -		}
> +	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> +		dpu_kms->hw_vbif[i] = NULL;
>   	}
>   
>   	if (dpu_kms->rm_init)
> @@ -1070,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		struct dpu_hw_vbif *hw;
>   		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
>   
> -		hw = dpu_hw_vbif_init(vbif, dpu_kms->vbif[vbif->id]);
> +		hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
> -- 
> 2.39.2
> 
