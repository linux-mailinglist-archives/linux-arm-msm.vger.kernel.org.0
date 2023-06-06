Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B547D7237D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 08:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbjFFGh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 02:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbjFFGhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 02:37:10 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC1210CA
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 23:37:08 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5147f7d045bso8251173a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686033427; x=1688625427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYmvqZmczDMcqohyIROSR+qXz+fAe5DrWByhFDu6zgY=;
        b=gGPkenfHeXPnex7XvGJd4CaDJ7VBqTkM0GwgIWaX/mI/U/mFlMZJmesXG98BDU25Rk
         N4kbpG7JNT7JCRZ9X43odDtPRJUlAXK1z3pWZqDOAJUaBJQoZm9tt6NUtoKF1mu3mQri
         s4bYrwraU7cRCyk0QTyv1s0xBlEkjb4v3tKGHkyNG/mP7e/ynKsf38nsb1cMYuAG9dg8
         cz+CvtXSCYZNpAHjK/kpiDYyvBdjL5EsXviNv4r0uYL3Z2ggFCTonwOXWlEUMWuJ31Qt
         FgmI/CfZXDNuUEfvqxd5wwBi+m1ZFDzcW+hd9TSzy6Hb9L8BRMmXZM7OTyxP1qOSY01K
         zbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033427; x=1688625427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYmvqZmczDMcqohyIROSR+qXz+fAe5DrWByhFDu6zgY=;
        b=GExtKzZXo3QMNkpD7Udn7KKGtW8xq8SgzhSg9OJSshgd6a/XiecRB6sQizwbPGPgfA
         8yi5fbFx6Wyqgy3CsaW/Mm/ZjO1ZDBH7/rI/nNFz6yrqmqj6hvzmNCPfMuV1+fjb4faQ
         w97IhXYRLq39nScb+ggamho7B2TR5+tv2qy9cNyLNd+xdHK7m30tPavQFnet4ELsyjhN
         hhfy3rGEp/nOFbdF4Gj5snShAd3ttvIu40RZ9d7awPFzHqWk6o+ITlgUT9bGNPsgv1qe
         xEN9uahTS/kMYEO2OBPSJVnJe4V4U1kuql0iFYnIe8uTNaww0pmpIdTIRsXyv+y6ckps
         rgmA==
X-Gm-Message-State: AC+VfDyX1PsGnV+kr9ART6Hff3j5TauZ67KjSgS8iq1mxs9+wAhZEntC
        Fd9Y7H0Y8g4m4qhRHlpIGG5LUg==
X-Google-Smtp-Source: ACHHUZ6V6Bp4WlfRuuGw6YN4xWGpuvxvL6WrZOlb6SjmOwptQP+pyURfL/RuTbj207t56g8ZyGiJEg==
X-Received: by 2002:a17:906:730b:b0:974:6026:a316 with SMTP id di11-20020a170906730b00b009746026a316mr1680755ejc.19.1686033426893;
        Mon, 05 Jun 2023 23:37:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b25-20020a1709064d5900b009745c628bcdsm5156819ejv.93.2023.06.05.23.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:37:06 -0700 (PDT)
Message-ID: <d0fa3b01-edab-fe8e-c309-036cbbcec7ab@linaro.org>
Date:   Tue, 6 Jun 2023 08:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/14] dt-bindings: soc: qcom: smd-rpm: Use qcom,rpm-proc
 in example
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-6-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-6-e0a3b6de1f14@gerhold.net>
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

On 05/06/2023 09:08, Stephan Gerhold wrote:
> Use the new top-level rpm-proc node instead of having a dummy top-level
> /smd node that only contains the RPM but not other remote processors.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> index c6930706bfa9..06e574239bd4 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> @@ -120,10 +120,10 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>  
> -    smd {
> -        compatible = "qcom,smd";
> +    remoteproc-rpm {

remoteproc

> +        compatible = "qcom,msm8916-rpm-proc", "qcom,rpm-proc";
>  
> -        rpm {
> +        smd-edge {

What about binding updates?

Anyway, this should be squashed with previous one.

>              interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>              qcom,ipc = <&apcs 8 0>;
>              qcom,smd-edge = <15>;
> 

Best regards,
Krzysztof

