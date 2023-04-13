Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941916E1865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 01:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjDMXir (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 19:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjDMXiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 19:38:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2B41FF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 16:38:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b40so807106lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681429124; x=1684021124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vbMMdXY95qL6L45KCQ/10QOy2KjAwy0Dtcq5sO3Kp8=;
        b=d5OeolZdIjVg9vlm/Y6YTXtOJ08S2Vazotp9JCFKdto+O6x3DAatnWg+RjgcTc3Mj6
         IXXLxyisehdJya3mgQK6ecYhyVf6XxbGeU8tttDDiZwLZO8lbNNeBZDrG1aUqJ+MG6iM
         PhSt3Ob058pEwVRY6aeugxhctNIjT2PZuGC5dEinW+mGg3eLyrcZLMkrvLWaJxPCbajk
         0GLDSUgKetoMoXJ0dUOF75OQtR7B2St8SdeTsWaicUNEby4FQKi8wGGX+gLr2GA/eCCO
         g9BDnd8/RnR1pPOQlqJ1R8pd5pn/6pYaOa5QMAf+uGJbtw8uGASupr4rDYqcZ6Wum1mq
         /DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681429124; x=1684021124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbMMdXY95qL6L45KCQ/10QOy2KjAwy0Dtcq5sO3Kp8=;
        b=J5smn8eRBtpW3neiEh25IRDEq8JybKZNHRO51mU5RyFPrHfmkv9S9bzyfDa9/y3+6W
         jbduEufT07Z+hcecCOtgF/Wi3My7dWmI0lUJzoPARrSr3pdXcl3AyjZGRbBQooJGDyIx
         U6eWLQSnS7V6mod02AxtDzAX3tb2ChTfnKNWNh6jUlAGLuasg3Wyrr+BdeumoGAGY8pU
         5/nb+rsSP8JOTHaK+xclCiwamBbmJB0ML2BTHDmr5rOOS9tFlto6nHLz0kx10W4iv/fZ
         txA4HndV381kBPX/DxuN0wzOaiUEjjRGyZd5nT96orAPvBUm26Xo62Azm5owFV5KVUz5
         k2LA==
X-Gm-Message-State: AAQBX9dkojIl1pxf9/FHToboFpRPz2esfU1vBywwvZ0cyjAz1OqmOqn/
        EL1uwq4Z58IU6wd6SlajMqJO3g==
X-Google-Smtp-Source: AKy350a0pU6DFdq6HyGx5oDdQCdXJIvlqz2vEQYEfimYppnwQw5jaUJSk+Zmdk6X6Fr3yIlyZ2CpAQ==
X-Received: by 2002:ac2:4895:0:b0:4d5:a689:7580 with SMTP id x21-20020ac24895000000b004d5a6897580mr1494493lfc.47.1681429123910;
        Thu, 13 Apr 2023 16:38:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id f16-20020a19ae10000000b004ed88fe62fesm317306lfc.209.2023.04.13.16.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 16:38:43 -0700 (PDT)
Message-ID: <bd2fd84c-78f2-e629-ea47-6e40ea5dad23@linaro.org>
Date:   Fri, 14 Apr 2023 01:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8155p-adp: Remove unneeded
 rgmii_phy information
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230413194020.1077857-1-ahalaney@redhat.com>
 <20230413194020.1077857-3-ahalaney@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230413194020.1077857-3-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.04.2023 21:40, Andrew Halaney wrote:
> Using interrupts-extended already indicates what the interrupt-parent
> is, so drop the explicit interrupt-parent.
> 
> The comment about this being the phy-intr is not helpful either, since
> this is the only interrupt in the phy node.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v1:
>     * New patch (Konrad)
> 
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> index ac52a8dfeba1..b65e0203d783 100644
> --- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> @@ -361,8 +361,7 @@ rgmii_phy: phy@7 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <0x7>;
>  
> -			interrupt-parent = <&tlmm>;
> -			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
> +			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>;
>  			device_type = "ethernet-phy";
>  		};
>  	};
