Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F197735131
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbjFSJ6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjFSJ5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:57:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636B4E5C
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:57:11 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b4790ff688so10963411fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168629; x=1689760629;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeiQM4ejZKy7dPfJe9slrlhV7ZlaqniYZxaLcIy60qI=;
        b=muoF4GrEBonkM9tV5lDzAR6qn8WU/FM9MjQ9Ct1HIYBe07KFtGv539ftF8tcsEw0YJ
         GFPoMJ+t6FxyMERan/Pich1Lc3mAFD4iE2mdoZz+khVL7tsh/SrqgMMCSGSEeeHUodE7
         bC5V0H3T7o29akKMrnEn+qqjHQsR1aDmXUnX7TAykfMsjj6h7KFEdU9EkE2YDUSZWIY9
         0aMkbvbzV8HUTmJ8qrqpML9oEzVEm9OAOZwxUWcHz6Cx1G1lJGvOvjvB2Ag9/MBsUBFt
         hpJNJF25oWtuEkdfSYUgg0FtU0LyROz/KAhtb7bAkPFz5c2PnZWVj2DXq9DZIkuuG1fs
         D/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168629; x=1689760629;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeiQM4ejZKy7dPfJe9slrlhV7ZlaqniYZxaLcIy60qI=;
        b=anOUJ3DthQ+705NOms++0yp1gMTyIrlpcCYre/kxqQiz6pL2pqD4rXkRYptdZ99f+W
         kLP8NOmVjZsweOwRZwwhgMra6C5xaNTiEskJh8R7U815GLn5gMW1QBnm03PhRZgEXcvX
         ZpHBCFnuM75jgVgW5vbQBKd4uy2xAIP76+yPU7KrjbnZ4YkXE2k4SkULr5I8n/Nrgthg
         gSs6rU6BCPAG31N43KeMcqz0xjaz78z0sdbnfwK4bFXFB/iQkU+zX4ocj4N2Km8/KU3z
         hniM78Nxv2b6Z1B0L1LStfcnw0Ib8bP/artFOE6N8OuF6URc3aQEJEu7j7R0kNWKTRms
         SOiQ==
X-Gm-Message-State: AC+VfDwklyltiBe4HQhlU4HA1C359Sm29WjlKSr/fI2yq5BkH0Mu1JsG
        +59d0tPljTHVa2jkbZGpEAOhSQ==
X-Google-Smtp-Source: ACHHUZ4JTGzzzuZTDej9tUaUJWtSPPh7iOtZ0TejwdtJHZU5PVXMr4Jrca6xRtmW4e8k0vIZBoUsFg==
X-Received: by 2002:a2e:6a11:0:b0:2a7:8150:82c1 with SMTP id f17-20020a2e6a11000000b002a7815082c1mr5216567ljc.38.1687168629694;
        Mon, 19 Jun 2023 02:57:09 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id j3-20020a2e8503000000b002a8c1462ecbsm5076893lji.137.2023.06.19.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:57:09 -0700 (PDT)
Message-ID: <ad29a143-c6bf-7c13-a085-a33b63351d5a@linaro.org>
Date:   Mon, 19 Jun 2023 11:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm6125-sprout: correct ramoops
 pmsg-size
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
 <20230618114442.140185-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230618114442.140185-4-krzysztof.kozlowski@linaro.org>
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

On 18.06.2023 13:44, Krzysztof Kozlowski wrote:
> There is no 'msg-size' property in ramoops, so assume intention was for
> 'pmsg-size':
> 
>   sm6125-xiaomi-laurel-sprout.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index a7f4aeae9c1a..7c58d1299a60 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -52,7 +52,7 @@ pstore_mem: ramoops@ffc00000 {
>  			reg = <0x0 0xffc40000 0x0 0xc0000>;
>  			record-size = <0x1000>;
>  			console-size = <0x40000>;
> -			msg-size = <0x20000 0x20000>;
> +			pmsg-size = <0x20000>;
>  		};
>  
>  		cmdline_mem: memory@ffd00000 {
