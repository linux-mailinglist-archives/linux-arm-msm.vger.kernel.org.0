Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4AA4B447A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239676AbiBNInt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:43:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241727AbiBNIns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:43:48 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FD74EA0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:43:41 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d187so28012179pfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qcnUrsY+dJtUzWlXtLbGA19ezD+s4FyCEB4BxrVfky8=;
        b=LSOzkp26jjR8YlaehwHRfHMexMkvrLWG952dQi07vUdrxnbSdx1Y2BvvzQI5HOzKIB
         Sfn+3WgDi7D3Q5cc6LvIbyuSUX1MwnRDLWUmzV4IvsqrSwfOM/dckP/m4WtVB8ulmpjW
         3srEhpIzICO75GvEKo96oZZiA4GjnB3pPHoObm3x8gVgso0tPsZGk9VOXcZkGFETfyhG
         R8nj4e4/ofCR6zvfAWftZdttNsTerBGO5te9gZt3d8/5KA0nc+2BwO/pLlDIYKlP1aaL
         sc6OD/vmeswYaAns32NT8SMsMrvZ07aUT2WrsDLJqHF6E2dA8e6OZIHTcN2rmW1hEn2I
         bUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qcnUrsY+dJtUzWlXtLbGA19ezD+s4FyCEB4BxrVfky8=;
        b=7aO7/H29utMMHrGPaZCZ6PXPpmPP7uVQFS+5WXIx0cUpVL9ytQbXbuGmuvRlG/fYkB
         mnx2ZG03uqulU69aWXNjyXekxEsOhLfOyzc8zMHhU8cU6JXgvHVMwrGbOL2elwkXmCFc
         tp/pVq7sr3DEZfiVdZAGKH85g7RlOEv5jTG/ce2GBXkjo1nluP9oDpMQuUlzssz748ii
         BAL9svqPI3WU6+XaNuZTuka02tR6WeedX6LKPKuGKEz1h6ynHihJ9xA70OCDcUP8BWn/
         vzcHBDXyCKnhZJbgINlbygXx8bnpB6Q0T3bY+rYQwZO0DZUHzOyl5KlYzuXnesIOH0PH
         kacQ==
X-Gm-Message-State: AOAM532nvfVwkZ4AEjr77uUxlaeLqC5JLGSPiLN44vAiI2ZGiMpuAgVo
        hyNCbvrU1nfOUR79bEn1+tBV
X-Google-Smtp-Source: ABdhPJwA+Gu8Sb+2JkcZ8tIUj3lvBso0yT297wHbi514ECZ4CtHix4aa2V8y8Nq5kyG0fZJj+8VGnw==
X-Received: by 2002:a63:8248:: with SMTP id w69mr2763076pgd.442.1644828220753;
        Mon, 14 Feb 2022 00:43:40 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id nm15sm13084320pjb.17.2022.02.14.00.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:43:40 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:13:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] ARM: dts: qcom: sdx65: Add support for A7 PLL clock
Message-ID: <20220214084334.GE3494@thinkpad>
References: <1644822069-27513-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644822069-27513-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 12:31:09PM +0530, Rohit Agarwal wrote:
> On SDX65 there is a separate A7 PLL which is used to provide high
> frequency clock to the Cortex A7 CPU via a MUX.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm/boot/dts/qcom-sdx65.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index 556a2e3..2900ffe 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -125,6 +125,14 @@
>  			      <0x17802000 0x1000>;
>  		};
>  
> +		a7pll: clock@17808000 {
> +			compatible = "qcom,sdx65-a7pll";
> +			reg = <0x17808000 0x1000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <0>;
> +		};
> +
>  		timer@17820000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -- 
> 2.7.4
> 
