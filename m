Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267F05681E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiGFIk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiGFIk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:40:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09D824BC5
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:40:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d12so1355970lfq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I2hjyds8g2dv5WuRtSpi+VxV5olHUTguPlVsXOjDs5c=;
        b=ik/DaBbjI2R3co3MqEspUKxKwDWjI0KRyzv9yWCtEta1mlul0P2FTfklpuMnRlYC1z
         685wFJ1XhY6Q7ApR2WFl/iYCpoooWUqgrYUhpaOQrOcUJxDmzsOtRvOgZKH0VgJEY2zq
         mQPEuFGZZjiNLLnH+ePznwR9xyMVSdmxKFPI6ogEK4umrWM1ZK7X/YSIuMw0aEqyn5A1
         Z3qLUfoPK7XH/UR0lcVKQuv+weYB1qM5Y1s3YOgB5f9S+oKnmwb+5Z9viNGIXk8cWR3m
         a9gzkoV+y2Oxw8JD1cNdyhTXuEWpz53gqnsrPO1f7D7P37JsKumnp8+anYowQMaCgumL
         e4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I2hjyds8g2dv5WuRtSpi+VxV5olHUTguPlVsXOjDs5c=;
        b=lA+Of6PvcFkhDvoRHZY7UE8H/7JPlRA5T5FpYbtcHj1NR5PFfIiaqpBV1vlLND7r02
         3jzx/2nIyRNEaT473wv1oZhYNXKYzoN+FWTSx3yKjkIadtObtTfOMBwSAT+bfk8kWzkB
         fYpMJRO6G9iLp6wt5/64SOzT2cEGyou1VhcuAcjCrFcatjLLLzeKqTyZx3vM9erZB8JN
         MZz0MvmMpB0lNl8ndfQuQuaZvV4MOLIUpd88NV0zfE4QvMpW0SyeMT9dI1bNI2dWCO5E
         FVtkMhqcby4k0/TQIQvODOXjYEnaWB4pvmxCpmJlyoLxVntAhqurh0V9N0S6DjN1ZOVN
         AfDg==
X-Gm-Message-State: AJIora+k9eSVsaErpYnWkB8jnwm0D2cBNvLti5qgR7kPDneXywtGYwNi
        AMfeVS9OpQkqLeX1p6EDQF5MzA==
X-Google-Smtp-Source: AGRyM1viMO/CLxPx/EA1CjDC1lRgOFNQyh+gZBfcfUaQmWOdGrB6vi8zeA5P/pt7tvi6uXxo/gcR/A==
X-Received: by 2002:a05:6512:32c2:b0:483:aa46:cf6 with SMTP id f2-20020a05651232c200b00483aa460cf6mr4920475lfg.214.1657096853037;
        Wed, 06 Jul 2022 01:40:53 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id t26-20020a05651c205a00b0025583eb9becsm5850553ljo.69.2022.07.06.01.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:40:52 -0700 (PDT)
Message-ID: <388ae57f-ab7a-7872-f0b7-99ae48d5d1c2@linaro.org>
Date:   Wed, 6 Jul 2022 10:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/13] ARM: dts: qcom: add speedbin efuse nvmem binding
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-13-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> Add speedbin efuse nvmem binding needed for the opp table for the CPU
> freqs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 777851bed95a..45e713387deb 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -862,6 +862,9 @@ tsens_calib: calib@400 {
>  			tsens_calib_backup: calib_backup@410 {
>  				reg = <0x410 0xb>;
>  			};
> +			speedbin_efuse: speedbin@c0 {

Wrong order of nodes. 0xc0 is before 0x410.


Best regards,
Krzysztof
