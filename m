Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784427DC0D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 20:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjJ3TwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 15:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJ3TwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 15:52:14 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BEBC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 12:52:12 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UJMg8r021684;
        Mon, 30 Oct 2023 19:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RAg5UiCfMRCZ8VUHGMoWAWeYgOsol6F0t3w9AyKiSjE=;
 b=m2DrzfTLqR0soECIH4WogkhREGqSvCXGX3cwm1mU370AUp2yrBbl/BjMXz45YL25q2wN
 JQsVRK3sCGorsQAgKddFHGMHzgzSnmK94Q9Emqt0dM6urf2L8eH0B1G4HrXV+DwnOph/
 Q3DPhHnTOywNHs/ZABOw2vGAok7+bhAtG/xZR6thc3TYYQa0+hAx0tDrajW2PYWMmlFt
 cCqhXGwIWW3ihDXMrUZeYwcdzU2fEFYpc4wI62O99Pvfs5Akhj0dVUeTVQUIi5FOfa4V
 NaSe5M+gd89kXSs5+9uKkaEtW8msjpIAMZx7lhkPkOsvQRC5+p824SuGBq+BDuRbMTQC yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u29fesf1q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Oct 2023 19:51:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UJpx4k029613
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Oct 2023 19:51:59 GMT
Received: from [10.110.97.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 12:51:58 -0700
Message-ID: <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
Date:   Mon, 30 Oct 2023 12:51:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 06/10] drm/msm/dpu: deduplicate some (most) of SSPP
 sub-blocks
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
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OrJ2qGEpejkuPaQwC_t5nuqO_Utj2CaY
X-Proofpoint-ORIG-GUID: OrJ2qGEpejkuPaQwC_t5nuqO_Utj2CaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300157
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> As we have dropped the variadic parts of SSPP sub-blocks declarations,
> deduplicate them now, reducing memory cruft.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
>   17 files changed, 120 insertions(+), 167 deletions(-)
> 

<snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index e60427f54b27..860feb9c54e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.name = "sspp_0", .id = SSPP_VIG0,
>   		.base = 0x4000, .len = 0x344,
>   		.features = VIG_SC7180_MASK,
> -		.sblk = &sm8550_vig_sblk_0,
> +		.sblk = &dpu_vig_sblk_qseed3_3_2,

Some of this naming doesnt sound right to me. What I had suggested was 
just dpu_vig_sblk_scaler_x_y but what is used is dpu_vig_sblk_qseedx_x_y

This is not correct because technically sm8550 was qseed4 as its scaler 
version is > 0x3000

So this adds some discrepancy in the naming.
