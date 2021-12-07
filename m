Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54B46BE2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 15:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbhLGOz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 09:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238251AbhLGOz2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 09:55:28 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10586C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 06:51:58 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id r18-20020a4a7252000000b002c5f52d1834so5470685ooe.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OeNOUxJRvzJDEPV0OHCTfN/BC6OjDO8ZDnn+8g5u4A0=;
        b=H4vHUFxY+7ZtRXtaHRDlhIzLI79WBBMNDjTny3CTQzQRnqFaZDmH7U314L1aT/sBuq
         IaAgyYE2n98cvIsPjjRf23kimor5r2uQqirFclePUpX3mTbIuZD5l2yT7UEGAU49S0QW
         37ux2Dul11cQJBSg1WUeyl7Yb0EkFPfuo9OI5eieCQTIEXZ4Qp6oBktjbMXEeCizfPpz
         57CJgP9NU31Q8nR3IKtBsUK0tzWUOxBIOlimy9p2ttVqRnu3T4YVret8FX9fcKTELqx2
         mrZ1aqqP6RYz6BlrrVgvg2FAqs/kLM2XFV/brhjIehGfu7chrbmxfZ8Vbe/rBGelCSKD
         5LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OeNOUxJRvzJDEPV0OHCTfN/BC6OjDO8ZDnn+8g5u4A0=;
        b=vKqyqrPtCRfwXMZ6cC2JebD87XmioFnSXaWbqCJcZxoNIsVYgg2INQ0Imjcc95Tfsw
         3po9qRSfFs+wrV3yHNSOH0rBOXL/Coq7LpljRe57/JYtFSdhxLzwjusNq8X4g5U0Tqcq
         rK0QHFpY0Z3PM6pykdN4YCqXCG8E3Bb/f7L0ijNxgN2eAzR1IBUuwtfKTDwSJ/T2nidV
         h8HhP0sHOnV2SF59FbJs/bbF2nGEhG2mdBg85m1gLL9j+v0vryXxh33nfC2qNX9m3AC4
         hkuhyycJ2ZFDUNwX6MUp54KS829rqyR/88A70dVrw8mPlAEkyS2RpAQzm06kS4SMcjuH
         dhbA==
X-Gm-Message-State: AOAM533ce0iSaSdZP/vAmJwlwB6OlL6KJMQKxd1klBiF1gg9988oWjXy
        vC9MegtESTLQpKTFbVpQ7oXNFQ==
X-Google-Smtp-Source: ABdhPJx4b5NHZUnIbdAlET8r6WP74/NerDHcpOLA4tts/SA95+Tbms6lQZAldQ7a4U4g4i2c+FcbbQ==
X-Received: by 2002:a4a:c987:: with SMTP id u7mr27386225ooq.65.1638888717409;
        Tue, 07 Dec 2021 06:51:57 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm2813460otj.14.2021.12.07.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 06:51:56 -0800 (PST)
Date:   Tue, 7 Dec 2021 06:53:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/15] arm64: dts: qcom: Add base SM8450 DTSI
Message-ID: <Ya91ZLytXpm9brJu@ripper>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201072915.3969178-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 30 Nov 23:29 PST 2021, Vinod Koul wrote:

> This add based DTSI for SM8450 SoC and includes base description of
> CPUs, GCC, RPMHCC, UART, interuupt-controller which helps to boot to
> shell with console on boards with this SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 476 +++++++++++++++++++++++++++
>  1 file changed, 476 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
[..]
> +		qupv3_id_0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x009c0000 0x0 0x2000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart7: serial@99c000 {
> +				compatible = "qcom,geni-debug-uart";

There's nothing special about uart7 on a platform level, so my
suggestion is that you use the standard compatible of "qcom,geni-se-qup"
here and then override the compatible with "qcom,geni-debug-uart" in the
qrd.dts.

Regards,
Bjorn
