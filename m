Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4179C4DB607
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 17:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354627AbiCPQVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 12:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238782AbiCPQVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 12:21:44 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC1A6D3BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 09:20:30 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ED9C33F221
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647447626;
        bh=O52a6BJ0eqWTsc/2DbHo6Vw/EG0KeFOooHXm8fZQaTo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=v6XzZQVCs8AyABaV6tUe0xX6u9tFxW0ldvmRgaitu+MYvXE3m1cqRs+aqpA2v5PH/
         eDQSWZgduMfXSK7y2qFr45jGJZR4/G9Q/t34X/jMvM4umccxdASZNbRvCDyQz4Hsfa
         WSPfAOxG7f53C0nFrtPPuoGmDsfj1bLUeH/psbsYXa9NqC8bwIYzA1LwgAS3Or7fwu
         7/luNlQexBDjZSAD8R+ItYii5N+APDYYEdd4yEz0QM3Zh0ySHnvkAqoPDoX7DUBFWU
         1QTywdQ7c+OFD1ws8OoCuDrykQWxfBeIj5a9clVLcsn2pTFCQ9CXruOmjGdsNJoKdn
         DCJvddf50gQcw==
Received: by mail-wr1-f72.google.com with SMTP id a5-20020adfc445000000b00203dcb13954so709007wrg.23
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 09:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O52a6BJ0eqWTsc/2DbHo6Vw/EG0KeFOooHXm8fZQaTo=;
        b=igbFZMYTcMtN4kJDePNcVajV7SfSfoXFCN4tf2lbwN6zT5NBwkQGM+/8I8MS9opAZD
         /ttYbCXMYXBK8PV/evC9cb6lBT/TZOyvVF+LVNA0X7gw1pDF4Bwe6SqwkC3Bp5POy+A0
         kZGpi5h1jYg0BTzilSnjjeFLdaKB/0xvyJ9OGnqs6g7yvtScnO0IxDT50N9hFQG6YmJx
         zLzDa1BFH9lGRn2flTCIr4QJ2dwzNyl7iiAYEuGqeyKIxiiKie/FloDQVtI75S4N+gs4
         F5ljP19Q6JhmgQeQNRjqCRFASLKqjqqlp9BWveXKtPJEgyOUF9Hsd3wbGYuzj8dZfl+V
         nYwg==
X-Gm-Message-State: AOAM532Bb0dPiQXXEMpoPr2fwa0hf3vDaN4N7rWGDpiJAmQuJylWAI32
        wtCR0yGu7qYvAfuRuD7aQI02cyviXQ8y1XTn+u+rCR5/vNfNG8fgzKwWIFUaqqpA8mWLoZU2NLB
        95iW+lEa8npbckjDlaz3oXVFKC+PkT1Df9wJEYS3zs40=
X-Received: by 2002:a5d:4bcd:0:b0:203:cec2:edf with SMTP id l13-20020a5d4bcd000000b00203cec20edfmr533647wrt.25.1647447624983;
        Wed, 16 Mar 2022 09:20:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvx/VWi9UpWEvGj+o7+fQNO9ol8C7gLCx1pm8lTtoDiyvjUWQUiU9XrTGq/gyB46keTeolwQ==
X-Received: by 2002:a5d:4bcd:0:b0:203:cec2:edf with SMTP id l13-20020a5d4bcd000000b00203cec20edfmr533629wrt.25.1647447624842;
        Wed, 16 Mar 2022 09:20:24 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id r186-20020a1c2bc3000000b0037bdd94a4e5sm2117243wmr.39.2022.03.16.09.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 09:20:24 -0700 (PDT)
Message-ID: <74ed4ba2-168e-b1c4-7449-443ff6955e6b@canonical.com>
Date:   Wed, 16 Mar 2022 17:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] dt-bindings: power: Add rpm power domain bindings for
 SDX65
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        rnayak@codeaurora.org, collinsd@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1647410837-22537-1-git-send-email-quic_rohiagar@quicinc.com>
 <1647410837-22537-4-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1647410837-22537-4-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2022 07:07, Rohit Agarwal wrote:
> Add RPM power domain bindings for the SDX65 SoC.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
