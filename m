Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1293E6F5041
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 08:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjECGev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 02:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjECGeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 02:34:50 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6016EB8
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 23:34:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-95678d891d6so963160066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 23:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683095688; x=1685687688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdKCblJXNr1HLxjWNay3udfmdB39mU7ZXyAlcIs4rKM=;
        b=RzuWPKtM7RArrWz3un7JoBwE7tEBsCb41svnglXy+zIIJRPMx+4u2SUczhlBD0QLzo
         d3S1LECo7B/yOY0rsz3sboGbwqNvhF5ERz1TUk8/o5Vz7TXCeDc6iVIPrgc8AelpJVsa
         kKtRQeUqoF3gojmvnt6Xl/0UxNDFDlAd3vmsxzmClgyt+EAZurKZRrJ0GtEVq1nEoZrv
         oHyHKjypQFr/Rj5UXh3D0bfU+24VEhGqU8oc4fiec1TurByBBmuqnoFVyWw+Ithk4JCJ
         5iSHTIfhFT5LCB919PiwjMRQml6+Jdl4LZX1GIknT9B9f17lKnZv8LpJBw6BBwv6D4Hk
         a60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683095688; x=1685687688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdKCblJXNr1HLxjWNay3udfmdB39mU7ZXyAlcIs4rKM=;
        b=YrLOD/eKNYGXE70ddIbNHfo4NU8fJytkd412xa3fPbDWv0J0IRQHfJB/4Ma+UNmXJh
         HP9X1ICtPJxzlbLlBrQZ5fcpFmVHN05I5gEbuEYrzAu4nkCbq6ehMLsPXM1DTQftuLZ7
         2XyGl9j1lUQtrtpyZ9Oue57TMU1EwLxSBzWGp4IdgPj3tF1T1uMIb8XkMwMHZHRNIVGZ
         QdqyEca+VGXYrQDFf1Xwr9K2nFv3cNOb0DFyoAJKJvfX/qPoIdulhhqmNtgZl0NPK9mv
         3iYO/Rfd9V8vvHeA38vGp9n18dePqSPvy/TXL7LYKVreLPth3Z+hVjZrTD8kCHP6JQVP
         sSJQ==
X-Gm-Message-State: AC+VfDyqN9RlrpCYtQu67reiZcZWGvG6Yh55Iy50xwRRJPGPQ+qdc1cQ
        d0Nkjss281u5A8cMbZsXSUzflg==
X-Google-Smtp-Source: ACHHUZ5JG+a3Mdw5F2LnHNmbj0w3dxz33/gnJvW+p0MX6RjEWBz5duFiD7bCwKIPriNTFfWGdwpNXg==
X-Received: by 2002:a17:907:9807:b0:953:7e25:2156 with SMTP id ji7-20020a170907980700b009537e252156mr2037056ejc.51.1683095687747;
        Tue, 02 May 2023 23:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5? ([2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5])
        by smtp.gmail.com with ESMTPSA id md23-20020a170906ae9700b0094fa846be48sm16754660ejb.132.2023.05.02.23.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 23:34:47 -0700 (PDT)
Message-ID: <6fbdd628-89f6-e34f-1b6e-b36e8fbd2346@linaro.org>
Date:   Wed, 3 May 2023 08:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 1/4] dt-bindings: thermal: tsens: Add ipq9574
 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Praveenkumar I <quic_ipkumar@quicinc.com>
References: <cover.1683027347.git.quic_varada@quicinc.com>
 <cbf916e31b00e0e0599a3012a84a4740df89f4e0.1683027347.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cbf916e31b00e0e0599a3012a84a4740df89f4e0.1683027347.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 06:45, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Qualcomm IPQ9574 has tsens v2.3.1 block, which is similar to IPQ8074 tsens.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

I saw already v1, so this looks like v2, not v1. Please add changelog
describing what you changed here.

> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index d1ec963..8e2208c 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -66,6 +66,7 @@ properties:
>        - description: v2 of TSENS with combined interrupt
>          enum:
>            - qcom,ipq8074-tsens
> +          - qcom,ipq9574-tsens

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof

