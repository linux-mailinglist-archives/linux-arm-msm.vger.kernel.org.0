Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBEA76FCCCA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 19:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbjEIRc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 13:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbjEIRc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 13:32:57 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5E640D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 10:32:55 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so11216566a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 10:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683653574; x=1686245574;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkerdXUB78wIzAaJ9iJcfK0GStyyCJEUEJ0KCD9uEeY=;
        b=urLTXgA9EumeaKkmyJY+7vQ7DwLz1J232TJyDyNV3TgmNEKHj4M5Or1Yavn7By1jXm
         dMilJdQXIQ9OATng6E9cemIfofBLm0UDXExBaUj3VapjZwBZOkn66RnFzleY0MkzC+qY
         MzX+SQycrkzeNrwKLZNXMqmVo6FPiLskilkYvhLCj0jxnvgsnQ/Bs3TA2zBqrX78FjHs
         18knLWHBC9NDa4htK4MxYu2WokggftZavhz86WlfP7Gtp7ddZSiJ0DrM6S2xveD+akeC
         RRvHNK8mY0GJNhX4INAqORITrWQEPxQM9aIFoXPMpzkOvcWxJDz8NGVWFzt70SOxN40W
         FXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653574; x=1686245574;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkerdXUB78wIzAaJ9iJcfK0GStyyCJEUEJ0KCD9uEeY=;
        b=YDNWyRfJID1iDqepcvaeljAJLG+16RenAdhudlEAKlMGXrm02FvMa+ygtHnLrkq+2Q
         b8k20xSrJzpw8YsGAO7C0moWPDgyeiP9DXCWzZ/6VStG5Ow/Y9kcJSw1CSHu5ke29eBI
         YppnbMEHgmp1i9XqtHXap3ky6lV3c7ADAB3zKIfYfqwM5QNYxUQLFjuPeN7LzWbkFS16
         UHHabzFKAzbH1XEg6741pkwoRsUG3HiNuzc9WdGtPgEs5jyIYeGO/duFvbppGq3L357T
         428Se+WTrwXG7Fw8QyRU4M6kLHAfXCWyOitdotMPzqgaLchhFPFDW0duKitJ1yf9kSxU
         K7hQ==
X-Gm-Message-State: AC+VfDzzLFafPWoviYmwzFQEBfMF2b0FSQzIRq5M4me604G4PK//kN+E
        BgTxArJJjkqcPTk44bUhrrMoEA==
X-Google-Smtp-Source: ACHHUZ6RJHvo4MaNujittUgNvlq/FRuKb899olsGv87Dc5HIui5f4cMg9j7ASVF+YFuSo57YFqqrKg==
X-Received: by 2002:a17:907:629b:b0:94e:2db:533e with SMTP id nd27-20020a170907629b00b0094e02db533emr14220150ejc.49.1683653573995;
        Tue, 09 May 2023 10:32:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id by26-20020a0564021b1a00b00506a09795e6sm967454edb.26.2023.05.09.10.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 10:32:53 -0700 (PDT)
Message-ID: <aa33b782-56f9-a04f-855f-96e04e01f49c@linaro.org>
Date:   Tue, 9 May 2023 19:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document MI01.3 board based
 on IPQ5332 family
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230509160133.3794-1-quic_kathirav@quicinc.com>
 <20230509160133.3794-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509160133.3794-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/05/2023 18:01, Kathiravan T wrote:
> Document the MI01.3 (Reference Design Platform 442) board based on IPQ5332
> family of SoCs.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

