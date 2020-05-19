Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0BB1D8D3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 03:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgESBnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 21:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgESBnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 21:43:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC3EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 18:42:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 145so5783813pfw.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 18:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Slf7JvWKOrM5x0/oFbmF5JJYCBnsK+Ra0wqdUtMN3PI=;
        b=d6Vp9MSwRJLOki7yPmsFP9mtreGeqohuis73sWEhgrcFYq0NCg+DdODWp7JbWlpmsC
         40DHVtyAZTwv9j60eD4l7aNT5Z8A/jr5T7yEVrEiewA0xp4t5oa+kpa++9NnVekVk9kU
         rseFenuXW3aZaXjw2sea/r89ld2mr27Ko0dlaSICFAi2P+H8AKiR5GXQtHVeyGYwFxai
         s3SesYrMYBTcXbHvdSR4dw6B7htGt4cnDcLtY/5RnV2AdXbwSQ6YkLf8qtlda9QkT8oC
         Tu5mQoqTlqjgNa9DbGtrdKjcTDYgMwqsFu5ubJLnATlwTn2DYZaUfE4MgHl35bBUR5y4
         a9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Slf7JvWKOrM5x0/oFbmF5JJYCBnsK+Ra0wqdUtMN3PI=;
        b=FC1adCT5nmNHk8QEVKKEM141lvn1VdHD45mW4dVY8hJNShd1tulFJnJwTNIzd0ObGo
         Vtmg/fbFK4+GC6wz/u89SqwstoUH0OFm7X/JHWYvx5nN/6hD23pDt54rQ+G1UuNmVRcG
         uafryER6NUYpOlNzj+j3XMcOgXnvs2TG9qn1MMF5ujlhb7SdQv2JuV2V7gqDgDhDDPul
         txSU98j+5tzgTfVqFlL5u9/SxA8fiIeZRrlHZeF69MFz43jm4M972jKkG8G/TXQAx50n
         gcthLDxnw9X0Z2mmj1vC5LxoRoDHjBeMUq14vA7HNhbl8FWf7mDEB1YV2mF2W73FDLJK
         T4Qg==
X-Gm-Message-State: AOAM531ux3n6vunUPkHfnDhQgrbzQXgquRjx8euyDtWP7Rf+mB92IQ63
        0DF4cYD0XeV4wi1rvKavHi8KmQ==
X-Google-Smtp-Source: ABdhPJx65eKPngn5OVLo7uoRDLU6Jsu4qJjlV5sooVcPZdPqE8dlBaKsMWwqnQE75tPyXN6IiNKBbw==
X-Received: by 2002:a63:b146:: with SMTP id g6mr17214044pgp.396.1589852578368;
        Mon, 18 May 2020 18:42:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 14sm605798pjm.49.2020.05.18.18.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:42:57 -0700 (PDT)
Date:   Mon, 18 May 2020 18:41:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2] iommu/qcom: add optional 'tbu' clock for TLB
 invalidate
Message-ID: <20200519014135.GV2165@builder.lan>
References: <20200518141656.26284-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518141656.26284-1-shawn.guo@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 07:16 PDT 2020, Shawn Guo wrote:

> On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> will not be correctly reflected, causing the system to go into a bad
> state.  Add it as an optional clock, so that platforms that have this
> clock can pass it over DT.
> 
> While adding the third clock, let's switch to bulk clk API to simplify
> the enable/disable calls.  clk_bulk_get() cannot used because the
> existing two clocks are required while the new one is optional.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
>  - Use devm_clk_get_optional() to simplify code and improve readability.
>  - Rename the new clock from 'tlb' to 'tbu'.
>  - qcom_iommu: use bulk clk API to simplfy enable/disable.
> 
>  drivers/iommu/qcom_iommu.c | 62 ++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 0e2a96467767..116d8188f87f 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -37,14 +37,20 @@
>  
>  #define SMMU_INTR_SEL_NS     0x2000
>  
> +enum qcom_iommu_clk {
> +	CLK_IFACE,
> +	CLK_BUS,
> +	CLK_TBU,
> +	CLK_NUM,
> +};
> +
>  struct qcom_iommu_ctx;
>  
>  struct qcom_iommu_dev {
>  	/* IOMMU core code handle */
>  	struct iommu_device	 iommu;
>  	struct device		*dev;
> -	struct clk		*iface_clk;
> -	struct clk		*bus_clk;
> +	struct clk_bulk_data clks[CLK_NUM];
>  	void __iomem		*local_base;
>  	u32			 sec_id;
>  	u8			 num_ctxs;
> @@ -626,32 +632,6 @@ static const struct iommu_ops qcom_iommu_ops = {
>  	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>  };
>  
> -static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
> -{
> -	int ret;
> -
> -	ret = clk_prepare_enable(qcom_iommu->iface_clk);
> -	if (ret) {
> -		dev_err(qcom_iommu->dev, "Couldn't enable iface_clk\n");
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(qcom_iommu->bus_clk);
> -	if (ret) {
> -		dev_err(qcom_iommu->dev, "Couldn't enable bus_clk\n");
> -		clk_disable_unprepare(qcom_iommu->iface_clk);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
> -{
> -	clk_disable_unprepare(qcom_iommu->bus_clk);
> -	clk_disable_unprepare(qcom_iommu->iface_clk);
> -}
> -
>  static int qcom_iommu_sec_ptbl_init(struct device *dev)
>  {
>  	size_t psize = 0;
> @@ -808,6 +788,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	struct qcom_iommu_dev *qcom_iommu;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
> +	struct clk *clk;
>  	int ret, max_asid = 0;
>  
>  	/* find the max asid (which is 1:1 to ctx bank idx), so we know how
> @@ -827,17 +808,26 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	if (res)
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
>  
> -	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
> -	if (IS_ERR(qcom_iommu->iface_clk)) {
> +	clk = devm_clk_get(dev, "iface");
> +	if (IS_ERR(clk)) {
>  		dev_err(dev, "failed to get iface clock\n");
> -		return PTR_ERR(qcom_iommu->iface_clk);
> +		return PTR_ERR(clk);
>  	}
> +	qcom_iommu->clks[CLK_IFACE].clk = clk;
>  
> -	qcom_iommu->bus_clk = devm_clk_get(dev, "bus");
> -	if (IS_ERR(qcom_iommu->bus_clk)) {
> +	clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(clk)) {
>  		dev_err(dev, "failed to get bus clock\n");
> -		return PTR_ERR(qcom_iommu->bus_clk);
> +		return PTR_ERR(clk);
> +	}
> +	qcom_iommu->clks[CLK_BUS].clk = clk;
> +
> +	clk = devm_clk_get_optional(dev, "tbu");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "failed to get tbu clock\n");
> +		return PTR_ERR(clk);
>  	}
> +	qcom_iommu->clks[CLK_TBU].clk = clk;
>  
>  	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
>  				 &qcom_iommu->sec_id)) {
> @@ -909,14 +899,14 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
>  {
>  	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
>  
> -	return qcom_iommu_enable_clocks(qcom_iommu);
> +	return clk_bulk_prepare_enable(CLK_NUM, qcom_iommu->clks);
>  }
>  
>  static int __maybe_unused qcom_iommu_suspend(struct device *dev)
>  {
>  	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
>  
> -	qcom_iommu_disable_clocks(qcom_iommu);
> +	clk_bulk_disable_unprepare(CLK_NUM, qcom_iommu->clks);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
