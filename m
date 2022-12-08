Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B749647982
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 00:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiLHXNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 18:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiLHXNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 18:13:08 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C2D72842;
        Thu,  8 Dec 2022 15:13:07 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8N04LA030276;
        Thu, 8 Dec 2022 23:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bljkY9MoelPTYhMmQSTzoWmYaEetjYZoDvIg35dNTKM=;
 b=Tmp8WqhS8LMdiNxDOkaTwTiEutYjJ3LapDKoRiFu7zPrUkT4wPHd+ZMCCs3Au0l6VIdp
 YS5czt1LqYjxpEbQapz1Ypt8gIDCwycB7phrmddhhHu18g5DN3GQ7mfA2QgVms7dEnCp
 MXk/YaBJOmMUd5mx/Vo0sc0H7MgvKbl1NAOOaBpulXACwerSgvPI0M6CIyQuoLjvLo9l
 WPOZdxx1Ih/AxWFDKAz9vWYw5VBcjtCJcnrm2NImeLPo4oMWHFCvrA+lmVVhWzQSu1Og
 NR/kLAVO25zNUjNJnAJUD5googlvFQ76xVVJ2/jAvi6Bi4S4GEPFScOuv/pBxZhPsIe1 ww== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbr2v84d0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Dec 2022 23:12:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8NCul2025615
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 8 Dec 2022 23:12:56 GMT
Received: from [10.110.56.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 15:12:54 -0800
Message-ID: <0c410565-6281-4455-d02c-48ef9c90ff4c@quicinc.com>
Date:   Thu, 8 Dec 2022 15:12:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 05/12] drm/msm/dp: Stop using DP id as index in desc
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        "Johan Hovold" <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-6-quic_bjorande@quicinc.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20221207220012.16529-6-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yCReIGnBRcTm4h70pm-wfFm-OoFpjZBt
X-Proofpoint-GUID: yCReIGnBRcTm4h70pm-wfFm-OoFpjZBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080191
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/7/2022 2:00 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> In the SC8280XP platform there are two identical MDSS instances, each
> with the same set of DisplayPort instances, at different addresses.
>
> By not relying on the index to define the instance id it's possible to
> describe them both in the same table and hence have a single compatible.
>
> While at it, flatten the cfg/desc structure so that the match data is
> just an array of descs.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>
> Changes since v4:
> - None
>
>   drivers/gpu/drm/msm/dp/dp_display.c | 72 ++++++++++-------------------
>   1 file changed, 25 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7ff60e5ff325..eeb292f1ad1b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -122,61 +122,41 @@ struct dp_display_private {
>   
>   struct msm_dp_desc {
>   	phys_addr_t io_start;
> +	unsigned int id;
>   	unsigned int connector_type;
>   	bool wide_bus_en;
>   };
>   
> -struct msm_dp_config {
> -	const struct msm_dp_desc *descs;
> -	size_t num_descs;
> -};
> -
>   static const struct msm_dp_desc sc7180_dp_descs[] = {
> -	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -};
> -
> -static const struct msm_dp_config sc7180_dp_cfg = {
> -	.descs = sc7180_dp_descs,
> -	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{}
>   };
>   
>   static const struct msm_dp_desc sc7280_dp_descs[] = {
> -	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> -	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> -};
> -
> -static const struct msm_dp_config sc7280_dp_cfg = {
> -	.descs = sc7280_dp_descs,
> -	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> +	{}
>   };
>   
>   static const struct msm_dp_desc sc8180x_dp_descs[] = {
> -	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> -};
> -
> -static const struct msm_dp_config sc8180x_dp_cfg = {
> -	.descs = sc8180x_dp_descs,
> -	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +	{}
>   };
>   
>   static const struct msm_dp_desc sm8350_dp_descs[] = {
> -	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -};
> -
> -static const struct msm_dp_config sm8350_dp_cfg = {
> -	.descs = sm8350_dp_descs,
> -	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{}
>   };
>   
>   static const struct of_device_id dp_dt_match[] = {
> -	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> -	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
> -	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> -	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> -	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
> -	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
> +	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
> +	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> +	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> +	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
> +	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
> +	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
>   	{}
>   };
>   
> @@ -1262,10 +1242,9 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>   	return 0;
>   }
>   
> -static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev,
> -						     unsigned int *id)
> +static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
>   {
> -	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +	const struct msm_dp_desc *descs = of_device_get_match_data(&pdev->dev);
>   	struct resource *res;
>   	int i;
>   
> @@ -1273,11 +1252,9 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>   	if (!res)
>   		return NULL;
>   
> -	for (i = 0; i < cfg->num_descs; i++) {
> -		if (cfg->descs[i].io_start == res->start) {
> -			*id = i;
> -			return &cfg->descs[i];
> -		}
> +	for (i = 0; i < descs[i].io_start; i++) {
> +		if (descs[i].io_start == res->start)
> +			return &descs[i];
>   	}
>   
>   	dev_err(&pdev->dev, "unknown displayport instance\n");
> @@ -1299,12 +1276,13 @@ static int dp_display_probe(struct platform_device *pdev)
>   	if (!dp)
>   		return -ENOMEM;
>   
> -	desc = dp_display_get_desc(pdev, &dp->id);
> +	desc = dp_display_get_desc(pdev);
>   	if (!desc)
>   		return -EINVAL;
>   
>   	dp->pdev = pdev;
>   	dp->name = "drm_dp";
> +	dp->id = desc->id;
>   	dp->dp_display.connector_type = desc->connector_type;
>   	dp->wide_bus_en = desc->wide_bus_en;
>   	dp->dp_display.is_edp =
