Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814527184E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 16:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbjEaO1E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 10:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236335AbjEaO1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 10:27:02 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACABF1B8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:26:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f505aace48so3806734e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685543203; x=1688135203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsb/Lkvit7E6o25rklytBN+4+1hIjsLT4kpV/+YNtPI=;
        b=s5VJQSDMVf1ZO7LSn6Qz8ogWZMVgFKLHWGk5Ta/NYNJuEAmViSvBAw2cNM+FoqKHzu
         rt2AsxhMJEHCEM1ycEb9dm5lSnn/F8cQNrgQysTAyKtaTNjANRmjDbcTxEBJTRSmcXo4
         PY2D8Lw4YPtigFF4peLh5Ih2rK/SbYWEOodnDVCzSkbvlxARLxewCjXii/eapKmFyYRc
         PjAmyypkxgf7retomJFTRxAU3KsNu8b+ijtrJqw5pHlecNoYn2hLI2+T5tj/GOFQlTTc
         z7KiW4ud2tTmt/0iS4zIffQQHvy2lfKVHM0R0NMviBVb0V9dd9Qsc3N+vV0u+u/oYSk+
         V/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543203; x=1688135203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsb/Lkvit7E6o25rklytBN+4+1hIjsLT4kpV/+YNtPI=;
        b=KPCmixezSUrruyUuyldqeIo+3cx3uuL1lsMu4PJrulaZ2WpNjfDJglYY8E3scI8NMQ
         bZH0A64q6JQh3Q9K63OMUSb4oXO8K/u1sUiJwRloZ5mFPfzwh+KpsUh3KyWGTDPRpWoU
         AGesKBz6/194cOrobUHowNsgL40gR7UVfIBLK/uMBz/DKBJDcWFM5/J+1f0P5Mv5SXNW
         iOcUSDVfGyElgUrSS/kQMbQUuz5QsnzDKqkJFT+TbK4W+9vsqhM19D5YYeAh4aswuAMa
         Yr1FSQlH03NLbjMfwNp4vRPgASTCw3xNn3zo7yyyPFLf4CoDm0fH19F7riZcUa/0j38J
         Dabg==
X-Gm-Message-State: AC+VfDyOKL2jl6tausehmvUee4fT+m4SGps8RHA+IBC2soKRutsWQCAM
        o4Fm9Wk4lH+sM6R+FefuqHLR9w==
X-Google-Smtp-Source: ACHHUZ6oAHKtG4Gtml+ABdtf9CkPpqdfRliFW4OeYR4pkE2wnfjiDAC/126mi+a6wiyp1UEy4wYyIA==
X-Received: by 2002:ac2:518c:0:b0:4f3:baf9:8f8e with SMTP id u12-20020ac2518c000000b004f3baf98f8emr2961540lfi.4.1685543202973;
        Wed, 31 May 2023 07:26:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512096200b004edc55d3900sm743380lft.0.2023.05.31.07.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 07:26:42 -0700 (PDT)
Message-ID: <b6015e94-47f1-aaa3-ad42-9ee8f78daeec@linaro.org>
Date:   Wed, 31 May 2023 16:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: pmk8550: always enable RTC PMIC
 device
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v2-0-a3b890604c49@linaro.org>
 <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v2-3-a3b890604c49@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v2-3-a3b890604c49@linaro.org>
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



On 31.05.2023 14:22, Neil Armstrong wrote:
> There's no reason to keep the RTC disabled, it has been tested
> and is functional on the SM8550 QRD and MTP boards.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index 8c897d4fee29..c7ac9b2eaacf 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -49,7 +49,6 @@ pmk8550_rtc: rtc@6100 {
>  			reg = <0x6100>, <0x6200>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> -			status = "disabled";
>  		};
>  
>  		pmk8550_sdam_2: nvram@7100 {
> 
