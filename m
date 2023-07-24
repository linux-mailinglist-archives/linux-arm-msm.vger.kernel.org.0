Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5954D75F097
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbjGXJwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 05:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjGXJvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 05:51:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367A32715
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 02:48:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb7589b187so6057296e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690192084; x=1690796884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEO6K3MUGMeWz06k3JG+LekMxAqNYPl7y4IghbUxOUs=;
        b=ThRQSvMF4hkuGbp12uIBlSjLghc6Cg8fEXjzF0dIjh2iGOEmCWpnOel5y5RaoQqIrq
         Zf667huUVYFn1QIpt+F4KN84zqD1d0V4rdfBQzvFiRMEnji3JUyLhfi6dIZMA8CV9N07
         oaHV0kz8cqhWjW3+rXUHwx9gqNnRdl8q0aXadZE2kVsqhy0K2R2rchRsuri4RLLEDAn7
         iIMejuMsIjqhmg9zDVL4M7ujYKK2OolrJC2YI9a2Mi0PBBTMNMrxEIq2EUL9SToWClvY
         G/pJPimyhYiwZDhDrw6J9eXOvHHDT4MS43mFydtIu7kqv9kEVGILIDr19fgaFyF8b020
         AdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192084; x=1690796884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEO6K3MUGMeWz06k3JG+LekMxAqNYPl7y4IghbUxOUs=;
        b=Q4vNwpZKvtzDGWOIuI/1QcMGxzLDHddjgtp2eJQXQ4b/lYbj7kH/pZG+8nqQiX3b7H
         bCbwZqIodnnLP/SOsR8g8ODBnzFyunt0u0McZRPga4dE+MsNsFVzBGk+ySuOiEbYXjoA
         PIIo+giQ7YlTKjF1OchMA1fBUW5CM9Jhw/m1aEAwMoq0bx7kat3Ok5TdwReKH9m6hH3K
         iP77rJXRQbISztLWdy8/XF+9BxGNOnOwSG5CsagUDdCcgCyQJq4O/ThV85DYxh3/DCdE
         jwpr/eJB2qFarmJn08tjwRhU1AMLcX44gTwAvfjaE7xM6VNrNRkgEmBErR4m/tLRSOur
         i6Hw==
X-Gm-Message-State: ABy/qLY7Y52uXb3IfCryH48i+VQ4Tq/zMVMPrNrtPm0M2JiFiR0rx9qq
        hA3KLMZ6yT6M5V04Af46hnGcQw==
X-Google-Smtp-Source: APBJJlGQjV872ZYigiFxlzLKDNPfcFX3W8t25/ltwLBKPlQZgGrrFnlvJTxwR/g8/iD0umK2zr8+VA==
X-Received: by 2002:a05:6512:ac2:b0:4f7:6a40:9fd7 with SMTP id n2-20020a0565120ac200b004f76a409fd7mr5377613lfu.47.1690192084595;
        Mon, 24 Jul 2023 02:48:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p6-20020a05640210c600b0052217b3a10dsm3252027edu.63.2023.07.24.02.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:48:04 -0700 (PDT)
Message-ID: <63433b17-df36-78e0-30da-cd1f4bb9dedc@linaro.org>
Date:   Mon, 24 Jul 2023 11:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] dt-bindings: nvmem: sec-qfprom: Add bindings for
 secure qfprom
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724082946.7441-1-quic_kbajaj@quicinc.com>
 <20230724082946.7441-2-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724082946.7441-2-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 10:29, Komal Bajaj wrote:
> This patch adds bindings for secure qfprom found in QCOM SOCs.
> Secure QFPROM driver is based on simple nvmem framework.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  .../bindings/nvmem/qcom,sec-qfprom.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> new file mode 100644
> index 000000000000..1425ced36fdf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/qcom,sec-qfprom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc, Secure QFPROM Efuse
> +
> +maintainers:
> +  - Komal Bajaj <quic_kbajaj@quicinc.com>
> +
> +description: |
> +  For some of the Qualcomm SoC's, it is possible that
> +  the qfprom region is protected from non-secure access.
> +  In such situations, linux will have to use secure calls

Bindings are not for Linux, so:
s/linux/software/

> +  to read the region.
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

