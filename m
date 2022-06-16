Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC51454DAC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 08:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344922AbiFPGgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 02:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359210AbiFPGgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 02:36:17 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A4656C1D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 23:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655361375; x=1686897375;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6uO1/U8p9gV8E92GnIp5ctp/Lr3j2fXbsBDKvSrZ4xI=;
  b=t6A9lbExkSxPPPl13doDM/pSp5hUQbYbUgxZycjKw7eyB3Jybl0aZWDU
   7xVgbbStwYRfDu3nQ2YHqRfztXj2Mk3RZfM0bVuM4atj/prKnaG74YBwl
   bK4UJQ7KyWEyH5cj1XMBJRWU6kP5J+QmGrwXw3uZThWs1kuR9MLluQ4jX
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2022 23:36:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 23:36:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:36:13 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:36:11 -0700
Message-ID: <989c9a5b-7ca8-aa90-e789-6a4252bca7e4@quicinc.com>
Date:   Wed, 15 Jun 2022 23:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/mdp4: move iommu_domain_alloc() call close to
 its usage
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
 <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 5/5/2022 6:50 AM, Dmitry Baryshkov wrote:
> Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
> This allows us to drop it from struct mdp4_cfg_platform which
> remained from the pre-DT days.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 8 ++++----
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 1 -
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index fb48c8c19ec3..1fba6ab06eb1 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -388,6 +388,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct mdp4_kms *mdp4_kms;
>   	struct msm_kms *kms = NULL;
> +	struct iommu_domain *iommu;
>   	struct msm_gem_address_space *aspace;
>   	int irq, ret;
>   	u32 major, minor;
> @@ -495,9 +496,9 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	mdp4_disable(mdp4_kms);
>   	mdelay(16);
>   
> -	if (config->iommu) {
> -		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
> -			config->iommu);
> +	iommu = iommu_domain_alloc(pdev->dev.bus);
> +	if (iommu) {
> +		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
>   
>   		aspace  = msm_gem_address_space_create(mmu,
>   			"mdp4", 0x1000, 0x100000000 - 0x1000);
> @@ -557,7 +558,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>   
>   	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>   	config.max_clk = 266667000;
> -	config.iommu = iommu_domain_alloc(&platform_bus_type);
>   
>   	return &config;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index e8ee92ab7956..7cc549b6a82b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -44,7 +44,6 @@ struct mdp4_kms {
>   
>   /* platform config data (ie. from DT, or pdata) */
>   struct mdp4_platform_config {
> -	struct iommu_domain *iommu;
>   	uint32_t max_clk;
>   };
>   
