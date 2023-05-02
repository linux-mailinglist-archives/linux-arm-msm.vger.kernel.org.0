Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A0F6F4B95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 22:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjEBUpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 16:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjEBUpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 16:45:46 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E231734
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 13:45:45 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342JumgW005591;
        Tue, 2 May 2023 20:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1vgKW6jlHCKJb9xeMsFEkB7YuPkorPjAU2tq9LK6stc=;
 b=SbP9VjW3qU1bf6fZMrEguwfvOCc8u3u8fF8YuUMCwdyQV1LCxBdqjPxH73v+lAMs6seT
 DeEP62iBPZbXBO14NthpLqkq+uil5+YiMcMh9goGqHIZld3nUP/rrSp7qTAJ39h9j3Kr
 KqhnlgMIg8m3kHrLNoV033+uj6IxPlvw3zKPpwqDFYv0so2A6fTYL2g5SijeV/36k98H
 X30QAS7D5Rppaafxh8rmR9QpYBd2Gz3hAA7BmV4LFuiMhQL+87BaR4rX16fMkwRmC27L
 foPV6OsZttFWwKZMmZIjdYdrb26LOq038aV2v5zcKRFwaoQKr1NdkRrUtflaVqdcWghs ZA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qays51k9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 20:45:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342KjYo7006078
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 2 May 2023 20:45:34 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 13:45:34 -0700
Message-ID: <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
Date:   Tue, 2 May 2023 13:45:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H0qZ-H44dDxgDE95wS19vUisR675HU_-
X-Proofpoint-ORIG-GUID: H0qZ-H44dDxgDE95wS19vUisR675HU_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_11,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020176
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> There is no need to clean up debugfs manually, it will be done by the
> DRM core on device deregistration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

There are two reasons to have the debugfs removed in the early_unregister:

1) Today, registration happens in late_register(), hence to balance the 
the call in _dpu_encoder_init_debugfs(), this one is present.

2) In drm_modeset_register_all(), if drm_connector_register_all() fails, 
it calls drm_encoder_unregister_all() first which calls early_unregister().

So to balance these out, dont we need to keep it?

>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 32785cb1b079..8c45c949ec39 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
>   	return _dpu_encoder_init_debugfs(encoder);
>   }
>   
> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> -
> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
> -}
> -
>   static int dpu_encoder_virt_add_phys_encs(
>   		struct msm_display_info *disp_info,
>   		struct dpu_encoder_virt *dpu_enc,
> @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
>   		.destroy = dpu_encoder_destroy,
>   		.late_register = dpu_encoder_late_register,
> -		.early_unregister = dpu_encoder_early_unregister,
>   };
>   
>   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
