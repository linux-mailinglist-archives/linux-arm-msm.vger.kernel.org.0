Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C909B691E8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjBJLno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjBJLno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:43:44 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C5B2798A
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:43:42 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id u10so3615181wmj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpJmB+ETEmIvVLEPcQCzpqfP31qhd1j/4sBxO0QaEzs=;
        b=dbdZNnwpGU6CqMUBUuO0dM7pxm7zPSFS4kfdvqDcT2WKSuXt91QGQHb7Xf5uCMhaDi
         fQmS64YvYzR+LutejL1ndam6j1BJB9zvF/CTUe0LkhIpsGJ7hazQcltCiQ9YdJPfI6Zf
         XpNUEVdJlkSINo2ZMzEo/99z1W0B6B4KygKJ2LNY6s47j6avOgd5SW2yvJa+1iJ2EOWd
         9jFwz5ZwwVPmQmr/mgrizJOjKjGRox40gunUNUYqnKpGDFvnf5ujJ6lgGpCSPReIby7n
         30gn0HqB+1/Gu8Rqs+dKyPs9DEVHsPOq+dxqT/n/kTGwnP/80WWgQSpASHF77dZljlzE
         G1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpJmB+ETEmIvVLEPcQCzpqfP31qhd1j/4sBxO0QaEzs=;
        b=xtEiUgXH28QGq0pgzwcysY5Vn2O7Mkv20HVawrfhsHPQWuPEurGwhEb+t2RxZWPP4s
         TUon0e6mry72LBGekV+tFC8u1buRRtRuPCBR0tamL9oI06pAuLpNuTDHuBzAbWCqQAOv
         dAhQY7Ly/DELbxXwIcf7b1RtX4HIIaiP3Ky9IIy16klGJ2imb9Iorkf9F2O3/fpIuxOI
         QsOq1uDAbtygmLuTN3/yNTcJ+8AU6NMAU13B0CNSpT5EAHjUpII6T8VnvZV61zpnBunx
         sRH80+tuRvMc3vR9ln2Biykzl9WeHazNJnQKvkvsbzVp/4CdSm+FZfVfzbEZM/TR3YKm
         wgHg==
X-Gm-Message-State: AO0yUKUxuV2bqkZe868Ckc9XYzBZegUiieEYZ9SWYaBEsxTL60fvowMI
        1hPdfHNXNakljmW+2cHyGUin4w==
X-Google-Smtp-Source: AK7set+Rco9Ht8woHgwauIhMlB1a7EFxs3tW2SDCkzBKeiLgGfEX0DoqvL34Vr5XVJcp5q4xsxy00g==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:5987:fe9 with SMTP id i27-20020a05600c4b1b00b003dc59870fe9mr13941504wmp.2.1676029421562;
        Fri, 10 Feb 2023 03:43:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t8-20020a7bc3c8000000b003e00c9888besm7920156wmj.30.2023.02.10.03.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:43:41 -0800 (PST)
Message-ID: <8cd6cf2b-834a-bcfe-d440-5c9795cd1f0b@linaro.org>
Date:   Fri, 10 Feb 2023 12:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/7] dt-bindings: mfd: qcom,spmi-pmic: Add pattern
 property for phy
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
 <20230208190200.2966723-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208190200.2966723-3-abel.vesa@linaro.org>
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

On 08/02/2023 20:01, Abel Vesa wrote:
> The phy pattern property will be used for providing eUSB2 repeater
> functionality. This will be modelled as a Qualcomm PHY driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

