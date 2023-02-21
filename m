Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743C269E1A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 14:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjBUNr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 08:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbjBUNr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 08:47:27 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1352A6DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 05:47:23 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id ck15so18675934edb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 05:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9L6ov6vTVmkxitFFQlV00coZPDFuBi+7eeeeetTk6A=;
        b=p55BTkGcLLxpjZedDFW3AH5uZ3wVxN8vrnB3M5b4oHoQewUw78JCKvLtTiPoLzPZUD
         BrrY3+QjBQSTXwkHojiLrJcHmCfH50DR7G68HyrINM1uXD3zuQVMd21xZJLwCTCXnvDk
         Ei49wlKk57MDUyBAyBFocrBVf7cy5igl8n+61m7QOV8jUYL1OcA2OX8xDXMNFQgiGJL4
         nvOy6sL3nWZW1x0VeEPpyWiuBfvRQGkoft4VBbnCIExx+ucu0r+/3rM8jJlo3V+/cEFq
         FrHA0WDkroCbxq4wpKie0alF+xq4uXUHJvmvvaeYJ9q1vIrakc8BwPvSxBV3nA7XqG2N
         LF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9L6ov6vTVmkxitFFQlV00coZPDFuBi+7eeeeetTk6A=;
        b=GKM33ORwvRhCvou8uIwuzvhl937a7bmrHXcMtpHckQv5zcJW/XFB02m8eK+9v5rcVh
         hK9LowhR15rOaTmU09GiEWClpVLR/7wO4SeHZZWtdqIWotIUki2flCm3xNW9kvguFgOi
         ozsP8vpzMhx3ywNKrg0uqs8kTQSm870nRsre0RqIoeztfF40AGrastz4292ZNlxXQelG
         ptzyQ9X3czZYnARO6GN54XsXguXsQXMAMCnCCJRjNVkabDriJ7sRJfOOiKP6BDyHKeFJ
         wiz6xKlpSAFFBLEmlPc6FZzirZLq7H+GzVhmGlYFp5wi733vHYbgmxwNJeXKvwlF0HcO
         29Bg==
X-Gm-Message-State: AO0yUKUMWLcCSwDcMFvxcutsL1TRsmR/sLJ1j8OeH5S0zHSPlhE8q7GL
        gBX6yqWx48jBE/q4Kn/HyImmrQ==
X-Google-Smtp-Source: AK7set9jepglI1mx99X50Qsq+rcAWy1TRMPBNM4TqGM5JJo/bjfZZHU9adgCkKHVTx5ppg/dS2v1Xg==
X-Received: by 2002:a17:907:33cc:b0:895:58be:94a with SMTP id zk12-20020a17090733cc00b0089558be094amr12650471ejb.14.1676987241912;
        Tue, 21 Feb 2023 05:47:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v22-20020a170906489600b008ca52f7fbcbsm3537052ejq.1.2023.02.21.05.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 05:47:21 -0800 (PST)
Message-ID: <eb5e25f2-b09d-fdc4-ef91-1f4beb4be9ab@linaro.org>
Date:   Tue, 21 Feb 2023 14:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: mfd: qcom,tcsr: Add compatible for sm8450
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1675336284-548-1-git-send-email-quic_mojha@quicinc.com>
 <c8c1ae71-a85f-18cb-780d-fd2e055f8e26@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8c1ae71-a85f-18cb-780d-fd2e055f8e26@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2023 14:38, Mukesh Ojha wrote:
> friendly reminder.

No need to ping during merge window. It's a merge window, so patches
cannot be applied... Ping or resend after it.

Best regards,
Krzysztof

