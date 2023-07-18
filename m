Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6234757441
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjGRGdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjGRGdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:33:06 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59ACCFC
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:33:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so78537771fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689661983; x=1692253983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4Lva620cMazo+qqDQs2FdmtjVWqdPUt9uWQuw7O1Qw=;
        b=FWvqz48TdEmMneXfDNx4p/lwgwRYHmCSVWu8XMxkbUHgVz/FgRp9gvXnApri930wnt
         EbrlU9pkhl51H7R4aQNyZz+QmLZnTteL3k33XetEfavgJYcpaEJpa6g+XEtR36zqbUw8
         VyKnEoREdjCQERYpp0ioF3bRpfssPoPdY4Gxe2Ai3XBUvp3cYPwL+VmUAYeN6VH4+EqF
         b2YPtpgjnDc0CYrjS2oyXa0ctpHMeN0JSu3VvNsOSwCA7DPUfDC0FFXMqDSbIewXHNWN
         +UYXsBMRyt2ncq/1WcGxKMXpV6UxH/201rIPjP0uh+WjzcxZLOI8Ic6W4XY5pwaix9vk
         e5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689661983; x=1692253983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4Lva620cMazo+qqDQs2FdmtjVWqdPUt9uWQuw7O1Qw=;
        b=IPEYxj1oh8y7cE7BU1hcHat7kCL0mGzO7o30j5qrlgAZpgE9GdA/DwXseTzoJGi516
         1H2BelMaZ1x2mzKLhL76cVzhZ3/7oDjGTz/0MZA5gjtdeRg+Dz7gREJCU+ytPkkEKu4P
         ETQk0TQ9GZNVWYOFoqIQ2J6hFwuokKPRAZw0CbTG2HEsqkrx+fJRl2HIJlE3m/IBslgY
         m3S6sDUR0oT2sj74OW2MNO87zcNGSEhZGQwZH4GktQW6wQqtgmtiKgJN2cBzKE0sXZmU
         nsiZ9Eie1VcrStSh3yRSypqp1072Q2vVmh1cHqLm+4kSB+W3ot3fG5YbBQ1RRl2UfWqP
         +zdg==
X-Gm-Message-State: ABy/qLYMZzS3yti3FB/RumxSOh5jlIz5ZvHtAGfE1lU87SrZvVSMFNjR
        QMi2NVL57/T5q5EYoWHXeVa+5g==
X-Google-Smtp-Source: APBJJlGO1XxxJC67bV0Gk2uXQ5a50Pbcyg6Qd4cd/I/IJPms3xkZ+6ZsBbfIYMsm4GR2K8WEwUVmXw==
X-Received: by 2002:a2e:9d98:0:b0:2b7:2f2:231d with SMTP id c24-20020a2e9d98000000b002b702f2231dmr9898701ljj.27.1689661983628;
        Mon, 17 Jul 2023 23:33:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l10-20020a170906414a00b0099304c10fd3sm563212ejk.196.2023.07.17.23.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:33:03 -0700 (PDT)
Message-ID: <cb534cdb-508e-b03e-4e39-50cd6654377a@linaro.org>
Date:   Tue, 18 Jul 2023 08:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: qcom,pm8xxx-vib: add more PMIC
 support
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230718062639.2339589-1-quic_fenglinw@quicinc.com>
 <20230718062639.2339589-2-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718062639.2339589-2-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 08:26, Fenglin Wu wrote:
> Add support for vibrator module inside Qualcomm PMI632, PM7250B, PM7325B
> PMICs.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

I don't see changelog. No changes then?

>  Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> index c8832cd0d7da..481163105d24 100644
> --- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> @@ -15,6 +15,9 @@ properties:
>        - qcom,pm8058-vib
>        - qcom,pm8916-vib
>        - qcom,pm8921-vib
> +      - qcom,pmi632-vib
> +      - qcom,pm7250b-vib
> +      - qcom,pm7325b-vib

Not much improved. With missing changelog, it seems you ignored the
feedback.


Best regards,
Krzysztof

