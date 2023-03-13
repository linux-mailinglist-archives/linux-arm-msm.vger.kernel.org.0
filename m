Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610256B71A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 09:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjCMIwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 04:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjCMIwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 04:52:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4104A1D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:49:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j11so14637753lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Noy5OnKBLdJAuSztSbwhQRksOoD5rM1ozmatoT04/g=;
        b=inkY4qh/tzNiyDZYMGGamzmgOnGdeJzgzohKc2ohK+Qw2/X97t0FUYxO4NhjTNmXom
         b8jEA2B9uoTYxyGVFP69FTXgZoLhaYxyLlJrWXTtO1iH6XwZfjuHYt6OkE+jI3Z06yah
         n+VyYIex+r8hvR/RQCvorSNhaH2BjdYF7eSUuy822tOJ2UPxFkr4IT0j93LME5nHLX0R
         Upsw8ZCHttrZWHrjOLOuUb2+riYkUkTTFbYrxmrrw54Lx9t/C7nelAph6SctWpIJJJwD
         7dnXizu8n8EJsdYPsVS7O6kKtAYp+1p5OlNCjavLEltk69geDkbL4z84Sn9BuNVNCQS6
         Id2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Noy5OnKBLdJAuSztSbwhQRksOoD5rM1ozmatoT04/g=;
        b=LWn6/3N8lhZnfwuYpALlM2PQ0q6CmkTH7bxS87q/zWS+pjO44NbSbpDYCHVGg2+cwH
         yefUhO/Pq+FfW21nsMBdT0Y+eGhxYjHQMbICR0RKIkCqMzfI7bIROhytrkjMyewcTf6I
         BAb10vnCUTmtpP1mZro4MkA6jmBo5mVL+cdooFV6+ytbw2NuAsWyhnzM7p7aGwesE1mj
         qONqQE2d0SbGFMNz/dyPc3jkkMSvuFtsXjpyt2esL+IGOqaACvRa1zpjTWQv7VzEbYKr
         /l6yLrozZF0kPwRaf9xLnNCgMAjPrfaHkoTRTrcldqLRWGj5ExSeKQBNuyfaVLx6zK+C
         VWRA==
X-Gm-Message-State: AO0yUKUdSRZH3evHKXfZbGBsTvuWAm4sw8bbhScW5IMURgNaYNd8w8zN
        aXmukb2aVg4PM4l6YKTweks0pg==
X-Google-Smtp-Source: AK7set8xbqwixj2ciB8aYKZTc6C/Z+c8gFhr3sCyhvC/8yfQyKGymToQA3azVaBtVTJdBrObf1/lVw==
X-Received: by 2002:ac2:5927:0:b0:4dd:a74d:ac46 with SMTP id v7-20020ac25927000000b004dda74dac46mr3278605lfi.0.1678697392147;
        Mon, 13 Mar 2023 01:49:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id d17-20020ac244d1000000b004db4c79d845sm895745lfm.184.2023.03.13.01.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:49:51 -0700 (PDT)
Message-ID: <668894df-9d34-c01e-9f78-924938f6c887@linaro.org>
Date:   Mon, 13 Mar 2023 09:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sc7180-trogdor-pazquel: correct
 trackpad supply
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
 <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.03.2023 19:36, Krzysztof Kozlowski wrote:
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> boards which use elan,ekth3000 with valid VCC:
> 
>   sc7180-trogdor-pazquel360-lte.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: fb69f6adaf88 ("arm64: dts: qcom: sc7180: Add pazquel dts files")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> index d06cc4ea3375..8823edbb4d6e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> @@ -39,7 +39,7 @@ trackpad: trackpad@15 {
>  		interrupt-parent = <&tlmm>;
>  		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>  
> -		vcc-supply = <&pp3300_fp_tp>;
> +		vdd-supply = <&pp3300_fp_tp>;
>  		post-power-on-delay-ms = <100>;
>  		hid-descr-addr = <0x0001>;
>  
