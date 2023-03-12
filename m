Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D1B6B6558
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 12:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjCLLVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 07:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCLLVf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 07:21:35 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FFC26C09
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 04:21:34 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r15so10743299edq.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678620092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPgK9DbotYQgvMk65BJJQwFUv5xZOuVj5AIIzlxJuXc=;
        b=uLyW2K+RIsq257fj4pm2t9CeGgEH/S9eYiBL3G+AnxMehFmEdb8RYRfE1rikKNTepX
         LT+Ct8API26svgkUFs4M+WTtBmsWs4ZztrfBPtWc4Kn/2r2NYcjKVtGvra+579LF4BRp
         baQMH97dy+VEaDU2q8rtRFRjci3eFrXfDvxG2cqsex9alP4+QA3zDpkQJxBjxAVeYMkY
         EGg/w+6A0pxR3jm24lrY4PgtZqicnHyrb7HOV+NjdbwljxpbaZiiWYeshXAhdY2QAPDi
         GlbYqGoyHvMDitrtA2sDMSXTUuQujJYNXgbl4QwojnyC4cke7iNWQrEkN2FNveqfgs0E
         0Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678620092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPgK9DbotYQgvMk65BJJQwFUv5xZOuVj5AIIzlxJuXc=;
        b=pT93GLnbw3d2K+ydI634FgLapDYHsu5s/P0rzq8zw6rdPs6MbZ8AR/SC9AOGKfxQdV
         H+V42Vlei+NBE3DWzzI5s1I03F7HgBvuJ/KBq/s9unH3eTzEV27qjdXPaxH9GACac2AF
         SZy3JJYQ85g9x79WpLrcPJ6JFqof0RF51gLKcL4xQj3/TOmgFrOOozqZ8JCuF8LC677p
         ZWZZP1p6jm5Fd1MIveFzwcoMh2uojZ458R5RArezfIa0tUM2ESRaMsRJEr83sk6Sqmt7
         E7pTXzQY+j57GmWqyQwzEMzbZq/uA/c8LejoNs84rDwK1VreEJ5nj+mxG8F2M3KyOs3l
         ZVtg==
X-Gm-Message-State: AO0yUKUOkspqRv/TSbNMJw8lOhMWOynUauv+sAhOZUmmY7KMrs0BE7iK
        LsMv04iPa5EwJ7ZfK520Ru9+vQ==
X-Google-Smtp-Source: AK7set+D+hLkNXjEjhGAsCWD29t27P1DggG6dhCXb3gScF7wEal1ZwREIDfrWAtxQv4vOf7Fc5QtBA==
X-Received: by 2002:a17:907:8a0c:b0:87b:3d29:2982 with SMTP id sc12-20020a1709078a0c00b0087b3d292982mr39887619ejc.11.1678620092569;
        Sun, 12 Mar 2023 04:21:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709063b9900b0092396a853bbsm1186283ejf.143.2023.03.12.04.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 04:21:32 -0700 (PDT)
Message-ID: <9a9a7d52-b35c-8d90-b6ca-1fa9a5f33534@linaro.org>
Date:   Sun, 12 Mar 2023 12:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM7150 pinctrl
 binding
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230311212114.108870-1-danila@jiaxyga.com>
 <20230311212114.108870-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311212114.108870-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/03/2023 22:21, Danila Tikhonov wrote:
> Add device tree binding Documentation details for Qualcomm SM7150
> TLMM device
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

