Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D3167A6CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 00:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAXXWm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 18:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjAXXWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 18:22:41 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639B9303DA
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 15:22:39 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ONMWBj010394;
        Tue, 24 Jan 2023 23:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5Ii9X4FAVTbWHoJsXU338PiVM2FtLRmkWdInRVFiis0=;
 b=hMG97h94FpgwJDW7b1Feh9PaUehL0a9tjx63oTqhYYkVdsV/eLMTQFVXPCalOej7BOXk
 DIocJr54KIJ9X4y3XLZ8cuFTVkS3jdwUub64btcFvOYisyauuDr6ZHPZQfMzejRyeg1v
 uz1ypVzdeVtXnIzZ0MVVyNT7Two6KkFFkzdrJNThed21Y/CztWaKJc3ZK4ShxDqry/mu
 v2Zb+nHVx00IuJUNMkndJgyXVHYtPNAy2zl7qI+BYOR+tTrMtOgmJe/hCcow+zTJmg0s
 dMGkssn5qXHHVfWEpMngnPu8ocx3h/L+ndlAcFTdviaslV3YWZ7/fTULeFUp3AomeX0I mA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dne1w7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 23:22:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ONMVLN022003
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 23:22:31 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 15:22:30 -0800
Message-ID: <76626a9e-9642-4706-ee38-a18202dd135f@quicinc.com>
Date:   Tue, 24 Jan 2023 15:22:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/dpu: handle UBWC 1.0 in
 dpu_hw_sspp_setup_format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
 <20221207142833.204193-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221207142833.204193-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bi8aoPkPOy5PC1NEjiGDqRIwHZySoRt7
X-Proofpoint-ORIG-GUID: bi8aoPkPOy5PC1NEjiGDqRIwHZySoRt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=997 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240215
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
> Extend dpu_hw_sspp_setup_format() to also handle the UBWC 1.0 case.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 691c471b08c2..4246ab0b3bee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -310,7 +310,11 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
>   			ctx->mdp->highest_bank_bit << 18);
>   		switch (ctx->catalog->caps->ubwc_version) {
>   		case DPU_HW_UBWC_VER_10:
> -			/* TODO: UBWC v1 case */
> +			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> +			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> +					fast_clear | (ctx->mdp->ubwc_swizzle & 0x1) |
> +					BIT(8) |
> +					(ctx->mdp->highest_bank_bit << 4));
>   			break;
>   		case DPU_HW_UBWC_VER_20:
>   			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
