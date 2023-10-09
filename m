Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D8E7BE9C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378087AbjJISj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378105AbjJISj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:39:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2452AAC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:39:26 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399HgjRd029150;
        Mon, 9 Oct 2023 18:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iRVQ2MUWUlljR9nA/kJhESWUtK+PFvarIXUgc99Ty4Y=;
 b=C8Rk9xPwpMmFwXLgeWGAosVWDB+i+t9ATVkFylCfOwXbt79mwyGqXlMABqH0I778G0rw
 PjP4+FyJh7BuBVFoyspoQs7oG4xRcTirVGJ71cQpcpscKyYyIkciWogGq3IMtZlhv/cl
 SER6hhO7UI2ATLNRc5FWS0LuqDTJmvRvUO+Fpp2e7HpEv8lrmaPtq2Mi4mfbmcoFW6hz
 7O/aV1gsOe+MxvskDM8EmJgnH4B/Z0zKptptMVLIY+95I0YZon1PFDxnh8mrbl8WBHtw
 wZInhfIOmJUxpcG3ceifO10OsJSd5LHdWkJ1nm7k6devZxYXvO3MfQ5zcGOrxC3JgsbZ jw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkhx2k6vb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 18:39:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399IdEN3031176
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Oct 2023 18:39:14 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 11:39:13 -0700
Message-ID: <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
Date:   Mon, 9 Oct 2023 11:39:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
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
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YpHS30YR64Soi43DQqnEptoAcSqb_JT1
X-Proofpoint-ORIG-GUID: YpHS30YR64Soi43DQqnEptoAcSqb_JT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_17,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090152
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
> Make MSM DSI driver use devm_drm_bridge_add() instead of plain
> drm_bridge_add(). As the driver doesn't require any additional cleanup,
> stop adding created bridge to the priv->bridges array.
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
>   3 files changed, 16 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index d45e43024802..47f327e68471 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   			 struct drm_encoder *encoder)
>   {
> -	struct msm_drm_private *priv = dev->dev_private;
>   	int ret;
>   
> -	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> -		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
> -		return -ENOSPC;
> -	}
> -
>   	msm_dsi->dev = dev;
>   
>   	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to modeset init host: %d\n", ret);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
> @@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   
>   	msm_dsi->encoder = encoder;
>   
> -	msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
> -	if (IS_ERR(msm_dsi->bridge)) {
> -		ret = PTR_ERR(msm_dsi->bridge);
> +	ret = msm_dsi_manager_bridge_init(msm_dsi);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
> -		msm_dsi->bridge = NULL;
> -		goto fail;
> +		return ret;
>   	}
>   
>   	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev,
>   			"failed to create dsi connector: %d\n", ret);
> -		goto fail;
> +		return ret;
>   	}
>   
> -	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
> -
>   	return 0;
> -fail:
> -	/* bridge/connector are normally destroyed by drm: */
> -	if (msm_dsi->bridge) {
> -		msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
> -		msm_dsi->bridge = NULL;
> -	}

We can drop msm_dsi_manager_bridge_destroy() now but dont we need to 
keep the part to reset msm_dsi->bridge to NULL in the fail tag if 
msm_dsi_manager_ext_bridge_init() fails?

> -
> -	return ret;
>   }
>   
>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index d21867da78b8..a01c326774a6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -56,8 +56,7 @@ struct msm_dsi {
>   };
>   
>   /* dsi manager */
> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
>   int msm_dsi_manager_ext_bridge_init(u8 id);
>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 28b8012a21f2..17aa19bb6510 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -466,9 +466,8 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>   };
>   
>   /* initialize bridge */
> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
>   {
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct drm_bridge *bridge = NULL;
>   	struct dsi_bridge *dsi_bridge;
>   	struct drm_encoder *encoder;
> @@ -476,31 +475,27 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>   
>   	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
>   				sizeof(*dsi_bridge), GFP_KERNEL);
> -	if (!dsi_bridge) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> +	if (!dsi_bridge)
> +		return -ENOMEM;
>   
> -	dsi_bridge->id = id;
> +	dsi_bridge->id = msm_dsi->id;
>   
>   	encoder = msm_dsi->encoder;
>   
>   	bridge = &dsi_bridge->base;
>   	bridge->funcs = &dsi_mgr_bridge_funcs;
>   
> -	drm_bridge_add(bridge);
> +	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
> +	if (ret)
> +		return ret;
>   
>   	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
> -	return bridge;
> +	msm_dsi->bridge = bridge;
>   
> -fail:
> -	if (bridge)
> -		msm_dsi_manager_bridge_destroy(bridge);
> -
> -	return ERR_PTR(ret);
> +	return 0;
>   }
>   
>   int msm_dsi_manager_ext_bridge_init(u8 id)
> @@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>   	return 0;
>   }
>   
> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
> -{
> -	drm_bridge_remove(bridge);
> -}
> -
>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
>   {
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
