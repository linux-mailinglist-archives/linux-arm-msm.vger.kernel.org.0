Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4C0689088
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbjBCHRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjBCHRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAB2911BD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:35 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h16so3771626wrz.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGO9MeuhOO617cZj7bVLeDPISS1OmNAxZtiWQngkqH4=;
        b=XZe2fMOvDAl66F76hhmHqgvTqEObAs4tYEPF6U+ipX23/ydNlqBsMqmstRAwbxH0gF
         qDILsSDUASO9hQyIfrz5vyS61P6POzUitiXvSuoDeTn2jjjPSq0J/fZRhwUr4XR9L4/w
         NiweoaiX6wnBvQI8MuhzWt/qUdq0+ZW11sqeDdu3+39yh4ArHBwxPlV4vBkP5s6nurGJ
         a4WVjCjYkUCO2Zo3fImYGtkAKg78OUE8WENfHCdI4Mxxvag/f8r9y/BEu5qZaeLINbrU
         oAoNT5w6XUFbKP1z8PlkMjanedat3/+OyrIdnY9W8kZnio1J6T5RLy6sWlKReLGA4OB+
         FaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGO9MeuhOO617cZj7bVLeDPISS1OmNAxZtiWQngkqH4=;
        b=fh0P+KGvi/DCySlXycpjkxMFbTMVs4hG9MYss9h0m9W8cFxGKBBBpxB/D0Ge7iIgBB
         XUU7z8+mXXQl0fyw4NieKx+vXQGempCJL7ZcR3fZ6X1wOQY58LwqCV7rEoJgck0IZS2V
         2LDVSkb/NZarGewEat1p4drK4zU5otZOtkfXOxHqWyo9Sk1TntDz/KkGwoX6NF0g1ZZY
         8pZ3Z3oUKOA6G62ve6O9/pbVuHjqbzc4T4kKQszuECIfJCncTXGUgDJG/axF2GReJV/4
         fEeeR1YWrv++I8gjNPJWWtMLDsAckarbD3U2lXI3FdKdMoToJ52xOpq4S5PNw86yGFg5
         FHkA==
X-Gm-Message-State: AO0yUKXBaR0f7jFR9TfqAjFUigGlEIAleW0T4kREnxpsEsZ6GQuquxDO
        24XrYRVFsRsTY3gGBIcUBppXrA==
X-Google-Smtp-Source: AK7set9LHwzzwnDVsSsn+baQ2bSSdl7yRpPbVWKVJ1wmGgs8GJq6bKFn3ZyovBUHbkahkQ/F3Dk4yw==
X-Received: by 2002:a05:6000:137a:b0:2c3:bb45:6d67 with SMTP id q26-20020a056000137a00b002c3bb456d67mr6513446wrz.5.1675408654028;
        Thu, 02 Feb 2023 23:17:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH v2 02/10] dt-bindings: pinctrl: qcom,msm8909: correct GPIO name pattern and example
Date:   Fri,  3 Feb 2023 08:17:22 +0100
Message-Id: <167540864401.6835.17597659634945338758.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-3-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Feb 2023 11:44:44 +0100, Krzysztof Kozlowski wrote:
> The MSM8909 TLMM pin controller has GPIOs 0-112, so narrow the pattern
> and gpio-ranges in the example.
> 
> 

Applied, thanks!

[02/10] dt-bindings: pinctrl: qcom,msm8909: correct GPIO name pattern and example
        https://git.kernel.org/krzk/linux-dt/c/87b93dd1fbb23b9bbae461bb2c01f6d93c7524d9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
