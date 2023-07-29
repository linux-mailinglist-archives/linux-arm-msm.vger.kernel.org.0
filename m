Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88CD4767A83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 03:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbjG2BKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 21:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbjG2BKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 21:10:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044DB3C38
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 18:10:42 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SNq5Gs022584;
        Sat, 29 Jul 2023 01:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lAhMcdDLQciK6k7MvesZmle67pQdTid6VoAAJF84fAc=;
 b=ChSHBS3IP0MBGPTQRqB7Zog/thh7znbXRFE2IJfs7emQTYR9t9SAuZ0QjxRBz5nGNI0J
 LMNpihfpkawZzh0Aypj5YbXqtNUIexTxbSsQfvKEUEugHkWw5EeRt9kLljFRaOVRt9mY
 WVchm6dacWvCXh7eX3DY31efG/noFnpjReE6nUXndGXAX+0KrhpAmGtuSOTP4NQ7lJo/
 mOaaVOnYQ0SRXHr0OTMo9KQft+VVtk0mqFTNbWtPigDPcYAi5bZ265vJjC6ONFLyK4pj
 5cYb9Bk80LNCErZJJHEKhZgTBSXkpFJDHL73LXgT0CI8FytThHlsVw2t+6SRWIZZxGWR aw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s469hjawe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 01:10:32 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36T1AVZW006926
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 29 Jul 2023 01:10:31 GMT
Received: from [10.110.51.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 18:10:30 -0700
Message-ID: <de08679b-a89b-fe56-7153-92e74ebe758a@quicinc.com>
Date:   Fri, 28 Jul 2023 18:10:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: drop unused dpu_plane::lock
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
 <20230707231251.3849701-8-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JW5eHj4s9vkjqwv7o9tGc64c8D6shPTM
X-Proofpoint-GUID: JW5eHj4s9vkjqwv7o9tGc64c8D6shPTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307290009
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
> The field dpu_plane::lock was never used for protecting any kind of
> data. Drop it now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..aba5185e1d66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>   struct dpu_plane {
>   	struct drm_plane base;
>   
> -	struct mutex lock;
> -
>   	enum dpu_sspp pipe;
>   
>   	uint32_t color_fill;
> @@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
>   		if (pstate->r_pipe.sspp)
>   			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
>   
> -		mutex_destroy(&pdpu->lock);
> -
>   		/* this will destroy the states as well */
>   		drm_plane_cleanup(plane);
>   
> @@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	/* success! finalize initialization */
>   	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
>   
> -	mutex_init(&pdpu->lock);
> -
>   	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>   					pipe, plane->base.id);
>   	return plane;
> -- 
> 2.39.2
> 
