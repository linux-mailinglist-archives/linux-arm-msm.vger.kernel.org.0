Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA29A75A9D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjGTI5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbjGTIt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:49:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096C72115
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:49:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso825752e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842993; x=1692434993;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHwSQayXdevxo9FDMxKFCH5PCKIJWPDU1Jdc50U3mtI=;
        b=RC2DdGveSkNJDTuLwxH0W6powkovYCXQWDbx6WLNOmovOpsg7/iR9nAkEXu9MEELJL
         CuP7T1mqC0Oi4jSz8ImaPEWOd7LfcEUBFjUn2BP/zBpWazxqfbl4w6mypwAJLodNBWcR
         N3/KOMdQSi/uNA+EcaepL4FpbNAUEqERAXj9H4KKNUGOuU7ypIyZ1/TLVFqCxLviY5Pn
         eeZx9ArmMZgDg5oqiZ+z8/hu8trO2v78zjeWeKT5BM7Pv17WGRuAOL46fRz8SnUcJD3I
         bxXN3GvKRVY6UxJp6pcWkYjY7OugK/wuh60Rwdj9fdJXu+1fFQE0kwFAb6d3P2dtjpbB
         a0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842993; x=1692434993;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHwSQayXdevxo9FDMxKFCH5PCKIJWPDU1Jdc50U3mtI=;
        b=EHNY3nfxMIj2aj3uM4NxYeydZUj/38mYcHFLEpEycdoAU7RXhHRZDkGc8auUeoTJmr
         4qYlJ5hIdy6yB2kWvoIsMFgm/eR8XSZDC7Y7mDb0HXI4+5w1HywxSrCM6uhK1IKnQobw
         wsrYlLXJbkqEkkBx+NujcITYxGJ/h7jB1diN4tzMtnk7X7bX92nO6nDgAcRHqQI266tY
         oXxZHTaxEKUUm5LsTwyfTDBfRqB0GBqMR59WETq3JV7jL/PBdbHCXLE0G2vq2XqhOtde
         ygvOOX9OWJSgeV0uZTGRYyQ6iqwtCybD2YvVYOFg2FO8l/Vwx8biTRJNDaE9aeFjnxfg
         N0tw==
X-Gm-Message-State: ABy/qLZQfTR5NICtPbhEJZkuBjsdOQOkoqh021oEmyvunB9sG2be7ojG
        XF3wlSNlEA/8qhr/Ptg4xxuHbQ==
X-Google-Smtp-Source: APBJJlFdkNIkrKShUcMqUd/+M8u95Hk3bP8wMlBGdsYWWZhPPEEWMlCgOgW0IIupQUWUh5LhkLbPsg==
X-Received: by 2002:a05:6512:224f:b0:4f8:68a3:38e2 with SMTP id i15-20020a056512224f00b004f868a338e2mr2018695lfu.0.1689842993293;
        Thu, 20 Jul 2023 01:49:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id bf9-20020a0564021a4900b0052177c077eesm437022edb.68.2023.07.20.01.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:49:52 -0700 (PDT)
Message-ID: <87c3a3db-d172-bc98-cf83-89b874c9fee7@linaro.org>
Date:   Thu, 20 Jul 2023 10:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document AL02-Cx and AL03-C2
 boards based on IPQ9574 family
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230720084534.6461-1-quic_sridsn@quicinc.com>
 <20230720084534.6461-2-quic_sridsn@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720084534.6461-2-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2023 10:45, Sridharan S N wrote:
> Document the below listed (Reference Design Platform) RDP boards based on IPQ9574
> family of SoCs.
> 
> AL02-C3  - rdp437
> AL02-C7  - rdp433-mht-phy
> AL02-C10 - rdp433-mht-switch
> AL02-C11 - rdp467
> AL02-C12 - rdp455
> AL02-C13 - rdp459
> AL02-C15 - rdp457
> AL02-C16 - rdp456
> AL02-C17 - rdp469
> AL02-C19 - rdp461
> AL03-C2  - rdp458
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> ---
>  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index dd66fd872c31..d992261da691 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -89,10 +89,20 @@ description: |
>          adp
>          ap-al01-c1
>          ap-al02-c2
> +        ap-al02-c3
>          ap-al02-c6
>          ap-al02-c7
>          ap-al02-c8
>          ap-al02-c9
> +        ap-al02-c10
> +        ap-al02-c11
> +        ap-al02-c12
> +        ap-al02-c13
> +        ap-al02-c15
> +        ap-al02-c16
> +        ap-al02-c17
> +        ap-al02-c19

Why? I asked once, but there was no feedback from Qualcomm.

Why do we need to do this? What's the point?

> +        ap-al03-c2
>          ap-mi01.2
>          ap-mi01.3
>          ap-mi01.6
> @@ -365,10 +375,20 @@ properties:
>            - enum:
>                - qcom,ipq9574-ap-al01-c1
>                - qcom,ipq9574-ap-al02-c2
> +              - qcom,ipq9574-ap-al02-c3
>                - qcom,ipq9574-ap-al02-c6
>                - qcom,ipq9574-ap-al02-c7
>                - qcom,ipq9574-ap-al02-c8
>                - qcom,ipq9574-ap-al02-c9
> +              - qcom,ipq9574-ap-al02-c10
> +              - qcom,ipq9574-ap-al02-c11
> +              - qcom,ipq9574-ap-al02-c12
> +              - qcom,ipq9574-ap-al02-c13
> +              - qcom,ipq9574-ap-al02-c15
> +              - qcom,ipq9574-ap-al02-c16
> +              - qcom,ipq9574-ap-al02-c17
> +              - qcom,ipq9574-ap-al02-c19

This looks fake. Sorry, but these boards have no differences.

Best regards,
Krzysztof

