Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E796D5AA4BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 03:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbiIBBA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 21:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbiIBBA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 21:00:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF5041D17
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 18:00:24 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2820AHCe002412;
        Fri, 2 Sep 2022 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DN7Ru5KLmieOhAv8GkQlyk+HPB8LjBsLoYLzxfaL72c=;
 b=ibQrDsJI4Iimev8bDAmFtd5xkRpH+u7zLrP9blQin0xY4rHooeTt7JB33ySF+Gbg/IMa
 DrBM3AiKeLHOqLFlW3PVhgErwD6S7RDPGuqJpm8CJ9Kq2eWKockI7MziMVurqtUvWlmb
 YRqIKQwZCYNuf4CDFnlcxpEYHtBYtU9yxfqIFz0ifCdiJzW4150Nb2VCgTTUwWZKUXi9
 RE7QObxqDB96G7RIMP6otY1aSIF5o1xpkp48p8SEmrcqErMJFkjxWlK6HITZrvXeRNZt
 qvyeIsXUvyW+g35KWJQGFnJTCGPNpL+/T3KY/vVbHc19MRKHtFoOTBuTw2G/KeheEnwH eA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jarc8327h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Sep 2022 01:00:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28210IYD002054
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Sep 2022 01:00:18 GMT
Received: from [10.111.173.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 18:00:15 -0700
Message-ID: <3489faa4-659d-6635-d20b-c34f9c6e6b18@quicinc.com>
Date:   Thu, 1 Sep 2022 18:00:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/4] drm/msm/mdp5: move resource allocation to the
 _probe function
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
 <20220620213054.1872954-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220620213054.1872954-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N6-cCYXzbawiAfhUjBjGlbqyjWc8nlWC
X-Proofpoint-GUID: N6-cCYXzbawiAfhUjBjGlbqyjWc8nlWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> To let the probe function bail early if any of the resources is
> unavailable, move resource allocattion from kms_init directly to the
> probe callback.

Seems to be the common typo in all the patches of this series

allocattion -> allocation

Apart from that, this one LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 97 +++++++++++-------------
>   1 file changed, 45 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index daf5b5ca7233..015388f262f4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -556,17 +556,18 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	struct mdp5_cfg *config;
>   	struct msm_kms *kms;
>   	struct msm_gem_address_space *aspace;
> -	int irq, i, ret;
> +	int i, ret;
>   	struct device *iommu_dev;
>   
> -	ret = mdp5_init(to_platform_device(dev->dev), dev);
> -
>   	/* priv->kms would have been populated by the MDP5 driver */
>   	kms = priv->kms;
>   	if (!kms)
>   		return -ENOMEM;
>   
>   	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> +
> +	ret = mdp5_init(to_platform_device(dev->dev), dev);
> +
>   	pdev = mdp5_kms->pdev;
>   
>   	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
> @@ -575,15 +576,6 @@ static int mdp5_kms_init(struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -	if (!irq) {
> -		ret = -EINVAL;
> -		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
> -		goto fail;
> -	}
> -
> -	kms->irq = irq;
> -
>   	config = mdp5_cfg_get_config(mdp5_kms->cfg);
>   
>   	/* make sure things are off before attaching iommu (bootloader could
> @@ -804,51 +796,17 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
>   static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
> -	struct mdp5_kms *mdp5_kms;
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   	struct mdp5_cfg *config;
>   	u32 major, minor;
>   	int ret;
>   
> -	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
> -	if (!mdp5_kms) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> -
> -	spin_lock_init(&mdp5_kms->resource_lock);
> -
>   	mdp5_kms->dev = dev;
> -	mdp5_kms->pdev = pdev;
>   
>   	ret = mdp5_global_obj_init(mdp5_kms);
>   	if (ret)
>   		goto fail;
>   
> -	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
> -	if (IS_ERR(mdp5_kms->mmio)) {
> -		ret = PTR_ERR(mdp5_kms->mmio);
> -		goto fail;
> -	}
> -
> -	/* mandatory clocks: */
> -	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
> -	if (ret)
> -		goto fail;
> -	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
> -	if (ret)
> -		goto fail;
> -	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
> -	if (ret)
> -		goto fail;
> -	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
> -	if (ret)
> -		goto fail;
> -
> -	/* optional clocks: */
> -	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
> -	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
> -	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
> -
>   	/* we need to set a default rate before enabling.  Set a safe
>   	 * rate first, then figure out hw revision, and then set a
>   	 * more optimal rate:
> @@ -906,9 +864,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	if (ret)
>   		goto fail;
>   
> -	/* set uninit-ed kms */
> -	priv->kms = &mdp5_kms->base.base;
> -
>   	return 0;
>   fail:
>   	if (mdp5_kms)
> @@ -951,15 +906,53 @@ static int mdp5_setup_interconnect(struct platform_device *pdev)
>   
>   static int mdp5_dev_probe(struct platform_device *pdev)
>   {
> -	int ret;
> +	struct mdp5_kms *mdp5_kms;
> +	int ret, irq;
>   
>   	DBG("");
>   
> +	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
> +	if (!mdp5_kms)
> +		return -ENOMEM;
> +
>   	ret = mdp5_setup_interconnect(pdev);
>   	if (ret)
>   		return ret;
>   
> -	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
> +	mdp5_kms->pdev = pdev;
> +
> +	spin_lock_init(&mdp5_kms->resource_lock);
> +
> +	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
> +	if (IS_ERR(mdp5_kms->mmio))
> +		return PTR_ERR(mdp5_kms->mmio);
> +
> +	/* mandatory clocks: */
> +	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
> +	if (ret)
> +		return ret;
> +	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
> +	if (ret)
> +		return ret;
> +	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
> +	if (ret)
> +		return ret;
> +	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
> +	if (ret)
> +		return ret;
> +
> +	/* optional clocks: */
> +	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
> +	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
> +	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
> +
> +	mdp5_kms->base.base.irq = irq;
> +
> +	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
>   }
>   
>   static int mdp5_dev_remove(struct platform_device *pdev)
