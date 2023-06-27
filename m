Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE8A74014F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 18:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjF0QeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 12:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbjF0Qd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 12:33:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FC326BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:33:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a662b9adso31599861fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883610; x=1690475610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Um1a8Di8IY3rLUktjDo7U5c6Z65JFohHK/V4Nx6QANs=;
        b=BGUZxcUxoexnlvX8ixsryCG1nbEQMg9k9DofDayzFEf0pJBrZ5M01orNSMl7peKN1M
         OXk2Bd0HPISEQLmlgOzIAbJnuDJhgszt3JBzHHktSHQpC7HTh3/qI1B7q5OCuoDHKr1q
         o8W0OOTNCjnLhvtXAVCuF3ayQIdk17/H1OWWrQDNXU+6w1UX9MOFv1k8BhVVH3pE71f4
         CXN9Sf4Nz9QxTjps1HqpVSHrzALgMxoaEKocYyAzBppF/HpwquiDgVqrVJU/C66iHlLA
         MbUBXlo/34Gp9dLzje7nukrhiiOGOzYBLcHKfiq9T6+Ii2umWOAnvKpAKQfGS8RgwiLq
         hfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883610; x=1690475610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Um1a8Di8IY3rLUktjDo7U5c6Z65JFohHK/V4Nx6QANs=;
        b=LNHeRoQ8srYL1yWRQXQKLQACAo2dfD+m29NGX9E73ngxDgv+YwGuNwlOgMtL10W6Pn
         LHJUFXjz9L2WhcT91WuDcVC1haFS3C/S12Lw4GDPgqWk73dFKVGLwpIL5Gf90dFNQQnQ
         1eQWEJoL0FHvCyaDdCiVxOGL5GHnY8u7/cifwwgQ8yzaEefCVwSh4MbZf6rlNOoVkwQv
         ShY35BVSEAGgW53sz0s7UbEThDhBp9FD08E6A/K7xWAPqjf1kHErsbaprSC5pr9XwuXX
         5SkoSNLF9S4OuNEQSHqn4obaJcSTCLiToM2a/3LQjix1wkcfENnSEGavUDEGRmuoPqAv
         nFqg==
X-Gm-Message-State: AC+VfDzMp0Ci0e3fpmbydLxAsNP1CDSNFxULc0S5iLOEe4mlK+vjgAGq
        jaWZLBSidL5bEvxb6ehTBop9TA==
X-Google-Smtp-Source: ACHHUZ6i8gT3Uh61AFhzJhn90PzjFM8Pd/4izuKEFt8ksKV/UAmA+veBM9rcMDZY+A7Fk4xWHFSiqQ==
X-Received: by 2002:a2e:b3c9:0:b0:2b5:9d78:2143 with SMTP id j9-20020a2eb3c9000000b002b59d782143mr7470933lje.28.1687883610030;
        Tue, 27 Jun 2023 09:33:30 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id o22-20020a2e7316000000b002b69e504a38sm1366854ljc.99.2023.06.27.09.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:33:29 -0700 (PDT)
Message-ID: <266d3cfa-f72d-fc08-c283-19bebbd3ef4c@linaro.org>
Date:   Tue, 27 Jun 2023 18:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm850-*: fix uart6 aliases
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
 <20230627-c630-uart-and-1p2-reg-v1-3-b48bfb47639b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v1-3-b48bfb47639b@linaro.org>
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

On 27.06.2023 17:32, Caleb Connolly wrote:
> This is a follow up on a previous patch
Either copy the commit message or reference it by hash, there have
probably been 12341234 commits between the landing of that one and
this one.

For the content:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> fixing the aliases for
> sdm845 devices, fix them here too.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 090f73251994..62f503508dea 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -34,7 +34,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart9;
> -		hsuart0 = &uart6;
> +		serial1 = &uart6;
>  	};
>  
>  	gpio-keys {
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> index 41f59e32af64..543837316001 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> @@ -56,7 +56,7 @@ framebuffer0: framebuffer@80400000 {
>  	};
>  
>  	aliases {
> -		hsuart0 = &uart6;
> +		serial1 = &uart6;
>  	};
>  
>  	/* Reserved memory changes */
> 
