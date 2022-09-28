Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10085EE34F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiI1RjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbiI1RjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:39:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61413F3F83
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:39:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s6so21427927lfo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IxJXSEam7tFBgvUgNhfn02/DoOyHrM5vTWh4d13Llgg=;
        b=rTMqvq0IZYRzK+NFwXM2Ka46LsX0BfAaP7Iuvrk73pFKNeodd6XxTTEKGP03ijVY5e
         CMZwRqiQxd7XCrpxvTQdp/TBKQKXd1P1l/VWRqvyOLXHIF7slAS2eombGYHWpiXjiHvg
         JtoU86vrteD3HACPbExNDFEYORfMLN10O9/3/GGkZAPQapMMQXm/ilV9mTKrs0qBjfqz
         u5LGF63Bek9XT+HFMUArSH9D5nJwEzcq4j10xvQ2DdPO+YKHYqIjJOLIOvn8RQmyGI95
         bTR6SgO6k1WNPwX7HRs2hzEyJcs1ORBtQl/0GZiv3Drh03rC7AjjUrWCPmzDFr8aDD6f
         lr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IxJXSEam7tFBgvUgNhfn02/DoOyHrM5vTWh4d13Llgg=;
        b=uM0pkZrGd7WoKuQ9PItvCXQB4WD2wI3arjBoRqRfyn3DjgBvHE7tiGRV/Hl9rNWiiN
         QmZYaubRoJvtELEoe+j9cSGOky4IAlAMZd0gR30QZugjxCDX2SLCJvfGKH7kqKx0jkV7
         mPVjHZljs34OdpZdRUub+4CfmB6QPJdEpY2ZIYOATujBjhsZO2iMfHvhSt7yR7Af1lvl
         dC/WbqpWp5W6nqBzUaqAe+cvv5v0jSjrQlhBn9WgMu6qp4sJ3F2VW6eC8nbJPgLKrdHz
         cxoEqlx8E8iNVQbLZlUBkhbvNRDLs1q0nXK4blYAImlkKiWqW7IdTQgh3yB05EbBiLFp
         I2vw==
X-Gm-Message-State: ACrzQf2oYYM9rJCoOUM/7Z4EmERVZU9RMOXMWYBZyw/4wvMKoEz8fwoB
        cwST3JftHz6Xhw5atYFSkBshIg==
X-Google-Smtp-Source: AMsMyM4ApYrvFe6rCUKeLGAtNzo0h8VZ3efl73bxTdB0vXIGtLXoFy+UwE10qTTvxhbdMTw1xa+FoA==
X-Received: by 2002:a05:6512:3984:b0:49e:19a6:a302 with SMTP id j4-20020a056512398400b0049e19a6a302mr13806325lfu.492.1664386753720;
        Wed, 28 Sep 2022 10:39:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9612000000b0026c0158b87csm496134ljh.29.2022.09.28.10.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:39:13 -0700 (PDT)
Message-ID: <9c733ae5-bbe4-308b-d0d1-63e5c3d24db6@linaro.org>
Date:   Wed, 28 Sep 2022 19:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: clock: split qcom,gcc-sdm660 to the separate
 file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145818.376250-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145818.376250-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:58, Dmitry Baryshkov wrote:
> Move schema for the GCC on SDM630/SDM636/SDM660 to a separate file to be
> able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 -
>  .../bindings/clock/qcom,gcc-sdm660.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> index 76988e04c7db..35fc22a19000 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> @@ -24,7 +24,6 @@ description: |
>    - dt-bindings/clock/qcom,gcc-mdm9607.h
>    - dt-bindings/clock/qcom,gcc-mdm9615.h
>    - dt-bindings/reset/qcom,gcc-mdm9615.h
> -  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
>  
>  allOf:
>    - $ref: "qcom,gcc.yaml#"
> @@ -41,8 +40,6 @@ properties:
>        - qcom,gcc-msm8974pro
>        - qcom,gcc-msm8974pro-ac
>        - qcom,gcc-mdm9615
> -      - qcom,gcc-sdm630
> -      - qcom,gcc-sdm660
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> new file mode 100644
> index 000000000000..a39f28d37387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm660.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SDM660/SDM630/SDM636

And one more comment: drop "Binding". Title is for hardware, so for example:
Qualcomm SDM660/SDM630/SDM636 Global Clock & Reset Controller

Best regards,
Krzysztof

