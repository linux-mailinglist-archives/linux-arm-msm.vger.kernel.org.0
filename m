Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85416F653C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 08:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjEDGr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 02:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjEDGr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 02:47:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA752718
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 23:47:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so56049a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 23:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683182875; x=1685774875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNoB1CN4mNjbzbyJ7ifXkPbkV+dgOC11t9BHcH2q8pY=;
        b=sSweCCGjrdmyJj2jSGtItrUmsI6bPOIG5TckUrtu/iIlxrDEqWImvvtyrqMtWCwhMp
         sBgI7GLHOoWO7BTiidKBun7BFlEq4I7/oFUK/F8Iw0ENDjA8BbxlpuOIGroFqD9sxLpc
         v7CHBOpmXxOMRqOIXHAcEUJ7t5asysNxom/TvXW7gld/a8lF31FftLJG7NdDW6w6sXk3
         L5iL0Mur6sMIG9xxyy1FXokDihqUIHSuPHTWMK5bzQf9Q5jDuCHd43CymXkXCKo4iLN2
         OQnA9aEMJ1tX3II5itslGhIVNBPGf25YphMBla+rUYqcHXO0CMczwG1VHVk7xv4XsFUQ
         A95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683182875; x=1685774875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNoB1CN4mNjbzbyJ7ifXkPbkV+dgOC11t9BHcH2q8pY=;
        b=VnxmZUNdRby2KpTV/afp4ePg74J8zLn+DZMIeH/hoP4tjulVOL6oqdYFXxd7ypweLh
         meGoQRFtvsXjUQYjL5dVN+Hq/MHR+3jqVQe7xJVwFmsIgnssXzX9RWj/vmBjAUQCoZDH
         m4UECtLzHqEpqgfQ89MwuM6DJxIyLY6/rBncAe6uIChzCf08rt9TjCw+MiG8G7taJ5C4
         nOnH2lQJsz2EPwHLs+wlVCUU6Yj8kKWkbilLrS1mpnvYQlgBd4QeL+b6Qil9Z1uhHjRA
         M/w+CtOUyrIOf1NzymGDb/V7Y9TPccYKcNYMY1k+MEQTJ9RDKqRmFXeTxivol9b1Cp/1
         Y32Q==
X-Gm-Message-State: AC+VfDwDR6l8kMwaBDafNvANWthQMw6CT8KKYVX12WDLsPGeJqcgtUz2
        dl4DQALBQgSJNfnqDQjQBaVQeDjY7ikK6N7LS/gowpX5
X-Google-Smtp-Source: ACHHUZ7PfA9SaWdGNw6CarkGjGW5noqaere74jXmcRAxtY4uIC+Sp8pC+Pvnt00LCkqoxHvBk+JvbA==
X-Received: by 2002:a17:907:c20:b0:965:5668:d0ed with SMTP id ga32-20020a1709070c2000b009655668d0edmr5359045ejc.22.1683182874882;
        Wed, 03 May 2023 23:47:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id jy7-20020a170907762700b00947740a4373sm18154982ejc.81.2023.05.03.23.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 23:47:54 -0700 (PDT)
Message-ID: <bffd777f-c076-58ac-f26b-bee671a57992@linaro.org>
Date:   Thu, 4 May 2023 08:47:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RESEND 1/3] dt-bindings: clock: qcom,msm8996-cbf: Add
 compatible for MSM8996 Pro
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503130051.144708-1-y.oudjana@protonmail.com>
 <20230503130051.144708-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503130051.144708-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 15:00, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The CBF clock on MSM8996 Pro has a different divisor compared to MSM8996
> and is therefore not fully compatible with it. Add a new compatible string
> to differentiate between them.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

