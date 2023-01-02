Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B4465B00C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 11:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjABKwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 05:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbjABKwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 05:52:17 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9AE62D0;
        Mon,  2 Jan 2023 02:52:13 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3026HN3k029485;
        Mon, 2 Jan 2023 10:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k9REcPPrfNLOnnRfbJEOwMzUHLTFcqDeBqHrIzrPZOs=;
 b=f5cr7ktYzDXoug42tSlpeFq45m4mqSb0GfrHrYMziVuoFUeQzh1w/eW26lBAF4nzqG51
 LDtlqQzFdWr8WTVnZS8EA8sHeK4PTZxyGVQqlQx6FZjZM6q+bdZQvzY648PSlh5bo9zd
 9uZwZek2tX7jVyZaBwDXD1mtRogaOSUDHfbQXL8MenyoAMlmexRq0J+xKk7nVXrQncux
 OnU/w99OlVDTzA9PSXtdkoW9bzg3qoyO0qIjyZTrwIOju8ik64PRUGcCQhYGr8UBtFUL
 dbol51+Cm3Aqj/zoRYStmL7x1W5isBxrZIXDn20kyt6oamTrsUxGTZeIHjy/LkORdgN8 bA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtduqaman-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Jan 2023 10:52:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 302Aq4gx022354
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 2 Jan 2023 10:52:04 GMT
Received: from [10.216.21.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 2 Jan 2023
 02:51:58 -0800
Message-ID: <442519fd-1bb7-1200-6b0f-97ddd5226411@quicinc.com>
Date:   Mon, 2 Jan 2023 16:21:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Make adreno quirks not
 overwrite each other
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <krzysztof.kozlowski@linaro.org>
CC:     <freedreno@lists.freedesktop.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
        <linux-kernel@vger.kernel.org>
References: <20230102100201.77286-1-konrad.dybcio@linaro.org>
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20230102100201.77286-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eNSBRZwgmE1BbAY9QzFGp5PvshGW6Csy
X-Proofpoint-ORIG-GUID: eNSBRZwgmE1BbAY9QzFGp5PvshGW6Csy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_06,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020098
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/2/2023 3:32 PM, Konrad Dybcio wrote:
> So far the adreno quirks have all been assigned with an OR operator,
> which is problematic, because they were assigned consecutive integer
> values, which makes checking them with an AND operator kind of no bueno..
>
> Switch to using BIT(n) so that only the quirks that the programmer chose
> are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
>
> Fixes: 370063ee427a ("drm/msm/adreno: Add A540 support")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> - pick up tags
> - correct the Fixes: tag
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c85857c0a228..5eb254c9832a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -29,11 +29,9 @@ enum {
>  	ADRENO_FW_MAX,
>  };
>  
> -enum adreno_quirks {
> -	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
> -	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
> -	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
> -};
> +#define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
> +#define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
> +#define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  
>  struct adreno_rev {
>  	uint8_t  core;
> @@ -65,7 +63,7 @@ struct adreno_info {
>  	const char *name;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
> -	enum adreno_quirks quirks;
> +	u64 quirks;
>  	struct msm_gpu *(*init)(struct drm_device *dev);
>  	const char *zapfw;
>  	u32 inactive_period;

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
