Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE963379D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCKQrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhCKQqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:46:43 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADBEC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:46:43 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id u198so18825555oia.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bPUcEKNcpptROwJILSiD3wkdHggXhfiIn/H9PdmDfno=;
        b=krg2k6BzzEGNVSS7bUow1o25bmusgc0sVKlKTiV5mbNKLd6NEYVFzj25UiJYDbiKF/
         aTHuzaWxKY8VDA/O1dh/mRG8Ql9DqcWMt2q5Kwr8xMuZD9N7ZVQ5vh0cz+g5CF/pYAyc
         RnUxo+QC0fKgx9PaYZA7VpATtcxT1FBeWJN1EXBQx5z7Qa8rEMwfOj3m9h5ov9n7A/a0
         qQXaEng6h2ZebrXuCwXx69qSMj8RH4jwuf3d6RDF4YlIWNIG5yc7TfZKfWHg4xnTb3Nr
         Da/9C5x7F3sO4EChpxLhX+P1UMI9pvKQCfJZg3b9a28jpromLSiyhI6puQgNaL23XDPp
         E/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bPUcEKNcpptROwJILSiD3wkdHggXhfiIn/H9PdmDfno=;
        b=PkDLmIMxSb5YF64s7yfbDxc3I1vc5/D6bZrPzuFKdeBFW4Zg5dsp3MI3Ykt7041gbr
         V1uNERwJz4jTFIM76PvHJIg7cm5CVxO48w4epAy4gscfCEVOAf1LcvIlyVsy7Bk7lYFn
         FJR3NonMbcxlmLju+U+5Ta921H8JYV8+jQ61+TInVuIRT2RdXsi7WyFDeYS8y937zLx0
         VrytG2oLgbUXjXdWzByUGiMiC2ryDBWFbYD0bJBSubrktf3CzZ3aWcp8tP2fOfmejzxS
         lYMuwr5Zlijahz2z318scotSFTSBXlLXIK4ESKa6tqwpAM9LanzEYvtvDkceJiwj9B/s
         o5ZQ==
X-Gm-Message-State: AOAM531Y7puHcoIpr2J28uHIugH+aZPOtJ0qRkEDdOyaD2heLNfXg2Sv
        X341LELjGsOolEk+FRXrhyhZUg==
X-Google-Smtp-Source: ABdhPJy/Fzr+kRgQilQjVczRAawF1/aWCLfmSJ98T5tYv9gCXNqDVapK1PmCUBdfcvx9CUNd55fs0A==
X-Received: by 2002:a54:4494:: with SMTP id v20mr7144273oiv.147.1615481202527;
        Thu, 11 Mar 2021 08:46:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c205sm652931oib.40.2021.03.11.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:46:42 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:46:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v3 07/14] dt-bindings: arm-smmu: Add compatible for
 SC7280 SoC
Message-ID: <YEpJcIjZuxDFCMCt@builder.lan>
References: <1615461961-17716-1-git-send-email-rnayak@codeaurora.org>
 <1615461961-17716-8-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615461961-17716-8-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 05:25 CST 2021, Rajendra Nayak wrote:

> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Add the SoC specific compatible for SC7280 implementing
> arm,mmu-500.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

This should be merged through the iommu tree, so please repost on its
own.

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6ba161d..9d27aa5 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -34,6 +34,7 @@ properties:
>          items:
>            - enum:
>                - qcom,sc7180-smmu-500
> +              - qcom,sc7280-smmu-500
>                - qcom,sc8180x-smmu-500
>                - qcom,sdm845-smmu-500
>                - qcom,sm8150-smmu-500
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
