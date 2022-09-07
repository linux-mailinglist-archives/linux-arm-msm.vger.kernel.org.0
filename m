Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F015B0CE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 21:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIGTId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 15:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIGTIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 15:08:04 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF820A4076
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 12:08:03 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287H0JAu017489;
        Wed, 7 Sep 2022 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eeEc2voPp71viK5vgVaGtvAVvWTSZ5APzkNqQTcQV/A=;
 b=lJPO5oxvZa3uvOskWV6bnbywXKkmiBrFRwDtbRjgNN3V0aW+Smiwdto033HByNFx4B3U
 /5bRm6n4WkR38cpuQsRDCGpdZuiepWT8foBNL6+KSBPEAVmBlVFrV6E10FaajPYhoYBB
 1vvjLlNRvp7uAQ6TrVh3dsYZlyE6On5ahrEJcLCZGnriSVqAqYoOoR+OL9ZkdLQHcNR+
 UU27hguh5g0Oawg869J8nFWNPgeb5CNXugL4RfswnIekLpKjEUUQ7oFSmMLVRwMTFuZS
 nYxlkl2zIld4iVl9ly5Wgi1DrRdjkRziPEkgqhE0NMRYV4hOSXvIivg3ffyBASF+TWhQ eA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jer1x2f7f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 19:07:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 287J7vNL013501
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 7 Sep 2022 19:07:57 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 12:07:55 -0700
Message-ID: <c4953b3e-1fb6-5c26-2238-c76070f5b17e@quicinc.com>
Date:   Wed, 7 Sep 2022 12:07:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 5/5] drm/msm/hdmi: move msm_hdmi_get_phy() to
 msm_hdmi_dev_probe()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
 <20220826093927.851597-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220826093927.851597-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aK7T6E0P6JIBLg2A0_P-rZxl3o49qQUo
X-Proofpoint-GUID: aK7T6E0P6JIBLg2A0_P-rZxl3o49qQUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209070071
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/26/2022 2:39 AM, Dmitry Baryshkov wrote:
> To continue the idea of failing the probe() rather than failing the
> bind(), move the call to msm_hdmi_get_phy() function to
> msm_hdmi_dev_probe(), so that the driver fails the probe if PHY is not
> yet available rather than succeeding the probe and then failing the
> bind() with -EPROBE_DEFER.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 40 ++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 926274eeee25..adaa67d9a78d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -68,14 +68,17 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>   		destroy_workqueue(hdmi->workq);
>   	msm_hdmi_hdcp_destroy(hdmi);
>   
> +	if (hdmi->i2c)
> +		msm_hdmi_i2c_destroy(hdmi->i2c);
> +}
> +
> +static void msm_hdmi_put_phy(struct hdmi *hdmi)
> +{
>   	if (hdmi->phy_dev) {
>   		put_device(hdmi->phy_dev);
>   		hdmi->phy = NULL;
>   		hdmi->phy_dev = NULL;
>   	}
> -
> -	if (hdmi->i2c)
> -		msm_hdmi_i2c_destroy(hdmi->i2c);
>   }
>   
>   static int msm_hdmi_get_phy(struct hdmi *hdmi)
> @@ -91,19 +94,15 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>   	}
>   
>   	phy_pdev = of_find_device_by_node(phy_node);
> -	if (phy_pdev)
> -		hdmi->phy = platform_get_drvdata(phy_pdev);
> -
>   	of_node_put(phy_node);
>   
> -	if (!phy_pdev) {
> -		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!phy_pdev)
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
> +
> +	hdmi->phy = platform_get_drvdata(phy_pdev);
>   	if (!hdmi->phy) {
> -		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
>   		put_device(&phy_pdev->dev);
> -		return -EPROBE_DEFER;
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
>   	}
>   
>   	hdmi->phy_dev = &phy_pdev->dev;
> @@ -130,12 +129,6 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>   		goto fail;
>   	}
>   
> -	ret = msm_hdmi_get_phy(hdmi);
> -	if (ret) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
> -		goto fail;
> -	}
> -
>   	hdmi->hdcp_ctrl = msm_hdmi_hdcp_init(hdmi);
>   	if (IS_ERR(hdmi->hdcp_ctrl)) {
>   		dev_warn(&pdev->dev, "failed to init hdcp: disabled\n");
> @@ -528,6 +521,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   	if (hdmi->hpd_gpiod)
>   		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>   
> +	ret = msm_hdmi_get_phy(hdmi);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
> +		return ret;
> +	}
> +
>   	ret = devm_pm_runtime_enable(&pdev->dev);
>   	if (ret)
>   		return ret;
> @@ -539,7 +538,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   
>   static int msm_hdmi_dev_remove(struct platform_device *pdev)
>   {
> +	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
> +
>   	component_del(&pdev->dev, &msm_hdmi_ops);
> +
> +	msm_hdmi_put_phy(hdmi);
> +
>   	return 0;
>   }
>   
