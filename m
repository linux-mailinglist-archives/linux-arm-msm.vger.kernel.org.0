Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1DEB678DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 02:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjAXBpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 20:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjAXBpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 20:45:09 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1122392AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 17:45:08 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30O1fQNa004554;
        Tue, 24 Jan 2023 01:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S73OMe1na2GtkcLKQFFJZWO4AgRxWHcFC8NjPuuYc1g=;
 b=dGuus4I8iwUoAL02TfGEL33pac0SvT7xpiYNNvh+4slweKSez3L1dEErp47VedJu+noO
 xU8oGWL5nGDjWmgLvqHHtC7GxRmDHqr+zgkrMKCi7m8b/veCMREv2V5ny15c4Jxf1/3K
 nFtdl8QFfR66vRPHuyYeHlWS2fo90MWpnu6fCf/MapBnK0etMXfYF/bKzbcq+uPfefNU
 zb6bfZx2p3DlL+VhLZ6J5E9JtoFKvoJHkz8F9o8sHsPgudiR7rif5PjutfUpfxhVyOQC
 Q2trM2TQoZHCLkrcDHjI8fV9SGSmzowCq4+K+no4r8oU95+8WNPkYbNJueRdEMNdof63 kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89k9c5m2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 01:45:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30O1j12D031152
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 01:45:01 GMT
Received: from [10.110.62.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 23 Jan
 2023 17:45:01 -0800
Message-ID: <5e2f6039-259f-9423-f1eb-425af0a0e885@quicinc.com>
Date:   Mon, 23 Jan 2023 17:45:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: use strscpy instead of strncpy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rKrbuMtfa-FZOEd8tUTwdJt2apj-qK1o
X-Proofpoint-GUID: rKrbuMtfa-FZOEd8tUTwdJt2apj-qK1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=978 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240011
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/17/2023 6:01 PM, Dmitry Baryshkov wrote:
> Using strncpy can result in non-NULL-terminated destination string. Use
> strscpy instead. This fixes following warning:
> 
> drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
> drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>     25 |         strncpy(fctx->name, name, sizeof(fctx->name));
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/msm_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index a47e5837c528..56641408ea74 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -22,7 +22,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>   		return ERR_PTR(-ENOMEM);
>   
>   	fctx->dev = dev;
> -	strncpy(fctx->name, name, sizeof(fctx->name));
> +	strscpy(fctx->name, name, sizeof(fctx->name));
>   	fctx->context = dma_fence_context_alloc(1);
>   	fctx->index = index++;
>   	fctx->fenceptr = fenceptr;
