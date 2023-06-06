Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF11724D75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 21:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239371AbjFFTq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 15:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239621AbjFFTqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 15:46:15 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42041FF2;
        Tue,  6 Jun 2023 12:45:33 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JXltd004648;
        Tue, 6 Jun 2023 19:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OgaSg+Ke0XSNUg8dd95ErabtjWzkLmBmb0ap50xQEuU=;
 b=XAsCQ80Iw22/mhlx3vFj9ztzLkLZZCrFm3BbkotSbqojnGRzhpgVAaQ57XKTq/TYEQmc
 lC5E2WkuYrCtbJihtzp7Q+b+vMbKLDuEKU96z99KKutSEwzQyJtdxDTlM8Lx0rOxJiWS
 OJFsBFsQCcAQy9W2ee64vDZ0K7Qezr44yXSZew1JrSuqEVJ788Kk+G8PbYkmm57u/hNS
 Dg7Viza3qSjv9Z7/9X6Ft6JpZbvWFig8sRfOrbvuyRwiRNHq1tPJDP3r/jBye3xrcicn
 iAmz4JJ5untSJ9/qe0VjakgmlmPhgCNdl3Lj3d6o/wFuBD71yZglFO6xyLpVD4rLk1QO QA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a6y83vw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 19:44:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356JiqPH010442
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Jun 2023 19:44:53 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 12:44:52 -0700
Message-ID: <51403425-caba-0d38-531a-3e8134cceb50@quicinc.com>
Date:   Tue, 6 Jun 2023 12:44:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3 5/7] drm/msm/dsi: Add configuration for
 MSM8226
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-5-b6284145d67a@z3ntu.xyz>
From:   Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230308-msm8226-mdp-v3-5-b6284145d67a@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XjkoyKXwzTD-WjQ1YWqu1h1RGTgvrxXn
X-Proofpoint-ORIG-GUID: XjkoyKXwzTD-WjQ1YWqu1h1RGTgvrxXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060167
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/1/2023 10:00 AM, Luca Weiss wrote:
> Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
> existing bits from other revisions that are identical for v1.0.2.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 29ccd755cc2e..8a5fb6df7210 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -245,6 +245,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>   		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0,
>   		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0_2,
> +		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1,
>   		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1_1,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 91bdaf50bb1a..43f0dd74edb6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -11,6 +11,7 @@
>   #define MSM_DSI_VER_MAJOR_V2	0x02
>   #define MSM_DSI_VER_MAJOR_6G	0x03
>   #define MSM_DSI_6G_VER_MINOR_V1_0	0x10000000
> +#define MSM_DSI_6G_VER_MINOR_V1_0_2	0x10000002
>   #define MSM_DSI_6G_VER_MINOR_V1_1	0x10010000
>   #define MSM_DSI_6G_VER_MINOR_V1_1_1	0x10010001
>   #define MSM_DSI_6G_VER_MINOR_V1_2	0x10020000
> 
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
