Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3C5735CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 19:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjFSRPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 13:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjFSRPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 13:15:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C991139
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 10:15:51 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so4779631e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687194950; x=1689786950;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2kap/rQ5fJ3nXml0zM9OrJF0E6FXM6ScX91UdQLE7c=;
        b=rngpnQwhAh16JuBIZPn/mivLNTP5pydspTYZdbbJEbzMqDcGq3VmBdGkmCbjZnDCzp
         LEH+IUgpNUnQWGxn6bSihKLo3dxtoaGPuNujh3uKSi1UZwUWByza1I0ytYJzbWxH2zJh
         v6fvFmRCi9kA6GA3FVvLSIMLoEAseXbZiTJ1biC1rVpTSv0VWEKMH37jz1Yu/zq0hATw
         ufu9kXCxWBzZXSAK2Sh5Jg9GqL3Vfn8cwOQjebSLE1IdP/fDiMYgRDipJnbJZDvLSpIS
         4Z7PDEqBh73HLPo9UdfYR6qBULCyfDwDVWifJkiKt6rWrZL3CMqqP7KTYb3M3+7oTCBk
         26IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687194950; x=1689786950;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2kap/rQ5fJ3nXml0zM9OrJF0E6FXM6ScX91UdQLE7c=;
        b=edI03rwO7RRuMBoms3JwxhO7JqHkD8EnqiCEOspFPFrbHd+sjohKBp5Ac2gu0HdKh6
         N+nk0yNNBQPnhYkI2pv38qZxqQjSom2nLYdZPtLJoDQMspOy388UvKesD/S1lHBib4gL
         H564hAxPFDRfxybjv6N036itDf7CIxkgdBwF5Sb51b5ZJ943nhs0oK7e7kw184C4zyo/
         yd9BEOG86TIJ1vTZL87jvs1wacWhJlGr2Fq7sxxfANakHSCpexdpzS5IoH9f5EYbrZwb
         HSxL4MoCJP8yDGt2FgSfMSpMYaUgjXGem6V4NQvfHfZFd2nYVByETMDti+w5fsBabog2
         3EGw==
X-Gm-Message-State: AC+VfDwIlX9gZ930YOQqGRdvHXlMHDNOPwOlMADREG3RADTbkjqq2HsT
        DA2FkXv/F7kkd6o43LhHqKFtXw==
X-Google-Smtp-Source: ACHHUZ6vqHQBArGvKBQIyIZwIu2jaSsAkaxyu18Hntva09WShrWLr/AaiGEZ5krhRE31N72a0W00Bg==
X-Received: by 2002:a2e:9106:0:b0:2b4:6d59:785f with SMTP id m6-20020a2e9106000000b002b46d59785fmr3344540ljg.43.1687194949706;
        Mon, 19 Jun 2023 10:15:49 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e7d18000000b002b4762882e4sm829534ljc.39.2023.06.19.10.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 10:15:49 -0700 (PDT)
Message-ID: <75cad230-ae46-5572-ca86-743fdfd295c0@linaro.org>
Date:   Mon, 19 Jun 2023 19:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] ARM: dts: qcom: sdx55: use generic node names for USB
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230619170151.65505-1-krzysztof.kozlowski@linaro.org>
 <20230619170151.65505-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230619170151.65505-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19.06.2023 19:01, Krzysztof Kozlowski wrote:
> Device node names should be generic which is also expected by USB
> bindings:
> 
>   qcom-sdx55-t55.dtb: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index df3cd9c4ffb9..55ce87b75253 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -603,7 +603,7 @@ usb: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_BCR>;
>  
> -			usb_dwc3: dwc3@a600000 {
> +			usb_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x0a600000 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
