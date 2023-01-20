Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9B7675BA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 18:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjATRg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 12:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjATRgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 12:36:24 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83D2DBE8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:36:22 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so6341751wml.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/fkQZoxq2LVgdlP6o8ISAl67meRTQs6k6eGFoQcXV0=;
        b=uCouVft/678PMSeYh72dZ/cmQ3539Q08cQjJm8WroYp5AYxoK6xmyZqRQtw45k+W/u
         p7DriRVdL5+iW+h8R+Efz19EaHAQw3bx4FMZhk7hQX+nCYhus2AoNhdXi1ksfKRw7eiw
         9VT2bugfXsp/wXAu5h1gKUMc+F/X/oFgqYT3zSSVm2X5AeJ5SurJoSe6u4weoPtM3N4b
         7ygZ53czOGsCIEJ7DBvXPY7UdnDYutz6QLJLTpB+x2E3K0HEpN6QX17BBUN+mI1C0dvk
         QG5ywTxIG9eet9FsuMCqmb/m8LcrVOtj8eKYRS1slfReD6SB2JPK2jMWyAkSX+cq5Z7A
         eIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/fkQZoxq2LVgdlP6o8ISAl67meRTQs6k6eGFoQcXV0=;
        b=TpHoOQ5wIraYWWCTVzzCLnbsJmUlucdGj/fN57NslRhKhhJShruBu/tLnYcS9Ry9Ar
         6lnKhwMAuBRbLuaqRBwwsMLcwAkAjc696L2VTMbZJoRcPbDyzqrCy9eRY/tZ3M/jJbd6
         g1WQlQv0A32Cej77l7nP+X6jiM6OL8yFf+EnlNhUeAKqkAgrhk+GJ6SDbtEWQnQAClSP
         7tMV6MIuobwXfMr7mTeku7nvVqgB9C0iJD7owtiuj/YnVe3tC+t1hs6x5wtyv1O5Y6k+
         BjwN13MTJTUmLIwf53zOou++6SwGIpbhkRccYnAbxb8KtCWFaeGNkLYgH/K8iICFijAj
         Di5g==
X-Gm-Message-State: AFqh2kqw1KpQAGge+ZOAoWvRE9pAAY6BqJf++dsfBpycc7dWKMNggIdI
        Zpo2jsM13Vpq1o7BTDasm/ghYg==
X-Google-Smtp-Source: AMrXdXsFwzzGIEstO3SnHULQxXF4eMZtD91tPjdYdhdv27AoHRcOCQEwd+woViZIHj7JJnRNA8pmRg==
X-Received: by 2002:a05:600c:22c6:b0:3da:fc30:bfc5 with SMTP id 6-20020a05600c22c600b003dafc30bfc5mr15185468wmg.13.1674236181384;
        Fri, 20 Jan 2023 09:36:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b002425be3c9e2sm35660830wrt.60.2023.01.20.09.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:36:20 -0800 (PST)
Message-ID: <c643747e-accb-c7af-a4f9-5cf8feb2075a@linaro.org>
Date:   Fri, 20 Jan 2023 18:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp"
 child node names to "-pins$"
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230120165103.1278852-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120165103.1278852-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 17:51, Rob Herring wrote:
> Just 'mpp' is a bit ambiguous for a pattern as it allows any prefix or
> suffix. Change the node name pattern to "-pins$" to align with other
> Qualcomm pinctrl bindings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Use "-pins$" for pattern instead
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

