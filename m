Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C75426BE3C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjCQIgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjCQIgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:36:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A6269CCE
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:35:30 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so17419037edd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=07OTXx2gmMLFRss9R8SVR6w8+GwnhkoIhKvMHjHuNVc=;
        b=ai8A80EZYMu+akU8PJJAH0vLmlFE5cZf21etGygLHm7WkGc5m2AWbDpKEPboAKEtGg
         cDk+v46yqcKvt3wHzWiM0Z7O9EJfsbGc/Kfw3bkAIGk9o0b2LnXwB+2zAOF+ukDdHTq0
         P86U0Uo6QYIw3qlBoiXVjhs1y32UR4RHXlyYHFAWhjad1Khnjubc+0o19Hd65yCJQ1n8
         TNWlm7QrEuyf5NNtmb9WRWwgQhXBRts8PCiOoD7V/o+gZL8Itd3F7cLSvUADMXTDY/Av
         u677i11mEOYtwvUFAz4XVNe5wGWLjLPIF4dfetoukl3X2fmvgHmPHkS9JOnRoyyBafcd
         kecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07OTXx2gmMLFRss9R8SVR6w8+GwnhkoIhKvMHjHuNVc=;
        b=ZTt/9J8h2GN0KRkB2TkXI/4LfnimAgsiQNe3wWcaL8I6Y6I9qMug/nsPLrFtj6zmpo
         8HhgkcbJTBpfNdv2xFQJUvaxX039nX/eYUewDqOa6RdtWjIa+43Xdg8yQ33UM5sOHXDJ
         ico85GL35xxjH/diEc6JxNfrWoeydwkohG2JASp1mh81ep0VEHQaHcMNge42NQ4c7/s7
         RfmAWISIgbaDJvcF267s+c31J7iwDPtR4/3G1r0eY3WnxUp1PSXQEDfG9gV+kowKkUCr
         DcJG3WBCSeyfKOP4b3iwUfIvoTiWlRnqu8kwTOy5zYgCVAZmUdNLY5jKY4hHeDIRjaq+
         /v2g==
X-Gm-Message-State: AO0yUKXFoQfCusdFoWYjBCOFQlKERX1ySqTN+RGU6PnoaAfRBfTo/XS0
        jQzCNFoSyJjOcfNYgDVtsOyylg==
X-Google-Smtp-Source: AK7set/+48dKcFx/8P464kE7iY8BqOjmSZI43xkWsJ1O03iz6ApiZBygnsSNSGscwiEjgAHKIe3yCg==
X-Received: by 2002:a17:907:c22:b0:930:1178:2220 with SMTP id ga34-20020a1709070c2200b0093011782220mr7382695ejc.40.1679042108106;
        Fri, 17 Mar 2023 01:35:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm722831edd.66.2023.03.17.01.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:35:06 -0700 (PDT)
Message-ID: <0344c3a8-fd24-ef88-880f-a70bf6d28d71@linaro.org>
Date:   Fri, 17 Mar 2023 09:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: dispcc-qcm2290: Add MDSS_CORE
 reset
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
 <20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2023 12:48, Konrad Dybcio wrote:
> Add the MDSS_CORE reset which can be asserted to reset the state of
> the entire MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

