Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79308712DD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237033AbjEZTqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjEZTqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:46:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4D7B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:46:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso1288102e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130387; x=1687722387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGRmQVz2qOO/JHGqdPvAPL5aOAN7tSdjqi8YZkSo1xs=;
        b=voBhsyIBCO5EPlcOz0jKXU8ijOs06ei0PEKdaElwd3YFnKM4vSmbg7X/adzwx+OGEE
         wssOaRNAVuKinyffQoY0hE0CVdQBKGTcgRsPfJrOTaL5hTIXWS2Nwyat4FpMkGeNQ3wX
         hiECqW/PwwytXVaZeImaQBnKdrhq/4oxCQexJ017nwtLvCc9OqqSpdWd9IC7BRT6Endu
         ZqDajo81sQ3I/t9BH2+FXjkY/uG/PsATnzgnt9WCiS4PmIEo9W85bAOJlBP/OLFox1un
         ZkZyrPqKXUF67qU3Yq/DYubaOHgvqYoZtnlJPp/m0tOZ+eSJRhK1K7C5DtWx1yYloAO5
         Blqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130387; x=1687722387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGRmQVz2qOO/JHGqdPvAPL5aOAN7tSdjqi8YZkSo1xs=;
        b=DIy9CQnEA7XB6Menm4wSL0D4vI/v63P7OKvv/lCTra9qUcZK2o8sV0i9RSm5Dz1y0o
         jEIePgKJFMdESJ92fKa+J7G+3TYR/QpY727gzGYBfREcLN0azHuBPi7Kby5ofYtnWxLw
         Q6O2lk9Mrg36n/SdP8T7QVeh0fnoFa/Eik7v86GxwbowuQrYWE9tRTSoIGo7lWETtu/4
         gI9VxIMKwRdxoxLKyDRcE5wizUNX/ytlEfT5YqLwxbi9t40EgvL2oBeQxuC+I48oryAt
         XgzJgtwdsco5XdP8Q2GkAjsxr6WQ59ebEW9II9ge8mxyaE0eoyIr42O4//QCxmTxVcvY
         orwA==
X-Gm-Message-State: AC+VfDyaTOCT0fHz1nEcMq78S+zJwqaXNZ2pEhkttldz6zYW4NbzENvM
        CTQNk57Pw+Sc8jxKw15xSII9ww==
X-Google-Smtp-Source: ACHHUZ4oVU/CuIh38JWiwcfSKfq4DCuUPWaxrg5aT4d8kWdUFMenhjIRlFtDPog3S+d3vemyn3407Q==
X-Received: by 2002:ac2:51ad:0:b0:4e0:a426:6ddc with SMTP id f13-20020ac251ad000000b004e0a4266ddcmr931823lfk.0.1685130387203;
        Fri, 26 May 2023 12:46:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004eb4074f40fsm747155lfo.241.2023.05.26.12.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:46:26 -0700 (PDT)
Message-ID: <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
Date:   Fri, 26 May 2023 21:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.05.2023 19:38, Caleb Connolly wrote:
> Add a node for the smb2 charger hardware found on the pmi8998 pmic
> following the DT bindings.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index be6f60bfc26c..73f51451d21d 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pmi8998_charger: charger@1000 {
> +			compatible = "qcom,pmi8998-charger";
> +			reg = <0x1000>;
> +
> +			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "usb-plugin",
> +					  "bat-ov",
> +					  "wdog-bark",
> +					  "usbin-icl-change";
> +
> +			io-channels = <&pmi8998_rradc 3>,
> +				      <&pmi8998_rradc 4>;
> +			io-channel-names = "usbin_i", "usbin_v";
Are these hard-wired internally?

Konrad
> +
> +			status = "disabled";
> +		};
> +
>  		pmi8998_gpios: gpio@c000 {
>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> 
