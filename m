Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741733AD16C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhFRRrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbhFRRrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:47:00 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8E4C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:44:50 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso10427441oto.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z45ZRVY3PmNbKDWQ2pZtZofzyWVzRspxGBeBytptIKU=;
        b=ZdhDET5thU5UyF8i25/TsxNo2D/56hddVFvS0Qz7b5DIzhtYvMCQ3QELfHYJjeHfNc
         zcUhzimmRiktF3G4OT7YnkiOe4miOflPUZ5ZEOat8qYfYHti5FuF+DhBPyNXUyTcxdD8
         FeHEm2d5faieVWlKpPmviY8mATkiuAsqFgjrQjRO5KJ1OnJx2Pnj3la6sJEWSEC/ZHfJ
         oOfAlFYmnQqfR4FZj6wwq6Zue5pal+X5i8MZeAZM7J0FfO7HLlPT5s/RuH3opJSMGup4
         oiZ6LKmoM1jzeZ/TLiXdHLpOnSA0OFyzrTZ7B2xC6YYn9ZYkFjavS9EpnTRsyoUtsoeX
         4opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z45ZRVY3PmNbKDWQ2pZtZofzyWVzRspxGBeBytptIKU=;
        b=YfGEMClKbJ0/dZkMAdPF9dlOZvs/HpsfLgSDVEmNbjOBnCVJhpEY2o5ee5iTYHlC/h
         RAnOA2oBBbyk2HomIkIGJGPNnXMR0sHwoAmPasSt/6w/PBAVZe0i5ANbn0YgwD/mv/3z
         l3WQJXcDbw1UDc1cvRLDbkjMqMlNmGkpv+CcWN+y/ZAJHFsG0QT2keP3tgjp0h9lNNcy
         sfFOkkdl0xA44dSVKhUYXLvBXi65pZnFdkSRLaP3DquCu9QXRpzr0WkT4efHg1IsKuge
         CEnRcomMulsh5tRAi5Ji2yy9lcOvHDg/N+cT4TZi6135wYe83k9L6eUs6y81lwKQrLxj
         l5+g==
X-Gm-Message-State: AOAM530Mun6lks2QPlVS9UKo9hTesukDin/7lEUjr1v1TK/mdrFmvUjK
        nYg3bUjOozJHBP/fmm5DxpBXHA==
X-Google-Smtp-Source: ABdhPJwyMOF1h8Ge/75wfCEnAXWfoFCN8QoAgvsbLueZLEw4jCip37wq4GoF24/qHiuaWF2OQfp/bA==
X-Received: by 2002:a05:6830:40b4:: with SMTP id x52mr10145439ott.117.1624038289768;
        Fri, 18 Jun 2021 10:44:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 79sm2163284otc.34.2021.06.18.10.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 10:44:49 -0700 (PDT)
Date:   Fri, 18 Jun 2021 12:44:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add xo clock for eMMC and
 Sd card
Message-ID: <YMzbj9uaAPcpwIhF@builder.lan>
References: <1623835059-29302-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623835059-29302-1-git-send-email-sbhanu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Jun 04:17 CDT 2021, Shaik Sajida Bhanu wrote:

> Add XO clock for eMMC and SDCard as it would help in calculating dll
> register values.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> 
> Changes since V1:
> 	- Updated commit message as suggested by Bjorn Andersson.
> 	- Added space after before xo clock name as suggested by
> 	  Konrad Dybcio.

Thank you Shaik. Sorry if I wasn't clear when I tried to say that I
fixed these things and applied your previous patch.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 52115e0..fb1d9ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -701,8 +701,9 @@
>  			interrupt-names = "hc_irq", "pwr_irq";
>  
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> -					<&gcc GCC_SDCC1_AHB_CLK>;
> -			clock-names = "core", "iface";
> +				 <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
>  			interconnects = <&aggre1_noc MASTER_EMMC 0 &mc_virt SLAVE_EBI1 0>,
>  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_EMMC_CFG 0>;
>  			interconnect-names = "sdhc-ddr","cpu-sdhc";
> @@ -2564,8 +2565,9 @@
>  			interrupt-names = "hc_irq", "pwr_irq";
>  
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> -					<&gcc GCC_SDCC2_AHB_CLK>;
> -			clock-names = "core", "iface";
> +				 <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
>  
>  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
>  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
