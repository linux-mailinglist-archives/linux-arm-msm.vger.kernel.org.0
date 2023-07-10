Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8834674D94C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 16:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjGJOsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 10:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjGJOsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 10:48:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD79D114
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 07:48:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98df3dea907so562675666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689000487; x=1691592487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zUz1F8t9WEy32K0WQzvG/tkTggRTR3113BWQqc0TAA=;
        b=OkpkR98UNKE1L7UjqB/hs8uZpKo2qzBIvbd3JgkfDo7ePiifR3C2gqjY3qh3r7Umni
         9eEQptj5rNxCtADx0qUDxJPbMot36PYWDZ9B5RxmrZguWpF2VUdGIqFxnWM4Keil68w7
         Rd+8K23yFKYKY+WRwR808JqH5nm5OUFVnmETF+LsbIKb43Expt9IR4XAda30Glg4CerA
         n3qzdFYtrM9cigbYW3x16/IfrpF2bA+KqQGNmUgTCbLkf6kKCTuNL0+s+oAdQ6gkXqvH
         FkSbRhp3EDX/iTfKRzSmGoRn4KC9BSbRtsx0RJ1izQOCEEHJU0kSiYDx2+o60sdJzc7R
         LDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689000487; x=1691592487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zUz1F8t9WEy32K0WQzvG/tkTggRTR3113BWQqc0TAA=;
        b=GyyAb5qxHybfLvwaXKpFFSkiYrZYR4NameRGRjLn8mAxc6HwSHl3jlsIiZ8smD7ThB
         fLx5byR6V2x0WZpxvuqJ9D/hy0ChnfQcVl0lXqQsEG2948ECskC21qqfNlsGYS/6z3b9
         v7STpSrmt8/EJpD8eP9zSJA8JQxSvpwqKa6rqQCwjJZ3OHj/AVv2StybAIxYMeDryy+L
         LLn8b363XGj2xXQ8x1uH1MwLHundwuPSPs5R9rytgb5wYWjacayudVcbIEM0H36TC+9y
         Cz5V3N29CNFYiUCKn1uywAV6vhd6vPp7pTMOo2yUD6FqTK/xBwyIRF23mAJlHQ9HCBTu
         H/IA==
X-Gm-Message-State: ABy/qLa8KT9G4J5eRqK+2wE3XRu0u5eJQySbNKyk8LWBvIhUBx9eq+L8
        jrJObD+BX1arzR7naOYLsJfaXA==
X-Google-Smtp-Source: APBJJlH4AXkRENLH/gW901quCxj9gQR9PgVXbmX2ni6qf+0KlpuIOL301ZCHjSNB/cdAHbYqljwGBg==
X-Received: by 2002:a17:906:300b:b0:98e:1deb:cb03 with SMTP id 11-20020a170906300b00b0098e1debcb03mr10212757ejz.56.1689000487153;
        Mon, 10 Jul 2023 07:48:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id j17-20020a170906279100b00982a352f078sm6181160ejc.124.2023.07.10.07.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 07:48:06 -0700 (PDT)
Message-ID: <beddd5fc-bfb6-6ca8-8137-efed029516ca@linaro.org>
Date:   Mon, 10 Jul 2023 16:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-db845c: Mark cont splash
 memory region as reserved
To:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20230616065123.3710734-1-amit.pundir@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616065123.3710734-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 08:51, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
> v3: Point this reserved region to MDSS.
> 
> v2: Updated commit message.
> 
> There was some dicussion on v1 but it didn't go anywhere,
> https://lore.kernel.org/linux-kernel/20230124182857.1524912-1-amit.pundir@linaro.org/T/#u.
> The general consensus is that this memory should be freed and be
> made resuable but that (releasing this piece of memory) has been
> tried before and it is not trivial to return the reserved memory
> node to the system RAM pool in this case.
> 
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index df2fde9063dc..503136eb9c06 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -101,6 +101,14 @@ hdmi_con: endpoint {
>  		};
>  	};
>  
> +	reserved-memory {
> +		/* Cont splash region set up by the bootloader */
> +		cont_splash_mem: framebuffer@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +	};
> +
>  	lt9611_1v8: lt9611-vdd18-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "LT9611_1V8";
> @@ -517,6 +525,7 @@ &i2c14 {
>  };
>  
>  &mdss {
> +	memory-region = <&cont_splash_mem>;

Just to be sure: does this pass the dtbs_check testing? I would say it
does not and wasn't tested :(

Best regards,
Krzysztof

