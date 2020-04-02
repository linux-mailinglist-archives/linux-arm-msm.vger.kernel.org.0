Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561AD19BB87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 08:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgDBGPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 02:15:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42590 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBGPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 02:15:11 -0400
Received: by mail-pf1-f195.google.com with SMTP id 22so1263433pfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=07RUzSF98HDlKkHMcwTokc6D2qHFZsro2icdPsGci64=;
        b=J6Nbi0EtdSwrriubNlSp++jvgCp+itwBO6E1gZlhnp1tqF3mpnr5T6tnBxeaQwrDEa
         giI0ImC5VpXAIy8zfGbzpjDr/l3dAiTdfGSI3QMbNeQSE5TXyE+3l7hNihvkcY8jZILo
         t+qiWU0ey10SDTqykpvJn7jZuTzOTUqpDrgCydLj+pZjAJUT61dRXlW8USCKduGyb6jx
         T7Vx5+Roal6VuMiEflOOlYvBElMDBA3C5ZH/i8eDFiR7pPrEOJ8EMqeWo/ON3iuOVvNY
         6gM3ys92xRR5cp8mW3CDEF6e29ywWZLSypipsA6y/QFglFGJZKvW5Ov6ZhiqAob6BVd4
         RRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=07RUzSF98HDlKkHMcwTokc6D2qHFZsro2icdPsGci64=;
        b=mg+GQmlBR47/hTpxjUB0KUrbtAoFVMW5SrPGflytt8Vfnwo9F3YJlgzBn+friZfOHP
         rDDWFZTb51rMLvkxdkyVc64bTMy1I+OgohpniieObF0DSr5mlzt6K7HhUuwNsoXC9WeF
         hoSuD40lGScabEH4j60SLQQo5HDW8pTGweoGF+XgUyMBCyyOVajkOzQ1157JPoez1p6C
         ZEj9dH8MKU6EarfG492HXvw6/j1t73rc8aLmwMINhe1LfPlA1t8B5VYZ+JFrhV4uCSvc
         OZmsjyPIwZpHGGzzhYQgSvNL+VfQttjGEYSfL3Gs4WhxmBYHwlSlwy1YDpwSAgB18gcp
         Q3qQ==
X-Gm-Message-State: AGi0PuZtWwwq9V7/x9eNZ8GDQTrZOE+Ak/5uCpnXtxvlOenPj0GksOqf
        WFXcTXLgTgex1AGSIjpSMG8w3w==
X-Google-Smtp-Source: APiQypKKGvDjseFizAmJpesEiYx7AGhcOrNqdIFHPsRABhrQ3IMWfXS6wrqqHdpRN9Xq3gst+TB1Bg==
X-Received: by 2002:a62:2f01:: with SMTP id v1mr1615968pfv.136.1585808109592;
        Wed, 01 Apr 2020 23:15:09 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id fa16sm2942071pjb.39.2020.04.01.23.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 23:15:09 -0700 (PDT)
Date:   Wed, 1 Apr 2020 23:15:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     robdclark@gmail.com, agross@kernel.org, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2]iommu/qcom:fix local_base status check
Message-ID: <20200402061506.GF663905@yoga>
References: <20200402060333.9156-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402060333.9156-1-tangbin@cmss.chinamobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Apr 23:03 PDT 2020, Tang Bin wrote:

> ------v2-----------------
> As requested, add some {} around this chunk.
> 
> ------v1-----------------

The changelog typically goes after the ---, as it doesn't add value to
the resulting git log. So please drop the above 4 lines from the commit
message. And please use ./scripts/get_maintainer.pl to find your
recipient list.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Release resources when exiting on error.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/iommu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..c08aa9651 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	qcom_iommu->dev = dev;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}
>  
>  	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(qcom_iommu->iface_clk)) {
> -- 
> 2.20.1.windows.1
> 
> 
> 
