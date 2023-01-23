Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E996781DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjAWQlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbjAWQky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:40:54 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1932E0D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:39:41 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v10so15247700edi.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2W5K6h5LHxVXenKBBO/Xci/8CCHG3S0Xpjg8qKfzByo=;
        b=cQ/V2m2GbViznyMsjEP+/3CWy1MkfHoZcUAGA8jA3aPFsbllidFVXKxs91WB5x8kS5
         OX2y6VMZauuXtq0ZYNqYcZHCC9agV/1ZYOcLkAhyzDN+MtzwWDJo0XIXRV2E+yYSAZL3
         wEMLWgvs1lPFVxpw3mg9yzs3kHYu9jp92iTo76ShjkEINbfMvGMoQpMF8kUkzV5IXqT6
         Zs82u3YhitA2U1t38TS1Q1nvHVuNbVdwAHYNCeYZbbNs5gD6K6BqTIecvkksor31nj1E
         dg5Y8Cp5gt00zoR5+y0PWy62N1E7blRZgX5w0eu5qyqDCRZuxpcgIusW3foaa0bXNF3L
         Ab2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2W5K6h5LHxVXenKBBO/Xci/8CCHG3S0Xpjg8qKfzByo=;
        b=QI271/NbqyKgk5J6yzIzE27N0kiSWTjWKpHhc/X26AcsmKPsOxdBA5B6mnxOTfo9/o
         erLFQyMGQYzYIwz3COJYWsrIRxI7EZuzI4pfqETFzQENoJBo6UWR6c35Aeg2eElJ7TW4
         Lq0ujPQT96gzHRJ2HQHHCtMMJ/Lu68UzRMHXW0kI6QVVkkVObnoN37DK0pZon1eaXens
         VUnN9MbEBHmhV90a95kFXSOOfVZrd+8A8sm3JweQJ9O+GhSG/YqanI775wWV01ysJLL4
         uFtBdvoiX+L23NyJbH5yNOxD3K9/tgKpv82V8wO6jqb81gOksNPW/Pqbqc5FM/bjOjFD
         sNAQ==
X-Gm-Message-State: AFqh2kqxas0cNwqfKydLd4BsHQAbcf+pemnwCZfYjhJfjR445ws5fYgA
        j4KGnkqKx9Yiii0u0xLC7h8TNg==
X-Google-Smtp-Source: AMrXdXucPw0wjtrBvqEDU6+GudHMU+wqbN75o2pFuhD5D8Z3VDIn9vs6GFBJLJ3U+w8mb2kJYMOqnA==
X-Received: by 2002:a05:6402:524a:b0:490:47c3:3d78 with SMTP id t10-20020a056402524a00b0049047c33d78mr33002626edd.1.1674491974345;
        Mon, 23 Jan 2023 08:39:34 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b0049e1f167956sm10829178edp.9.2023.01.23.08.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:39:34 -0800 (PST)
Message-ID: <8c67ca83-63ef-f84a-dccf-16f05ada2a91@linaro.org>
Date:   Mon, 23 Jan 2023 17:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add vibrator
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-2-4049f565c24c@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122-msm8974-bacon-features-v1-2-4049f565c24c@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.01.2023 17:48, Luca Weiss wrote:
> Enable the pm8941 vibrator that's wired up on this device.
So this commit adds some wires inside.. ;)

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> index b5606623f968..63180fe1d292 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> @@ -95,6 +95,10 @@ &pm8941_coincell {
>  	status = "okay";
>  };
>  
> +&pm8941_vib {
> +	status = "okay";
> +};
> +
>  &pronto {
>  	vddmx-supply = <&pm8841_s1>;
>  	vddcx-supply = <&pm8841_s2>;
> 
