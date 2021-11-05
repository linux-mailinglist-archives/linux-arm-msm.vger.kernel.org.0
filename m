Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6118F445D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 02:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhKEBJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 21:09:32 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15919 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231133AbhKEBJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 21:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636074413; x=1667610413;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fXUzAmtlORo9GPNRcxy7NY5/rabltRVLJSlXVeirULg=;
  b=nKbcAzdS0wwla0orFprZ2JS5OV4Ruht0yDiSkaflB94bxtCy+Eo0KNgf
   KdGWDLnHH36VIHrz7vI3kRGRsUPgaF+CGwGiFTNqLnjeESSFVkjAeDKgk
   4YGqT/Cy0us6eTfiL+NTFo2O3675Vj0Fu7703D/Xhpz9LPnfXnhOCfT8D
   8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Nov 2021 18:06:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 18:06:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 4 Nov 2021 18:06:52 -0700
Received: from [10.38.242.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 4 Nov 2021
 18:06:50 -0700
Message-ID: <4ac088d4-3e6a-c5f9-97da-85f741414281@quicinc.com>
Date:   Thu, 4 Nov 2021 18:06:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: drop vdd regulator
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/3/2021 5:34 PM, Dmitry Baryshkov wrote:
> The "vdd" regulator was used by the mdp5 driver only on downstream
> kernels, where the GDSC is represented as a regulator. On all current
> kernels the MDSS_GDSC is implemented as the power domain, removing the
> need for this regulator. Remove it from the mdp5 driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 24 ++---------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> index 2f4895bcb0b0..2ac8fd37c76b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> @@ -16,8 +16,6 @@ struct mdp5_mdss {
>   
>   	void __iomem *mmio, *vbif;
>   
> -	struct regulator *vdd;
> -
>   	struct clk *ahb_clk;
>   	struct clk *axi_clk;
>   	struct clk *vsync_clk;
> @@ -189,8 +187,6 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
>   	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
>   	mdp5_mdss->irqcontroller.domain = NULL;
>   
> -	regulator_disable(mdp5_mdss->vdd);
> -
>   	pm_runtime_disable(dev->dev);
>   }
>   
> @@ -238,31 +234,17 @@ int mdp5_mdss_init(struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	/* Regulator to enable GDSCs in downstream kernels */
> -	mdp5_mdss->vdd = devm_regulator_get(dev->dev, "vdd");
> -	if (IS_ERR(mdp5_mdss->vdd)) {
> -		ret = PTR_ERR(mdp5_mdss->vdd);
> -		goto fail;
> -	}
> -
> -	ret = regulator_enable(mdp5_mdss->vdd);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n",
> -			ret);
> -		goto fail;
> -	}
> -
>   	ret = devm_request_irq(dev->dev, platform_get_irq(pdev, 0),
>   			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to init irq: %d\n", ret);
> -		goto fail_irq;
> +		goto fail;
>   	}
>   
>   	ret = mdss_irq_domain_init(mdp5_mdss);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
> -		goto fail_irq;
> +		goto fail;
>   	}
>   
>   	mdp5_mdss->base.funcs = &mdss_funcs;
> @@ -271,8 +253,6 @@ int mdp5_mdss_init(struct drm_device *dev)
>   	pm_runtime_enable(dev->dev);
>   
>   	return 0;
> -fail_irq:
> -	regulator_disable(mdp5_mdss->vdd);
>   fail:
>   	return ret;
>   }
> 
