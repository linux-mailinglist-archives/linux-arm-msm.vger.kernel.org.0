Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F50F601C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 00:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiJQWNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 18:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJQWNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 18:13:23 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CAF6E2FA
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 15:13:21 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id cr19so5393634qtb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 15:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCtI7HpnKLN2RHhMH5+l4CbBXx3g+mkMW6UlFy261fc=;
        b=OU4mKJkhQCZAztADc9v2BTa0rsCpsIXIlNR3wCJIZkUIDHULMp1dwTknBBBWSkC9q5
         cBZ8pe2cNB+AC4WHIFxuV9WIrakeq8p/CLez4o2i6ccGCQubRQlKLHhyRHSzpb1a6+mD
         vsK9AY6fnB7xAZtta8Ieln4FcZoFmbQHg2nOCymLMHPKnYYru00nJDvtsORnFkYUvNdE
         vAS33zc2FIi3nJuLJh4AShyroCJuQcTWXajFsppR1xa58Cgqo9pmmCmmki4vlw0MT3nW
         qOY1H0Lkjc8+/sHDni+DD62uIuJArQtiHaMEERkGuwrZKdQPSs5TF4rO+OoG3VUtFiS2
         Ve7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCtI7HpnKLN2RHhMH5+l4CbBXx3g+mkMW6UlFy261fc=;
        b=r2wezANcLXRK+jQQfrQnqQAumaTgaev1R5tU5HXMqpJkWq3k5VQOaDyvXvQErkxht3
         wGRngXJtWPZIfZZiGVida/UBHJiHsOgHzMCp6PSd+OH9Um2YQ1XF9BITXmIZrzl1Z/Lw
         bO5mnPSZrn6qbuyblHrtT0IrJfloJGeoOkOaIf7Gb8lIiY+JWXt6IYHXYehAMZfeSLWE
         ruvTGMkWi1HX9TXv9qfeVnJ8xfMn4oEW1YQrmrvwS7tuZ7asChoYQkRApaFdg0y+16+E
         +oBxfRimnJP7U4GjMO45uUnaanBu294mTxsvs/LrnRFTMEW12NM1gjW9DkHnpflWranI
         2JNg==
X-Gm-Message-State: ACrzQf2TgLsCrDWr8tWNq7zZU+CXkzDmrb4ABe/pWrPIOHRHj0mggRHs
        OZE1+btMINw2iyS1Wi8RouH7GQ==
X-Google-Smtp-Source: AMsMyM5uytjViQrc7YdL7vZ5CO/vsYMTKrcInnLQzLGkBb0PTDgbeiNlLGhIVvhcU93+cxYzHxP/dw==
X-Received: by 2002:ac8:5813:0:b0:39c:d5f0:f1e1 with SMTP id g19-20020ac85813000000b0039cd5f0f1e1mr10645396qtg.453.1666044800983;
        Mon, 17 Oct 2022 15:13:20 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id g19-20020ae9e113000000b006ce3cffa2c8sm735933qkm.43.2022.10.17.15.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 15:13:20 -0700 (PDT)
Message-ID: <158acf1d-de37-936b-3dc4-40f62f227af2@linaro.org>
Date:   Mon, 17 Oct 2022 18:13:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/5] arm: dts: qcom: mdm9615: wp8548-mangoh-green: fix
 sx150xq node names and probe-reset property
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20221005-mdm9615-pinctrl-yaml-v2-0-639fe67a04be@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v2-3-639fe67a04be@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v2-3-639fe67a04be@linaro.org>
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

On 17/10/2022 06:23, Neil Armstrong wrote:
> Fix the sx150xq node names to pinctrl and use the right probe-reset property.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

