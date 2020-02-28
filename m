Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B76172F46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 04:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgB1DYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 22:24:52 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34960 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730769AbgB1DYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 22:24:52 -0500
Received: by mail-pg1-f194.google.com with SMTP id 7so764227pgr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 19:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H/v7KsyZaSnIQHt4LUxp0DK1a2Lu38EDYZabaVLVetk=;
        b=eTpcztdHQTm5/rDIVIQIhxvItqZKHbqp4cI9mZTTdONiVx8F9HtFEuVvn1jG1sN9n/
         4SrvRPjkf814oGpFtngkhLRb9OmPMwakJjkTERr22C9HsAbrrD4FkhOuL+GrYHrP8nBs
         z7KhCttgvL/kQKAwVpE5ZgWyF2grXLwev9S00BA9I/UuqmzkutEzH0bess2NzdVxCarZ
         42o3bA6puBJJVbN1Q5nS/y6caMe/Vnmd+dALa1VEMt1AfqmotHqc0pMv9a3SKIAUAzmQ
         bnOkoHLEMMkeQYo2WRuSM11EggSJyEJQInx0OVpgjN49XXFCDoheLw3GT5M6pYkadBwW
         Masg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/v7KsyZaSnIQHt4LUxp0DK1a2Lu38EDYZabaVLVetk=;
        b=Zh5vx/VNmsElpWwS3i/ROn70ljEzidj5NeaDX9u/mcLOfqAv0ywDuK1EJ3II4goD/E
         xVT+DhjoNsmXdB2ghVK+CQ9hmr0Ly0Uh7W7WKASJU9fGF31QMQo01peMd+9SQs5tANMH
         +9b/SKywtUQaqf1ld/I9J5C2E848H/MUusiLuAMnOqCQCkc1bo+k9x8aTtys0KffmZ0X
         gfmoHeoIQJmACTCoWe54zITF+nu6xkgDx3kqcP+84c+GbA7/Rh2FXnunTNsW4hynZV68
         7RbdsBP/cNaPLmv9ip63OXF2rJnkc7FJ2yi/WvOdhqFASn9gRZG5c2eet+Ml/Yy/HgkZ
         BCdg==
X-Gm-Message-State: APjAAAXjuSVb7R+//9pAJkQ36iDSwY2RgbH/6gycUBBEFeqz71CgDbUb
        SrAzdqa1uGQdrIGchd3Eaws1KA==
X-Google-Smtp-Source: APXvYqxcXORPyb7DbvPZYryfw+X2PjFVWDfnTU6OxjUhkfzPetW6eG/5nxsAIrTsbdOAHZeW0urarw==
X-Received: by 2002:a63:df02:: with SMTP id u2mr2341345pgg.403.1582860291347;
        Thu, 27 Feb 2020 19:24:51 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y9sm112165pjj.17.2020.02.27.19.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 19:24:50 -0800 (PST)
Date:   Thu, 27 Feb 2020 19:24:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: thermal: tsens: Add qcom,tsens-v2 to
 msm8996.dtsi compatible
Message-ID: <20200228032448.GB210720@yoga>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
 <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Feb 01:31 PST 2020, Amit Kucheria wrote:

As with patch 2, $subject should have an appropriate prefix. Please
update this.

Regards,
Bjorn

> The qcom-tsens binding requires a SoC-specific and a TSENS
> family-specific binding to be specified in the compatible string.
> 
> Since them family-specific binding is not listed in the .dtsi file, we
> see the following warnings in 'make dtbs_check'. Fix them.
> 
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is not valid
> under any of the given schemas (Possible causes of the failure):
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is too short
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
> 
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is not valid
> under any of the given schemas (Possible causes of the failure):
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is too short
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 7ae082ea14ea..f157cd4f53b4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -446,7 +446,7 @@
>  		};
>  
>  		tsens0: thermal-sensor@4a9000 {
> -			compatible = "qcom,msm8996-tsens";
> +			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
>  			reg = <0x004a9000 0x1000>, /* TM */
>  			      <0x004a8000 0x1000>; /* SROT */
>  			#qcom,sensors = <13>;
> @@ -457,7 +457,7 @@
>  		};
>  
>  		tsens1: thermal-sensor@4ad000 {
> -			compatible = "qcom,msm8996-tsens";
> +			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
>  			reg = <0x004ad000 0x1000>, /* TM */
>  			      <0x004ac000 0x1000>; /* SROT */
>  			#qcom,sensors = <8>;
> -- 
> 2.20.1
> 
