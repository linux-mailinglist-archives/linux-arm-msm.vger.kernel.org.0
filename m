Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73131DB1D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 13:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgETLeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 07:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgETLeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 07:34:19 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C91C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 04:34:18 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id m18so664211vkk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 04:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgmfyzVYzscCx4dDlPSqr1e5ZR4oYBcUr/7sbyuRQZI=;
        b=fj9sgLib8MofXTKe1dMs13C6gyONXHS2rDtjzx7S78uHk74FIhLqglDxqTQHQeXLNH
         cn9OrhwXtAvlsvj+bD0DF44mdrGPzntlqBDCPaH360Hj60rTxrFpv0OEKADDEpdzAvf7
         G2UFqzj3z+OA/EzQGbEigdKtC/5xvhK4UQJfVHNFrht0Xl3TmzmMYuwC9SFpWVcHW3h7
         2jMRDd9X7bRKcX8gluJMAxGQzr+VfvU1yIfLoSYhN6n7xY6jkLN+YSzwb33A7z8PmVX/
         szyPVtLJ6L3HLMOeanuO2IOMvah1a154/lGdG37E8Vtn9n9GeL7R6t4b2UifiJ3fEnnK
         hDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgmfyzVYzscCx4dDlPSqr1e5ZR4oYBcUr/7sbyuRQZI=;
        b=GT4OZCWmVxPuIP6A7JQhfCrlpVmhhxnPwxFukOc4LKHkWFYUV+UceChwefY4jVpbqj
         ws5+hhM2n+iGE51Ky0VklMKPsyPjdlzxVD6nhQ56nqYWKYxapZOPCMuziBh6nfN2GvUw
         NvFvlslinI2jCTCKQzAEsL2OetLA9r3NdLQFKCOlZFr7dXquFUa3sgA2OEf+cOD3UpSw
         34uJA6hPmzYflAS3GIBnIB1nU9aq3KtS91e9l93HhyDsX/vxsG/iqp16D6H2ZPiLMAXr
         Mi2mUgiJWjShrnR4TgDbQANfZMOpzWvH53b7O2sXuedNtLAa3J3vIfFFwdNIePLAG+fA
         dHlQ==
X-Gm-Message-State: AOAM5334rA+scM0lvGZZTtzI6xVf2GJSx779Z3Kp9mozu5pm4v/WlGZd
        iIa008xGekYbMq672fw3K5P3tssH8rVF77AkuEZrmQ==
X-Google-Smtp-Source: ABdhPJxKuVUpB+U+VNKWEGX391HdkT4mDSF1Cg8zQZh7p+i+ndcZwRmQL7rhoJt2wQSfYPd+IGT2+LG8GsbHywt+4g8=
X-Received: by 2002:a1f:25d7:: with SMTP id l206mr3353792vkl.53.1589974457487;
 Wed, 20 May 2020 04:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org> <1588838535-6050-2-git-send-email-sartgarg@codeaurora.org>
In-Reply-To: <1588838535-6050-2-git-send-email-sartgarg@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 May 2020 13:33:41 +0200
Message-ID: <CAPDyKFoSz2f+t=-S-K_Qwkd07y4BC+ne-kiqNk+Zpjbe_rN-oA@mail.gmail.com>
Subject: Re: [PATCH V1 1/7] dt-bindings: mmc: Add information for DLL register properties
To:     Sarthak Garg <sartgarg@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 May 2020 at 10:03, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>
> Add information regarding DLL register properties for getting target
> specific configurations. These DLL register settings may vary from
> target to target.
>
> Also new compatible string value for sm8250 target.

As Rob indicated, it's a bit confusing to understand the bindings. I
think the word "target" is what makes this confusing.

I would suggest splitting this patch into two pieces. One that adds
the new compatible string for the new variant and another patch that
adds the *board specific* dll bindings. That should clarify this.

Kind regards
Uffe

>
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 5445931..b8e1d2b 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -17,6 +17,7 @@ Required properties:
>                 "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
> +               "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> @@ -46,6 +47,13 @@ Required properties:
>         "cal"   - reference clock for RCLK delay calibration (optional)
>         "sleep" - sleep clock for RCLK delay calibration (optional)
>
> +- qcom,ddr-config: Certain chipsets and platforms require particular settings
> +       for the DDR_CONFIG register. Use this field to specify the register
> +       value as per the Hardware Programming Guide.
> +
> +- qcom,dll-config: Chipset and Platform specific value. Use this field to
> +       specify the DLL_CONFIG register value as per Hardware Programming Guide.
> +
>  Example:
>
>         sdhc_1: sdhci@f9824900 {
> @@ -63,6 +71,9 @@ Example:
>
>                 clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>                 clock-names = "core", "iface";
> +
> +               qcom,dll-config = <0x000f642c>;
> +               qcom,ddr-config = <0x80040868>;
>         };
>
>         sdhc_2: sdhci@f98a4900 {
> @@ -80,4 +91,7 @@ Example:
>
>                 clocks = <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
>                 clock-names = "core", "iface";
> +
> +               qcom,dll-config = <0x0007642c>;
> +               qcom,ddr-config = <0x80040868>;
>         };
> --
> 2.7.4
>
