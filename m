Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777D85076A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 19:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244488AbiDSRhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 13:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244015AbiDSRhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 13:37:12 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935CB393F1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 10:34:29 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id k29-20020a056830243d00b006040caa0988so8053488ots.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z8TLbLfReqVjU1V5RrGBLrzOEWti2/YJj/Lmqyr2mRU=;
        b=Hk+iDwE1BufloZNfXKAGw2Ex8g+O5qMpaFlcLwy7lMnBGvBbeyHcv6YyI9A/yoF/Hz
         tzSm93Mp4JnWGN+jHrQfZwVziNpvWdkvdnSzyjIbXBRDcApl2RjnMOr6a7btYuQalkU4
         p3bWggEEkwyqpnDWE2D9rDlmkdFMJqAL47Sacfc+ZFjLHVekjOqC6e5C4zw2nZVYfuf2
         oXyBQ4haAPKsFkjPRICUNflaBI0kKDL5NX6oGq1+BOMOHPYCoNFgfWS92PFbruPmwisi
         ExkmahVCiJKCRCgNkvjyLuXFnlWPouGoZiwmulZodWFE4muoSz3JfTh+WPO25E71i2pf
         1FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z8TLbLfReqVjU1V5RrGBLrzOEWti2/YJj/Lmqyr2mRU=;
        b=46GoyXDFA099Q5g6WCy5soFWKUFnUjtSMbuyUhL8FTBuqdcrtRT5LwRot94VrFIFcJ
         0bjbO61TKe00kOjiFY9OsTl/eyKF/rFxtL+OYOO32AXVLE1crjCP4aM4TiQ7rMwQwQW+
         Dtv3nRYIiWIN3dxr7D7rYzpr5W5R2OiCPTi0AR1hJlmtlv0eU4M9ucOtmHaxeU3s6fi9
         6NAyG3qrNld+xhVwoz/ypbnQ6WFiet5gxyvRJcaqeT1xSLvlmvyexuVFYPf2ju+CK9Ay
         YNHJhIkJZTuYH7/5eYXA1jGsWm1ON35xIfUsLpMPEn/UUIxy8VrSuZnERflVUsegw1un
         1Hng==
X-Gm-Message-State: AOAM530Srnj3QkuPvD1aQ13UXs7IWjht7ecDFa0G8lMpqPo1BnFX952B
        KCqNZ17SeV7vaEz7KS2gsicSnw==
X-Google-Smtp-Source: ABdhPJzUw+TTAb6KW1iJVpbiTOwCdonhSAHLyMz/zOK1GLEoh/HQG+xVHf4N8LQfopb2pa42vkW4jg==
X-Received: by 2002:a05:6830:4b6:b0:605:47ba:2310 with SMTP id l22-20020a05683004b600b0060547ba2310mr5267772otd.301.1650389668886;
        Tue, 19 Apr 2022 10:34:28 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id m187-20020aca58c4000000b002ef721352easm5369685oib.14.2022.04.19.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 10:34:28 -0700 (PDT)
Date:   Tue, 19 Apr 2022 12:34:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add thermal sensor
 controllers
Message-ID: <Yl7yol4wdf04zOy/@builder.lan>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
 <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 10 Apr 18:44 CDT 2022, Dmitry Baryshkov wrote:

> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> The change adds description of two thermal sensor controllers found
> on SM8450.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 934e29b9e153..b695ce824722 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1021,6 +1021,28 @@ pdc: interrupt-controller@b220000 {
>  			interrupt-controller;
>  		};
>  
> +		tsens0: thermal-sensor@c263000 {
> +			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";

Please don't forget to add qcom,sm8450-tsens to the DT binding
documentation.

Thanks,
Bjorn

> +			reg = <0 0x0c263000 0 0x1000>, /* TM */
> +			      <0 0x0c222000 0 0x1000>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens1: thermal-sensor@c265000 {
> +			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c265000 0 0x1000>, /* TM */
> +			      <0 0x0c223000 0 0x1000>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		aoss_qmp: power-controller@c300000 {
>  			compatible = "qcom,sm8450-aoss-qmp", "qcom,aoss-qmp";
>  			reg = <0 0x0c300000 0 0x400>;
> -- 
> 2.35.1
> 
