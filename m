Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5D557592D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 12:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjGSKY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 06:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjGSKYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 06:24:35 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00C2270D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:24:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51f7fb9a944so9416342a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689762251; x=1692354251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLKZmC/SKzmySAI5HZVabtR31SCx8Kece+jGCkmTP0Y=;
        b=Ve77vr8HaariIAGE8yu/tWU3WPL4XK7kPA2xo7VvUtNrcAffVRDLa1JT2ILreOyHGN
         YcN5qGxKPyuWr37cQ4K1BE1SnWc/m2w1V45OABBqwDZh2COc+fGX4ikVqDgq6QYeP6xm
         zrP+P8t0hJrVZ2/MoHwh8Xi9EI64jxw4XqRnYcuCfgaiF6cuAZbuyiz/UozxRBvRSMzZ
         0cmxIwpdE/VcsKUtc1OXxdzbudTn9rjZ+yWbumiVQnfeQ9vi0CK1HozsKTxQer+8Xeiw
         +pZ343q46Ud/i7AO8Ydth2whq8pPJKg9hpqEhsASZp2N8hEXgGkl/p/23AuoyrdszaIv
         71vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762251; x=1692354251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLKZmC/SKzmySAI5HZVabtR31SCx8Kece+jGCkmTP0Y=;
        b=LttZnEygq75O2r9Q8+C3TimNGvZblzw5zg7OHsQpTq9yV05VBafjhj+1ktkrekWBkA
         I84yWrT/45ycYLhilq6R0fIXT1HgkrRQ3sFfwzRSzZ1rfAh0mIHczo7pPAcj4ygbjF01
         xQxvPltOHZlqFhhDZk7PoANxSjJcPo2uJgGge4HvwHdm0G5khOT5XfSWVLHRh5Qvb+uf
         zcheeBYrEFHjgdbiFaSnyhfUW3XA6KmGe0UWz1o+nLIeDsWi0W5NhUdBIo4bBDJpy3j1
         o7jPLlAmjST9bKzXlikxp/Px/tFK3vWER/jE1IJMN2nnoDDJAlwzIYnUFfgBYDXK//mB
         sgHQ==
X-Gm-Message-State: ABy/qLZpvhnX3X2wvrshCMKzYnBHvOKDo4L8WInrKPbO2ti4/V4OUyX0
        jn/JH50iXZm4eBA5paZjtwXWaA==
X-Google-Smtp-Source: APBJJlHncBYlcdzowwcMk8BD6Q+e6uuL3V3TS7sj+n077nM7zufGVPOUSOjZ6/7P4P6VDBkkHik6zQ==
X-Received: by 2002:a17:906:8476:b0:97d:ee91:df83 with SMTP id hx22-20020a170906847600b0097dee91df83mr1666710ejc.61.1689762251315;
        Wed, 19 Jul 2023 03:24:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906340800b00992d8aa60b0sm2187045ejb.63.2023.07.19.03.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:24:10 -0700 (PDT)
Message-ID: <6c28d674-7dea-4dea-805a-cf318af05a3c@linaro.org>
Date:   Wed, 19 Jul 2023 12:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] dt-bindings: firmware: scm: Add SM4450
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230719100135.21325-1-quic_tengfan@quicinc.com>
 <20230719100135.21325-4-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719100135.21325-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 12:01, Tengfei Fan wrote:
> Add compatible for SM4450 SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index bdbee58a542b..f02f0815bece 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -62,6 +62,7 @@ properties:
>            - qcom,scm-sm8450
>            - qcom,scm-sm8550
>            - qcom,scm-qcs404
> +          - qcom,scm-sm4450

Please keep things sorted...

Best regards,
Krzysztof

