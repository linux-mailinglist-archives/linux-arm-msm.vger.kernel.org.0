Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130F526D2B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 06:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgIQEgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 00:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIQEgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 00:36:11 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AD5C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 21:36:11 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id g3so874268qtq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 21:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ASmnaqlmvLV3DYCl/m4SEZFCwcmLMSD0ZhdmaqWyIl8=;
        b=lNgCZAlIj6lQ73jenE3EOdKSadjFEUkLlLpAyr08G6LssALZVGhq24MfEyHobd7o5h
         IRhhXMTjvVpb1nhWIi9dvyq6hGScQzfHpok5K7J1RcGCZu40dGx4Y+KEQD3+FvvR4bYM
         yQ8/Gj1BIwhwQV+Jkxe2+Pbq7n22UD51PBX2pD/4xo4mYDzcd2xeCARs9CU6k+HwA4g2
         +AJfLduLQB4pCBbPPNTefGWE3Hkm7/pF3pNayx5uqHqqmtVl2/R6AeRjWfvpKiZsQJl8
         sY42CPNAq8cUF6zm9LQKLvzzAZf3+WBuJ1NVnUrDWJIvd+vEcTIUv7bUzhPw9uXDCIu2
         FkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ASmnaqlmvLV3DYCl/m4SEZFCwcmLMSD0ZhdmaqWyIl8=;
        b=nZ1eQLOIvonhUyzsAGG0NVRDu8Tya6vsxlqS2nAdLOOExDjwjG2G4HWgrlsZT28/Oj
         17nAFzWWvBi7g4+LTl5fZYQHjpzoxZ6qK89GLiTCqdxNtHMRwlokcqcJiaBEwTzL68O5
         Z521VSGdnxdUczAwDOgpnd1nFS/t5o7iDYxh9ISiJeNPw2N399UO4VL8Ui63OQ895IAg
         BAbuHf8iMoVPlwYJYaouI9FJ/u7d3a7hqOELChT/I1UF872FnRQI98XnPSWwIYzE9w/e
         ICNgEMjQFHMaB4tdrWrGj67TFuMGDC+dQrqbuxQHEdytzCa5LtQ324Cs7DN3xoG4Li6k
         NSEA==
X-Gm-Message-State: AOAM5336fcGzNOcxK38GLGjm+JUgAw5Qg41xeBBDavdg8cqGFL4Exzdb
        wGgc5GbShNaPwHP086ysCRFrMg==
X-Google-Smtp-Source: ABdhPJyv4cSYBMkZht+naxEL8Ufs+6UVZgOoiaMa6zIMjcRxaxT8MxzbH2MEH5kdxmk5eOyC2UU4jw==
X-Received: by 2002:ac8:5d43:: with SMTP id g3mr14123544qtx.295.1600317370546;
        Wed, 16 Sep 2020 21:36:10 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id p68sm21048764qka.78.2020.09.16.21.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 21:36:09 -0700 (PDT)
Date:   Thu, 17 Sep 2020 04:36:08 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Qilong Zhang <zhangqilong3@huawei.com>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] soc: use devm_platform_ioremap_resource_byname
Message-ID: <20200917043608.GA108053@uller>
References: <20200916111517.99670-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916111517.99670-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Sep 11:15 UTC 2020, Qilong Zhang wrote:

> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

I fixed up the subject line to match the previous commits in this driver
and applied the patch.

Thank you,
Bjorn

> ---
>  drivers/soc/qcom/llcc-qcom.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 429b5a60a1ba..70fbe70c6213 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
>  static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		const char *name)
>  {
> -	struct resource *res;
>  	void __iomem *base;
>  	struct regmap_config llcc_regmap_config = {
>  		.reg_bits = 32,
> @@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		.fast_io = true,
>  	};
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	if (!res)
> -		return ERR_PTR(-ENODEV);
> -
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource_byname(pdev, name);
>  	if (IS_ERR(base))
>  		return ERR_CAST(base);
>  
> -- 
> 2.17.1
> 
