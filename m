Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3900746982
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 08:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjGDGVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 02:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjGDGVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 02:21:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC151AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 23:21:44 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51d810010deso4906777a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688451703; x=1691043703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vq0/2nxOenOtZq1KpxPmgjEqnbAXYZ9BqZlUzCiIlAo=;
        b=l2hN4EhcBkBGp0AE1Ry2s5QTwmPcujV6NtQ0vxOH4MnlMsNHIQFhLw5dNeTCFMhGdY
         P1FxibEEyWzcOyfntL1PVpFrWWAqkTj6skr2eg4RXqhcaL2/8HS+vuV5xO7UJUXhRBFQ
         gDCFqBzf6ufBOv1GMANon2eDzRnwfXDxrVeiIzopaBcFM6O4Fzy8EJOldzvGYhHrQmLq
         E4V4Hy8NhY8+N6INWxnLuS44k8JAhAdg4hhAEHANTfQT11RuJIFL8qa5s0T03XaBPudA
         TxVOfR9L1NdOUYVa1NYvyEv4m/m62kmcfx8zOb3q/KOa623ae6LEAw6D3GF+FN3WUWkk
         sMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688451703; x=1691043703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vq0/2nxOenOtZq1KpxPmgjEqnbAXYZ9BqZlUzCiIlAo=;
        b=LkeX4EWcMnmQnJgP70J+RR1xwDbxU9zxGS9R1z6MRyZyV1esTxrgC7YEXBgZKQJBR0
         C4AbrvIosnATXU3gyXKvMxZvh4+qv3yw4rQfzRwH1x5HEOMVtlOoAe2YlKS+5xgDiXUK
         SxPtoLZo9XuRD0wljYxq0Wj1WzVODu9lEV77FqiVXmVi1dQoTUGXwN3xqWW2r9LZsDfT
         aO27igBX1zmSi2SENpzn12PHI7Isg9YSiMcvuGFDwS8XxQ8epZGygRkR1VXKjLWEhisS
         w7DCqXeizxzjfB0GIdr/TmmyGE4nM4LsOz87QiHVMYJivJKMtUt8q4gzplngG6jF2o5L
         Un8Q==
X-Gm-Message-State: ABy/qLbSP8G8D47sWbUFUBjf412S2P/Q6enPcLYs0CHObkOA5DWtSUr3
        Qu7+cyx2GY0X+R8SjZVuVmNphw==
X-Google-Smtp-Source: APBJJlFITTYj1lrz5y0PhfMY6B62r2Da/YPqbUjO1rOVXBPBe3rSyh+mlXst/ofQlWLc4FKsa86N8Q==
X-Received: by 2002:a05:6402:4494:b0:51b:ec86:b49a with SMTP id er20-20020a056402449400b0051bec86b49amr8381188edb.7.1688451703309;
        Mon, 03 Jul 2023 23:21:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v2-20020aa7d9c2000000b0051bee925ca7sm11388042eds.34.2023.07.03.23.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 23:21:42 -0700 (PDT)
Message-ID: <9412f498-64ad-5f08-7184-b7ff4403afdd@linaro.org>
Date:   Tue, 4 Jul 2023 08:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] dt-bindings: regulator: Add PMX75 compatibles
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <1688395346-3126-1-git-send-email-quic_rohiagar@quicinc.com>
 <1688395346-3126-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688395346-3126-2-git-send-email-quic_rohiagar@quicinc.com>
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

On 03/07/2023 16:42, Rohit Agarwal wrote:
> Add PMX75 compatibles for PMIC found in SDX75 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index b949850..cc72144 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -53,6 +53,7 @@ description: |
>        For PMR735A, smps1 - smps3, ldo1 - ldo7
>        For PMX55, smps1 - smps7, ldo1 - ldo16
>        For PMX65, smps1 - smps8, ldo1 - ldo21
> +      For PMX75, smps1 - smps10, ldo1 - ldo21
>  
>  properties:
>    compatible:
> @@ -84,6 +85,7 @@ properties:
>        - qcom,pmr735a-rpmh-regulators
>        - qcom,pmx55-rpmh-regulators
>        - qcom,pmx65-rpmh-regulators
> +      - qcom,pmx75-rpmh-regulators

You miss the update to the if:then: parts.

Best regards,
Krzysztof

