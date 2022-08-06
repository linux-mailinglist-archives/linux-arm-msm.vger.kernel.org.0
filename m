Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5652658B71A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 18:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiHFQ4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 12:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiHFQ4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 12:56:42 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EF2DECA
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 09:56:41 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso10878096pjf.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=chw1AUQBrnHboAKY0eFDG8UW2unxy880Ni7vYVjl9Zw=;
        b=oTy6/IS6vceirX0RWj8vRNlVBMCjAEkWWGD/jdr2yKnCpwEOL/lMFLgZ5ltoxQjIk+
         bLxMR+2I/BJhymC0le1OklWBEx1BDjgSXCGWa1Zz7vrt0SiU6S/sUBF5peAtEjQ4ac0E
         2yMs1dI74/NdbRDYq6Udu8L0bSc1+Dsh9iBbMbZrGWYq3ulCiKajkfMH/6IiwEHtg5Sf
         9phe2Kv+TA74Ttjk5YV9nl39s+b7iTmrz2qQDKcUlhxEMnnHUrQzFZqoYUGXyRDJBd9N
         9bVxXoGb44BGsGSXyqsOdULHBZFM6YjFds5S3N6VVmyJ3qzTOTEbCiiwJU730Nf0eqRq
         jvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=chw1AUQBrnHboAKY0eFDG8UW2unxy880Ni7vYVjl9Zw=;
        b=oDui3G58eKhRAP/VXZcP37nDw3Yj9L5X+/3V7WXtAMeWfFf0v/NbQMa/rZ1e09A8Oq
         b08C0meMJhhzRH0rDhfyEJQ1mJVMUfo3aRhAC2PahZgUM1OnuED8JstmE/p+tQEVz58X
         Xi+xtYXDr8SJB1UuO4vdBKRnI+oz54mcGQ9EdDdwqO074sAqojtBG0PUQC8x4NTvdoQI
         r1nRxKjVUExc35uOmyb/b+dvTvMLVSnyoDInqwedQDqO18YuIyV2Q5lOuFvhq4QVHiTP
         hxMBZnJ6J7yWLazZOPhuP5tCvgaCH0MoY64wNGEUQ03+o4vJTuHQU0mMPfAdRRv6xgNe
         siPw==
X-Gm-Message-State: ACgBeo03Vt6SSNPnyORMhooIW4Z5DWauW5UTYRb0YN/LNHMnZC5XK3Uv
        6Yabo66OvpLsUEoLkZo6eSgDHj2VGRLw
X-Google-Smtp-Source: AA6agR5FxI2iCQHJREN+PCkoSjiGqfJALmgeBMRVOV2Sqzb486q9zhCsl7qqCY/kERygF5jPchWxmA==
X-Received: by 2002:a17:902:ce83:b0:16d:d667:d4df with SMTP id f3-20020a170902ce8300b0016dd667d4dfmr11551145plg.159.1659805000693;
        Sat, 06 Aug 2022 09:56:40 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id q12-20020aa7960c000000b005251f4596f0sm5311376pfg.107.2022.08.06.09.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 09:56:40 -0700 (PDT)
Date:   Sat, 6 Aug 2022 22:26:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc8280xp-crd: move HID pin config
Message-ID: <20220806165635.GO14384@thinkpad>
References: <20220805092317.4985-1-johan+linaro@kernel.org>
 <20220805092317.4985-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805092317.4985-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 11:23:12AM +0200, Johan Hovold wrote:
> The HID pin configurations belong in the HID nodes rather than i2c bus
> node.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 47192e9cf7a4..ae8be1b743ce 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -194,16 +194,20 @@ &qup0_i2c4 {
>  	clock-frequency = <400000>;
>  
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&qup0_i2c4_default>, <&ts0_default>;
> +	pinctrl-0 = <&qup0_i2c4_default>;
>  
>  	status = "okay";
>  
>  	touchscreen@10 {
>  		compatible = "hid-over-i2c";
>  		reg = <0x10>;
> +
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
>  		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts0_default>;
>  	};
>  };
>  
> @@ -219,24 +223,32 @@ &qup2_i2c5 {
>  	clock-frequency = <400000>;
>  
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&qup2_i2c5_default>, <&kybd_default>, <&tpad_default>;
> +	pinctrl-0 = <&qup2_i2c5_default>;
>  
>  	status = "okay";
>  
>  	touchpad@15 {
>  		compatible = "hid-over-i2c";
>  		reg = <0x15>;
> +
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
>  		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
>  	};
>  
>  	keyboard@68 {
>  		compatible = "hid-over-i2c";
>  		reg = <0x68>;
> +
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
>  		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&kybd_default>;
>  	};
>  };
>  
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
