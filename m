Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FCD4C225B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 04:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiBXD2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 22:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiBXD2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 22:28:35 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9921D14CD8C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:28:06 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id x6-20020a4a4106000000b003193022319cso1655588ooa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 19:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GFVa3DjQlyegmWMDp165z9Si+REv56L8MkHfgIOzldw=;
        b=dNy3JhchndOVm31lCDbIR/z5g12ami92rgQQUFF9y2yVWKDel6PcmxwLFkURQLfga2
         jBEEF3ET08xlVDTZC9zQAqmljTx3MRdpdT5qiZuuFHaHGSpfCgaQiBGZ58xEnul5JThI
         TAjcTJExcy2XrZcxzxH28Sy8wLLDrx2R+37zWUYEDMNTepNw8EEiWATmTpXkLH2VWcXZ
         JcvAO9zhAx7W3rIi9NRjDauFkN1jaUdzrVV/VcIdfVO9GD2ZOHAQEOfdA3rWBUvVM28m
         houvSqynzQy4KR0j6FnNffG1i0A++mCgyzcnE8qZcjg57PDh/xPhSKiL0HAitnlOseDK
         J6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GFVa3DjQlyegmWMDp165z9Si+REv56L8MkHfgIOzldw=;
        b=oke16tpU6YCo8iKoMWrbIIA3wCAhVQlWOgivCcwJpZjAbkKGCvY9UnPFWyY/b3jc7j
         bijBTX7epBEetol9Xv92M9nEC/pkxxxqb4rIDfd0zXF/pj2MDT3/lrgRUqCfhP3h4Bfe
         94fyF0hkvYpELONhSEZ1Rc2LaoWRD0svfkd89RTwd0ZKApybSMtIXvMKj2hLEasGYBLM
         MMgYuuv5U7XfJ90FW2v1e/I8Jp8rpeMVkofgLxnTq001ItF83EWRnoWGYU6zLtTEjHAg
         AqphfZYrreZ2ovu2Rw5+JZ9BzQFNQdmr4yLHySW7dGD0oYlOpOEafX4wa9Hx0N+k+zBr
         pmrA==
X-Gm-Message-State: AOAM530MxvVhvDfdEl90qBs9O8yxGzQedakJCf5nvZaZgVnqtvCybICK
        L6pvfygDBCBlMOHCFyWZpXj5Gw==
X-Google-Smtp-Source: ABdhPJwBogg0rsy9M4oHjP62JFiYF9ZgSvTm6VvFPZuJ/jwjMjUwWgMnC52O8KBeVvY5KHw1Cc/k6w==
X-Received: by 2002:a05:6870:8919:b0:d3:7c1a:da69 with SMTP id i25-20020a056870891900b000d37c1ada69mr290520oao.317.1645673285839;
        Wed, 23 Feb 2022 19:28:05 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u16sm672689oth.53.2022.02.23.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:28:05 -0800 (PST)
Date:   Wed, 23 Feb 2022 21:28:03 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm GPI DMA Driver
Message-ID: <Yhb7Q91cEdgayc6c@builder.lan>
References: <20220222042409.1185564-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222042409.1185564-1-vkoul@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Feb 22:24 CST 2022, Vinod Koul wrote:

> Qualcomm GPI DMA Driver is used for DMA transfers for Serial engines
> like Geni I2C and SPI.
> 
> Enable this dma driver
> 

Can you please include a motivation in the commit message why this has
to be builtin?

Thanks,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 30516dc0b70e..d73913f082d7 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -948,6 +948,7 @@ CONFIG_PL330_DMA=y
>  CONFIG_TEGRA20_APB_DMA=y
>  CONFIG_TEGRA210_ADMA=m
>  CONFIG_QCOM_BAM_DMA=y
> +CONFIG_QCOM_GPI_DMA=y
>  CONFIG_QCOM_HIDMA_MGMT=y
>  CONFIG_QCOM_HIDMA=y
>  CONFIG_RCAR_DMAC=y
> -- 
> 2.34.1
> 
