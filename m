Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9E966A5E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 23:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjAMWXj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 17:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjAMWXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 17:23:33 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C55A7814E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 14:23:32 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DLUqS4028811;
        Fri, 13 Jan 2023 22:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3N0oIrnWUfEYNL5bsvQGK5JZTSS350cvtmrsLKB1yYE=;
 b=hlOAkATYuZxJVzqVzI+rxgf2YnXWQu3oX4eP7OBXVkPUQHmGoQGuIZoFpjJGzraEOica
 FMQDav4FvbV/QAs66nd7AGmpUplImvQLNPBZI/IqXTRgVarQEUXMC1Mw3WdioiIbfWk9
 d9pMicMvckYDDPSEyVsb0TPbyBKZxTJpxzTkGaR23UtYE1fFZGHL9WzbplvbJ7gOzedy
 tfQjTjK6H69yw4EKTHkFgFapahB3InB9KsNpaR1kEpAntLzxsutUI9Jkkz31MZO06nvm
 tf9lCAEUJwe3redqV2vsxxbBNYYyBVN0jNPC+MbA84/PcKxePvk6wZ0ahuUMi0zWLfsR Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2s0cttys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 22:23:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DMNOrB028997
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 22:23:24 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 14:23:24 -0800
Message-ID: <42e6df3d-a566-eab1-b081-1652b5a2838e@quicinc.com>
Date:   Fri, 13 Jan 2023 14:23:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 4/4] drm/msm/mdss: add the sdm845 data for
 completeness
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221208000850.312548-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7XI-XTbzszB2pjuy9GqB33THu1Gr-ZEV
X-Proofpoint-GUID: 7XI-XTbzszB2pjuy9GqB33THu1Gr-ZEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130153
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> Add the platform data for sdm845 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 5e19ec897670..b2c6e8b12469 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -532,6 +532,11 @@ static const struct msm_mdss_data sc8280xp_data = {
>   	.macrotile_mode = 1,
>   };
>   
> +static const struct msm_mdss_data sdm845_data = {
> +	.ubwc_version = UBWC_2_0,
> +	.highest_bank_bit = 2,
> +};
> +
>   static const struct msm_mdss_data sm8150_data = {
>   	.ubwc_version = UBWC_3_0,
>   	.highest_bank_bit = 2,
> @@ -556,7 +561,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,mdss" },
>   	{ .compatible = "qcom,msm8998-mdss" },
>   	{ .compatible = "qcom,qcm2290-mdss" },
> -	{ .compatible = "qcom,sdm845-mdss" },
> +	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>   	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>   	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
>   	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
