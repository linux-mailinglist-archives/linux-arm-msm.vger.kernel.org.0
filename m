Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E90C735838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjFSNPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbjFSNPS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:15:18 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A44199
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:15:16 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b47354c658so19712701fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180514; x=1689772514;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmxdBQdxI+3tmCtcQTMxaPen7vOAaoUf1XFTUdjbnDQ=;
        b=j6s9pu5xWz3HKFvC/sAau3XLJfjVwmxXHtJxoeiabRunqCooo0fTYbRbMgdUofZvXw
         V8Kae9UounDz1XO+qKcpVcaY4N2BcD2CTCRcZNvEsluvYoWh9t13VstyUcOwnln7OprA
         m1qskcqLtPt3Moqpo2uyRt0Ih6LfxINgQSd+s84GhZgAQLzvZIKUdlEtGqethJOjZe71
         8B2BhbG/zYYZ1zlAVTE39uXzblowH5cOdn+sa9FjRcjoXtPTdaWihOG6ouXCkNyazQra
         wJONkIovyiFqw//bPCtqcfkN07WoQR1Xgpnlln4jAvOWZCv9hqd5p9Oue6/XSAcWYngi
         rJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180514; x=1689772514;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmxdBQdxI+3tmCtcQTMxaPen7vOAaoUf1XFTUdjbnDQ=;
        b=KVzbeff3byJ1LxILzzGIO5cFlmaVrVtukYKtOT3I17m3O+nAkrb812WVWKiPBBsrRZ
         rnEp0DHb78nuGDZ3zKPH17CzJV6z+J7mKyUfzE8cOGtfyQfzyHmF4ehMx4+09F+Iu5wW
         QU2gqry1LtqNDW9xv7I3RgDfHVqA9qCKpaS2GWXLgOHPWT2eEl40B2iL9Ls55LMNysWu
         G7LW0uSfFgISTTgLEVFNWleHtD5RYFr7iA8EeY3ah+aJwAe5dR9RB3RX0+S+tPpcLI3m
         sGAPDv1cN8NP2tZyfPihqEPn0lZSXTj0duNtYvzkcoQObRU3o3okULvcZHiN6Qgtue/X
         2vZw==
X-Gm-Message-State: AC+VfDyUMzTZUqEht+7xZtDobP3SiwJtyHxdTMZPYDkob4GPEbAKJHv9
        22ttQpbrwpYRZbqeernddIRoWA==
X-Google-Smtp-Source: ACHHUZ7S4Ius9mVSaG3e2TQRp10Nt7uQwNRAFwB/jQ1x9S4+7dLsMW+HSCGSSstH2saj3qkJsVivxw==
X-Received: by 2002:a2e:7209:0:b0:2b4:5a0b:9290 with SMTP id n9-20020a2e7209000000b002b45a0b9290mr5728662ljc.21.1687180514584;
        Mon, 19 Jun 2023 06:15:14 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id f16-20020a2e6a10000000b002b326e7e76csm3987093ljc.64.2023.06.19.06.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:15:14 -0700 (PDT)
Message-ID: <2a1f5505-6867-7d70-2f5b-4fd3b0c70ef7@linaro.org>
Date:   Mon, 19 Jun 2023 15:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 13/15] arm64: dts: qcom: sc8180x-primus: correct panel
 ports
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
 <20230617171541.286957-13-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617171541.286957-13-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17.06.2023 19:15, Krzysztof Kozlowski wrote:
> Panel takes only one port:
> 
>   sc8180x-primus.dtb: panel: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> index fc038474cb71..9b8695b92c48 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> @@ -377,11 +377,9 @@ panel {
>  
>  			backlight = <&backlight>;
>  
> -			ports {
> -				port {
> -					auo_b133han05_in: endpoint {
> -						remote-endpoint = <&mdss_edp_out>;
> -					};
> +			port {
> +				auo_b133han05_in: endpoint {
> +					remote-endpoint = <&mdss_edp_out>;
>  				};
>  			};
>  		};
