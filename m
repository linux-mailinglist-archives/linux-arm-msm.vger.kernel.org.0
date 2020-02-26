Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2645717039D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 17:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgBZQAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 11:00:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:47272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728406AbgBZQAX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 11:00:23 -0500
Received: from localhost (unknown [171.76.87.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B37221556;
        Wed, 26 Feb 2020 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582732822;
        bh=EqVxdl4cALqg8w0BRf5DWyljaf0SUvy/U0GO5XGzNPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aAhRK20/XmxR215d1nehbFy1c9uFykiY17ILbyz8vhnWE1pm/qE/7WLfEqAD7xDC0
         OLXGliyTTu5IODUDYwmcXLhaEmFlUtnJ5amIoIurvEyOBhVihW5S2RZ8fs/awt1t1H
         y6HrtRUD4oB6Z2SLxl0yf0vXfqsi+z34bSbytRK0=
Date:   Wed, 26 Feb 2020 21:30:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: thermal: tsens: Add qcom,tsens-v0_1
 to msm8916.dtsi compatible
Message-ID: <20200226160018.GA2618@vkoul-mobl>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
 <ab6a982bd9bcbc76262cd9ca5dd6ea10cf45b8a1.1582705101.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab6a982bd9bcbc76262cd9ca5dd6ea10cf45b8a1.1582705101.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26-02-20, 15:01, Amit Kucheria wrote:
> The qcom-tsens binding requires a SoC-specific and a TSENS
> family-specific binding to be specified in the compatible string.
> 
> Since them family-specific binding is not listed in the .dtsi file, we
> see the following warnings in 'make dtbs_check'. Fix them.
> 
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8916-tsens'] is not valid
> under any of the given schemas (Possible causes of the failure):
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8916-tsens'] is too short
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8916-tsens' is not one of
> ['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8916-tsens' is not one of
> ['qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,sdm845-tsens']

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9f31064f2374..1748ea3f4b4f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -860,7 +860,7 @@
>  		};
>  
>  		tsens: thermal-sensor@4a9000 {
> -			compatible = "qcom,msm8916-tsens";
> +			compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
>  			reg = <0x4a9000 0x1000>, /* TM */
>  			      <0x4a8000 0x1000>; /* SROT */
>  			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
> -- 
> 2.20.1

-- 
~Vinod
