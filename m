Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB94D60F9BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbiJ0Nym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 09:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235751AbiJ0Nyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 09:54:40 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A350314004
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:54:38 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id hh9so1106059qtb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hK2/xkj/1+Mko9PrFSyDb/eTUfMq8JnMBIWkkOQ0gmI=;
        b=NlKCSem2tgeixOMI8RA9BB7ZPyQVJXj5SSYElD35AYcCGm2HveIBtCNfsOnMbwUCc6
         Z0/Ta5mq8ixNB2+pA9fY/Ez5WXVrMVYXJ/yVa4wsx2dbyVLv9XA7uMTCdISuMSOOTQgK
         sCSi9kzBh6bMk+GqGZTmTJmJXDU+nEvCpO+Li79iUQOcsoZvWh9g1vx2FUmIo5FmI5os
         l3/v6u6iI8/yI3iBHNOifW7ZS/G0OG/j3cOKYqSwki2Lhd02rx5RMSbUyZN7RpYGWSl0
         DpK9nqm0FNLAI+fyKJtBbGLdQ+IdxByWeEBTaJp7tBHiX69gR0pWK0NxPamxheKhEwmh
         FV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK2/xkj/1+Mko9PrFSyDb/eTUfMq8JnMBIWkkOQ0gmI=;
        b=q1K5l1un0pUzlhuQpq8ycZYw9W6xIG2QmQrIKwNHiGRMRrB1W1U4JuMrD+JPQyM5Yd
         a8htdw2vxKTzQosPNTP8KUE++JQfptzdEz1lStteRjDE01hlhjcfXPyBws/knY1cRd8m
         zHXnQRNYpUjn1bqIz6TgRJ0ZFQYIdf02R/ibfiDcqZAwZ2Qz/0VAQmzQizyAfcMazE0I
         OeynKMJd/c/ieYvXTu5fvbmu7tnyAKP67oFfQsu5QM+lIi9HXItDk5TI6FDYqD425xjv
         34dFpHAhXPc9tBx2U0T3Et2QMOLL+BIjuP7HHwj4Hn2dIz5V4wXrtSXm23wNuQLB+UQV
         c8Wg==
X-Gm-Message-State: ACrzQf27av8WxWjJ+RDk25XEgxTHKGFhtKR5lrmCg0fEnA3Q2CvWcqF3
        csd1QaiPglH4COIC8NUESN4VBQ==
X-Google-Smtp-Source: AMsMyM4rL/77LVbikTP764POqt0oknzFqr/o7AWmzinR4r175iqXxRB8bK1UASnIw9et85ZRe5POBA==
X-Received: by 2002:a05:622a:170f:b0:39c:e3dd:62f3 with SMTP id h15-20020a05622a170f00b0039ce3dd62f3mr41869769qtk.480.1666878877473;
        Thu, 27 Oct 2022 06:54:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q39-20020a05620a2a6700b006b640efe6dasm989961qkp.132.2022.10.27.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:54:36 -0700 (PDT)
Message-ID: <f86157a8-cdcf-00e9-e065-a6d64899300a@linaro.org>
Date:   Thu, 27 Oct 2022 09:54:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7
 block
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-6-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027063006.9056-6-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 02:30, Manivannan Sadhasivam wrote:
> Add support for ADC7 block available in PMK8280 for reading the
> temperature via the AMUX pins.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> index 4a3464f5e6e9..32086d5edd0d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> @@ -75,6 +75,17 @@ pmk8280_pon_resin: resin {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pmk8280_vadc: adc@3100 {
> +			compatible = "qcom,spmi-adc7";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "eoc-int-en-set";

Schema does not accept this. Be sure `make dtbs_check` passes.

Best regards,
Krzysztof

