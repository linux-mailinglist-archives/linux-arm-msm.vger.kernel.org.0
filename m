Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636843C3230
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 05:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhGJDPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 23:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhGJDPa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 23:15:30 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9ADC0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 20:12:45 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso11513272otu.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eazz+RPiPjL3cNRuOI983DWMBua4N7N7F/aRJn5tHYI=;
        b=YUzbwhpOX5TTXByAqzLVTQg2Ld5Adcq6Ao/RZ3m4Bd7IKpn2W7KnEjcMyBnYX5XCe+
         kuzm2RwkaYP6C/FRfb7nBEASntTpH5dSkA9Gyq46swFvD0YHynylLgt781RgKg/CyDB+
         ZzkBleoAJWRzKHFaB+nrH2ecb4p4DxEBMbspgodlzBro6GSkag8Q7oDU7R4I2TKI4cG/
         cY7A3bt1LLP7nXvoJ1V0/Xp85x3/m2gqmAwKm6dpadygnG20BlYV1HbD7PimNGlRcGri
         xG3NbfyIvuJYB2CUC/xH7x17G947c5gtT8lAsf9/qvFxEU0ZwuyvJyvqZRJWi5ZTJpDw
         ZuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eazz+RPiPjL3cNRuOI983DWMBua4N7N7F/aRJn5tHYI=;
        b=fWxlaHjO8hgMtxe/45mB1qFFCj5o78VH2MkoqN4s1NefpxxHwkAJs1DiwB16lXqV45
         qoiT88f7/WzXXqB2mXnJIFijHHYjyD18u1Fks6w+vVRcnsm4eCVxTIdlMaMhATcBEaG3
         CZffso6E9AJ+CSRismmjc/FoTKTH6X/xl4UN4TFiWqZtKojgA/bNELXs62QjUMLdIRlZ
         6rgdz5FQfL6W+RcsMInF/l5fZsMRUJiDHGuL9J6Ws2HN2a6Mmo/llMzCuIJ0QA+E/knR
         BWSU23xFQjbKjH/zHH+FzGy2EINrL1Imn6CXTdAO396s/cqOg+fI2y+uKoAxoeqs42AV
         BbCg==
X-Gm-Message-State: AOAM530IazZ/wXER3to/rkgEPBOlnHxPeUmOzV5bF7xPMYiBTMq/vv71
        LnpwgVa0Um9d65xtK/TW3TWJ3A==
X-Google-Smtp-Source: ABdhPJxIz/4eGDDoxN1i1tug+1xliP67hhpFQgC0pAim8BZIAJJF2cZyUeTRB96b9K2RO2NY7dW7cg==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr31741958otb.257.1625886765244;
        Fri, 09 Jul 2021 20:12:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 76sm1540357otj.28.2021.07.09.20.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:12:44 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:12:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 1/1] ARM: dts: qcom: sdx65: Add pincontrol node
Message-ID: <YOkQKkUMO3cvR4yz@yoga>
References: <20210709200819.20373-1-quic_vamslank@quicinc.com>
 <20210709200819.20373-2-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200819.20373-2-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 15:08 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> This commit adds pincontrol node to SDX65 dts.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index 4b5e7248c34d..155635d1de2f 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -96,6 +96,17 @@ blsp1_uart3: serial@831000 {
>  			status = "disabled";
>  		};
>  
> +		tlmm: pinctrl@f100000 {
> +			compatible = "qcom,sdx65-pinctrl";
> +			reg = <0xf100000 0x300000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			interrupt-parent = <&intc>;
> +			#interrupt-cells = <2>;

You're missing gpio-ranges.


Please squash this with the other dts patch.

Thanks,
Bjorn

> +		};
> +
>  		pdc: interrupt-controller@b210000 {
>  			compatible = "qcom,sdx65-pdc", "qcom,pdc";
>  			reg = <0xb210000 0x10000>;
> -- 
> 2.32.0
> 
