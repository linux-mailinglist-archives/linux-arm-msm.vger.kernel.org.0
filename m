Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937D37A29C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 23:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbjIOVuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 17:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbjIOVt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 17:49:58 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AED4C6
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 14:49:50 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FLVtJl022982;
        Fri, 15 Sep 2023 21:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z25xmuI5ONOOocHmHCGTDcRg4/waQzjbo4j50H+Kvlg=;
 b=Ap8NcsYYsbmgbar2arPCppaD+fFrVnyRnjoqm9GNXtPuJgebMlPEKPMNn2SWZlXSfeWv
 wWON7P5r5kFlKm2jcJozlAd9wWzQD5cev63yMUOBTuyIxXulpuaO/5Z+E8PBUtmBHWCs
 BebB+5vBz3RBuaDN2jT6ktHa4RxfcQjkL5XxXCVriA0epRHhCZOiD54iIiLJc99iAbRz
 Zzo7926jwGQ8+ucYQGAWXmSf66JRK6UsituQRg4ipv1v7I6mPtr3/m2F4NEMiFXetaan
 NMTSS9mf5KRkwIqglYh/DuVr91bDexJ1hQsgpkZi4x4auEZvOELfE08xT+k7nechF+T2 YA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4dvqtkk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 21:49:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FLnS1E026553
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 21:49:28 GMT
Received: from [10.110.81.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 14:49:26 -0700
Message-ID: <f01ea903-0af3-a98c-30e0-997abc324d61@quicinc.com>
Date:   Fri, 15 Sep 2023 14:49:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 6/9] drm/msm/dpu: deduplicate some (most) of SSPP
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
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-7-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230911214521.787453-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UAYmJmKkze2tNDqJZKDyX7dFnz09p5bO
X-Proofpoint-ORIG-GUID: UAYmJmKkze2tNDqJZKDyX7dFnz09p5bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_18,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150195
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
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
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index ff83bf694fee..1276981c16d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>   		.name = "sspp_0", .id = SSPP_VIG0,
>   		.base = 0x4000, .len = 0x1ac,
>   		.features = VIG_MSM8998_MASK,
> -		.sblk = &msm8998_vig_sblk_0,
> +		.sblk = &dpu_vig_sblk_1_2,

Thats a lot of de-duplication which is nice!

I think dpu_vig_sblk_scaler_x_y is a better name for all of these 
because it indicates that its the scaler version which is different.
