Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4833D6B18B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 02:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCIBZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 20:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCIBZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 20:25:31 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEB2CC313
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 17:25:27 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id i9so354899lfc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 17:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678325125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqq4VEw4gc/dtr1bOgTdIY1FDWwPC01i6JuhT66K9Gs=;
        b=WAsVz6H63rIudTmBhP8WrhBoyhPjw/4TCp6wfRCWAdEQ8gFpdr5ex4Y9/CIq0nG/kz
         9fHkU9KsFJluewVg0Z32oudvSsBcxMcycJYyRfnwsWL3g6NtOolTl4+hG1Wnf65OwyIc
         vY3+RD8LuJkCpCTT/dqWRGbZ72TyvXZFGaksH034CqU3CyfeMQsDgYn6HLbPxliIwIdq
         ij6RYhnFWeq0uZ38VbRpNOYvq7N8Xt+qGQkYWECrFW3Ao/OA5vn7krtOKJ6aVWx6OL2T
         6osopRW55lUYM59Y5TmbST5DMNkBcsBZXOcu8z3CsoOIujpfOaTwx6u169Y+aoqeqb1s
         wKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678325125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqq4VEw4gc/dtr1bOgTdIY1FDWwPC01i6JuhT66K9Gs=;
        b=yfDOyMEZ2AXHya05JSGqaFhakEFMf8Ry1ehxNbjbmIf2vz2i7rYW7rZYpyKfHLuPHV
         eZgknCebU5Ig7HRN5lBeX2BkOKEYrUScJI5gRgVv1aHd7mmWQuZ0sxSoD7bdtqVlwmsa
         LaG2gnXxZZDztSzzq0PJv07Uyxq0w3S6Pa9TtcWAhOpkjVUubiNIwxGrNnufh45bfP70
         2l1jZYLU1Iv15HkrUwRwnwrWTWBxn6ylVtkYB40HnpPhDfTdh6dNo8GhsmBlJLJoC7gK
         Gqp9piTcpmdWh/+Ox32bxy+P3dpyam78CVqjj+ed+AKnCp3wYZ0XKb7gAOX+z3snpWu7
         Ec1Q==
X-Gm-Message-State: AO0yUKU3MViWw0RAEhVR7cq3ndQz02isupNw5OAmv4uvdboHnASTNLJ4
        PII+XxFUOpoth/K4ceB5z9DiIA==
X-Google-Smtp-Source: AK7set8IXnMjaPGHtH44O0AdjtLFWMJyDdhixh/ZWQXBS3NB2lcGP2OxccgWsKunXUZhKrMh8b+MJQ==
X-Received: by 2002:a19:ae13:0:b0:4e1:13fa:bf07 with SMTP id f19-20020a19ae13000000b004e113fabf07mr6084681lfc.43.1678325125441;
        Wed, 08 Mar 2023 17:25:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a28-20020a05651c031c00b002934b5657f2sm2754672ljp.29.2023.03.08.17.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 17:25:24 -0800 (PST)
Message-ID: <6bccbd03-68c8-e9e0-1a12-595391246ae8@linaro.org>
Date:   Thu, 9 Mar 2023 03:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 12/14] clk: qcom: smd-rpm: Hook up CNoC_1 and
 SNoC_2 keep_alive
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-12-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-12-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/03/2023 23:35, Konrad Dybcio wrote:
> 4 of our 18 supported platforms need an active keepalive vote on
> CNoC_1 and SNoC_2 so as not to cause havoc on the entire SoC.
> Guarantee that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

