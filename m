Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8BA571528
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 10:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbiGLI4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 04:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiGLI4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 04:56:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46CAA9E44
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 01:56:07 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u13so12823041lfn.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=cPj9MTsK1QXN/Iovblt90lj8En5FjLfhaWRro/VdiFw=;
        b=YCBAMTot/cYovGazfhpGKpUF5Ea9mggII3+fFTLnNxGYVXkCU4erD15c2AteOJVV/b
         RLzvm6S8U6+orKFUNhrSe3lODa3/1FirokDfNzB1pEwmtvgDXv20UYDNh0FyMNLiFf4N
         P2mF0jSgzao3vOWRq1kjDsNHWPIQBVPHLAgs+YxNqmhKY3UUP/UkQ4aU+0ktzTPi8GyP
         Qh1ejTFkbGayT4LwIoJMzGQDem3M+jBKHFWnH2mJGHr4AKTKCGunBiV5nw+g0C8qxrEB
         cn0iTVy3+l1ic9ghEJlNt107jevSSTTupTwTF3uO6WbzBcEuqrW/j+gepDW26KVVPrCa
         3KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cPj9MTsK1QXN/Iovblt90lj8En5FjLfhaWRro/VdiFw=;
        b=WXsi5JQrfi0HXCCbb8HwGanCDzlEFOgdtJ9ShICbABwhweZa1dvPmkQiEYTskN54cs
         8Xua5SleR1xOkfn+k7D8XkmHJ6aWDT6Ku5xr73YNaK9az1VjvfLH7w079VAigz/qHSn7
         OltP+L+EWKuOj/CWAArDFMVnvGnsPUWpWMLPpPx7F8qut/scDTSIEy9sKIWvD8GU/tfP
         Sx6GEYwciYyBLdgkn9zrw1+InV0Jm3S5c+AFjdCkU5ODWL1vM89xgjdRYa2nI3VG4wGh
         1uNIouLjZHB9KFZ7i0+h8Gb8Fds98vdUC6k5dvDZZuMLjTrSHODA8TprnRsGBpk6NOFZ
         PuXg==
X-Gm-Message-State: AJIora+QgqTgzScT9enyU2sWfkmtZYezQgoE+j9LdTOs+No03idGz9ug
        WZ9d6YVD56RTxnLc/MFO4J1mRtR85xzeTID1
X-Google-Smtp-Source: AGRyM1tU6nmMrgLNu9squdgDq1hdAkpsHdK3LDTR4p70bozyzAhc5eBWHuXLCEc9Fh6s/suOKxdrjw==
X-Received: by 2002:ac2:568a:0:b0:489:dd50:bfc9 with SMTP id 10-20020ac2568a000000b00489dd50bfc9mr6257755lfr.487.1657616166108;
        Tue, 12 Jul 2022 01:56:06 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f08000000b0047fac765f39sm2051069lfq.219.2022.07.12.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:56:05 -0700 (PDT)
Message-ID: <94667ee2-3b5f-37f9-49f6-a28ecd69e709@linaro.org>
Date:   Tue, 12 Jul 2022 10:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 2/4] dt-bindings: mailbox: qcom: correct clocks for
 IPQ6018 and IPQ8074
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220711105931.43164-1-robimarko@gmail.com>
 <20220711105931.43164-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711105931.43164-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2022 12:59, Robert Marko wrote:
> IPQ6018 APSS driver is registered by APCS as they share the same register
> space, and it uses "pll" and "xo" as inputs.
> 
> Correct the allowed clocks for IPQ6018 and IPQ8074 as they share the same
> driver to allow "pll" and "xo" as clock-names.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 44 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 95ecb84e3278..939ce63fa824 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -41,10 +41,6 @@ properties:
>    clocks:
>      description: phandles to the parent clocks of the clock driver
>      minItems: 2

You need maxItems (widest) as well.

> -    items:
> -      - description: primary pll parent of the clock driver
> -      - description: auxiliary parent
> -      - description: reference clock
>  
>    '#mbox-cells':
>      const: 1
> @@ -54,10 +50,6 @@ properties:
>  
>    clock-names:
>      minItems: 2

You need maxItems as well.

> -    items:
> -      - const: pll
> -      - const: aux
> -      - const: ref

Best regards,
Krzysztof
