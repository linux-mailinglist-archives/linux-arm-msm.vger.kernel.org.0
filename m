Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF26FE025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 16:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbjEJO1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 10:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237461AbjEJO1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 10:27:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBCB4206
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 07:27:06 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc456cc39so10950192a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683728824; x=1686320824;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5fqs9Y81ig3TpwIrDEGqHqhJO5UVO6aYGC8XalYxes=;
        b=xH7fsAxQmiOMEPwPdPPTVNCnDQW2EVH6Jk9bva0QjqcRfboxKPc+DXuYeedLV41s5v
         Tzny/MXflkypr1NmOwJOm+VSY6hjqfP8KeD/3Xbjfz3cIVQnFwDas7GsWLV0BarVRZ3y
         FqGmviBpRee3SIf0k4ZW2rNxe5rNYDo9BY/Gru7AEuZZcKzPeuUllvws7yiacaJSD+M5
         CdRR3zTqi6UTQ3Fn+QXYd1iLFJ2bLZp/I8+IqBNEnM2WjcOcFWFLxJklG6LjXfkGa1SF
         Qh9cRpjOaeaZtiO2hBhKAaSP/8uQoot6WwG7kkJy+A3DNqHcSpkb2/yfpCL2uUbc7Ho9
         Qg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728824; x=1686320824;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5fqs9Y81ig3TpwIrDEGqHqhJO5UVO6aYGC8XalYxes=;
        b=Y1v/N9i7UWo7xpPESXZ5gf/fdoWXDqmMn/ijCaSi6sU9hu2ACkXr0iRyCh9k0rOdWp
         Dd/Ytyk2sqdtl6r4ZfPLJehseq4D9AAJPloN0vXWEqF69tsHwXTOBo/ryoMoG5sj+/tX
         JmPttDLUTU15tqBDx7y4G8iYyxzIVdWRmtmkWYeDSIIfRE6UeslZkjY0bfLYVDaGmaQP
         +RE5Jzc59/X9PqzLPgfS80YyjLUhz6yiLP3hqDwG0XWWVIQOf0mTONazUtOD7sgYsf9y
         W/dLGVVOlm7Z2zHSMZpM4P6EiDOJtooOiIzZ4DVMnPfBe0bJ9TGeVpQTgyWgc1PWKTK7
         hjmw==
X-Gm-Message-State: AC+VfDzJRtUr4udSt03d4g0euXRe7Xuw81iqmDjUpr9OakedkPx9YJcI
        h2j+0+nka8aG/ilqFXDnidfoFQ==
X-Google-Smtp-Source: ACHHUZ4eGNGOFkcqZsv2DkqHDoiknTmiRfn50NcREBtwsSikvNTtdlm/miXdxBddhhEuDHXs+wkbNg==
X-Received: by 2002:aa7:d593:0:b0:50b:cd19:7545 with SMTP id r19-20020aa7d593000000b0050bcd197545mr12095722edq.33.1683728824599;
        Wed, 10 May 2023 07:27:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id r9-20020a056402018900b0050dab547fc6sm1967824edv.74.2023.05.10.07.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:27:04 -0700 (PDT)
Message-ID: <0b75ca9e-2370-bce4-f7dc-c90b8332bb53@linaro.org>
Date:   Wed, 10 May 2023 16:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/8] dt-bindings: qcom: Add ipq5018 bindings
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230510134121.1232286-1-quic_srichara@quicinc.com>
 <20230510134121.1232286-6-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510134121.1232286-6-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2023 15:41, Sricharan Ramabadhran wrote:
> Document the new ipq5018 SOC/board device tree bindings.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v4] Checked '0' schema warnings.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

