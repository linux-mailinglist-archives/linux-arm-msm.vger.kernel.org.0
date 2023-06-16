Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA67732FE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 13:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245126AbjFPLdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 07:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235378AbjFPLdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 07:33:54 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EDF2738
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:33:53 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51a3e7a9127so680862a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686915231; x=1689507231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnCBULjwaeoKSSjtKcAIMInnLKiE524xqLou3I4mzIY=;
        b=BzjzuQgJYIshv6bcYud1qHQiywtb1eZ8d+MShkxuxN3EJDxICt070sEJ0JJL7EEZqt
         u/pHAQ2DsV8ngkLgbpYKLS/D2PuXq0Wc5uhV4XxQzWecNdsJQmKfFl3h2T/ndhDWq90i
         SxH3a6OkswRDlbuZ5UKmFpm0bwJWecwrCb3ou+GUVfA5dMQj1tWqNXc2WT/3977ka5+f
         vI7eGEX97OQRjPg4ZY1XQYpDwSqHcII1L4JzlIoRUyAClKNuZlmWidjutaM1NKaLbHkJ
         XfqIxSRJiCyCYD49u9Z5cXqTtls+ko5E0de6qSUDctt7lAU9e/8vUL0jx3n6PZvP01N4
         N81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915231; x=1689507231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnCBULjwaeoKSSjtKcAIMInnLKiE524xqLou3I4mzIY=;
        b=De1+UroCnisRwAoa+EHagTs2XU+lBFABAzeuiOE9V7pozg1Sv+TieyhDmJh5YehQoj
         zCFqqfEBNZC4hw09C3Gbl7Kv5qqKic1+KGto2spEX9E7du6t2vfiY8q8p3bnDuG0l1I2
         vqJRwW9qNeSZ3+FnUPLrTiIGsSSWJMgbr/FeXdBGx1h2EIUPKdT18qK6vOHxagf5pkwh
         7HiXiQBModTKuzuWIKzDCp8T0nID4dUnS/wBByIzx5UP6/iQoaHLajeGX5L9Z4yJz5Mf
         ddUEQVG7nT6qWaL9+4Xzc8TXiWIh4QBOW/PsuTKIf4BP19xMWK08YCSMzbj1OXemVLow
         gaig==
X-Gm-Message-State: AC+VfDxnEUbI4gOfOIdknQklaBnG6tiHFQxB2FcyMLUuC0s/pCjqDJfv
        boO/GI//EhX29l5q9VRh0V7NwA==
X-Google-Smtp-Source: ACHHUZ5cEJy8okqiTA6pGSDD4tP30kklvbaWhufgQI9cqL7BYN2Ux0OGcf6oNZHMSOUjHxJKR+CmEw==
X-Received: by 2002:a05:6402:5216:b0:514:a5cf:745b with SMTP id s22-20020a056402521600b00514a5cf745bmr7337833edd.3.1686915231435;
        Fri, 16 Jun 2023 04:33:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7c30e000000b00514b0f6a75esm9684653edq.97.2023.06.16.04.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:33:50 -0700 (PDT)
Message-ID: <cee56c57-060a-2fce-a2af-25404b9afe48@linaro.org>
Date:   Fri, 16 Jun 2023 13:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Update GCC clocks for QDU1000 and
 QRU1000 SoCs
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230616104941.921555-1-quic_imrashai@quicinc.com>
 <20230616104941.921555-2-quic_imrashai@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616104941.921555-2-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 12:49, Imran Shaik wrote:
> Update the qcom GCC clock bindings and add v2 compatible string for QDU1000
> and QRU1000 SoCs.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,qdu1000-gcc.yaml         | 6 +++++-
>  include/dt-bindings/clock/qcom,qdu1000-gcc.h                | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> index 767a9d03aa32..030953d258c1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> @@ -8,6 +8,8 @@ title: Qualcomm Global Clock & Reset Controller for QDU1000 and QRU1000
>  
>  maintainers:
>    - Melody Olvera <quic_molvera@quicinc.com>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +  - Imran Shaik <quic_imrashai@quicinc.com>

I appreciate adding more maintainers, it is welcomed and needed.

However many of Qualcomm folks, including some of you, did not care
enough to fix their old/incorrect email in existing entries, thus we
have hundreds of wrong addresses and email bounces.

We already raised this internally and publicly, with just small effect,
so I am not sure what to do more. For me, allowing to have outdated
email in maintainers is an easiest proof that maintainer does not care.
Adding more maintainer entries, while maintainer does not care, would
not feel right. Maybe let's start with fixing existing entries?

>  
>  description: |
>    Qualcomm global clock control module which supports the clocks, resets and
> @@ -17,7 +19,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,qdu1000-gcc
> +    enum:
> +      - qcom,qdu1000-gcc
> +      - qcom,qdu1000-gcc-v2

It's the same block, isn't it? What is the "v2" exactly?

Best regards,
Krzysztof

