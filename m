Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F9C642734
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiLELKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiLELKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:10:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1D017416
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:10:30 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r26so15213430edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU/76g4brplnYb3ey5gxpSxqgyVW+nANCNKN0JgWmK8=;
        b=k/O1OZh41TBI5kNXhYT5bzOwbSedegIPUi5Eb3Yxl4uEnf7R4Ob137ils7XNpaUR6U
         JM3DpM1X/sO0whM/dvTZGQXIKfBNqJvOFc497A6DVLA+dfY4kQbqveaVjJ2pniZqpvDP
         qpuUDrSTt6YynSupHLM8bUiFcepzBeixu7o1i6T+JUzWt48WSlHwEp+IpKXiPrDIAASa
         EXwVIB8zz7o+zymWxj0U+DNCuyly9vrri7Q8oZCxGQi7QNqKC8IC2Eci65foeRhnoPQl
         EanxBMkOG0L0s2CYb1kLTAuNTQEFumC4Z2E4vLbr8FZjM5clGPVvRbr3+JVnETc2pVYP
         SnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AU/76g4brplnYb3ey5gxpSxqgyVW+nANCNKN0JgWmK8=;
        b=8FyPSIbnlSZ6Or29QGCDMDZ68Yqg63QQNIomFQaZthYB4eOtBK8NkJZeNMMBPNkpFC
         Os/8OBOTUCxeHXmH05B5wv7Hw4pRMVhhVOQ+nYtbs7H5wgRKh/NXGRdt5/yjPCAMiYr5
         BSgxcLLexG6B06kPiOTgpUnm7vkvEJO11Q7o1J4uILANoK5FIuplBSNdqzeIxULO/sT3
         M7IBffXvZ7Su+PaaMf0qJKVp6r9nSLpRja81ppC8RtQ07faAlVwMLyvuFItHZaK2+Gcl
         LiVDQW1RpVdCtigPZO9ZDQxu7QTVCkWvyB/6X6lR6/+jN5x2MC9hYNuNldAD4sfrhg6p
         lgrw==
X-Gm-Message-State: ANoB5pneGfxt4jrYb+DxteBeoMHr2oupiw71syEX6Xz02QYpe6KZrHHv
        EbS/2sOWbTLtV+Nj0XhLlN3WBw==
X-Google-Smtp-Source: AA0mqf4hEOOs2fYF8KLQv44pMgB+bl46xD2Ll7qnTKI86c5MjicG1zvWJmGPngeQ+lAkC01kpu9yGA==
X-Received: by 2002:a05:6402:4445:b0:468:eef6:a83c with SMTP id o5-20020a056402444500b00468eef6a83cmr19094396edb.191.1670238629304;
        Mon, 05 Dec 2022 03:10:29 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id el7-20020a056402360700b00462e1d8e914sm5966156edb.68.2022.12.05.03.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:10:28 -0800 (PST)
Message-ID: <c3bb0e24-1f07-1c82-7ba8-c83b49cbf757@linaro.org>
Date:   Mon, 5 Dec 2022 12:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: qrb5165-rb: fix no-mmc property for
 SDHCI
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
 <20221204094438.73288-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221204094438.73288-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/12/2022 10:44, Krzysztof Kozlowski wrote:
> There is no "no-emmc" property, so intention for SD/SDIO only nodes was
> to use "no-mmc":
> 
>    qcom/qrb5165-rb5.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 4c39cec0b13e..8c64cb060e21 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -904,7 +904,7 @@ &sdhc_2 {
>   	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
>   	bus-width = <4>;
>   	no-sdio;
> -	no-emmc;
> +	no-mmc;
>   };
>   
>   &sound {
