Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99964739DA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjFVJsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjFVJsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:48:10 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABC893C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:37:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b46cfde592so76592311fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687426604; x=1690018604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNkV9xAtMniIcjJ9HwdT1bLznh1eJZZcSsFGcqOzrhQ=;
        b=UsK03MOaYaOQ3HgcTdNopysn7bz+2NhG7PUdGIT2G7+OO+U3YpmhjQP5Zwv5hvbWBS
         h38/tZZwzc8jy5NhMTu/1wqAZN39bVOL8cFpwE64Vr+nOLxrQxEF077Up1h0w5Q84CXD
         VnbVJc9peKFaLGhQTRWKDjTEG4WDQBB5teXoKF/2UEke2ms+24qjPXCjIo7dDIqiyN9l
         vXTnc/A9pntZ6qkurXialJ1DoXse1GMedPSDcDGAaaJARbBTdGqRgqRThvx/7OAfk4H6
         pOiPNVOKLtWmhGg5vyJjH5NMRP+rqtf4cQUbiQ4dAPo0r5Rr0eXfuuyjs96My6y+x4b4
         2Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687426604; x=1690018604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNkV9xAtMniIcjJ9HwdT1bLznh1eJZZcSsFGcqOzrhQ=;
        b=AqVs+Nj+tJo2MEXvlj1hgO5AhggbBOWChPaK/aDiMc40XZ6Z6F1EbtyweQ7icyKYc7
         quZfy5Gb/FOFqieGbLsX/M2GCiqS8Y3YxOfEiuLQVpPu/qCmhFX9Lwg6tJc0JZmteyea
         pflB8WUzMVyzyhnDCZb3zJV6F/JT7E6jJj0iAz5ck8DJ/80/ah2MmPwWkpC3wmWWn4d3
         Dyo3XBaxXft9d647wBjRjJPX+3B02iy4goADVx97SrKGYfM+Ywf44SWCifmL4rpYFmzL
         fNg5Bhbv/c1NUGo8WdMWL5QogTYjriDJIUjbNj/Zf33k2tNUTzEiiQnWqIC79qWeHUZN
         pLCQ==
X-Gm-Message-State: AC+VfDwP0r4d2apWn8ANO4pTWzHIjSDQifK9E3w4XF78MdLBuHJIMub8
        MIeJ0jZtPE8VqcSZhuLgORErwA==
X-Google-Smtp-Source: ACHHUZ7oME0q+/73a/ckmmmGjXtpmVy3hhaghu6ttoRXj2kLaocap0Vh1OZNUNakyMXv8HXG+bt1CQ==
X-Received: by 2002:a2e:a307:0:b0:2b4:5afc:fe0c with SMTP id l7-20020a2ea307000000b002b45afcfe0cmr11588750lje.7.1687426604342;
        Thu, 22 Jun 2023 02:36:44 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id l11-20020a2e99cb000000b002adb10a6620sm1192869ljj.107.2023.06.22.02.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:36:44 -0700 (PDT)
Message-ID: <bd27fc27-70d4-dfff-22d1-2e632ac7a868@linaro.org>
Date:   Thu, 22 Jun 2023 11:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 6/6] iommu/qcom: Add support for QSMMUv2 and QSMMU-500
 secured contexts
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, luca@z3ntu.xyz, dmitry.baryshkov@linaro.org,
        joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20230622092742.74819-1-angelogioacchino.delregno@collabora.com>
 <20230622092742.74819-7-angelogioacchino.delregno@collabora.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230622092742.74819-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.06.2023 11:27, AngeloGioacchino Del Regno wrote:
> On some SoCs like MSM8956, MSM8976 and others, secure contexts are
> also secured: these get programmed by the bootloader or TZ (as usual)
> but their "interesting" registers are locked out by the hypervisor,
> disallowing direct register writes from Linux and, in many cases,
> completely disallowing the reprogramming of TTBR, TCR, MAIR and other
> registers including, but not limited to, resetting contexts.
> This is referred downstream as a "v2" IOMMU but this is effectively
> a "v2 firmware configuration" instead.
> 
> Luckily, the described behavior of version 2 is effective only on
> secure contexts and not on non-secure ones: add support for that,
> finally getting a completely working IOMMU on at least MSM8956/76.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> [Marijn: Rebased over next-20221111]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 9786fd094e7d..7b6241f36698 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -59,6 +59,7 @@ struct qcom_iommu_ctx {
>  	struct device		*dev;
>  	void __iomem		*base;
>  	bool			 secure_init;
> +	bool			 secured_ctx;
>  	u8			 asid;      /* asid and ctx bank # are 1:1 */
>  	struct iommu_domain	*domain;
>  };
> @@ -273,6 +274,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  			ctx->secure_init = true;
>  		}
>  
> +		/* Secured QSMMU-500/QSMMU-v2 contexts cannot be programmed */
> +		if (ctx->secured_ctx) {
> +			ctx->domain = domain;
> +			continue;
> +		}
> +
>  		/* Disable context bank before programming */
>  		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
>  
> @@ -669,10 +676,14 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return -ENODEV;
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,msm-iommu-v2-sec"))
> +		ctx->secured_ctx = true;
> +
>  	/* clear IRQs before registering fault handler, just in case the
>  	 * boot-loader left us a surprise:
>  	 */
> -	iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
> +	if (!ctx->secured_ctx)
> +		iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
>  
>  	ret = devm_request_irq(dev, irq,
>  			       qcom_iommu_fault,
> @@ -712,6 +723,8 @@ static void qcom_iommu_ctx_remove(struct platform_device *pdev)
>  static const struct of_device_id ctx_of_match[] = {
>  	{ .compatible = "qcom,msm-iommu-v1-ns" },
>  	{ .compatible = "qcom,msm-iommu-v1-sec" },
> +	{ .compatible = "qcom,msm-iommu-v2-ns" },
> +	{ .compatible = "qcom,msm-iommu-v2-sec" },
>  	{ /* sentinel */ }
>  };
>  
> @@ -729,7 +742,8 @@ static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
>  	struct device_node *child;
>  
>  	for_each_child_of_node(qcom_iommu->dev->of_node, child) {
> -		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec")) {
> +		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
> +		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec")) {
>  			of_node_put(child);
>  			return true;
>  		}
> @@ -873,6 +887,7 @@ static const struct dev_pm_ops qcom_iommu_pm_ops = {
>  
>  static const struct of_device_id qcom_iommu_of_match[] = {
>  	{ .compatible = "qcom,msm-iommu-v1" },
> +	{ .compatible = "qcom,msm-iommu-v2" },
>  	{ /* sentinel */ }
>  };
>  
