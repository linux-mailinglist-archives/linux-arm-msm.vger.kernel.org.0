Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E117258210A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 09:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiG0H0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 03:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiG0H0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 03:26:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5CB3E75E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:26:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a23so23519962lfm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8nhJCT3rD1ItmbUeh8BkQKeiT6tXFfN/+ixSzWykvJc=;
        b=MKIHocr4BEkDBaTzuoccGtEHNAgvpG1hjFXNhO3CIqX7f28bJgPNScExLAY37+OgsB
         q3zwwzAIvJm8PQ4aLGmUBRe0uEleevOAwvz8hWHSUb7NcUsL6BW7A9cqS60UphudAtdu
         WkJujEBjICB3B3GwJni1ldK1nW73K1070YzK/fpiaFx4/5V1wJUVHRRKBsx9hh4YhaVD
         Y2ouJVY99b0mf+CmY2UovTd1Vps8YAoBz4365OUSAqgotejFu3DbA3qn6fpEHm9JUaVV
         GrnwgqhUAjZS8id7cyFN7xyzYpRVDX0/2zyz2E9g3w3ZDu9EbdQfbya2PZ03V86M8YCR
         q7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8nhJCT3rD1ItmbUeh8BkQKeiT6tXFfN/+ixSzWykvJc=;
        b=yHD/5wGuZOcBP4YzvIeugW0aCgRfFfL2NqS8X03idfYvkd+NN0GRBAMTlMyKd89tbJ
         iCbkbr8FwfeM3K9+8H3JF12wdZEXy1li7+pzRxLT+VyjtqUzENNv9Oq3k3+HxKaTmiFo
         ju1HebAiAOK+U+wjeY2I9AC2a1ttWgiru7yWBmW3cPgfKOuQ06DkmRRZvXCnpjRhf57z
         5cv21Xom32dglW+ljf37u/5sdGYE/FJJkPUY5n0m/t/+NmEAPXLa3iYv5cwFj6oF9Nfl
         v2FFFrBh1gwqGVJwf1jgzXrbPCrVP0T0KjywOeQEZ2QqAXao8obmFNJCNyJxanQaxER+
         QeQQ==
X-Gm-Message-State: AJIora/1qRxXJA3Umuz2jgyffs/JT4hH8g7pfA1QEkO+wnGCU9YJ0JB6
        3Dk0h2dsbh6Il4lyMFMpwfYnrg==
X-Google-Smtp-Source: AGRyM1uUEpQJOmsYyeoFck+zrvHEKaVsS4IQQB/C5smIm084uy+xqPneVmF7JFoySIzAF6bFSztIrA==
X-Received: by 2002:a19:7606:0:b0:48a:74b4:8479 with SMTP id c6-20020a197606000000b0048a74b48479mr7369691lff.441.1658906789985;
        Wed, 27 Jul 2022 00:26:29 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a17-20020a2eb551000000b0025dece5427asm3114746ljn.124.2022.07.27.00.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:26:29 -0700 (PDT)
Message-ID: <7e742415-d93f-83d9-bf01-6f023a4d1a34@linaro.org>
Date:   Wed, 27 Jul 2022 09:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/5] dt-bindings: regulator: Document the PM6125 RPM
 regulators
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220726181133.3262695-1-iskren.chernev@gmail.com>
 <20220726181133.3262695-3-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726181133.3262695-3-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2022 20:11, Iskren Chernev wrote:
> Document the pm6125 compatible string and available regulators in the QCom SMD
> RPM regulator documentation.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Unusual SoB chain here as well.

> ---
>  .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
> index c233461cc980..1122a3a17f56 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
> @@ -57,6 +57,9 @@ description:
> 
>    For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
> 
> +  For pm6125 s1, s2, s3, s4, s5, s6, s7, s8, l1, l2, l3, l5, l6, l7, l8, l9,
> +  l10, l22, l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24
> +
>    For pma8084, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3,
>    l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
>    l20, l21, l22, l23, l24, l25, l26, l27, lvs1, lvs2, lvs3, lvs4, 5vs1
> @@ -90,6 +93,7 @@ properties:
>        - qcom,rpm-pm8998-regulators
>        - qcom,rpm-pm660-regulators
>        - qcom,rpm-pm660l-regulators
> +      - qcom,rpm-pm6125-regulators

Put new entry in alphabetical order.


Best regards,
Krzysztof
