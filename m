Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78F1310339C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 06:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKTFRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 00:17:00 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37315 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfKTFRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 00:17:00 -0500
Received: by mail-pf1-f193.google.com with SMTP id p24so13628505pfn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 21:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7uNFuGTkHht4kVlmGTndg0AtCQQACOHGMMX+d3QoKic=;
        b=et/J9lmplBBlik2YCaRAp6TG8tH6vVIbWesmrAQ3Aohv3+V3X3VNz6wbtquVLnw2Ly
         c4bIvqpXikhgKLXp/0sVXvheUmBT1PeO3JCszhUOQpv50PFwZ90tDOY6wDnA1KKQNyPb
         IdjfrXc4b0PtcFQdUpAVDaT9DKmNM89f/uJsGvcLxK57Yc2+f/JBlTpwce3F1cdFRPLX
         nfGqmJ/QP3NiwovChHCNcx+TOdfHgCC9qoN/z994JUX932xkcO8HjcKOUEm92tYoU43m
         0kSRxk93EqAZQ3T5zBVxNNL8euORnzsg9hFWfQOVSYpe0jMVaHikzyg+ev3abv/RPk+8
         3ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7uNFuGTkHht4kVlmGTndg0AtCQQACOHGMMX+d3QoKic=;
        b=cXpm/WblecyubEtNoM5vD0MduArTIr4tssOybHHDb/MCf8BB4bmUSnRjZWbBIWM3PO
         70P4yXSPMnJiswKxom+rwfNsycfmC0Xy0+pOf8R1VVlqyA+FL0b3u4St8GN6j68qsf5n
         8PyjnmVhyrnc3yEMfeWtmpo1PoAswhf8xF/CnEfMue8As6mWyubTQBJmY5WUI4QHQQFm
         qUMlYiZwhF4Aqte6ut/Ldy/8RtBexCTgGa+nW1tQFo7ce5rEqQhomwRebsY1SJkQVS/g
         IWIlHerkuYUICOEM4UCpPmmzByoAWjLNJxrYlA0/GgZAFRv2xIZZslYo15Pj2BcAgpdP
         d6pA==
X-Gm-Message-State: APjAAAV33Y4PD4PMzUsug7UUVqS7fK66Lj95ZNvTLcHAHn9bX9e969cM
        WAZn6i02flaA2BMUU5DbPh2vmQ==
X-Google-Smtp-Source: APXvYqyzRYmVnEKGm1r5WusT49tJmRjBJ7jzvN2oRZS+WXGVi9Kc9Yyv6xriF+KNAjdw9bjEEjGvlw==
X-Received: by 2002:a63:d642:: with SMTP id d2mr1014621pgj.205.1574227019574;
        Tue, 19 Nov 2019 21:16:59 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f31sm5451979pjg.31.2019.11.19.21.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 21:16:58 -0800 (PST)
Date:   Tue, 19 Nov 2019 21:16:56 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        amit.kucheria@linaro.org, sboyd@kernel.org, vireshk@kernel.org,
        ulf.hansson@linaro.org, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable
 CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Message-ID: <20191120051656.GU18024@yoga>
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
 <20191119154621.55341-6-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119154621.55341-6-niklas.cassel@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Nov 07:46 PST 2019, Niklas Cassel wrote:

> Enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4385033c0a34..09aaffd473a0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -88,6 +88,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
>  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  CONFIG_ARM_IMX_CPUFREQ_DT=m
> +CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
>  CONFIG_ARM_QCOM_CPUFREQ_HW=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
> -- 
> 2.23.0
> 
