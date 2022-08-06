Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1583A58B731
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 18:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbiHFQ7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiHFQ7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 12:59:47 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F15DF05
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 09:59:46 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w10so5202635plq.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yajg26YKKxsWCe5pWsAcyObGluBWF9dmEs4naRj0qv4=;
        b=uIDNnv9DrE4FmZfzhcJqY9mat5loGMEGNaPXdogbk71eZUSYihgX00aPvwbdnK62UQ
         w7WCL+tTA2caRRyEvOtijuO+5eSKL+qLnstj/TjnlbCMoD+NK6u/677X+r+2j4aK7Mrc
         6kNupTzbKcr0H8zfQTU7pSFlWsvDHWt2TKgH9AvWbZktwyOS5ioISkpKdFPOp74+OrHQ
         JfK+1iwGaHb4Y9zsAyX4dIu1OYVB4O9Ju/imaYe5drx7BEjFez7xGE8OZSc1vk91/iHf
         cTqg767E8uHiRcSWQp4WSaeJpxlUa8/Oc1hj8Cj79xr5P+y61KUu/0ABs8qW+OvtlUE0
         nmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yajg26YKKxsWCe5pWsAcyObGluBWF9dmEs4naRj0qv4=;
        b=pSyS1hu5P6+hmEu7IQN89hft1mJprb4EvUJz4pzO6mSG9R/EL7DQUTX9nAfZG7dKBb
         lrbWcHR5D+aaPVJAcDsiqgbkuyQwQtefNL+yn0cjTtRzSnVh/WaK4ouOwMdvj8ah78PQ
         RrNlsKlHuV8M80micgZ9+bRpEbO1kiJxj59XG98zBt/30MXaPLblq1uH5wBIIBb9z4iv
         BJlENUvvdqKOHO6TNg6vrUL8wHT+YFqUBbjuV1/SA6sG8yAzDOUY9iCxDM+lpx8YDf0o
         yqBCrI3WaKmXZTwwZax8zy4pGdGmGKbBajHIMQex+nth6OxLlp4vTASTMgg3qpoGv0Vq
         4Lcw==
X-Gm-Message-State: ACgBeo2ZxPhVM9cMoBPjg/ZjSmocqRqJBbC7MUeTsJnHcVdIRkrYiLsH
        i4H7mkF6niVGX3LciXsPPfBZeBU2jxs6
X-Google-Smtp-Source: AA6agR6jABn3VGmwJnmGoFNd8Zz0PNEDWOd//4g71uTcPAMLDbdOI2l6i8cEQyUjk2VCv3EcvCitdA==
X-Received: by 2002:a17:902:ecc2:b0:16f:3846:b279 with SMTP id a2-20020a170902ecc200b0016f3846b279mr11600093plh.127.1659805185927;
        Sat, 06 Aug 2022 09:59:45 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902ea0c00b0016d9b94ddfasm5338094plg.145.2022.08.06.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 09:59:45 -0700 (PDT)
Date:   Sat, 6 Aug 2022 22:29:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add
 alternate touchpad
Message-ID: <20220806165940.GT14384@thinkpad>
References: <20220805092317.4985-1-johan+linaro@kernel.org>
 <20220805092317.4985-8-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805092317.4985-8-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 11:23:17AM +0200, Johan Hovold wrote:
> Add support for the alternate (second-source) touchpad found on some
> X13s laptops.
> 
> Note that alternate touchpad is kept disabled for now. The boot firmware
> should determine which device is actually populated and enable only the
> corresponding node.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 1ca72f6ba55a..bdeb2d05aaa1 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -211,6 +211,22 @@ &qup2_i2c5 {
>  
>  	status = "okay";
>  
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
> +
> +		status = "disabled";
> +	};
> +
>  	touchpad@2c {
>  		compatible = "hid-over-i2c";
>  		reg = <0x2c>;
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
