Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F2B629319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 09:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiKOIP7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 03:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiKOIP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 03:15:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075531D305
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 00:15:55 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id k19so16525569lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 00:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKNE4suE4Xq9bLfqtt7DRJYJuAXCcWCc8o+W/CVSbcE=;
        b=n0HJtSjX1I6FULGQvhFZpt0pxRXGBSbnI/NMT5fbB3fMn5h7d4qTLTOnXAychY3Z5U
         neUQgVhe8KKo1Es2Ege8S08gbM4v70vvs2X4hv3H5c49UIOw68RMnhykQhZNmZYNkuKl
         G4cUfxhWHjQ/aynpdnemuH/jSqFT5wwxbRWqcX36vEKO9YcZx9OkHa81YHZBdOp8IJ66
         aG8dO/gA4OHqpqfqtlCqcxKI8qdlEJlsXmKj06uZubAW/8VQwO03M1CSGl+HTMmLk4/z
         FVRO5cWlOuUis6v+w5/ieTtq2Cxvsw1mlObTCJsjdZMCDVjEgXdRS+nUM9SJ1shTUNhj
         o4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKNE4suE4Xq9bLfqtt7DRJYJuAXCcWCc8o+W/CVSbcE=;
        b=ogRNilDHtLJ81ePyKysYnWTgnigWwMtfZBTAJxPI43DpOYSt6SmoyQ7vzZqFrtlWWl
         02D2luJyAfJWh1InAnlFkCTz4MwD/w5wxeX8JOM31kh5T7/pXcNVlpm1MhkoNNAgXRyx
         bhiN3+S1rIJaJoXRJf4z4ggJaWZS079V/vCNZ1dubfHiL1t5G8PqDYdzv6NJSA0vRNCb
         FSGXySJxpHN6JszxunhbqL69q1TXlR+IGlD0nLYf0Q0sYQ5g8uNnUZlDKjA+QCCKJM8t
         ydOthddMYn/BFx66WcWk4aLMBx8KNgxbo/DUeWbckqsf+rJWB3fZIRUSi8YT3kL0+sbh
         yghQ==
X-Gm-Message-State: ANoB5plidgJ7MGia2yEkK2/NlzQMRpo/UGwLgpOE3Lgr6+se6PzCVnzm
        HWPUJtN/D8G1qmoYlnSop5HL4Q==
X-Google-Smtp-Source: AA0mqf6AOtcM9oAFJUYI7DC7+YNPPzruSzNsYADn099tCIhkzNGYwqIH/0wr7C9PTQ8R+U9gvZ+47Q==
X-Received: by 2002:a2e:711a:0:b0:26d:e647:dabb with SMTP id m26-20020a2e711a000000b0026de647dabbmr5673338ljc.134.1668500153379;
        Tue, 15 Nov 2022 00:15:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b0048b365176d9sm2107058lfp.286.2022.11.15.00.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 00:15:52 -0800 (PST)
Message-ID: <450262a9-d9fd-b686-f64c-2cb339c9480a@linaro.org>
Date:   Tue, 15 Nov 2022 09:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] dt-bindings: net: ipq4019-mdio: document required
 clock-names
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221114194734.3287854-1-robimarko@gmail.com>
 <20221114194734.3287854-4-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114194734.3287854-4-robimarko@gmail.com>
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

On 14/11/2022 20:47, Robert Marko wrote:
> IPQ5018, IPQ6018 and IPQ8074 require clock-names to be set as driver is
> requesting the clock based on it and not index, so document that and make
> it required for the listed SoC-s.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Define clock-names under properties and disallow it per compatible
> like clocks
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

