Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5E04C3E24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 06:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbiBYF7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 00:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbiBYF7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 00:59:16 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3878F1451F5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:58:45 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 12so6281220oix.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CZ4Dx4EQ0hug6uJLkQP0eo9Eq36tGbxAPFdNvG/WOeY=;
        b=zdzNOBZBBKx4BUzFjJUjY4t2Lmqpv3EPCLRATlog8g+gvfWbTjIl1EmxX96gPd+D0k
         docq3B+u4Q5/RpHJmRYD+LBuJ07GMycSW3XnT4oL1JHtX6rqav5S2xyIjmQNKMasLED6
         iWnWpvtdxBKmixrGraZ0SgPxWn+WVUKBrcupX/+Zbr0IlGAFdmxyrs+/5P9vwteS/eZX
         xQtiDuKOBtuHkwrnqFEy1JRyrNl1/4AMVOz3SqJcHgRaejEPPWjCtcGYDLXXYufq/Svx
         cmGr2BX1VGXWE86arTjf6qb+MgXAbauX+Ki2oqSdNTHLlUPzZib2vnpHayZ/S0ZBvUI9
         kNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CZ4Dx4EQ0hug6uJLkQP0eo9Eq36tGbxAPFdNvG/WOeY=;
        b=8Qhg7uhTVJS3MvEAMHPGKz2hBEQUsl2uei6T2t6dRvdDnYFTnjC+5n5lYgrnguSdDV
         5SVZomxcsDg1n0zgJIZsSYBH6BayLMJkeSNugQe33UIUbYj058jSdywdnJVDqIO5e1/d
         3qPcVBOAmZYpx82KexyhEM0XJva2kOn/3cPigFAinbc2WAE+iNnWyYyS2lVs4t1AXIFo
         Cau/BWYffp9RI7SCQ7aPs5ToT6MOdFWb8pm4+HeDaemBPMIau4PVkyDOy+8QIO9O9ObY
         +iyIfb8oDhScDMdNKhDkYaezrkPul4J6fFsbC8ZzL1XnEWc0FonLM3ihhpEw9g9U+qOW
         +f2g==
X-Gm-Message-State: AOAM533PsmRzEO2XK/Yqu1Tp5rrQcXp2YOES7gV2uYC+9nvdTjSNT2HJ
        KKNI9WbO62O8N+t1zV8r7YyvcynW2YC2aw==
X-Google-Smtp-Source: ABdhPJyr9Hg6TQKa+Ekd+SqimDmXPQD784++AIWctUeVA8wjzwDLjOY4QRJPLbSThA1Xx37TBi5anw==
X-Received: by 2002:a05:6808:1707:b0:2ce:6a75:b883 with SMTP id bc7-20020a056808170700b002ce6a75b883mr779526oib.330.1645768724209;
        Thu, 24 Feb 2022 21:58:44 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id a69-20020a4a4c48000000b0031bec1608fbsm704932oob.17.2022.02.24.21.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:58:43 -0800 (PST)
Date:   Thu, 24 Feb 2022 23:58:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable Qualcomm GPI DMA Driver
Message-ID: <YhhwEaPdyUcHBL+V@builder.lan>
References: <20220225044033.1376769-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225044033.1376769-1-vkoul@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Feb 22:40 CST 2022, Vinod Koul wrote:

> Qualcomm GPI DMA Driver is used for DMA transfers for Serial engines
> like Geni I2C and SPI.
> 
> Enable this dma driver
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> 
> Changes in v2:
>  - As dicussed with Bjorn GPI DMA is used by Serial engines SPI/I2C so we
>    can make this a module rather than inbuilt
> 
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

Would you like me to change this to =m as I apply the patch, just to
make it match changelog? ;)

Regards,
Bjorn

>  CONFIG_QCOM_HIDMA_MGMT=y
>  CONFIG_QCOM_HIDMA=y
>  CONFIG_RCAR_DMAC=y
> -- 
> 2.34.1
> 
