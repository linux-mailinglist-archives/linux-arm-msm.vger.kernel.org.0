Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82416BA913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 08:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjCOH2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 03:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjCOH2c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 03:28:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523821E9CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:27:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r11so20111813edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678865278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoMNqIZg63BCmS5MP4kOVeZdeqcwuh/YDGzstKQSmrQ=;
        b=JGhEfeejXcy4MBuFn0aGjJ3esWbQR4usZ+Q3lX2gvWeK639uf/vJBM4dkTEgV87O7/
         fBZQqI65R13af5U7tUFlAwxKMOnToACR7Ot7QGu5FYhUC3AaCXadb8UaWlT8Ofonl8No
         xW5fl3g7yV8e+9fHZYT+Y8x12jXq2mlsouilFv9lt5yFML910kMP5phIzbT6UXkE2l9y
         ZB90BrQf0LllBoEuP2MRb8vfMoVkdIX4wdg1CyZGih6I1xaokbVlEg9gLxbEQcinwaPl
         TstLYL7iWQpVsrhR9YPsTdeUms3KKpl1blE5W0bdkE2sCHjnUij/o3TsbRJKLawykH7l
         x0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678865278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoMNqIZg63BCmS5MP4kOVeZdeqcwuh/YDGzstKQSmrQ=;
        b=JsQZLJRWPXcYvAS/3HvRHwc+et5pH00vmH+LVT77fwGIpfHRw1qdfZATSPZJHW3rRB
         dkzphhQtT+wOu4DgiNGkum2oz81VdNws0BtgwNK82T6PZWspME9/2vWw0TKxTgiR+1d7
         JlmUpl3BRyOA2EPq7dyKxSji9sMjBc62U4/EpvQKzzHrIoJOKjllg+o2RScKDyDNChxF
         bytOVC3R9dxh72OAN059g5HjT6N091jsAoc3lJ8r9LRVSmYuTQKYPPyAlqGxkbmMFQTe
         fIhWQwi4Hg7FeGvcebm0Fa3cqLJQWZUZcgIvSQPf5KY8T7V/VHDJKIqN75EJcQXLfFYy
         5Ddg==
X-Gm-Message-State: AO0yUKU0Zs4zkNii9sCQLy0JUZ5fhnyk3Hv5IqF9go4FX9E63OrWfBfv
        gYwuCajapKQfx3Ep7NN+uaYPmw43SUCXxjgoWIo=
X-Google-Smtp-Source: AK7set9sR49g2cBRnWruxCKOSMu+Pc321U7dZsDEMsLFXqtlU2jBjEqi4GKgaER4c4jlK9kGs36H0g==
X-Received: by 2002:a17:906:c248:b0:8b1:7ead:7d43 with SMTP id bl8-20020a170906c24800b008b17ead7d43mr6359937ejb.50.1678865277832;
        Wed, 15 Mar 2023 00:27:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id gf4-20020a170906e20400b0092396a853bbsm2123664ejb.143.2023.03.15.00.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:27:57 -0700 (PDT)
Message-ID: <e3e271b9-43c5-3448-2143-0678db12a5f3@linaro.org>
Date:   Wed, 15 Mar 2023 08:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sc7280: Use the correct BWMON
 fallback compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
 <20230304-topic-ddr_bwmon-v2-4-04db989db059@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v2-4-04db989db059@linaro.org>
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

On 13/03/2023 12:41, Konrad Dybcio wrote:
> Use the correct fallback compatible for the BWMONv4 with merged global and
> monitor register spaces.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

