Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE57042C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 03:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjEPBRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 21:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjEPBRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 21:17:50 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD441727
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 18:17:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so15540891e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684199867; x=1686791867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WACwJGv8gsOQeDW3ZaDiXX7Fzl5vd3342+yL7YL6Kn8=;
        b=hARnqa4yEveffmwYihTWwU3aHHPP9wSW4Bk/52TvRcJZZrf17eGrVV6eJ5ws5HJrF7
         IPN/04lnFUg+5zP/JYRwFWKppQtWVVKHAksORVM2srLjiJOb0jUEsEhcZ9tTi0n2PPOK
         plAflzLYHkR9CI7NziTyqRaWuzkc9F4qDyhOOxWCg5ulCljUE7lLrx1aeGsCg7wqf5Aa
         2H+HBgr4xATalp1m4+ve4pY1gEd6a96jau8p2KPVty42EBt5BcfeIw133KbT2VeTFGWv
         gJVsCXgcdwGhaa/ZqAk56noXdPEEjpb8wmGfiNearKWE94GOqm1aie3ZJ+OEnw6AiF5W
         03Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684199867; x=1686791867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WACwJGv8gsOQeDW3ZaDiXX7Fzl5vd3342+yL7YL6Kn8=;
        b=KCIPSp+/zkuhxkgQ6n9T6IHXqMBtXSuLZICiCvU5kb8NVlWXXzIjCJhHOXMgz0UH8s
         1NstycgmsZGCkjc42rC6CssBU0cFBPx0RvEW9ia/zbTaYG6CBc0o2KkwSaCJyZ5a7wIp
         OwYzrLuRgUqB8BNiA0BNyVWopbYFb7MHIlVpDesOSazxEiyVORwEqYFOE1Bnhe9Lg69H
         eQGU5yz9bozPW/ejPmmOTVB1D7nZeR0dn5fPD4EZDRydC+yS9G9TazW6TvI1G5xV9Kgk
         SXMtl8q0Vh3tBwZis85GFSEE4PXywy6s/3a0JLggCzEXJBbWBEh5sUWxdNMz1Bk/yDuU
         BrYw==
X-Gm-Message-State: AC+VfDyDEWN9z4wHCmqa6vHxcaafZI+Vu4cGs9PhopyqbF2rO4LnwuVp
        H7BufmYJe1t1hkjr7XJgaMRiOw==
X-Google-Smtp-Source: ACHHUZ4JNYC7Doy3Hnr2LE6tTJvsIEpXocwMqY7PIXE8ZRt4GhDn7EK5Y/rjvycBw00KaOj7K/nV5w==
X-Received: by 2002:a2e:9916:0:b0:2ac:53f7:41d6 with SMTP id v22-20020a2e9916000000b002ac53f741d6mr7391563lji.49.1684199866814;
        Mon, 15 May 2023 18:17:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y19-20020ac24473000000b004efe8991806sm2786742lfl.6.2023.05.15.18.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 18:17:46 -0700 (PDT)
Message-ID: <27108475-a482-dc2c-67e4-ee573090a524@linaro.org>
Date:   Tue, 16 May 2023 03:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] ARM: dts: qcom: msm8226: Add ocmem
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-6-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-6-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> Add a node for the ocmem found on msm8226. It contains one region, used
> as gmu_ram.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 42acb9ddb8cc..7ad073eb85c8 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -636,6 +636,23 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		sram@fdd00000 {
> +			compatible = "qcom,msm8226-ocmem";
> +			reg = <0xfdd00000 0x2000>,
> +			      <0xfec00000 0x20000>;
> +			reg-names = "ctrl", "mem";
> +			ranges = <0 0xfec00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>;
> +			clock-names = "core";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			gmu_sram: gmu-sram@0 {
> +				reg = <0x0 0x20000>;
> +			};
> +		};
>  	};
>  
>  	timer {
> 
