Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F123859F0D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 03:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiHXBZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 21:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiHXBZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 21:25:14 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466082B60B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 18:25:12 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NNqEYl010733;
        Wed, 24 Aug 2022 01:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IzHXtqynfVwEe5eMwtZdRV4569xPU1BbuzTf2dKX8nI=;
 b=lQkrPKFI0IrNAw55l4MGIxQB2bJPm2KtMWv2/eyRo1EvxCzBmhPrNTJCQC9P5eUfuF+5
 MQwcbUtJuyWZLm972MBcSuNCeaGkqIFXEOL0Emjl9IO+i84G/pnsYF1mNMcjWWCsEFaP
 YH6ht+X8ca9L8OVgWYBIQLtwlH5vvCItuUv3MhEMatSGkDArp5/WCIk/IkAONNK46PG3
 15jL/1sMmJNML4fyh1bA1yDdsxr5+YTbzGu3uMC9P7NUC1bTTdxFco14mgtE6YBK7npA
 pQM31OqeUavWiesUdtcOOumKGLAWCRz+fUNWZe8HvG807ymfcoFqICVSkJZgaT5O11ll GQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pjhede-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Aug 2022 01:25:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27O1P7Gq003538
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Aug 2022 01:25:07 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 18:25:05 -0700
Message-ID: <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
Date:   Tue, 23 Aug 2022 18:25:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qvd7WFTPvdJfuu5igI6rJ_GubrGwxNBM
X-Proofpoint-GUID: Qvd7WFTPvdJfuu5igI6rJ_GubrGwxNBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> The rest of the code expects that master's device drvdata is the
> struct msm_drm_private instance. Do not override the mdp5's drvdata.
> 
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Is this just for consistency across mdp5/dpu drivers?

What issue was seen if mdp5's platform data is overwritten?

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index c668a4b27cc6..daf5b5ca7233 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>   							  slave_encoder);
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev);
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>   
>   static void mdp5_kms_destroy(struct msm_kms *kms)
>   {
> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>   	}
>   
>   	mdp_kms_destroy(&mdp5_kms->base);
> -	mdp5_destroy(mdp5_kms->pdev);
> +	mdp5_destroy(mdp5_kms);
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	return ret;
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev)
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>   {
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>   	int i;
>   
>   	if (mdp5_kms->ctlm)
> @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
>   		kfree(mdp5_kms->intfs[i]);
>   
>   	if (mdp5_kms->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_disable(&mdp5_kms->pdev->dev);
>   
>   	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>   	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	platform_set_drvdata(pdev, mdp5_kms);
> -
>   	spin_lock_init(&mdp5_kms->resource_lock);
>   
>   	mdp5_kms->dev = dev;
> @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	return 0;
>   fail:
>   	if (mdp5_kms)
> -		mdp5_destroy(pdev);
> +		mdp5_destroy(mdp5_kms);
>   	return ret;
>   }
>   
> @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
> @@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
