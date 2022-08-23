Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D9559EC42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 21:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbiHWT0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 15:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbiHWT0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 15:26:06 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFC613E9A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 11:12:24 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGjw1c013908;
        Tue, 23 Aug 2022 17:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8fLGhA7Bt8Qd6/SaI5ysg1yKxIN/iFrGLl2A3ahSzYU=;
 b=GhrcUqRu/FYfsxa5Uy8RtAMm6Wu9HldCukmw08/OlFiebMXvnwGzqHFDEG1BQ6sqwc31
 3v1JL0kSMeVfQbKhllmrq4h54qF0rVGUGOgPmoB3eL5ZpilxikbxYjq4DoBIKvhSkpnw
 9urbTF6crEUCqsP1S+oopfnpQ+FKRykB3G4xcARZ1/nDtaig1ERGYaFRE0JQaN+3uZEI
 vDoinN5IvlacG3xkzeuVZvapIQEfL/LL7amooWeLeqx95DOBUYHHiSaAq9gj70/eJ1nk
 2OW8iZueeAWFgXQ4F73jTSkYGiwdPwLXZSVUncEjY6Xrw+nMI2qHZ2obNf8uPXMszRzk Cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52ppr7ja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Aug 2022 17:40:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NHev0h032371
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Aug 2022 17:40:57 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 10:40:55 -0700
Message-ID: <8941ad9a-3fe2-c2b9-72c1-8e84947516e4@quicinc.com>
Date:   Tue, 23 Aug 2022 10:40:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] drm/msm/hdmi: drop constant resource names from
 platform config
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
 <20220616075947.347888-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220616075947.347888-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7dmSOcFXUubCFrVZflYr--97ZR3LAy5U
X-Proofpoint-GUID: 7dmSOcFXUubCFrVZflYr--97ZR3LAy5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230069
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/16/2022 12:59 AM, Dmitry Baryshkov wrote:
> All MSM HDMI devices use "core_physical" and "qfprom_physical" names for
> register areas. Drop them from the platform config.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 9 +++------
>   drivers/gpu/drm/msm/hdmi/hdmi.h | 3 ---
>   2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 9ff9a68b201b..8dfe5690366b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -133,7 +133,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>   	hdmi->config = config;
>   	spin_lock_init(&hdmi->reg_lock);
>   
> -	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
> +	hdmi->mmio = msm_ioremap(pdev, "core_physical");
>   	if (IS_ERR(hdmi->mmio)) {
>   		ret = PTR_ERR(hdmi->mmio);
>   		goto fail;
> @@ -141,14 +141,14 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>   
>   	/* HDCP needs physical address of hdmi register */
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -		config->mmio_name);
> +		"core_physical");
>   	if (!res) {
>   		ret = -EINVAL;
>   		goto fail;
>   	}
>   	hdmi->mmio_phy_addr = res->start;
>   
> -	hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
> +	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>   	if (IS_ERR(hdmi->qfprom_mmio)) {
>   		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>   		hdmi->qfprom_mmio = NULL;
> @@ -510,9 +510,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>   		return -ENXIO;
>   	}
>   
> -	hdmi_cfg->mmio_name     = "core_physical";
> -	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
> -
>   	dev->platform_data = hdmi_cfg;
>   
>   	hdmi = msm_hdmi_init(to_platform_device(dev));
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index a6c88d157bc3..7263bcbf4d06 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -84,9 +84,6 @@ struct hdmi {
>   
>   /* platform config data (ie. from DT, or pdata) */
>   struct hdmi_platform_config {
> -	const char *mmio_name;
> -	const char *qfprom_mmio_name;
> -
>   	/* regulators that need to be on for hpd: */
>   	const char **hpd_reg_names;
>   	int hpd_reg_cnt;
