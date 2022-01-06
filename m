Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF43E486DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245537AbiAFXbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245491AbiAFXbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:31:42 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B06DC061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:31:42 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so4793361otu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/iQuGmfWVCkASUQJWaEZjxwQAvZNH3XGdLjyGaFqjM=;
        b=QYekmvEyoXHRscB62NK9bJUtGw8ZD99/DIFRGyeHrPx3wzvFj/kwtu+NC4BYqZl8I/
         8BgPS2GskUr/7xzGX//DJdT4KPVPHNdSr8VotN9gPvsqZgPV9AjoahEjTv60wfNrSL44
         68XfzjkVYMo1XYk1fdTw/jHVwlPDt/RrYeQhw7uZ+xuP1ZR84chvBSzZ2kUeeXPGVlGI
         fCdZcsaVHOSajq8XA3RX49EbeS7bHBJRXOLhtCPcKWnB9I8Ptzph1P0sAKhDVs7hFZoP
         NTm0fwdXH+6ppEyfgZc6EaEZHPg/2WcGKiokFtDLBo+NgCQUDLLDBFabFTd+4L/0eYby
         kIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/iQuGmfWVCkASUQJWaEZjxwQAvZNH3XGdLjyGaFqjM=;
        b=k/HyK76nOKcbqF585XnrcK7T6KUTI0cmzYQDbPdXwgJqPB2uqQoaVim4brSNuCSvKS
         TTKXS1q4+/QJjLhta71aA/xiadokhGpKNw6t7xSS2IEJRKSn8ECsIf0CUWDrFJOX+B2a
         atgbJl8vTdMTRTzQ7JBKgL0pthchfsZxECIhOa8V//e+x1KtyxIR2VjVkNZfvfBvuVgG
         17GCWypxUmqwsP7Ix3vtAjNHuiRd9nWWMrSrqF2o5pXCE2DhNGkQQ5upMvlzf5QHIQVi
         odHW1ztV2SI8qRCz40j8f5iYSf03g6Nl3QxyM9WC5K8kzuiKfA3+6jKaAqVK5rDVQWhF
         JOLw==
X-Gm-Message-State: AOAM533wJdDeC8FeNJe0+RjFGgLg6emvT+eBh3juNY83+zkpv8j8ahcC
        epBEapzEgIVM4K7izGqheRxIEQ==
X-Google-Smtp-Source: ABdhPJwwvy1O+83ffycRY9f/jcSNfUXGTP0v3GbYn5nK1x1SBIZ23uQYgrNJb6+fJc8BSLGhw3LwBA==
X-Received: by 2002:a9d:700b:: with SMTP id k11mr42420380otj.141.1641511901355;
        Thu, 06 Jan 2022 15:31:41 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 2sm613946otm.41.2022.01.06.15.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:31:41 -0800 (PST)
Date:   Thu, 6 Jan 2022 15:32:28 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
        rui.zhang@intel.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 1/3] thermal: qcom: lmh: Add support for sm8150
Message-ID: <Ydd8DAAEClRcklTy@ripper>
References: <20220106173138.411097-1-thara.gopinath@linaro.org>
 <20220106173138.411097-2-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106173138.411097-2-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 09:31 PST 2022, Thara Gopinath wrote:

> Add compatible to support LMh for sm8150 SoC.
> sm8150 does not require explicit enabling for various LMh subsystems.
> Add a variable indicating the same as match data which is set for sdm845.
> Execute the piece of code enabling various LMh subsystems only if
> enable algorithm match data is present.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Thara,
Bjorn

> ---
> 
> v2->v3:
> 	- use of_device_get_match_data to get the data from match table
> 	  rather than using of_match_device and subsequent ->data, as per
> 	  Bjorn's review comments.
> 	- Minor fixes as per Bjorn's review comments.
> 
> v1->v2:
> 	- Added LMH_ENABLE_ALGOS of_device_id match data to indicate
> 	  whether LMh subsytems need explicit enabling or not.
>  drivers/thermal/qcom/lmh.c | 62 +++++++++++++++++++++-----------------
>  1 file changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
> index eafa7526eb8b..c7f91cbdccc7 100644
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@ -28,6 +28,8 @@
>  
>  #define LMH_REG_DCVS_INTR_CLR		0x8
>  
> +#define LMH_ENABLE_ALGOS		1
> +
>  struct lmh_hw_data {
>  	void __iomem *base;
>  	struct irq_domain *domain;
> @@ -90,6 +92,7 @@ static int lmh_probe(struct platform_device *pdev)
>  	struct device_node *cpu_node;
>  	struct lmh_hw_data *lmh_data;
>  	int temp_low, temp_high, temp_arm, cpu_id, ret;
> +	unsigned int enable_alg;
>  	u32 node_id;
>  
>  	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
> @@ -141,32 +144,36 @@ static int lmh_probe(struct platform_device *pdev)
>  	if (!qcom_scm_lmh_dcvsh_available())
>  		return -EINVAL;
>  
> -	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
> -				 LMH_NODE_DCVS, node_id, 0);
> -	if (ret)
> -		dev_err(dev, "Error %d enabling current subfunction\n", ret);
> -
> -	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_REL, LMH_ALGO_MODE_ENABLE, 1,
> -				 LMH_NODE_DCVS, node_id, 0);
> -	if (ret)
> -		dev_err(dev, "Error %d enabling reliability subfunction\n", ret);
> -
> -	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_BCL, LMH_ALGO_MODE_ENABLE, 1,
> -				 LMH_NODE_DCVS, node_id, 0);
> -	if (ret)
> -		dev_err(dev, "Error %d enabling BCL subfunction\n", ret);
> -
> -	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_THERMAL, LMH_ALGO_MODE_ENABLE, 1,
> -				 LMH_NODE_DCVS, node_id, 0);
> -	if (ret) {
> -		dev_err(dev, "Error %d enabling thermal subfunction\n", ret);
> -		return ret;
> -	}
> -
> -	ret = qcom_scm_lmh_profile_change(0x1);
> -	if (ret) {
> -		dev_err(dev, "Error %d changing profile\n", ret);
> -		return ret;
> +	enable_alg = (uintptr_t)of_device_get_match_data(dev);
> +
> +	if (enable_alg) {
> +		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
> +					 LMH_NODE_DCVS, node_id, 0);
> +		if (ret)
> +			dev_err(dev, "Error %d enabling current subfunction\n", ret);
> +
> +		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_REL, LMH_ALGO_MODE_ENABLE, 1,
> +					 LMH_NODE_DCVS, node_id, 0);
> +		if (ret)
> +			dev_err(dev, "Error %d enabling reliability subfunction\n", ret);
> +
> +		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_BCL, LMH_ALGO_MODE_ENABLE, 1,
> +					 LMH_NODE_DCVS, node_id, 0);
> +		if (ret)
> +			dev_err(dev, "Error %d enabling BCL subfunction\n", ret);
> +
> +		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_THERMAL, LMH_ALGO_MODE_ENABLE, 1,
> +					 LMH_NODE_DCVS, node_id, 0);
> +		if (ret) {
> +			dev_err(dev, "Error %d enabling thermal subfunction\n", ret);
> +			return ret;
> +		}
> +
> +		ret = qcom_scm_lmh_profile_change(0x1);
> +		if (ret) {
> +			dev_err(dev, "Error %d changing profile\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	/* Set default thermal trips */
> @@ -213,7 +220,8 @@ static int lmh_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id lmh_table[] = {
> -	{ .compatible = "qcom,sdm845-lmh", },
> +	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
> +	{ .compatible = "qcom,sm8150-lmh", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, lmh_table);
> -- 
> 2.25.1
> 
