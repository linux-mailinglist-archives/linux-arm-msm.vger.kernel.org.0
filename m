Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2488A3E1F90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 01:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242500AbhHEXvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 19:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242550AbhHEXvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 19:51:44 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAC8C061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 16:51:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so13591683pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 16:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LvXvxc4FpfdQsNTQ2uP7M38rxQUNtPKsYk8dUCbk8vw=;
        b=RFz/Y/FntKBu086yBh8DOvEcoTbXW+UBSqeBcOSLniuR8fpBhTS4XE4KGiQqVWqTlT
         IByvUcFYRGdsnr80Wh7XaXMnHzQ/L0RXnuUg/7TP6zKxhc5pojD8RsY3/yOiXPcoPY7I
         Pk327FGZesE/IJlh1S2JpNE024prgZBIy+WLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LvXvxc4FpfdQsNTQ2uP7M38rxQUNtPKsYk8dUCbk8vw=;
        b=OCV4jmM7hqlMtJCKYR94HeZ+67k4L6OaeGuFfHngS719GuR8mbtIg4X4NfJ6nBYvWB
         yObq6uqUbOfdI3nsOuil0tZ8QdL+xjxzSQX40qzE6KndHkEVefAQJPjv4mfBbK/vmq/F
         fYEKTA2qYDD4j4A1fhIMlOZkid51NV/RAIV5DqkK/hrIgH48NriYjmxEGAzc+eX9rRsJ
         CLGqOMvrw5J7HrvjakcrfYnCrN1Mtxt4Np3nos3fejNmCzyX8PhDERnVseyoDXuzPfv6
         1uEoRxjRqCNiM+ddSFbLtND+PjMgScT+AmscZpR5IUKdHXDNnUhgwpoClvi7PirojZ7p
         W/WQ==
X-Gm-Message-State: AOAM532zS5h5ss6sTkww0Vvg2qd9NoVKyeFEnBtLwvdNDHOaXeye0GA6
        nZPUWJ9TgfWt6Lqk/u1YTxFJlw==
X-Google-Smtp-Source: ABdhPJx7XizOixq0HL7mC9NkNAJ0u2Ph2L3oW2+f1ilfNne9wrBdgsgcQQu8QVqLF9KyU4Zt1X8+1g==
X-Received: by 2002:a17:90a:9511:: with SMTP id t17mr17926916pjo.194.1628207488974;
        Thu, 05 Aug 2021 16:51:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8944:bd:9484:29e])
        by smtp.gmail.com with UTF8SMTPSA id t22sm9144685pgv.35.2021.08.05.16.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 16:51:28 -0700 (PDT)
Date:   Thu, 5 Aug 2021 16:51:27 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7280: add IPA information
Message-ID: <YQx5f9dD9KOGrXao@google.com>
References: <20210804210214.1891755-1-elder@linaro.org>
 <20210804210214.1891755-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210804210214.1891755-2-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 04:02:11PM -0500, Alex Elder wrote:
> Add IPA-related nodes and definitions to "sc7280.dtsi", including
> the reserved memory area used for AP-based IPA firmware loading.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a75edef..5764c5b5cae17 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -69,6 +69,11 @@ cpucp_mem: memory@80b00000 {
>  			no-map;
>  			reg = <0x0 0x80b00000 0x0 0x100000>;
>  		};
> +
> +		ipa_fw_mem: memory@8b700000 {
> +			reg = <0 0x8b700000 0 0x10000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -568,6 +573,43 @@ mmss_noc: interconnect@1740000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		ipa: ipa@1e40000 {
> +			compatible = "qcom,sc7280-ipa";
> +
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x482 0x0>;
> +			reg = <0 0x1e40000 0 0x8000>,
> +			      <0 0x1e50000 0 0x4ad0>,
> +			      <0 0x1e04000 0 0x23000>;
> +			reg-names = "ipa-reg",
> +				    "ipa-shared",
> +				    "gsi";
> +
> +			interrupts-extended = <&intc 0 654 IRQ_TYPE_EDGE_RISING>,
> +					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,

nit: use GIC_SPI for the interrupt type

> +					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ipa",
> +					  "gsi",
> +					  "ipa-clock-query",
> +					  "ipa-setup-ready";
> +
> +			clocks = <&rpmhcc RPMH_IPA_CLK>;
> +			clock-names = "core";
> +
> +			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
> +			interconnect-names = "memory",
> +					     "config";
> +
> +			qcom,smem-states = <&ipa_smp2p_out 0>,
> +					   <&ipa_smp2p_out 1>;
> +			qcom,smem-state-names = "ipa-clock-enabled-valid",
> +						"ipa-clock-enabled";
> +
> +			status = "disabled";
> +		};
> +

I know little about IPA, but besides the nit this looks sane to me.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
