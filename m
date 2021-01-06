Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29C22EC16A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 17:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbhAFQsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 11:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbhAFQsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 11:48:51 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B49C06134D
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 08:48:08 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id q25so4056707oij.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 08:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ul3z+zPYyErER25sLdRQyHxYuVeArqXgOYoH6Iif2tA=;
        b=xnr9R7Osri/fA96VspyfVZmLyshJO2Rq5Q8oYcbT9/pOILj5EE6ugUcpCetuytQ65R
         ZdqURe6AQD5HSXQfp2p3t/XMeZaUoY9X0j9EmoUbGlWsDacuW0JztS4dVpg+lS7SsoLN
         tfA7IOcuHKvOFfxp/i45x2+HCHvnExX42mdAWAR+2raJR6GBw8vJoEabelrMcQlYt1s+
         oZJkd3aSwGJNguTNfTTzWKn/+03gWx7jFZflnBsPoFyGkUpPKZREc8Cmw9opt+uYHCPs
         LTdfWkc99o3c1zQp1qIVDDRW9+fjrPt2Y75YubIPdrrnlgTLUdbiOVrKhYCxTPUSOHpx
         8XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ul3z+zPYyErER25sLdRQyHxYuVeArqXgOYoH6Iif2tA=;
        b=AkNv2d7P/5CDR3NeERZ3BCabnv93MVe9FOMRjePObHrTHaASDAf7RkT+i5COcn94i6
         Tz+3ZcMEfbOq9Udvfd2nvWkJVN+GcIehKy8GdgzyYDpaf5U+/ZSf2t7azTZb5JJ22zM2
         jQ6fBVMPNKRogCHrkDgRutNHj8bXfYOfGUU9Ndfu3tFEKmEgf0yUg4xzbRdAlwPp7xuF
         wGkpgVw2Ar7u1wqIbE6xek7ZkwigagzyEEAcOLRouRGGKMkFnHZcXxlccUqQ4GTVRGFB
         tB56R8TCipzDdMCg8SkAZ0sTnOXGqv3sgM12vNKQh6Vna1scl6ogAyOFq5FgLwsrUoWQ
         v0ew==
X-Gm-Message-State: AOAM532HpyXA1ePRhlEfQgG4VsYiKyrSPlOsr1IngMVRR5m0k3PtVBdz
        UHdDJ2Lx7RE7OTnsBEXINeRA2Q==
X-Google-Smtp-Source: ABdhPJxxRuCnYDf8FtFTNwcplgFnRhX6u7tlycCQ/ZVJNpGJXKzwRPzUivQBtqh6G5FQclk39qXrJw==
X-Received: by 2002:aca:6146:: with SMTP id v67mr3702322oib.102.1609951688292;
        Wed, 06 Jan 2021 08:48:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o135sm597707ooo.38.2021.01.06.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 08:48:07 -0800 (PST)
Date:   Wed, 6 Jan 2021 10:48:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/18] Devicetree update for SDX55 platform
Message-ID: <X/Xpxecneh5RHdzx@builder.lan>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Jan 06:53 CST 2021, Manivannan Sadhasivam wrote:

> Hi Bjorn,
> 
> This series updates devicetree for the SDX55 platform and the MTP board.
> Most of the SDX55 specific driver codes are already merged and some of
> existing driver support got reused.
> 
> Thanks,
> Mani
> 

Thanks Mani, I've applied the DTS changes. Please resend the dt-bindings
to the appropriate maintainers.

Regards,
Bjorn

> Changes in v3:
> 
> * Dropped interrupts property in spmi-gpio node
> * Used dma-controller node name
> * Reworked tcsr mutex node
> * Sorted binding compatibles
> * Collected reviews from Vinod
> 
> Changes in v2:
> 
> * Changed "SoC" to "platform" and modified FIXME in commit message
> 
> Bjorn Andersson (1):
>   ARM: dts: qcom: sdx55: Enable ARM SMMU
> 
> Manivannan Sadhasivam (9):
>   dt-bindings: mmc: sdhci-msm: Document the SDX55 compatible
>   ARM: dts: qcom: sdx55: Add support for SDHCI controller
>   dt-bindings: arm-smmu: Add binding for Qcom SDX55 SMMU
>   ARM: dts: qcom: sdx55: Add support for TCSR Mutex
>   ARM: dts: qcom: sdx55: Add Shared memory manager support
>   ARM: dts: qcom: sdx55: Add QPIC BAM support
>   ARM: dts: qcom: sdx55: Add QPIC NAND support
>   ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
>   ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
> 
> Vinod Koul (8):
>   ARM: dts: qcom: sdx55: Add pincontrol node
>   ARM: dts: qcom: sdx55: Add reserved memory nodes
>   ARM: dts: qcom: sdx55: Add spmi node
>   ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
>   ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
>   ARM: dts: qcom: sdx55: Add rpmpd node
>   ARM: dts: qcom: Add PMIC pmx55 dts
>   ARM: dts: qcom: sdx55-mtp: Add regulator nodes
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml   |   1 +
>  .../devicetree/bindings/mmc/sdhci-msm.txt     |   5 +-
>  arch/arm/boot/dts/qcom-pmx55.dtsi             |  84 +++++++
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts          | 203 +++++++++++++++++
>  arch/arm/boot/dts/qcom-sdx55.dtsi             | 214 ++++++++++++++++++
>  5 files changed, 505 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi
> 
> -- 
> 2.25.1
> 
