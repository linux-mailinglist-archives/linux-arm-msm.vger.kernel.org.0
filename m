Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C53C2BC385
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 05:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgKVELD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 23:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgKVELC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 23:11:02 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93046C0613D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 20:11:00 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n11so12799868ota.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 20:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z5iasv0Tn+EAgqcCTW+28/WJrxDWlSK3B7pN57OlmRg=;
        b=b5l7i4HfOFDcEGL1OPYUNQ49HaBHuvNwRdgP5IA11zLsYWI8Z/0MbyawwNBcqip2aj
         Ytf2nfhNU07LE2CZpq9wyXUhDmj9l0+IfqPwXxq5jRmB9bczfpdo93BsvE9NQp/ZLpSW
         Lk6fu0CvGnI3Vrg4crRAZ3F7qz/xEhZYpVeP8b01ClIvb+w7bQyaPNBfJFCHG84oOs+Y
         ZaIljSE9jW9/lqMMxdEqPUn1MASCAcwl40/dUy7k69vZCXYhUi1s/DcgRirkm6SkysAK
         kwX8KPtJFwts0J1sf/ykuAqAFJCsT/BuuYOj8c54NX/IOB8npe6QYT99WivdjsW7lRHg
         Q16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z5iasv0Tn+EAgqcCTW+28/WJrxDWlSK3B7pN57OlmRg=;
        b=QP3v4QIfDkLx2scfkknELQZVsKGyHgArRAdKvi6EwyYpXJJu7d4da0j48RTPz+m02s
         HkmKa7pP1GEpAnHLigSCK4Ym/BLhOOnvCgCeBAlq4wIotwUlzp6CauqMADAmoPHmfpsW
         56ofAJIei2RezOcC6gNpCsWqW5NTkSpuYTCRtsrSA23Thc0Pnld8ZpwAFLQi1K0H8iNU
         fYJqAudcVK8JWmfXRZje1BHbhKST98xcAt1K1A3vMsIOvw5g1sEAKpru3BWZunrrLgq/
         LWzha8Ma8H1TaHCc7co1L0BmRnQLEdEfysS2d6SCY7ne9Rxexx8jhffR/uBS6J6QVSaV
         NLTQ==
X-Gm-Message-State: AOAM531y7dyo5ukWFQZ8bROoGImnbgjJGXvXM9q6rJowicNV3RzCMX31
        8S2bD4FcgrE8vdDjheQjyQyCUw==
X-Google-Smtp-Source: ABdhPJz8F5yoRLWdQiuXZgXwodrkuPDhzHULObQCiPwxXX5bRQuDSrqRaao+RiP2JtvjvAjUvy4jsA==
X-Received: by 2002:a9d:7855:: with SMTP id c21mr11213697otm.218.1606018259837;
        Sat, 21 Nov 2020 20:10:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l184sm4720513oih.27.2020.11.21.20.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 20:10:59 -0800 (PST)
Date:   Sat, 21 Nov 2020 22:10:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        robh@kernel.org, svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        truong@codeaurora.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pci: qcom: Document PCIe bindings
 for SM8250 SoC
Message-ID: <20201122041057.GC95182@builder.lan>
References: <20201027170033.8475-1-manivannan.sadhasivam@linaro.org>
 <20201027170033.8475-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027170033.8475-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Oct 12:00 CDT 2020, Manivannan Sadhasivam wrote:

> Document the PCIe DT bindings for SM8250 SoC. The PCIe IP is similar to
> the one used on SDM845, hence just add the compatible along with the
> optional "atu" register region.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> index 02bc81bb8b2d..3b55310390a0 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> @@ -13,6 +13,7 @@
>  			- "qcom,pcie-ipq8074" for ipq8074
>  			- "qcom,pcie-qcs404" for qcs404
>  			- "qcom,pcie-sdm845" for sdm845
> +			- "qcom,pcie-sm8250" for sm8250
>  
>  - reg:
>  	Usage: required
> @@ -27,6 +28,7 @@
>  			- "dbi"	   DesignWare PCIe registers
>  			- "elbi"   External local bus interface registers
>  			- "config" PCIe configuration space
> +			- "atu"    ATU address space (optional)
>  
>  - device_type:
>  	Usage: required
> @@ -131,7 +133,7 @@
>  			- "slave_bus"	AXI Slave clock
>  
>  -clock-names:
> -	Usage: required for sdm845
> +	Usage: required for sdm845 and sm8250
>  	Value type: <stringlist>
>  	Definition: Should contain the following entries
>  			- "aux"		Auxiliary clock
> @@ -206,7 +208,7 @@
>  			- "ahb"			AHB reset
>  
>  - reset-names:
> -	Usage: required for sdm845
> +	Usage: required for sdm845 and sm8250
>  	Value type: <stringlist>
>  	Definition: Should contain the following entries
>  			- "pci"			PCIe core reset
> -- 
> 2.17.1
> 
