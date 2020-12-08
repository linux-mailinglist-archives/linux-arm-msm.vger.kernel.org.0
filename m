Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641522D3737
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 00:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgLHXzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 18:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbgLHXzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 18:55:10 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BFDC061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 15:54:29 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so13709684pgi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2rK9eXbFabJb72qqgAX1hLLY10/7BrTO5clSEsTqMCU=;
        b=Sgx6prnHlAsh2UMYUB9oN3T03kov3UHmJFXkIAaavgl/vGFAporMXy+AUASGS9Fi0T
         DamVmTSPFXcF/WpcZ8m24LQYPjWFjVK4V9lvVe0J9jSqy6YBtpTmBYeeY2SZOmrrBtpI
         53FGeoB6ppuZJmsORbDLwTFnFrHV7sbTeNhUFks6eLAg+AkCJDEKmBe6OYv2BPGpxjHE
         TDD6LLy5ySlnipXq6gEMkABw4xiAw5pBN3udLiQlDCuyHl6URq8ANRqVetC2/Sj1lUVk
         jnceRwZBvIB+QLTvgtp+PolIE0J27BBBxGRSXs9IHuqr/cCKLsFPRnW2QDyjJwYRVW61
         S5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2rK9eXbFabJb72qqgAX1hLLY10/7BrTO5clSEsTqMCU=;
        b=QjWzR8/oIGc/p0ZVZOAEQTpQrGxF1n+wYGdHGZF39VuJWYsEB5SyIywJ55r25sGcRz
         agTGIvt19kBsODbMEQAyc2mj3wFUkEpJrKj2PrbfgF+AvcqIuN+WReuLSn/pwDw6xN0m
         HO8iu9Hd65xOykZhjMqiX2rwJiyJtfqpGg+ZbAdrl78QILhF6zMSiFMnj/ilx0odbqdM
         42fNl2Drxjq9WN33jmf+ogNrTzcwha61bGjNNk7m2eQ3onoyOmA2HUjP8W/gll8OWy4r
         uWu8qGDgCgQpQVXr9Lsl50/5iI+tuxp9aIp8IZ8cAhfnG7UI+vKS5TehXa5PQF9GbRgw
         u/eA==
X-Gm-Message-State: AOAM531nPdJsZ4ez0x0yZKUGtUafEQUwFZwFssxXUe8NU7pGve7xQjhg
        khhdJ6y6NVReuc63IERdXpv6eA==
X-Google-Smtp-Source: ABdhPJymLFoVA6st/R/6ICIUCnlgIQ2mzU0HofUTcy+4xtvDPxoNZuI2YP/rGfXQcIctAkDjwazN8A==
X-Received: by 2002:a62:f901:0:b029:160:b5d:fc40 with SMTP id o1-20020a62f9010000b02901600b5dfc40mr316964pfh.55.1607471669215;
        Tue, 08 Dec 2020 15:54:29 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com. [35.233.137.154])
        by smtp.gmail.com with ESMTPSA id w4sm296254pjc.52.2020.12.08.15.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 15:54:28 -0800 (PST)
Date:   Tue, 8 Dec 2020 23:54:24 +0000
From:   Satya Tangirala <satyat@google.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fscrypt@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neeraj Soni <neersoni@codeaurora.org>,
        Barani Muthukumaran <bmuthuku@codeaurora.org>,
        Peng Zhou <peng.zhou@mediatek.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: mmc: sdhci-msm: add ICE registers
 and clock
Message-ID: <X9ASMO7eby9bZumo@google.com>
References: <20201203020516.225701-1-ebiggers@kernel.org>
 <20201203020516.225701-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203020516.225701-8-ebiggers@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 02, 2020 at 06:05:14PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document the bindings for the registers and clock for the MMC instance
> of the Inline Crypto Engine (ICE) on Snapdragon SoCs.  These bindings
> are needed in order for sdhci-msm to support inline encryption.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 3b602fd6180bf..4f2e138439506 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -30,10 +30,12 @@ Required properties:
>  	- SD Core register map (required for controllers earlier than msm-v5)
>  	- CQE register map (Optional, CQE support is present on SDHC instance meant
>  	                    for eMMC and version v4.2 and above)
> +	- Inline Crypto Engine register map (optional)
>  - reg-names: When CQE register map is supplied, below reg-names are required
>  	- "hc" for Host controller register map
>  	- "core" for SD core register map
>  	- "cqhci" for CQE register map
> +	- "ice" for Inline Crypto Engine register map (optional)
>  - interrupts: Should contain an interrupt-specifiers for the interrupts:
>  	- Host controller interrupt (required)
>  - pinctrl-names: Should contain only one value - "default".
> @@ -46,6 +48,7 @@ Required properties:
>  	"xo"	- TCXO clock (optional)
>  	"cal"	- reference clock for RCLK delay calibration (optional)
>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
> +	"ice" - clock for Inline Crypto Engine (optional)
>  
>  - qcom,ddr-config: Certain chipsets and platforms require particular settings
>  	for the DDR_CONFIG register. Use this field to specify the register
> -- 
> 2.29.2
> 
Looks good to me. Please feel free to add
Reviewed-by: Satya Tangirala <satyat@google.com>
