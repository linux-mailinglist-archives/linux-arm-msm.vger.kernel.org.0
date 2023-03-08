Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E696B1369
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 21:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjCHU51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 15:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjCHU5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 15:57:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74428CCEBB
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 12:57:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g17so23018231lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678309031;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ilAaZb7hSDXaI4WXSM2pmgGhUZ9iTLxZL8N2jMFMCo=;
        b=NzIE3k5e5alZIHF3tvyGrfHpG9/ywjPhZjamLJUXqUOBU1l+DppAtEFNnEjMWZQMiI
         311m1otcIBhB739U15aiZ4SPZJNC36XjFvyuwt4o91EIlmlQi51f6F/uX0+roLFe3+Qm
         iOO3Unz4pBX0X2R+BKVfsVYACqrlwG8BOKa+Yhuva/s1gKpzOLT5i71pP444QoRsHtSA
         HaBJkNa/ZHSFoYbinwNbBtYnj3h4a5A18YagK0RiXWF3vbSuzG/1C1rMVTDvNc5/fqW1
         u0o9KE9tSB1L2hxTN1tzYN++WAG0jXIvyJ5CjEmIG+yRfB/1PS2WJTo6u8PqR8b6GJKN
         aJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309031;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ilAaZb7hSDXaI4WXSM2pmgGhUZ9iTLxZL8N2jMFMCo=;
        b=4EP4WKbjxZ0JdDXDQCkNtL5fUSI4FJR/HNnRSbkUh/IxCfzBGZYRtlIKgQpnN0S102
         nG2oRZrd+N84NJPtwMVsPJ7Sn2OTf29Cvb5AfxO0/BYSnp3YSFqKX+g6nItbDYBr21x1
         vrRxFackGMnJBTe8DU4weYAkVolrtx4db6vb2zL79MZfkSmDSSTDjPjJECjRV0YSGwT1
         3OSRx7CyEZ8SRzyEVAJbnfcHb2OryrFPKMEk+3s0zfXxvetszOC/geJHYp1FIj3Kh186
         QkJOhZjyvAbrRVLllcxa+Ld1ypBySWbklAaZytXpzf4puDVvC3gJjD834j/KzmZ9Ri5C
         0Vbw==
X-Gm-Message-State: AO0yUKUy+EuA0930EjvECwkgNKA6iVc2IQ+Gkmg3fQdOzMa/jo8nQjkW
        akNJoqoQt2z4P5H+1rdYlwt+bQ==
X-Google-Smtp-Source: AK7set/o2yeczUbSVTI3Mx+fREt4A1qy7Cz3X//8yUo8LD7Da2Nz4ewJVIohC+52rLBcZL7QgYrfLg==
X-Received: by 2002:ac2:51ba:0:b0:4dd:cf7a:990e with SMTP id f26-20020ac251ba000000b004ddcf7a990emr5399358lfk.8.1678309030703;
        Wed, 08 Mar 2023 12:57:10 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id f25-20020ac25339000000b004b567e1f8e5sm2442196lfh.125.2023.03.08.12.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 12:57:10 -0800 (PST)
Message-ID: <eb0265be-0783-38e1-b787-aa2dca454ffc@linaro.org>
Date:   Wed, 8 Mar 2023 21:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8450-hdk: use precise WCD9385
 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308183317.559253-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308183317.559253-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 19:33, Krzysztof Kozlowski wrote:
> The HDK8450 uses WCD9385 audio codec, so use precise compatible, even
> though WCD9380 and WCD9385 are both compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index e04de4bb7fae..9cd1d1bd86cb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -25,7 +25,7 @@ aliases {
>  	};
>  
>  	wcd938x: audio-codec {
> -		compatible = "qcom,wcd9380-codec";
> +		compatible = "qcom,wcd9385-codec";
>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&wcd_default>;
