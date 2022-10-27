Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04ED360FA06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 16:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiJ0ODe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 10:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiJ0ODd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 10:03:33 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94DD186D6C
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:03:32 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id j21so929021qkk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvF80D9H8oYt3aR4noTCx2Krv0SD5Mn7EHZKPpjVB+M=;
        b=ox7Dd32xxvVzXrbvdc7i6bp4sI20U18S5sSou448DCAu2YMLSw7wBKnr7r0g6XteYX
         uFC4aVrdKTvbOLB4TGQNwIu90ypmHxdl4RNMcnYj6cmpW+UmG7+GzdOSLQZSFFrUqxiV
         sZLqtvC9AO9S3/a+ipT0SlxOHLRvSA0P4xHeIvl0/xa8HJEjTaCLM+Ydyly2xV2xW3zo
         2UiTwUrQcQSKd5nPlNhY8jN1u6lX2A6k9zIvhBxKSyN1/PvjrS/ntRv5H4xIdCjuTCfi
         /bFIxXLIzuCcGGkjmbonMZFU0Txqo+7dou+QLmfGpi+bdZVib0Dwro1lcEiF2Hz1aGwC
         Q6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvF80D9H8oYt3aR4noTCx2Krv0SD5Mn7EHZKPpjVB+M=;
        b=KyfYVhmM8r/yaqLlBr6sdh6QBnBRBr2HkYpGvuM58xQHXwkHLPyVknXmv4DSwzGfKl
         shT519gnfl4oWW57CqP2X6x14wbJ0v82np1bhI5mKVbK3CZ32LbwQHUubclzGyH2kMxz
         jiPs0UlA1CgFokHAmW6mGkttDPJnkkoYeLrgAs6YGr9xeJl3SIXLl2IlUPaF05LfT6Wy
         qTJk4ZCeeeLG4zIYVUdEVDMgvzm6Ora7KOJVcwVqsKdKYFJ3XnVr1eVNRFLsufqpAr2g
         RQFw9NpUerdvOCOHWGg6i9P5ZA5d96dXUACCx10LHF/KiGBYP6Xk3jCeANhly13osaRA
         2bfA==
X-Gm-Message-State: ACrzQf3oxle5S15JNiNJo5DM56Ffu7IoSiuenpa6kBl4fx2Y7/3i/x35
        G36pGI0miIJxNVSF1hl9ZMyALQ==
X-Google-Smtp-Source: AMsMyM5zDOLskP7ssWPvp2cs9uQUPdwDK8zapU+jjylLNgoDsOf89rsE0vejQUMmxVTOwU5bUtQGIA==
X-Received: by 2002:a05:620a:2b85:b0:6ee:cc4a:de6 with SMTP id dz5-20020a05620a2b8500b006eecc4a0de6mr33801365qkb.458.1666879411976;
        Thu, 27 Oct 2022 07:03:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a0c5300b006ef0350db8asm993289qki.128.2022.10.27.07.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:03:31 -0700 (PDT)
Message-ID: <0d4af50e-558a-e9cd-1d6f-54c77e0deb86@linaro.org>
Date:   Thu, 27 Oct 2022 10:03:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC
 channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-9-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027063006.9056-9-manivannan.sadhasivam@linaro.org>
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
> Add VADC channels for measuring the on-chip die temperature and external
> crystal osciallator temperature of PMK8280.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 6aa8cf6d9776..9ac5d5c22832 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "sc8280xp.dtsi"
> @@ -173,6 +174,23 @@ &pmk8280_pon_resin {
>  	status = "okay";
>  };
>  
> +&pmk8280_vadc {
> +	status = "okay";
> +
> +	pmk8280-die-temp@3 {

die-temp@

> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> +		label = "pmk8280_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	pmk8280-xo-therm@44 {

xo-therm@



Best regards,
Krzysztof

