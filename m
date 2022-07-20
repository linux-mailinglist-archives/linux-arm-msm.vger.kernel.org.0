Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953D657B0D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 08:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235880AbiGTGLB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 02:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbiGTGLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 02:11:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8EF49B40
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 23:10:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w17so19945051ljh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R724gXzbsAes7qqV9vmgsnDK2zNWLN0xtkY5GrfADYc=;
        b=dKF3Gni2mdRt3jsXRwkxlKFvWbGSErW4PONf3JI+seKboTnKaEP1LKMZc2V2Yf0mCX
         Xq9qhYogXQ/xM95ueLCzbwh7u0zjURJaAyMWouojT5GE7tSy6r9YmXzHcn/grBKIg/py
         Yem9FHhoUFtffdyMuSvfVsDHsQCiqWF52J+fLWjedr6aKNoAtWdRj1eWGbgHOJbIpQkr
         5FAnT/saqAtNXyOUbtBJP18NoCKNn2SMEul0Fg5VD2nQddV1oid1XrlZZ6nQDz2quCfW
         xBntlBx5NW5M6g62SABxrKTjGgF5fwECiCPaBTM+qoS5vACF93uMwVeAeabk3OaRXy3j
         S28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R724gXzbsAes7qqV9vmgsnDK2zNWLN0xtkY5GrfADYc=;
        b=U6QK4JGB3B486n6AYYiHvRlFZ3sw3oNHMLQ6XXHh95cZM2TofYa2CycL9k+gOgA7Yn
         Nr2K5zEeC/xoJAu8AZ1TnGSePqgSkwWexhHkC1G8Hf6xJujc4zDszxFrR2D8jjuO+K5m
         AGPOw3HfuMisCRXJmm0szkiSjBkW+dfekdFf8Qen1DQ+VpO46c6bmiQ6b3TEmaYIcUfY
         Myb77KYQpQJZIetqXEX4p3BMACCmhlXKZVLDhs7s9ZE8a/iTAAa0x1UJZlTfZlMeAmBU
         8SQ909Ld8tnwpaTBHousOe1b+HdCZRxVVU/lylJwAiwGujVSDnx0JnNfCUQGevtWqGoB
         bxkw==
X-Gm-Message-State: AJIora8g+ij4wL5Dv8XZ3Ro7phoapdLvi2Y5du+7/kZv1DllHGY8lfkg
        zXzqa7T+hNg/UZtScVHwJmpLcQ0PbAk6IAey
X-Google-Smtp-Source: AGRyM1sqMk/IxWNdfO/ZrAP8MTy5lfGn6Ymb6DxouAFaqjIbx2YNSH3cIx2gJo6fAJyUsVlKMcg7Dw==
X-Received: by 2002:a2e:9917:0:b0:25d:a469:75da with SMTP id v23-20020a2e9917000000b0025da46975damr10463914lji.55.1658297455004;
        Tue, 19 Jul 2022 23:10:55 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k7-20020ac24f07000000b0048602d54471sm3584486lfr.156.2022.07.19.23.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:10:54 -0700 (PDT)
Message-ID: <7a04c9af-0ccb-7711-249f-73908fe7ec36@linaro.org>
Date:   Wed, 20 Jul 2022 08:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: Add SKU6 for
 sc7180-trogdor-pazquel-lte-parade
Content-Language: en-US
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Henry Sun <henrysun@google.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220720025058.1.I5bfba8857ea0d43c747ecdc3a950875abd56927f@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720025058.1.I5bfba8857ea0d43c747ecdc3a950875abd56927f@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 04:51, Yunlong Jia wrote:
> SKU6 is LTE(w/o eSIM)+WIFI+Parade
> 
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> index 764c451c1a857..4649eaec6318d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> @@ -14,7 +14,7 @@
>  
>  / {
>  	model = "Google Pazquel (Parade,LTE)";
> -	compatible = "google,pazquel-sku4", "qcom,sc7180";
> +	compatible = "google,pazquel-sku4", "google,pazquel-sku6", "qcom,sc7180";

You miss binding change and sku6 should be rather added before sku4 as
it is more specific, isn't it?


Best regards,
Krzysztof
