Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C4B627789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 09:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbiKNI1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 03:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbiKNI06 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 03:26:58 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4251AD86
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 00:26:57 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a15so12163143ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 00:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixJxobNj4DD1YXWvhlrQKeBzVvZAIlWWvS0k0+1NqA4=;
        b=t661uRes5GHNddkRcdzBodf8spLivS2NVAwYndZIPl533C0ucL1T2zVHCWzv37Gdwm
         btQC10m0YchIGnmJp0pHOUA7H6LAbQXU6u6n1HRTjbxJKqtoN3PY2CKHHJks0i3Fy14U
         +rVGkG9/WGEDbqVnLtqTrb1eSBVfBbemQ5sASoUZmnkdJ/buGAqsJZMxU2JDoqaGsJPd
         OqJd2uuvdvj6Whapt2tOh01hqU5Jfldbm4h+7k/Xy+HnoEDV7O/SGXZbVQQZlb9UxgCr
         RkB8QdZxks/xpH3WLu0NngbCbg8WkNZvocC9qBA37X9uKI7nyVWSZmZqYIj+suCcDTun
         TB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixJxobNj4DD1YXWvhlrQKeBzVvZAIlWWvS0k0+1NqA4=;
        b=aDmCTAsAN1p8/p/mIKrKPG9nd4NJq4GID+948M3dvVNxgt1hYFRsWXbjycmP8kHoQk
         6yUqscum2jKpD4rWZ74tmw4dS4eO4XqWBVX0vOzI/a6fOClu5+JxBgdu99uL+JkglaE2
         gzHh3WXjdl7PvkG+VJ4u/Ws1qS3z8+f00cFYBego/2xiFwxv/cBFVtpLPW/k1UYAfyX1
         EDag0sF22gnNturusb9PiOkl7ZAeyU792dyFZNZQc5ecExL6F8GcCpfwjVu3IOacLGVu
         Bt6csT8foRweQLHDRpi2zOr0i4l14jBMmgciSNvPHkf3YGAgz5RlZe5MheLNZUuGtWOt
         e57A==
X-Gm-Message-State: ANoB5pn1QJEwz8jsVYU5BTaSHXOjtcki5w/Ym7x7kK7EYIbkF9tc92v9
        ef08NSAtCbAb+DqNtmjjE02DKQ==
X-Google-Smtp-Source: AA0mqf6dIgf3/5Bb/A+GrCM1yFb3n+HDl/IF8ETElwQQZcPogufOpVNMoDG8uPkrvKXtFZ7MRAG/Gw==
X-Received: by 2002:a2e:711a:0:b0:277:75bb:429f with SMTP id m26-20020a2e711a000000b0027775bb429fmr3597455ljc.387.1668414415504;
        Mon, 14 Nov 2022 00:26:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b004948b667d95sm1733603lfg.265.2022.11.14.00.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 00:26:55 -0800 (PST)
Message-ID: <6a9a6d2a-9fa4-a09f-9a2a-35e756ac63e9@linaro.org>
Date:   Mon, 14 Nov 2022 09:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] dt-bindings: net: ipq4019-mdio: document IPQ6018
 compatible
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221113184727.44923-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221113184727.44923-1-robimarko@gmail.com>
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

On 13/11/2022 19:47, Robert Marko wrote:
> Document IPQ6018 compatible that is already being used in the DTS along
> with the fallback IPQ4019 compatible as driver itself only gets probed
> on IPQ4019 and IPQ5018 compatibles.
> 
> This is also required in order to specify which platform require clock to
> be defined and validate it in schema.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml  | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> index ad8b2b41c140..2463c0bad203 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> @@ -14,9 +14,16 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,ipq4019-mdio
> -      - qcom,ipq5018-mdio
> +    oneOf:
> +      - items:

These are just one item, so drop "items".

> +          - enum:
> +              - qcom,ipq4019-mdio
> +              - qcom,ipq5018-mdio
> +

Best regards,
Krzysztof

