Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB4730283A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 17:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbhAYQwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 11:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730872AbhAYQur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 11:50:47 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EB2C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 08:50:05 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id a109so13387834otc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FXiOGPJTStyVPkN5QR6IiZg8V0I4G7zzEe6ZPNG+tu0=;
        b=Tabny4UNbo2e/sg7eclt06kqT5ioZhKFjOQojGSDzhvOPAVSHL+pgXPwHpYl1ly2vm
         +Jsb/lqzz8CiL44bNN+hthgilh55llayuHVMtb+437Uef7PHx1kV8O3Dd4S3Kl0HbUew
         sbcvxxRnM2ZMO5T/64pEuMy2PB5uCgKcrF1qYgs7wtvrYCTB7q7m9z4XNd08QYvOWArN
         xvSqYSTy9Pug4H9H7Fq7nGSUNsK+pGovRNQiDpBFgKvnydiA3Xa1kCXVzRC1SM7S6+Qs
         kmnO/DgNb003FU+189Zk7xhdXh0jITq0VL9G50h0AtGaQ1fo/fd5/XwnTb1dozCnVSJ7
         pDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FXiOGPJTStyVPkN5QR6IiZg8V0I4G7zzEe6ZPNG+tu0=;
        b=mfd1JV4K5CegQeuLtiNTEbQHFa5BlnF+iPporibXJwfSY3NTlU7Sdk8tv0LEx8pVqi
         Tzl0rGb1/nYGlYyCs90MjhsctFmyl2rKTGNWYYBPdUFZu2eUc9vB65RgC+hPxhoEy5Xr
         wnRexvKZ0ebr///bjAoC6b4C5of3ttgggT6oJbBQTKxzzGmQC0oj4SMMxCD9IhCRdshO
         oB623oBK8PjzTO6Wzfr7ArkFAoOTrU6AxltL3Zwn+Hk7+5Rkisf2kphRlFV0CAIl31bI
         G+//u6Rg6OOmWz5kLdG2wsILnMmadHxR4xY2BqJUr71m850cEL1Ggq5omStkgYKr8LxW
         SHQw==
X-Gm-Message-State: AOAM531cALzvR4Wh4Be3QBJSertsfIGdBVDV12O3t+BM2r+x/nUXUYra
        1fX0ag450v7+at7t1DC2u5UzPg==
X-Google-Smtp-Source: ABdhPJwa37NdGl0h6SNNYtodzUCLuxnziGC5ipaC8v4/Ne5doejFqNHW7GfaAqTxW/v6trTIszI2LA==
X-Received: by 2002:a9d:27c6:: with SMTP id c64mr1053724otb.313.1611593404407;
        Mon, 25 Jan 2021 08:50:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o16sm3544458ote.79.2021.01.25.08.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 08:50:03 -0800 (PST)
Date:   Mon, 25 Jan 2021 10:50:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH] arm: dts: IPQ4019: add SDHCI VQMMC LDO node
Message-ID: <YA72ufb10QEZc5VH@builder.lan>
References: <20200907101937.10155-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907101937.10155-1-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Sep 05:19 CDT 2020, Robert Marko wrote:

> Since we now have driver for the SDHCI VQMMC LDO needed
> for I/0 voltage levels lets introduce the necessary node for it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 6741a1972e55..7774dbd3cec7 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -211,6 +211,16 @@ tlmm: pinctrl@1000000 {
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		vqmmc: regulator@1948000 {
> +			compatible = "qcom,vqmmc-ipq4019-regulator";
> +			reg = <0x01948000 0x4>;

The actual hardware block where this register is found is the "TCSR"
which is 0x01947000 of size 0x21000 - making this the register at offset
0x11000.

Perhaps it would have been better represented as a simple-mfd with this
regulator as a child node thereof.


That said, this has been sitting long enough, so I'll merge it as is and
we can rework it once we need more pieces of tcsr.

Thanks,
Bjorn

> +			regulator-name = "vqmmc";
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-always-on;
> +			status = "disabled";
> +		};
> +
>  		sdhci: sdhci@7824900 {
>  			compatible = "qcom,sdhci-msm-v4";
>  			reg = <0x7824900 0x11c>, <0x7824000 0x800>;
> -- 
> 2.26.2
> 
