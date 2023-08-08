Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1D2774255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjHHRm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbjHHRlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:41:44 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6776A238F5
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:18:25 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-986d8332f50so809084266b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511458; x=1692116258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybSaKnH3U1PUxa94j8TvSQvCpscNikWjtLAxZuswTqA=;
        b=G9DMJ7PQfZIHZEL6tKAAlox8l+YcuBVl2LvLOeerxJoH9qIS3tnpmU8v64pNs15ZYR
         68/S74gQLe7LXsCErNhcGmxy/m4BS1dYCgqEG4GLHw/HErsR5VX676Bo/ulPdrDc0lot
         Q1CNXo7c+dyXeZ5sXgW2MK/YaRGCpr2+vbGDD13znMlYvT2zsl1vb0ANUOLHQSrLABnT
         BDfqflYj7UFKiHB9RIJnH7C8qoNGT6LedyV2vHvxsrS8YuGoNQUw2c05XYiR9VNKkuvX
         APkilcTwWvGszLQ0+HV7TkhyVd264ReNah1J6tFGCg2ssXS3wx7PlxKmLb5f/7EP3ril
         KCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511458; x=1692116258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybSaKnH3U1PUxa94j8TvSQvCpscNikWjtLAxZuswTqA=;
        b=jXP7DaLjVB2NN2q0NpMrV5V6aOwgCFkptPdrUt/I1yhfPGRwNeI1R4rieh6Fhi4wad
         szrocM12LaclOR/74jVzWIAxSkPdYevKy8NFu0mSTxtWdmLlGGmf/oYuhF2SzzsFqa9v
         sJuA/sRXv/GOC4bIOwDwY/bxmFw1bOB93uCwOjgBeVQ/4NxdECFgRy4DlChHzQIsafqQ
         uL6qKMzGJfYUZ0zfdO0Y2VLsopXp2JNKGuNUM2p6qPpTo19eMb5sIUxjiIgbb6HdU1t6
         e9yydroShYJFYGc6jERsUwH1azgnUwNjamGE84POjlKEcZeGl9jDMvOcGGYxMLB4F42w
         Lo7w==
X-Gm-Message-State: AOJu0Yzrv/kardT+xqUhtjHpnXe51HlbnHT1OchNqTlBZGBLz7ldudyZ
        Cr0T2aeuKmxg3wygzhNGN4cMfA==
X-Google-Smtp-Source: AGHT+IHy3b88rrWSRN1JLxN3DzDvkBHUqN01Uo4RsZimAWEYCJuL9axBSLSlB1r3TamXnnz8rJDfuA==
X-Received: by 2002:a17:906:1091:b0:99b:ca24:ce33 with SMTP id u17-20020a170906109100b0099bca24ce33mr61823eju.31.1691511457715;
        Tue, 08 Aug 2023 09:17:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id p4-20020a170906614400b00984822540c9sm6920839ejl.96.2023.08.08.09.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 09:17:37 -0700 (PDT)
Message-ID: <921291bc-f1ac-bcec-718b-f3674668a715@linaro.org>
Date:   Tue, 8 Aug 2023 18:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v13 03/10] dt-bindings: opp: v2-qcom-level: Document CPR3
 open/closed loop volt adjustment
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20230217-topic-cpr3h-v13-0-d01cff1c54cf@linaro.org>
 <20230217-topic-cpr3h-v13-3-d01cff1c54cf@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217-topic-cpr3h-v13-3-d01cff1c54cf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2023 14:37, Konrad Dybcio wrote:
> CPR3 and newer can be fed per-OPP voltage adjustment values for both
> open- and closed-loop paths to make better decisions about settling
> on the final voltage offset target. Document these properties.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/opp/opp-v2-qcom-level.yaml         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> index a30ef93213c0..b203ea01b17a 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> @@ -34,6 +34,20 @@ patternProperties:
>          minItems: 1
>          maxItems: 2
>  
> +      qcom,opp-cloop-vadj:
> +        description: |
> +          An array of per-thread values representing the closed-loop
> +          voltage adjustment value associated with this OPP node.
> +        $ref: /schemas/types.yaml#/definitions/int32-array

I assume negative values are accepted on purpose.

Adding these to example would be useful. Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

