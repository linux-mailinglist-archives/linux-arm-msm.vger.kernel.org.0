Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F97854D072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 19:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245372AbiFORzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 13:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbiFORzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 13:55:24 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506E144766
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655315723; x=1686851723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+eIIEZKk3dvBxjAF6pJdeSvTC4ae8wbVP989QBksmwU=;
  b=O5nc93uB9sIwxk981fm5wDF94rEbMoxYpZNXQ0YO92DFIaoc+tMY/Y72
   RKt0Az3On0fewAqAEzfJWuV7X0ITVoockMABtzMcKOg04eJuX/dnLR8v3
   qfFgL92bdOXPZ3Ihobw4einSm+fVeAPddDf9tXzGGF38u9+EqYn+onu/O
   0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 10:55:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 10:55:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 10:55:22 -0700
Received: from [10.38.242.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 10:55:19 -0700
Message-ID: <14f2d0e2-6c34-e244-26a4-79638b147592@quicinc.com>
Date:   Wed, 15 Jun 2022 10:55:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 1/5] drm/msm/dpu: check both DPU and MDSS
 devices for the IOMMU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        "Robin Murphy" <robin.murphy@arm.com>,
        <dri-devel@lists.freedesktop.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        <freedreno@lists.freedesktop.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/4/2022 5:16 PM, Dmitry Baryshkov wrote:
> Follow the lead of MDP5 driver and check both DPU and MDSS devices for
> the IOMMU specifiers.
> 
> Historically DPU devices had IOMMU specified in the MDSS device tree
> node, but as some of MDP5 devices are being converted to the supported
> by the DPU driver, the driver should adapt and check both devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 143d6643be53..5ccda0766f6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1004,14 +1004,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>   	struct msm_mmu *mmu;
>   	struct device *dpu_dev = dpu_kms->dev->dev;
>   	struct device *mdss_dev = dpu_dev->parent;
> +	struct device *iommu_dev;
>   
>   	domain = iommu_domain_alloc(&platform_bus_type);
>   	if (!domain)
>   		return 0;
>   
> -	/* IOMMUs are a part of MDSS device tree binding, not the
> -	 * MDP/DPU device. */
> -	mmu = msm_iommu_new(mdss_dev, domain);
> +	/*
> +	 * IOMMUs can be a part of MDSS device tree binding, or the
> +	 * MDP/DPU device.
> +	 */

Can you please explain this a little more?

So even if some of the mdp5 devices are getting converted to use DPU 
driver, their device trees are also updated right?

In other words, if DPU driver was using mdss_dev to initialize the 
iommu, why should the new devices which are going to use DPU have the 
binding in the dpu_dev?


> +	if (dev_iommu_fwspec_get(dpu_dev))
> +		iommu_dev = dpu_dev;
> +	else
> +		iommu_dev = mdss_dev;
> +
> +	mmu = msm_iommu_new(iommu_dev, domain);
>   	if (IS_ERR(mmu)) {
>   		iommu_domain_free(domain);
>   		return PTR_ERR(mmu);
