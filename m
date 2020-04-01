Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A57519B900
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 01:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733214AbgDAXgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 19:36:48 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54479 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732503AbgDAXgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 19:36:47 -0400
Received: by mail-pj1-f68.google.com with SMTP id np9so759169pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 16:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sQjK7qegajNFKiTPiHQ5Z456M8UVRRDL3FiaA3tyTGs=;
        b=LYTp9ksrfOguPgd3XflLQaiRWyQXN2zGAWee6altMkkc2NYCumREpFdzZpExQW1Qq6
         H8ZK7mzZ37Z7HLmx7GiNCrpchU54WVA51+coaid+eY4HnF3doY4Bz6inL0koZuy2NFm+
         myL0WIcVxF+sjBOXLcspklxcfpViozESXgSbwrR6fXFLGxxXOmGleluSQRGL4ByE3r2Z
         iTfxXwBN81CuR21mLL2wMwJpZBiOM5UYcYhp4lAdlLa+DdMXxsp1ligXXoRMqRrzzeYn
         HZcOLvEQ+CKuDVUiZoqRasDJnI/9VYQ1xXn48wUYREmgLpyrAXI4xbbEXqXfYwFJnCYa
         hb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sQjK7qegajNFKiTPiHQ5Z456M8UVRRDL3FiaA3tyTGs=;
        b=sBWBHnUlfhnl8jUhZOlSSA8fguQ3rwffaC1Gq2CTmnu64E2o5czvpO1AH0NEYwI3BE
         iCQ+whFYzcN8TZQFqfzVnvGDHCZ1hLw2zw+2VzCIXM5lZ0VWsWPuaX/BbtXt+cmRYvqs
         2AwzqoWBU7zVN1/SNkwmrBQZeOADl6lRowWsfzMUQJ0ZBuGShWJgMgYQFfTiq7yvcey0
         qyXIs17RXT6uczPkTLR5UakCon6xXV6mYPAJvB9OmeZQBKww3JwRioak8IGfVqXJthlB
         FOKvOipGccytwSX9AeSIhbm2KuK1GpvIUdn7rUCRPo2lmOfNUQhbU9amaLHoMxsksVgi
         A6Yw==
X-Gm-Message-State: AGi0PuZwAe0pFk8F6DUN5p1VrbqFE+G7+2FIDAQ6tSijcV4as0wAN4vv
        cyPEJLmlM7OWU7E4+PNiJQL3sbVnyhk=
X-Google-Smtp-Source: APiQypIJCdx4hNppaFM2XL2D9B8R+4Fnma25HLV1H6qHB+zBdia/d//vCt3FUseVJwiQZfZ1RwBbVw==
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr275281plv.297.1585784205324;
        Wed, 01 Apr 2020 16:36:45 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a15sm2369442pfg.77.2020.04.01.16.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 16:36:44 -0700 (PDT)
Date:   Wed, 1 Apr 2020 16:36:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     robdclark@gmail.com, agross@kernel.org, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
Message-ID: <20200401233642.GI254911@minitux>
References: <20200401152008.16740-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401152008.16740-1-tangbin@cmss.chinamobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Apr 08:20 PDT 2020, Tang Bin wrote:

> Release resources when exiting on error.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/iommu/qcom_iommu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..d4ec38b1e 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -815,6 +815,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (res)
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))

Good catch! But while it works, this is not under the if (res). So
please add some {} around this chunk.

Regards,
Bjorn

> +			return PTR_ERR(qcom_iommu->local_base);
>  
>  	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(qcom_iommu->iface_clk)) {
> -- 
> 2.20.1.windows.1
> 
> 
> 
