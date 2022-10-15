Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7E5FFADF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 17:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJOPPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 11:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiJOPPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 11:15:37 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CD22DA99
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:15:36 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id o67so5016285qvo.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oMrOTbUd3cbdsiML3nv2+rJ1KxLtOIUzPm5C1zEHGY=;
        b=SX7g5cHeayW/KtT6diblULbooFsbwiTJedYfjCwfM4UCnWTZUKxVfMqG8RX5n+iIx1
         a37yUV6S/lB41sqI9ecs8E1Lb185XWLP/mL2Gys4KmCUL7YqPLH8o2/WyQvK9amwdywd
         mrlDakEqUIGp7frhPnOCUVDtM3ybjP2kdfCOgVPVT7MrdXiV8ZQ+DMoN5kCgmVArIDdG
         nvc/ji598P8qVEL9X9VLLUypmmgK6QIS9dQv1KzJ/Cc8pvla5XB0IiVLHg+cN92IoVTo
         ZHzUCHI3wpTrEi5eXsyXy56tqHdnOqMxCJBbR4CrneMfLiWuYb3xi3LbLbRHjKE+WIec
         /BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oMrOTbUd3cbdsiML3nv2+rJ1KxLtOIUzPm5C1zEHGY=;
        b=gx373oXjGIjmA9tHBBJLh2kDIaWKE6EOTNmODEcKc64zXXwJIdrvHAAGFtXNRP/2qx
         wnfJnSGaqGqxDxVWj4M8xlBUKt4kf3kPPgbe+y5GbZg8Bag599rPNmNW81gRETSwMEX8
         GkjBECxo4FNfiS/YgYohkmyZYLS0eghQ+OnKiX7gVSOWrT/Q8TN6+xVFJhcTflkNFiLN
         tWt2E43qPRo9Cj8L/1gIwxZ7UdDjC74SibcOzN3bXKQHD8EuhQXiXqjKbdOCWKn2fm9q
         vtJ3EJwKxZm8Bg9ouc2CdSRZ2gRIUJL8U6mydcHcilWi3du1F4TLnznbUXHFwCYwsucs
         /jOw==
X-Gm-Message-State: ACrzQf1wo1rzZeqjoIUvo3Lo+3SZ6xNyF3qjz0OwnLqMB6+gzLzH1uwc
        9ahl7YqMUm+9PDsAt+EwkpyKAvp+GxiTXA==
X-Google-Smtp-Source: AMsMyM5w93pwRpeupaaVj0b7ISuHi4qyZKLxOuU2c5bjnJYaWopZTwqcM3xGgr3SEIgSzVcrBFG5zg==
X-Received: by 2002:a05:6214:21a9:b0:4b3:99ff:8794 with SMTP id t9-20020a05621421a900b004b399ff8794mr2116002qvc.68.1665846935149;
        Sat, 15 Oct 2022 08:15:35 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id p14-20020ac8740e000000b003992448029esm4095819qtq.19.2022.10.15.08.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:15:34 -0700 (PDT)
Message-ID: <16c192b3-b05f-8f24-30f7-82aeced6badd@linaro.org>
Date:   Sat, 15 Oct 2022 11:15:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: Add RPMHCC bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221014221011.7360-1-quic_molvera@quicinc.com>
 <20221014221011.7360-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221011.7360-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:10, Melody Olvera wrote:
> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 437a34b930e3..7cacbfe745a5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -17,6 +17,8 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,qdu1000-rpmh-clk
> +      - qcom,qru1000-rpmh-clk

Nope, you sent something entirely else.

Best regards,
Krzysztof

