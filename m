Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D5A6F8784
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjEERYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjEERYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:24:44 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8C2E6C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:24:43 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345EnDdX014878;
        Fri, 5 May 2023 17:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TwKe2rbu+TUX/pS/0hLxy6mK+CzZ66m3ZTlixgoLX30=;
 b=PnUm1TGd2DHj42X1TI2PHIpGGI/KaOzSE6lvMcOo6pZFY1O69rJmIj8M19BRu7/8cGyy
 w1BDNw6OB4SEougnSlav78PVsWOJk207c6xRvL8HCQ7/T2D6+patdxumoqKmkZ6JotAQ
 dWzakLHbRlaCPKdL8zP8ZK24N9U2U1wFBB+fmWoKRL1HqDsgKuDU6eGpeQEyn12ftwHS
 qh0YiQXpiYWCQYFTKlQm1tf4DAEllGFtB6p2ocZOxXFH7B9947ahniMdD4N/qA2a/vAs
 u5w9tDrH0Y3EMYVvESgRu7TXFbT+hlFOIz+dB/x6IgK9w95klGhNdmn6R1mEG2pw7/bn og== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcumk9g9p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 May 2023 17:24:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HO8YV030371
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 May 2023 17:24:08 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:24:07 -0700
Message-ID: <e2ddc196-5b12-5e8b-b406-665e2adfef0a@quicinc.com>
Date:   Fri, 5 May 2023 10:24:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 1/9] drm/msm/dpu: fix SSPP register
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-2-dmitry.baryshkov@linaro.org>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UCkWVTtSEYjJ6X4cJV-m9YoazkiN1Fhp
X-Proofpoint-ORIG-GUID: UCkWVTtSEYjJ6X4cJV-m9YoazkiN1Fhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050144
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> Reorder SSPP register definitions to sort them in the ascending order.
> Move register bitfields after the register definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 +++++++++++----------
>   1 file changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 6b68ec5c7a5a..1bf717290dab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -26,45 +26,18 @@
>   #define SSPP_SRC_FORMAT                    0x30
>   #define SSPP_SRC_UNPACK_PATTERN            0x34
>   #define SSPP_SRC_OP_MODE                   0x38
> -
> -/* SSPP_MULTIRECT*/
> -#define SSPP_SRC_SIZE_REC1                 0x16C
> -#define SSPP_SRC_XY_REC1                   0x168
> -#define SSPP_OUT_SIZE_REC1                 0x160
> -#define SSPP_OUT_XY_REC1                   0x164
> -#define SSPP_SRC_FORMAT_REC1               0x174
> -#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> -#define SSPP_SRC_OP_MODE_REC1              0x17C
> -#define SSPP_MULTIRECT_OPMODE              0x170
> -#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> -#define SSPP_EXCL_REC_SIZE_REC1            0x184
> -#define SSPP_EXCL_REC_XY_REC1              0x188
> -
> -#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> -#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> -#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> -#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> -#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> -#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> -#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> -#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> -#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> -#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> -#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> -#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> -
>   #define SSPP_SRC_CONSTANT_COLOR            0x3c
>   #define SSPP_EXCL_REC_CTL                  0x40
>   #define SSPP_UBWC_STATIC_CTRL              0x44
> -#define SSPP_FETCH_CONFIG                  0x048
> +#define SSPP_FETCH_CONFIG                  0x48
>   #define SSPP_DANGER_LUT                    0x60
>   #define SSPP_SAFE_LUT                      0x64
>   #define SSPP_CREQ_LUT                      0x68
>   #define SSPP_QOS_CTRL                      0x6C
> -#define SSPP_DECIMATION_CONFIG             0xB4
>   #define SSPP_SRC_ADDR_SW_STATUS            0x70
>   #define SSPP_CREQ_LUT_0                    0x74
>   #define SSPP_CREQ_LUT_1                    0x78
> +#define SSPP_DECIMATION_CONFIG             0xB4
>   #define SSPP_SW_PIX_EXT_C0_LR              0x100
>   #define SSPP_SW_PIX_EXT_C0_TB              0x104
>   #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
> @@ -81,11 +54,33 @@
>   #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
>   #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
>   #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> +#define SSPP_OUT_SIZE_REC1                 0x160
> +#define SSPP_OUT_XY_REC1                   0x164
> +#define SSPP_SRC_XY_REC1                   0x168
> +#define SSPP_SRC_SIZE_REC1                 0x16C
> +#define SSPP_MULTIRECT_OPMODE              0x170
> +#define SSPP_SRC_FORMAT_REC1               0x174
> +#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> +#define SSPP_SRC_OP_MODE_REC1              0x17C
> +#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> +#define SSPP_EXCL_REC_SIZE_REC1            0x184
> +#define SSPP_EXCL_REC_XY_REC1              0x188
>   #define SSPP_EXCL_REC_SIZE                 0x1B4
>   #define SSPP_EXCL_REC_XY                   0x1B8
> -#define SSPP_VIG_OP_MODE                   0x0
> -#define SSPP_VIG_CSC_10_OP_MODE            0x0
> -#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> +
> +/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
> +#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> +#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> +#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> +#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> +#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> +#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> +#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> +#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> +#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> +#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> +#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> +#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
>   
>   /* SSPP_QOS_CTRL */
>   #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
> @@ -96,6 +91,7 @@
>   #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
>   
>   /* DPU_SSPP_SCALER_QSEED2 */
> +#define SSPP_VIG_OP_MODE                   0x0
>   #define SCALE_CONFIG                       0x04
>   #define COMP0_3_PHASE_STEP_X               0x10
>   #define COMP0_3_PHASE_STEP_Y               0x14
> @@ -107,6 +103,12 @@
>   #define COMP1_2_INIT_PHASE_Y               0x2C
>   #define VIG_0_QSEED2_SHARP                 0x30
>   
> +/* DPU_SSPP_CSC_10BIT space */
> +#define SSPP_VIG_CSC_10_OP_MODE            0x0
> +
There is an existing grouping for CSC 10 bit op modes. You can add to that.
> +/* SSPP_TRAFFIC_SHAPER and _REC1 */
I dont get the _REC1 comment. How is it relevent for this flag?
> +#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> +
>   /*
>    * Definitions for ViG op modes
>    */
