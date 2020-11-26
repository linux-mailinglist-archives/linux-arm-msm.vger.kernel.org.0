Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C69A2C5B04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 18:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404543AbgKZRrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 12:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404542AbgKZRrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 12:47:17 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83A7C061A04
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:47:15 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id f11so3044342oij.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ji9tlscliCLN0LYIyEt9KD3a3MCIVAkdS9NkM4jRpzU=;
        b=GeqZtzB8CzX8/SX36WTvrTjGZINKtLen+xUmDFCJoF60rC43wPoG+F86S9YXQNSxO7
         S43tdvejsYFX3dNMSu0Taxbxc9/loWYec+adZRBEaFo0hIuyZ+MjnekJGM31pTDR7iQu
         lxtHUjWyHCoOqTKKnG4gRBCrVuNBJ0UMPFtNhII8Cyhx3BShvAFtkw+UsRtWh1G0LATm
         bbDWMd+yFVlH/gf/oR8Z9CxnXUZjYgd2fuzBLn8KF99OnlXUk5yKN6rciwrIhzcVG3nj
         fH/xe4tAgmnEb9afBRI7/LNIL5hlZ1jl/uS8PWeXXEXO/J2KVAmXD15p5utHnPCU7vaZ
         Uydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ji9tlscliCLN0LYIyEt9KD3a3MCIVAkdS9NkM4jRpzU=;
        b=hVcb57k7dTf76U44IoNvmFMuPoJHwMJFYmAVrJ4bepOVRz22E2GYv5RZP4iRGqsNXG
         XGnSliLg/a7x1RTtubqjGP2uNfg952nyR8kGhIOMgpBUi5BhRNXfGyfqwpWe+1S9MX6q
         X/a1LTcLOyvlJVtQZnJ8cwvLmvaxdV63RpMvojT/8mnZAKf3G1TUSiW4+A4EUzkxbZDV
         nsju9QuJJEvH6+/d+T7YcVL6jGQGXDzi73n178L3LZpghCHAoIefhQK2/LfgXzCqTzxZ
         vafaK+tBNklMWKRawMJCYBqL3LdLi7hjFl1cZNmI3NXkv+0Ahw94eRXkrqXhxZJe9laX
         kouA==
X-Gm-Message-State: AOAM530uzYctDhNcWJ+geV7RhIn7g+i+16k3ah/yKwt4r/SFZGvNDIrT
        NIAfYDz3kbgPiMGyk9botugY1Q==
X-Google-Smtp-Source: ABdhPJzV4JJZig/67KvTlQcOUGc8xVp51xSXwYlfjM7f8LjhRhYB1WlGP/8UUTGdyZAx2bNEQI2RBg==
X-Received: by 2002:aca:ed86:: with SMTP id l128mr2744772oih.0.1606412835129;
        Thu, 26 Nov 2020 09:47:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o29sm3357331ote.7.2020.11.26.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:47:14 -0800 (PST)
Date:   Thu, 26 Nov 2020 11:47:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: limit IPA iommu streams
Message-ID: <X7/qIMCOewRMG7Hy@builder.lan>
References: <20201126015457.6557-1-elder@linaro.org>
 <20201126015457.6557-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126015457.6557-2-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Nov 19:54 CST 2020, Alex Elder wrote:

> Recently we learned that Android and Windows firmware don't seem to
> like using 3 as an iommu mask value for IPA.  A simple fix was to
> specify exactly the streams needed explicitly, rather than implying
> a range with the mask.  Make the same change for the SC7180 platform.
> 
> See also:
>   https://lore.kernel.org/linux-arm-msm/20201123052305.157686-1-bjorn.andersson@linaro.org/
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Fixes: d82fade846aa8 ("arm64: dts: qcom: sc7180: add IPA information")
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c0efb101b0d61..eb66aadf360d7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1396,7 +1396,8 @@
>  		ipa: ipa@1e40000 {
>  			compatible = "qcom,sc7180-ipa";
>  
> -			iommus = <&apps_smmu 0x440 0x3>;
> +			iommus = <&apps_smmu 0x440 0x0>,
> +				 <&apps_smmu 0x442 0x0>;
>  			reg = <0 0x1e40000 0 0x7000>,
>  			      <0 0x1e47000 0 0x2000>,
>  			      <0 0x1e04000 0 0x2c000>;
> -- 
> 2.20.1
> 
