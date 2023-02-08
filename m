Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB6F68EA77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBHJGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjBHJGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:06:03 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AF73AB0
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:06:01 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n13so12818265wmr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyY8q7xLN+1QwuI0v7PWzuHYyz8z2SDShGu2jLieKWs=;
        b=MrEAhW5TjT2SfJnE+DNgDGzCAW1X37wSAR8Ns9zAQTQu1cjvqQwnaR50iiX4Dmn2db
         ltiY2JHr3cB/fB8H59bUPR9YLHSAQRC956QYPrQYeB4WL8fwGPA1UYzU5d4TU/M0f4oe
         B5JvcoC9c4thf8D7oGXe/ptcYk/G81KvkjOPhG9RHeS9m/MaEImol0gND12ZnEbLDFy6
         7orQYxlYOxO6wbmCtmR5eB985zlzjzXqgOIrfXRuv0RXyzEYtgpD3ocqvNeP8du6qs9Q
         Vw45+l7JviCze3X2SJUCUkMpcD6QowhyAKN0k3abLPIKmeZQ29dTCMCA03tqjoGcNS4s
         SaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyY8q7xLN+1QwuI0v7PWzuHYyz8z2SDShGu2jLieKWs=;
        b=o4oVW393ZrJ50TqhvA/dj7BIHRpg2qiixwwuYmqmBGkvMU0jOmyKsE76ZRB1mK068O
         AQu6Oelx6rjb/r5pytNeuKbDuzC1PpnMdtEulhBDQWY/RsBADn4pYVwwUZVd5JkZbPL6
         0ngqGAL3v8YXHOFGmAS0KfdjZFqYjtGR97QiodQO7McNMoOrdgwMctAP8wWxe9R3i56l
         LxYim4U0C2b3h0UNulHhZaH7pJLDr5OxqI8Y0rXCqy0sFe5LI7mjlbKRg79uOO5aRhou
         nifUXohmuyJYvE7M97LXZiU52rFKioK08ra3zqXKVPmLtMkUol0T8bQ5r4V2nz/Ya+Q0
         a3ng==
X-Gm-Message-State: AO0yUKVwBe5Ng3OOgnxkh5DZ4ueHqg6xnU6PmzUKh/6z4dpiLVDNxhm2
        k9bIUSlTySLlVipD7ZH5OYvyYg==
X-Google-Smtp-Source: AK7set9R4LRS/68Ujwg38yiOn58/8GzayTCec4stwqGeTM8KZcz8jj2/J7oBpRhOSCPmxsKw/ztEKw==
X-Received: by 2002:a05:600c:331e:b0:3dc:5823:d6c0 with SMTP id q30-20020a05600c331e00b003dc5823d6c0mr5768527wmp.6.1675847160493;
        Wed, 08 Feb 2023 01:06:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z6-20020a1c4c06000000b003d1d5a83b2esm1224778wmf.35.2023.02.08.01.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:06:00 -0800 (PST)
Message-ID: <82b50683-2714-e524-eb2a-57c8336f9870@linaro.org>
Date:   Wed, 8 Feb 2023 10:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: firmware: document Qualcomm SM8550 SCM
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20230207-topic-sm8550-upstream-scm-bindings-v2-1-ca12bd33fa1c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-scm-bindings-v2-1-ca12bd33fa1c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 14:46, neil.armstrong@linaro.org wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Document the compatible for Qualcomm SM8550 SCM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

