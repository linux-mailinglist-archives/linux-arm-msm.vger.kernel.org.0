Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B206E1D98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 09:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDNH4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 03:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDNHz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 03:55:59 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDEE6E8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 00:55:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fy21so591843ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681458955; x=1684050955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syaimoY1CeMz3j1GQljmX0s2rTTrm4sDqwOqzOB2bDk=;
        b=aMKEHU4W8BPj4JRuUktionnuCb3sDqW+/xngj1wmFIHmfAJXre2xbeYVGDXasuvH+P
         sTiY7M7yNgjDc7iiy3VAmW1RvTuQp/cL+Hn7hOxXQMf5C4AurjrqYrzaEP6ioPlu5Keo
         vBkBc8BEt6G2ziEjhZHYtoKd/CYzodmcMNnYXA8XdXuUhA6v522SP943jQaj6tg6OG19
         7fz8O+H3UADvhZIvH+la3f+Hs2agd6n16PJ/YyUmNPwLyEXPmuibUfFqJhRWUY3g8b2W
         4FLqg5j0YmaNnrQIx9RkQCdJc4COKjcn/MoBJR3nxntfVIX7wM379uvFan7ybFA381z4
         nsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681458955; x=1684050955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syaimoY1CeMz3j1GQljmX0s2rTTrm4sDqwOqzOB2bDk=;
        b=ImEf3u9QQsOkh5vuNdEDB1zLsUrWkgbFXySIteL7AQi0t94j/otzp5Lbh7ASFulxcb
         rhgHu95Lnq009SJPNMH2orGqKcTDd1igD3X0LuSh1oyKcz2d3ODFk8K3x8kRyWoVZ7Yq
         MsFh4RqdVWRx6u/EdGr4xDZ7klu0JTzci8Fl+Szg6OtaBzxvmVxscpdJpdtEnbmsTBJq
         jYRJCZ7VMLpkT8xRKg3ZRXCquKLGmZn1OOlhwo62CH0SWcWt+hAKYRnYzubxt43MpUrE
         SUGaZoTohudJZtmhnnKCyf4mmFxwiVT8ZGhVzmb7uFBRpN13gvVoEPR7jaQ/gI2At7ON
         mFEQ==
X-Gm-Message-State: AAQBX9cyNzJbji5JLgSWc5BOLe9Tbqz+zKB+grU65QdRlEcLjUvm0Mbe
        81ybhnJ55NayVJzX7XlyauCnKw==
X-Google-Smtp-Source: AKy350YEkKeUBW3ili1/m7SH/lApxnbxMQneIpNg+EJow4S//Z5+6f9wtWSfxtIlV4kBKhAQpgt0Qg==
X-Received: by 2002:a17:906:6b0e:b0:932:cec7:6801 with SMTP id q14-20020a1709066b0e00b00932cec76801mr5001716ejr.54.1681458955055;
        Fri, 14 Apr 2023 00:55:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id gn42-20020a1709070d2a00b00930525d89e2sm2088224ejc.89.2023.04.14.00.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 00:55:54 -0700 (PDT)
Message-ID: <e6d3fbd9-09bb-6694-60db-881c41e828de@linaro.org>
Date:   Fri, 14 Apr 2023 09:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/8] dt-bindings: leds: qcom-lpg: Add compatible for
 PMI632 LPG block
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz>
 <20230414-pmi632-v1-3-fe94dc414832@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414-pmi632-v1-3-fe94dc414832@z3ntu.xyz>
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

On 14/04/2023 01:17, Luca Weiss wrote:
> Document the availability of an LPG configuration for the PMI632 PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

