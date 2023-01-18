Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05A56710D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjARCJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjARCIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:08:36 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B194345A
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:08:25 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I19UeQ020138;
        Wed, 18 Jan 2023 02:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z3DKXCmO1HouasRtE1cjxHJVD/kCDSspckrTrsV/zg0=;
 b=HiegyrFP57f8tLD+SjHVZBcYYOcGNvrQ9Gxy0zukB5QB2p2MDlrh3pgka0EMxYaxZptR
 0lpbn7rdMi+/ASsFTl5bMzfygLmLEKqS7vb2XahKPUlNIkDAZo6m2jtsUpx8EFR3sase
 Ga63txTWH+4sCSPjqQ8dKhnAaaIEioEtKESAtc2mBpVUGkwfKNTDclSLnqVIuUvpJkWZ
 MB1Mblh2NisCPDd7G6Zkv7oa4Bih6eqt55hFuGpg7N19/jLWbHT5iMfdbL5ZhFHQ11ub
 cUUdEKTh+hO1YvTIOXsCna3eUfHea5glo03e9QShR+wY2p3hYpfmZv0o9j5DqGV9nEUv 3g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n60bx0vup-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 02:08:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30I28HPD011329
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 02:08:17 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 18:08:16 -0800
Message-ID: <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
Date:   Tue, 17 Jan 2023 18:08:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to
 sc8280xp_regdma
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MS46vR8YTcAY7HtoHwjvgrsvqYWyjKaY
X-Proofpoint-ORIG-GUID: MS46vR8YTcAY7HtoHwjvgrsvqYWyjKaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180015
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/17/2023 6:04 PM, Dmitry Baryshkov wrote:
> SC8280XP configuration missed the reg_dma configuration. We do not use
> regdma for now, but let's put the correct pointer anyway.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 4375e72a9aab..3d0fbc1746e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>   	.intf = sc8280xp_intf,
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,

Lets stick to the convention of the rest of the entries and use ARRAY_SIZE.

> +	.dma_cfg = &sc8280xp_regdma,
>   	.perf = &sc8280xp_perf_data,
>   	.mdss_irqs = IRQ_SC8280XP_MASK,
>   };
